package com.aidev.system.domain;

import com.aidev.common.enums.OnlineStatus;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 在线用户记录
 *
 * @author aidev
 */
@TableName("aidev_sys_user_online")
@Data
@Accessors(chain = true)
public class SysUserOnline {
    /**
     * 用户会话id
     */
    private String sessionId;
    /**
     * 登录名称
     */
    private String loginName;
    /**
     * 部门名称
     */
    private String deptName;
    /**
     * 登录IP地址
     */
    private String ipaddr;
    /**
     * 登录地址
     */
    private String loginLocation;
    /**
     * 浏览器类型
     */
    private String browser;
    /**
     * 操作系统
     */
    private String os;
    /**
     * 在线状态
     */
    private OnlineStatus status = OnlineStatus.on_line;
    /**
     * session创建时间
     */
    private LocalDateTime startTimestamp;
    /**
     * session最后访问时间
     */
    private LocalDateTime lastAccessTime;
    /**
     * 超时时间，单位为分钟
     */
    private Long expireTime;
}
