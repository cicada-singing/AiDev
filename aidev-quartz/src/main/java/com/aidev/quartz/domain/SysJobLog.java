package com.aidev.quartz.domain;

import com.aidev.common.annotation.Excel;
import com.aidev.common.core.domain.ParamEntity;
import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 定时任务调度日志
 *
 * @author aidev
 */
@TableName("aidev_sys_job_log")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Accessors(chain = true)
public class SysJobLog extends ParamEntity {
    /**
     * ID
     */
    @Excel(name = "日志序号")
    @TableId
    private Long jobLogId;
    /**
     * 任务名称
     */
    @Excel(name = "任务名称")
    private String jobName;
    /**
     * 任务组名
     */
    @Excel(name = "任务组名")
    private String jobGroup;
    /**
     * 调用目标字符串
     */
    @Excel(name = "调用目标字符串")
    private String invokeTarget;
    /**
     * 日志信息
     */
    @Excel(name = "日志信息")
    private String jobMessage;
    /**
     * 执行状态（0正常 1失败）
     */
    @Excel(name = "执行状态", readConverterExp = "0=正常,1=失败")
    private String status;
    /**
     * 异常信息
     */
    @Excel(name = "异常信息")
    private String exceptionInfo;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;
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
