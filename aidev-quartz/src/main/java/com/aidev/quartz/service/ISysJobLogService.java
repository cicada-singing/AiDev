package com.aidev.quartz.service;

import com.aidev.quartz.domain.SysJobLog;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 定时任务调度日志信息信息 服务层
 *
 * @author aidev
 */
public interface ISysJobLogService extends IService<SysJobLog> {
    /**
     * 获取quartz调度器日志的计划任务
     *
     * @param domain 调度日志信息
     * @return 调度任务日志集合
     */
    List<SysJobLog> selectJobLogList(SysJobLog domain);

    /**
     * 清空任务日志
     */
    void cleanJobLog();
}
