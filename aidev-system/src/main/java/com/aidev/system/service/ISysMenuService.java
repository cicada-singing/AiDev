package com.aidev.system.service;

import com.aidev.common.core.domain.Ztree;
import com.aidev.common.core.domain.entity.SysMenu;
import com.aidev.common.core.domain.entity.SysRole;
import com.aidev.common.core.domain.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 菜单 业务层
 *
 * @author aidev
 */
public interface ISysMenuService extends IService<SysMenu> {
    /**
     * 根据用户ID查询菜单
     *
     * @param user 用户信息
     * @return 菜单列表
     */
    List<SysMenu> selectMenusByUser(SysUser user);

    /**
     * 查询系统菜单列表
     *
     * @param userId 用户ID
     * @param menu   菜单信息
     * @return 菜单列表
     */
    List<SysMenu> selectMenuList(Long userId, SysMenu menu);

    /**
     * 查询菜单集合
     *
     * @param userId 用户ID
     * @return 所有菜单信息
     */
    List<SysMenu> selectMenuAll(Long userId);

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    Set<String> selectPermsByUserId(Long userId);

    /**
     * 根据角色ID查询菜单
     *
     * @param role   角色对象
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<Ztree> roleMenuTreeData(SysRole role, Long userId);

    /**
     * 查询所有菜单信息
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<Ztree> menuTreeData(Long userId);

    /**
     * 查询系统所有权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    Map<String, String> selectPermsAll(Long userId);

    /**
     * 删除菜单管理信息
     *
     * @param menuId 菜单ID
     * @return 结果
     */
    boolean deleteMenuById(Long menuId);

    /**
     * 校验菜单名称是否唯一
     *
     * @param menu 菜单信息
     * @return 结果
     */
    String checkMenuNameUnique(SysMenu menu);
}
