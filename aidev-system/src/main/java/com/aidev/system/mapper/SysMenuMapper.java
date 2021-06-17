package com.aidev.system.mapper;

import com.aidev.common.core.domain.entity.SysMenu;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单表 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    /**
     * 查询菜单名称
     *
     * @param menuId
     * @return
     */
    String selectMenuNameById(@Param("menuId") Long menuId);

    /**
     * 查询系统正常显示菜单（不含按钮）
     *
     * @return 菜单列表
     */
    List<SysMenu> selectNormalMenus();

    /**
     * 根据用户ID查询菜单
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<SysMenu> selectNormalMenusByUserId(@Param("userId") Long userId);

    /**
     * 根据用户ID查询菜单
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    List<SysMenu> selectMenusByUserId(@Param("userId") Long userId);

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    List<String> selectPermsByUserId(@Param("userId") Long userId);

    /**
     * 查询系统菜单列表
     *
     * @param wrapper 菜单信息
     * @return 菜单列表
     */
    List<SysMenu> selectMenusByUserId2(@Param(Constants.WRAPPER) Wrapper wrapper);

    /**
     * 根据角色ID查询菜单
     *
     * @param roleId 角色ID
     * @return 菜单列表
     */
    List<SysMenu> selectMenuTreeByRoleId(@Param("roleId") Long roleId);
}
