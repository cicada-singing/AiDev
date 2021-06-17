package com.aidev.system.service;

import com.aidev.common.core.domain.entity.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Set;

/**
 * 角色业务层
 *
 * @author aidev
 */
public interface ISysRoleService extends IService<SysRole> {
    /**
     * 根据条件分页查询角色数据
     *
     * @param domain 角色信息
     * @return 角色数据集合信息
     */
    List<SysRole> selectRoleList(SysRole domain);

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    Set<String> selectRoleKeys(Long userId);

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    List<SysRole> selectRolesByUserId(Long userId);

    /**
     * 查询所有角色
     *
     * @return 角色列表
     */
    List<SysRole> selectRoleAll();

    /**
     * 批量删除角色用户信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     * @throws Exception 异常
     */
    boolean deleteRoleByIds(String ids);

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    boolean insertRole(SysRole role);

    /**
     * 修改保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    boolean updateRole(SysRole role);

    /**
     * 修改数据权限信息
     *
     * @param role 角色信息
     * @return 结果
     */
    boolean authDataScope(SysRole role);

    /**
     * 校验角色名称是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    String checkRoleNameUnique(SysRole role);

    /**
     * 校验角色权限是否唯一
     *
     * @param role 角色信息
     * @return 结果
     */
    String checkRoleKeyUnique(SysRole role);

    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    void checkRoleAllowed(SysRole role);

    /**
     * 角色状态修改
     *
     * @param role 角色信息
     * @return 结果
     */
    boolean changeStatus(SysRole role);
}
