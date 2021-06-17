package com.aidev.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 角色和部门关联（角色1-N部门）
 *
 * @author aidev
 */
@TableName("aidev_sys_role_dept")
@Data
@Accessors(chain = true)
public class SysRoleDept {
    /**
     * 角色ID
     */
    private Long roleId;
    /**
     * 部门ID
     */
    private Long deptId;
}
