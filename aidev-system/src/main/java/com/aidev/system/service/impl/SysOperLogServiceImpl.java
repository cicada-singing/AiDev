package com.aidev.system.service.impl;

import com.aidev.system.domain.SysOperLog;
import com.aidev.system.mapper.SysOperLogMapper;
import com.aidev.system.service.ISysOperLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * 操作日志 服务层处理
 *
 * @author aidev
 */
@Service
public class SysOperLogServiceImpl extends ServiceImpl<SysOperLogMapper, SysOperLog> implements ISysOperLogService {
    @Override
    public List<SysOperLog> selectOperLogList(SysOperLog domain) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(domain.getTitle()), SysOperLog::getTitle, domain.getTitle())
                .eq(Objects.nonNull(domain.getBusinessType()), SysOperLog::getBusinessType, domain.getBusinessType())
                .in(ArrayUtils.isNotEmpty(domain.getBusinessTypes()), SysOperLog::getBusinessType, domain.getBusinessTypes())
                .eq(Objects.nonNull(domain.getStatus()), SysOperLog::getStatus, domain.getStatus())
                .like(StringUtils.isNotBlank(domain.getOperName()), SysOperLog::getOperName, domain.getOperName())
                .between(Objects.nonNull(domain.getStartTime()) && Objects.nonNull(domain.getEndTime()), SysOperLog::getOperTime, domain.getStartTime(), domain.getEndTime())
                .list();
    }

    @Override
    public void cleanOperLog() {
        getBaseMapper().cleanOperLog();
    }
}
