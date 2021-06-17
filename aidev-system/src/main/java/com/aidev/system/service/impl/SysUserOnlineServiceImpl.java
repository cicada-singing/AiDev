package com.aidev.system.service.impl;

import com.aidev.common.constant.ShiroConstants;
import com.aidev.common.utils.DateUtils;
import com.aidev.common.utils.StringUtils;
import com.aidev.system.domain.SysUserOnline;
import com.aidev.system.mapper.SysUserOnlineMapper;
import com.aidev.system.service.ISysUserOnlineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Date;
import java.util.Deque;
import java.util.List;
import java.util.Objects;

/**
 * 在线用户 服务层处理
 *
 * @author aidev
 */
@Service
public class SysUserOnlineServiceImpl extends ServiceImpl<SysUserOnlineMapper, SysUserOnline> implements ISysUserOnlineService {
    @Resource
    private EhCacheManager ehCacheManager;

    @Override
    public SysUserOnline selectOnlineById(String sessionId) {
        return lambdaQuery().eq(SysUserOnline::getSessionId, sessionId).one();
    }

    @Override
    public void deleteOnlineById(String sessionId) {
        SysUserOnline userOnline = selectOnlineById(sessionId);
        if (Objects.nonNull(userOnline)) {
            lambdaUpdate().eq(SysUserOnline::getSessionId, sessionId).remove();
        }
    }

    @Override
    public void batchDeleteOnline(List<String> sessions) {
        for (String sessionId : sessions) {
            SysUserOnline userOnline = selectOnlineById(sessionId);
            if (Objects.nonNull(userOnline)) {
                lambdaUpdate().eq(SysUserOnline::getSessionId, sessionId).remove();
            }
        }
    }

    @Override
    public void saveOnline(SysUserOnline online) {
        SysUserOnline sysUserOnline = lambdaQuery().eq(SysUserOnline::getSessionId, online.getSessionId()).one();
        if (Objects.isNull(sysUserOnline)) {
            save(online);
        } else {
            lambdaUpdate().eq(SysUserOnline::getSessionId, online.getSessionId()).update(online);
        }
    }

    @Override
    public List<SysUserOnline> selectUserOnlineList(SysUserOnline userOnline) {
        return lambdaQuery()
                .like(SysUserOnline::getIpaddr, userOnline.getIpaddr())
                .like(SysUserOnline::getLoginName, userOnline.getLoginName())
                .list();
    }

    @Override
    public void forceLogout(String sessionId) {
        lambdaUpdate().eq(SysUserOnline::getSessionId, sessionId).remove();
    }

    @Override
    public void removeUserCache(String loginName, String sessionId) {
        Cache<String, Deque<Serializable>> cache = ehCacheManager.getCache(ShiroConstants.SYS_USERCACHE);
        Deque<Serializable> deque = cache.get(loginName);
        if (StringUtils.isEmpty(deque) || deque.size() == 0) {
            return;
        }
        deque.remove(sessionId);
    }

    @Override
    public List<SysUserOnline> selectOnlineByExpired(Date expiredDate) {
        return lambdaQuery()
                .le(SysUserOnline::getLastAccessTime, DateUtils.toLocalDateTime(expiredDate))
                .orderByAsc(SysUserOnline::getLastAccessTime)
                .list();
    }
}
