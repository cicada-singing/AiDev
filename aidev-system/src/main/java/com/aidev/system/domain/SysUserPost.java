package com.aidev.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 用户和岗位关联（用户1-N岗位）
 *
 * @author aidev
 */
@TableName("aidev_sys_user_post")
@Data
@Accessors(chain = true)
public class SysUserPost {
    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 岗位ID
     */
    private Long postId;
}
