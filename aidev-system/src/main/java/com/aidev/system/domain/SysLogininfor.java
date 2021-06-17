package com.aidev.system.domain;

import com.aidev.common.annotation.Excel;
import com.aidev.common.annotation.Excel.ColumnType;
import com.aidev.common.core.domain.ParamEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 系统访问记录
 *
 * @author aidev
 */
@TableName("aidev_sys_logininfor")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Accessors(chain = true)
public class SysLogininfor extends ParamEntity {
    /**
     * ID
     */
    @Excel(name = "序号", cellType = ColumnType.NUMERIC)
    @TableId
    private Long infoId;
    /**
     * 用户账号
     */
    @Excel(name = "用户账号")
    private String loginName;
    /**
     * 登录IP地址
     */
    @Excel(name = "登录地址")
    private String ipaddr;
    /**
     * 登录地点
     */
    @Excel(name = "登录地点")
    private String loginLocation;
    /**
     * 浏览器类型
     */
    @Excel(name = "浏览器")
    private String browser;
    /**
     * 操作系统
     */
    @Excel(name = "操作系统")
    private String os;
    /**
     * 登录状态 0成功 1失败
     */
    @Excel(name = "登录状态", readConverterExp = "0=成功,1=失败")
    private String status;
    /**
     * 提示消息
     */
    @Excel(name = "提示消息")
    private String msg;
    /**
     * 访问时间
     */
    @Excel(name = "访问时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime loginTime;
    /**
     * 开始时间
     */
    @TableField(exist = false)
    private LocalDateTime startTime;
    /**
     * 结束时间
     */
    @TableField(exist = false)
    private LocalDateTime endTime;
}