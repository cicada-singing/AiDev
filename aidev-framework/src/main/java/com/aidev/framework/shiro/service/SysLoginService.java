package com.aidev.framework.shiro.service;

import com.aidev.common.constant.Constants;
import com.aidev.common.constant.ShiroConstants;
import com.aidev.common.constant.UserConstants;
import com.aidev.common.core.domain.entity.SysUser;
import com.aidev.common.enums.UserStatus;
import com.aidev.common.exception.user.*;
import com.aidev.common.utils.MessageUtils;
import com.aidev.common.utils.ServletUtils;
import com.aidev.common.utils.ShiroUtils;
import com.aidev.framework.manager.AsyncManager;
import com.aidev.framework.manager.factory.AsyncFactory;
import com.aidev.system.service.ISysUserService;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * 登录校验方法
 *
 * @author aidev
 */
@Component
public class SysLoginService {
    @Resource
    private SysPasswordService passwordService;
    @Resource
    private ISysUserService userService;

    /**
     * 登录
     */
    public SysUser login(String username, String password) {
        // 验证码校验
        if (ShiroConstants.CAPTCHA_ERROR.equals(ServletUtils.getRequest().getAttribute(ShiroConstants.CURRENT_CAPTCHA))) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
            throw new CaptchaException();
        }
        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null")));
            throw new UserNotExistsException();
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // 查询用户信息
        SysUser user = userService.lambdaQuery().eq(SysUser::getLoginName, username).one();

        /**
         if (user == null && maybeMobilePhoneNumber(username))
         {
         user = userService.selectUserByPhoneNumber(username);
         }

         if (user == null && maybeEmail(username))
         {
         user = userService.selectUserByEmail(username);
         }
         */

        if (user == null) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.not.exists")));
            throw new UserNotExistsException();
        }

        if (UserStatus.DELETED.getCode().equals(user.getDelFlag())) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.delete")));
            throw new UserDeleteException();
        }

        if (UserStatus.DISABLE.getCode().equals(user.getStatus())) {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.blocked", user.getRemark())));
            throw new UserBlockedException();
        }

        passwordService.validate(user, password);

        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        // 记录登录信息
        userService.lambdaUpdate().set(SysUser::getLoginIp, ShiroUtils.getIp()).set(SysUser::getLoginDate, LocalDateTime.now()).eq(SysUser::getUserId, user.getUserId());

        return user;
    }

    /**
     private boolean maybeEmail(String username)
     {
     if (!username.matches(UserConstants.EMAIL_PATTERN))
     {
     return false;
     }
     return true;
     }

     private boolean maybeMobilePhoneNumber(String username)
     {
     if (!username.matches(UserConstants.MOBILE_PHONE_NUMBER_PATTERN))
     {
     return false;
     }
     return true;
     }
     */
}
