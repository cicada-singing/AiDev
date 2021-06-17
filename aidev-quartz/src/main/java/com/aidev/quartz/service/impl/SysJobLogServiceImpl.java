package com.aidev.quartz.service.impl;

import com.aidev.quartz.domain.SysJobLog;
import com.aidev.quartz.mapper.SysJobLogMapper;
import com.aidev.quartz.service.ISysJobLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * 定时任务调度日志信息 服务层
 *
 * @author aidev
 */
@Service
public class SysJobLogServiceImpl extends ServiceImpl<SysJobLogMapper, SysJobLog> implements ISysJobLogService {
    @Override
    public List<SysJobLog> selectJobLogList(SysJobLog domain) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(domain.getJobName()), SysJobLog::getJobName, domain.getJobName())
                .eq(StringUtils.isNotBlank(domain.getJobGroup()), SysJobLog::getJobGroup, domain.getJobGroup())
                .eq(StringUtils.isNotBlank(domain.getStatus()), SysJobLog::getStatus, domain.getStatus())
                .like(StringUtils.isNotBlank(domain.getInvokeTarget()), SysJobLog::getInvokeTarget, domain.getInvokeTarget())
                .between(Objects.nonNull(domain.getStartTime()) && Objects.nonNull(domain.getEndTime()), SysJobLog::getCreateTime, domain.getStartTime(), domain.getEndTime())
                .list();
    }

    @Override
    public void cleanJobLog() {
        getBaseMapper().cleanJobLog();
    }
}
