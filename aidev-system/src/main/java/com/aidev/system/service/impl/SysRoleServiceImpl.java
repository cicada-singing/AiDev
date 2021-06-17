package com.aidev.system.service.impl;

import com.aidev.common.annotation.DataScope;
import com.aidev.common.constant.SqlConstants;
import com.aidev.common.constant.UserConstants;
import com.aidev.common.core.domain.entity.SysRole;
import com.aidev.common.core.text.Convert;
import com.aidev.common.exception.BusinessException;
import com.aidev.common.utils.spring.SpringUtils;
import com.aidev.system.domain.SysRoleDept;
import com.aidev.system.domain.SysRoleMenu;
import com.aidev.system.domain.SysUserRole;
import com.aidev.system.mapper.SysRoleMapper;
import com.aidev.system.service.ISysRoleDeptService;
import com.aidev.system.service.ISysRoleMenuService;
import com.aidev.system.service.ISysRoleService;
import com.aidev.system.service.ISysUserRoleService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.*;

/**
 * 角色 业务层处理
 *
 * @author aidev
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements ISysRoleService {
    @Resource
    private ISysRoleMenuService roleMenuService;
    @Resource
    private ISysUserRoleService userRoleService;
    @Resource
    private ISysRoleDeptService roleDeptService;

    /**
     * 根据条件分页查询角色数据
     *
     * @param domain 角色信息
     * @return 角色数据集合信息
     */
    @Override
    @DataScope(deptAlias = "d")
    public List<SysRole> selectRoleList(SysRole domain) {
        if (StringUtils.isNotBlank(domain.getDataScopeSql()) && StringUtils.equals(domain.getDataScopeSql(), SqlConstants.N_A)) {
            return null;
        }
        return getBaseMapper().selectRoleList(Wrappers.query()
                .eq("r.del_flag", "0")
                .eq(StringUtils.isNotBlank(domain.getStatus()), "r.status", domain.getStatus())
                .like(StringUtils.isNotBlank(domain.getRoleName()), "r.role_name", domain.getRoleName())
                .like(StringUtils.isNotBlank(domain.getRoleKey()), "r.role_key", domain.getRoleKey())
                .eq(StringUtils.isNotBlank(domain.getDataScope()), "r.data_scope", domain.getDataScope())
                .between(Objects.nonNull(domain.getStartTime()) && Objects.nonNull(domain.getEndTime()), "r.create_time", domain.getStartTime(), domain.getEndTime())
                .exists(StringUtils.isNotBlank(domain.getDataScopeSql()), domain.getDataScopeSql()));
    }

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectRoleKeys(Long userId) {
        List<SysRole> perms = getBaseMapper().selectRolesByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (SysRole perm : perms) {
            if (Objects.nonNull(perm)) {
                permsSet.addAll(Arrays.asList(perm.getRoleKey().trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    @Override
    public List<SysRole> selectRolesByUserId(Long userId) {
        List<SysRole> userRoles = getBaseMapper().selectRolesByUserId(userId);
        List<SysRole> roles = selectRoleAll();
        for (SysRole role : roles) {
            for (SysRole userRole : userRoles) {
                if (role.getRoleId().longValue() == userRole.getRoleId().longValue()) {
                    role.setFlag(true);
                    break;
                }
            }
        }
        return roles;
    }

    /**
     * 查询所有角色
     *
     * @return 角色列表
     */
    @Override
    public List<SysRole> selectRoleAll() {
        return SpringUtils.getAopProxy(this).selectRoleList(new SysRole());
    }

    /**
     * 批量删除角色信息
     *
     * @param ids 需要删除的数据ID
     * @return
     * @throws Exception
     */
    @Override
    @Transactional
    public boolean deleteRoleByIds(String ids) {
        Long[] roleIds = Convert.toLongArray(ids);
        for (Long roleId : roleIds) {
            checkRoleAllowed(new SysRole(roleId));
            SysRole role = getById(roleId);
            if (userRoleService.lambdaQuery().eq(SysUserRole::getRoleId, roleId).count() > 0) {
                throw new BusinessException(String.format("%1$s已分配,不能删除", role.getRoleName()));
            }
        }
        // 删除角色与菜单关联
        roleMenuService.lambdaUpdate().in(SysRoleMenu::getRoleId, roleIds).remove();
        // 删除角色与部门关联
        roleDeptService.lambdaUpdate().in(SysRoleDept::getRoleId, roleIds).remove();
        return removeByIds(Arrays.asList(roleIds));
    }

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean insertRole(SysRole role) {
        // 新增角色信息
        save(role);
        return insertRoleMenu(role);
    }

    /**
     * 修改保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean updateRole(SysRole role) {
        // 修改角色信息
        updateById(role);
        // 删除角色与菜单关联
        roleMenuService.lambdaUpdate().eq(SysRoleMenu::getRoleId, role.getRoleId()).remove();
        return insertRoleMenu(role);
    }

    /**
     * 修改数据权限信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean authDataScope(SysRole role) {
        // 修改角色信息
        updateById(role);
        // 删除角色与部门关联
        roleDeptService.lambdaUpdate().eq(SysRoleDept::getRoleId, role.getRoleId()).remove();
        // 新增角色和部门信息（数据权限）
        return insertRoleDept(role);
    }

    /**
     * 新增角色菜单信息
     *
     * @param role 角色对象
     */
    private boolean insertRoleMenu(SysRole role) {
        // 新增用户与角色管理
        List<SysRoleMenu> list = new ArrayList<>();
        for (Long menuId : role.getMenuIds()) {
            SysRoleMenu rm = new SysRoleMenu();
            rm.setRoleId(role.getRoleId());
            rm.setMenuId(menuId);
            list.add(rm);
        }
        return roleMenuService.saveBatch(list);
    }

    /**
     * 新增角色部门信息(数据权限)
     *
     * @param role 角色对象
     */
    private boolean insertRoleDept(SysRole role) {
        // 新增角色与部门（数据权限）管理
        List<SysRoleDept> list = new ArrayList<>();
        for (Long deptId : role.getDeptIds()) {
            SysRoleDept rd = new SysRoleDept();
            rd.setRoleId(role.getRoleId());
            rd.setDeptId(deptId);
            list.add(rd);
        }
        return roleDeptService.saveBatch(list);
    }

    /**
     * 校验角色名称是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public String checkRoleNameUnique(SysRole role) {
        Long roleId = Objects.isNull(role.getRoleId()) ? -1L : role.getRoleId();
        List<SysRole> sysRoles = lambdaQuery().eq(SysRole::getRoleName, role.getRoleName()).page(new Page<>(1, 1)).getRecords();
        if (!CollectionUtils.isEmpty(sysRoles) && !Objects.equals(sysRoles.get(0).getRoleId(), roleId)) {
            return UserConstants.ROLE_NAME_NOT_UNIQUE;
        }
        return UserConstants.ROLE_NAME_UNIQUE;
    }

    /**
     * 校验角色权限是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public String checkRoleKeyUnique(SysRole role) {
        Long roleId = Objects.isNull(role.getRoleId()) ? -1L : role.getRoleId();
        List<SysRole> sysRoles = lambdaQuery().eq(SysRole::getRoleKey, role.getRoleKey()).page(new Page<>(1, 1)).getRecords();
        if (!CollectionUtils.isEmpty(sysRoles) && !Objects.equals(sysRoles.get(0).getRoleId(), roleId)) {
            return UserConstants.ROLE_KEY_NOT_UNIQUE;
        }
        return UserConstants.ROLE_KEY_UNIQUE;
    }

    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    @Override
    public void checkRoleAllowed(SysRole role) {
        if (Objects.nonNull(role.getRoleId()) && role.isAdmin()) {
            throw new BusinessException("不允许操作超级管理员角色");
        }
    }

    /**
     * 角色状态修改
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public boolean changeStatus(SysRole role) {
        return updateById(role);
    }
}
