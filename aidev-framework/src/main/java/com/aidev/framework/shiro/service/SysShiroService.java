package com.aidev.framework.shiro.service;

import com.aidev.common.utils.DateUtils;
import com.aidev.framework.shiro.session.OnlineSession;
import com.aidev.system.domain.SysUserOnline;
import com.aidev.system.service.ISysUserOnlineService;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Objects;

/**
 * 会话db操作处理
 *
 * @author aidev
 */
@Component
public class SysShiroService {
    @Resource
    private ISysUserOnlineService onlineService;

    /**
     * 删除会话
     *
     * @param onlineSession 会话信息
     */
    public void deleteSession(OnlineSession onlineSession) {
        onlineService.deleteOnlineById(String.valueOf(onlineSession.getId()));
    }

    /**
     * 获取会话信息
     *
     * @param sessionId
     * @return
     */
    public Session getSession(Serializable sessionId) {
        SysUserOnline userOnline = onlineService.selectOnlineById(String.valueOf(sessionId));
        return Objects.isNull(userOnline) ? null : createSession(userOnline);
    }

    public Session createSession(SysUserOnline userOnline) {
        OnlineSession onlineSession = new OnlineSession();
        if (Objects.nonNull(userOnline)) {
            onlineSession.setId(userOnline.getSessionId());
            onlineSession.setHost(userOnline.getIpaddr());
            onlineSession.setBrowser(userOnline.getBrowser());
            onlineSession.setOs(userOnline.getOs());
            onlineSession.setDeptName(userOnline.getDeptName());
            onlineSession.setLoginName(userOnline.getLoginName());
            onlineSession.setStartTimestamp(DateUtils.toDate(userOnline.getStartTimestamp()));
            onlineSession.setLastAccessTime(DateUtils.toDate(userOnline.getLastAccessTime()));
            onlineSession.setTimeout(userOnline.getExpireTime());
        }
        return onlineSession;
    }
}
