package com.aidev.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 用户和角色关联（用户1-N角色）
 *
 * @author aidev
 */
@TableName("aidev_sys_user_role")
@Data
@Accessors(chain = true)
public class SysUserRole {
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 角色ID
     */
    private Long roleId;
}
