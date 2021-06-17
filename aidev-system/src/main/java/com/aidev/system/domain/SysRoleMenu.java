package com.aidev.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 角色和菜单关联（角色1-N菜单）
 *
 * @author aidev
 */
@TableName("aidev_sys_role_menu")
@Data
@Accessors(chain = true)
public class SysRoleMenu {
    /**
     * 角色ID
     */
    private Long roleId;
    /**
     * 菜单ID
     */
    private Long menuId;
}
