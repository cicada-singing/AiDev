package com.aidev.system.service.impl;

import com.aidev.common.annotation.DataScope;
import com.aidev.common.constant.SqlConstants;
import com.aidev.common.constant.UserConstants;
import com.aidev.common.core.domain.Ztree;
import com.aidev.common.core.domain.entity.SysDept;
import com.aidev.common.core.domain.entity.SysRole;
import com.aidev.common.exception.BusinessException;
import com.aidev.system.domain.SysDeptAnce;
import com.aidev.system.mapper.SysDeptMapper;
import com.aidev.system.service.ISysDeptAnceService;
import com.aidev.system.service.ISysDeptService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 部门管理 服务实现
 *
 * @author aidev
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements ISysDeptService {
    @Resource
    private ISysDeptService deptService;
    @Resource
    private ISysDeptAnceService deptAnceService;

    /**
     * 查询部门管理数据
     *
     * @param domain 部门信息
     * @return 部门信息集合
     */
    @Override
    @DataScope(deptAlias = "d")
    public List<SysDept> selectDeptList(SysDept domain) {
        if (StringUtils.isNotBlank(domain.getDataScopeSql()) && StringUtils.equals(domain.getDataScopeSql(), SqlConstants.N_A)) {
            return null;
        }
        return getBaseMapper().selectDeptList(Wrappers.query()
                .eq("d.del_flag", "0")
                .eq(Objects.nonNull(domain.getParentId()), "d.parent_id", domain.getParentId())
                .like(StringUtils.isNotBlank(domain.getDeptName()), "d.dept_name", domain.getDeptName())
                .eq(StringUtils.isNotBlank(domain.getStatus()), "d.status", domain.getStatus())
                .exists(StringUtils.isNotBlank(domain.getDataScopeSql()), domain.getDataScopeSql()));
    }

    /**
     * 查询部门管理树
     *
     * @param dept 部门信息
     * @return 所有部门信息
     */
    @Override
    public List<Ztree> selectDeptTree(SysDept dept) {
        List<SysDept> deptList = deptService.selectDeptList(dept);
        List<Ztree> ztrees = initZtree(deptList);
        return ztrees;
    }

    /**
     * 查询部门管理树（排除下级）
     *
     * @return 所有部门信息
     */
    @Override
    public List<Ztree> selectDeptTreeExcludeChild(SysDept dept) {
        Long deptId = dept.getDeptId();
        List<SysDept> deptList = deptService.selectDeptList(dept);
        Iterator<SysDept> it = deptList.iterator();
        while (it.hasNext()) {
            SysDept d = it.next();
            if (d.getDeptId().intValue() == deptId
                    || deptAnceService.lambdaQuery().eq(SysDeptAnce::getAnceId, deptId).count() > 0) {
                it.remove();
            }
        }
        List<Ztree> ztrees = initZtree(deptList);
        return ztrees;
    }

    /**
     * 根据角色ID查询部门（数据权限）
     *
     * @param role 角色对象
     * @return 部门列表（数据权限）
     */
    @Override
    public List<Ztree> roleDeptTreeData(SysRole role) {
        Long roleId = role.getRoleId();
        List<Ztree> ztrees;
        List<SysDept> deptList = selectDeptList(new SysDept());
        if (Objects.nonNull(roleId)) {
            List<String> roleDeptList = getBaseMapper().selectRoleDeptTreeByRoleId(roleId)
                    .stream()
                    .filter(Objects::nonNull)
                    .map(i -> i.getDeptId() + i.getDeptName())
                    .collect(Collectors.toList());
            ztrees = initZtree(deptList, roleDeptList);
        } else {
            ztrees = initZtree(deptList);
        }
        return ztrees;
    }

    /**
     * 对象转部门树
     *
     * @param deptList 部门列表
     * @return 树结构列表
     */
    private List<Ztree> initZtree(List<SysDept> deptList) {
        return initZtree(deptList, null);
    }

    /**
     * 对象转部门树
     *
     * @param deptList     部门列表
     * @param roleDeptList 角色已存在菜单列表
     * @return 树结构列表
     */
    private List<Ztree> initZtree(List<SysDept> deptList, List<String> roleDeptList) {
        List<Ztree> ztrees = new ArrayList<>();
        boolean isCheck = CollectionUtils.isNotEmpty(roleDeptList);
        for (SysDept dept : deptList) {
            if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
                Ztree ztree = new Ztree();
                ztree.setId(dept.getDeptId());
                ztree.setpId(dept.getParentId());
                ztree.setName(dept.getDeptName());
                ztree.setTitle(dept.getDeptName());
                if (isCheck) {
                    ztree.setChecked(roleDeptList.contains(dept.getDeptId() + dept.getDeptName()));
                }
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }

    /**
     * 新增保存部门信息
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean insertDept(SysDept dept) {
        SysDept info = getById(dept.getParentId());
        // 如果父节点不为"正常"状态,则不允许新增子节点
        if (!UserConstants.DEPT_NORMAL.equals(info.getStatus())) {
            throw new BusinessException("部门停用，不允许新增");
        }
        save(dept);
        List<SysDeptAnce> deptAnces = deptAnceService.lambdaQuery().eq(SysDeptAnce::getDeptId, dept.getParentId()).list()
                .stream()
                .filter(Objects::nonNull)
                .map(i -> i.setDeptId(dept.getDeptId()))
                .collect(Collectors.toList());
        deptAnces.add(new SysDeptAnce().setDeptId(dept.getDeptId()).setAnceId(dept.getParentId()));
        return deptAnceService.saveBatch(deptAnces);
    }

    /**
     * 修改保存部门信息
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean updateDept(SysDept dept) {
        SysDept newParentDept = getById(dept.getParentId());
        SysDept oldDept = getById(dept.getDeptId());
        if (Objects.nonNull(newParentDept) && Objects.nonNull(oldDept)) {
            List<Long> newAnceIds = deptAnceService.lambdaQuery().eq(SysDeptAnce::getDeptId, dept.getParentId()).list()
                    .stream()
                    .filter(Objects::nonNull)
                    .map(SysDeptAnce::getAnceId)
                    .collect(Collectors.toList());
            newAnceIds.add(dept.getParentId());
            List<Long> oldAnceIds = deptAnceService.lambdaQuery().eq(SysDeptAnce::getDeptId, dept.getDeptId()).list()
                    .stream()
                    .filter(Objects::nonNull)
                    .map(SysDeptAnce::getAnceId)
                    .collect(Collectors.toList());
            updateDeptChildren(dept.getDeptId(), newAnceIds, oldAnceIds);
        }
        if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
            // 如果该部门是启用状态，则启用该部门的所有上级部门
            updateParentDeptStatusNormal(dept);
        }
        return updateById(dept);
    }

    /**
     * 修改该部门的父级部门状态
     *
     * @param dept 当前部门
     */
    private void updateParentDeptStatusNormal(SysDept dept) {
        List<SysDept> parents = deptAnceService.lambdaQuery().eq(SysDeptAnce::getDeptId, dept.getDeptId()).list()
                .stream()
                .filter(Objects::nonNull)
                .map(i -> new SysDept().setDeptId(i.getAnceId()).setStatus("0"))
                .collect(Collectors.toList());
        updateBatchById(parents);
    }

    /**
     * 修改子元素关系
     *
     * @param deptId     被修改的部门ID
     * @param newAnceIds 新的父ID集合
     * @param oldAnceIds 旧的父ID集合
     */
    private void updateDeptChildren(Long deptId, List<Long> newAnceIds, List<Long> oldAnceIds) {
        deptAnceService.lambdaQuery().eq(SysDeptAnce::getAnceId, deptId).list()
                .stream()
                .filter(Objects::nonNull)
                .forEach(i -> {
                    List<Long> childAnceIds = deptAnceService.lambdaQuery().eq(SysDeptAnce::getDeptId, i.getDeptId()).list()
                            .stream()
                            .filter(Objects::nonNull)
                            .map(SysDeptAnce::getAnceId)
                            .collect(Collectors.toList());
                    if (CollectionUtils.containsAll(childAnceIds, oldAnceIds)) {
                        oldAnceIds
                                .stream()
                                .filter(Objects::nonNull)
                                .forEach(j -> {
                                    deptAnceService.lambdaUpdate().eq(SysDeptAnce::getDeptId, i.getDeptId()).eq(SysDeptAnce::getAnceId, j).remove();
                                });
                        newAnceIds
                                .stream()
                                .filter(Objects::nonNull)
                                .forEach(j -> {
                                    deptAnceService.save(new SysDeptAnce().setDeptId(i.getDeptId()).setAnceId(j));
                                });
                    }
                });
    }

    /**
     * 根据ID查询所有子部门（正常状态）
     *
     * @param deptId 部门ID
     * @return 子部门数
     */
    @Override
    public int selectNormalChildrenDeptById(Long deptId) {
        return getBaseMapper().selectNormalChildrenDeptById(deptId);
    }

    /**
     * 校验部门名称是否唯一
     *
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public String checkDeptNameUnique(SysDept dept) {
        Long deptId = Objects.isNull(dept.getDeptId()) ? -1L : dept.getDeptId();
        List<SysDept> sysDepts = lambdaQuery()
                .eq(SysDept::getDeptName, dept.getDeptName())
                .eq(SysDept::getParentId, dept.getParentId())
                .page(new Page<>(1, 1)).getRecords();
        if (!org.springframework.util.CollectionUtils.isEmpty(sysDepts) && !Objects.equals(sysDepts.get(0).getDeptId(), deptId)) {
            return UserConstants.DEPT_NAME_NOT_UNIQUE;
        }
        return UserConstants.DEPT_NAME_UNIQUE;
    }
}
