package com.aidev.system.service.impl;

import com.aidev.system.domain.SysLogininfor;
import com.aidev.system.mapper.SysLogininforMapper;
import com.aidev.system.service.ISysLogininforService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author aidev
 */
@Service
public class SysLogininforServiceImpl extends ServiceImpl<SysLogininforMapper, SysLogininfor> implements ISysLogininforService {
    @Override
    public List<SysLogininfor> selectLogininforList(SysLogininfor domain) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(domain.getIpaddr()), SysLogininfor::getIpaddr, domain.getIpaddr())
                .eq(StringUtils.isNotBlank(domain.getStatus()), SysLogininfor::getStatus, domain.getStatus())
                .like(StringUtils.isNotBlank(domain.getLoginName()), SysLogininfor::getLoginName, domain.getLoginName())
                .between(Objects.nonNull(domain.getStartTime()) && Objects.nonNull(domain.getEndTime()), SysLogininfor::getLoginTime, domain.getStartTime(), domain.getEndTime())
                .list();
    }

    @Override
    public void cleanLogininfor() {
        getBaseMapper().cleanLogininfor();
    }
}
