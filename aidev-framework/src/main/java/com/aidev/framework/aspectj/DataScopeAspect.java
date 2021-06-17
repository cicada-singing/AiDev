package com.aidev.framework.aspectj;

import com.aidev.common.annotation.DataScope;
import com.aidev.common.constant.SqlConstants;
import com.aidev.common.core.domain.ParamEntity;
import com.aidev.common.core.domain.entity.SysRole;
import com.aidev.common.core.domain.entity.SysUser;
import com.aidev.common.utils.ShiroUtils;
import com.aidev.common.utils.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Objects;

/**
 * 数据过滤处理
 *
 * @author aidev
 */
@Aspect
@Component
public class DataScopeAspect {
    /**
     * 全部数据权限
     */
    public static final String DATA_SCOPE_ALL = "1";

    /**
     * 自定数据权限
     */
    public static final String DATA_SCOPE_CUSTOM = "2";

    /**
     * 部门数据权限
     */
    public static final String DATA_SCOPE_DEPT = "3";

    /**
     * 部门及以下数据权限
     */
    public static final String DATA_SCOPE_DEPT_AND_CHILD = "4";

    /**
     * 仅本人数据权限
     */
    public static final String DATA_SCOPE_SELF = "5";

    /**
     * 数据权限过滤关键字
     */
    public static final String DATA_SCOPE = "dataScope";

    /**
     * 数据范围过滤
     *
     * @param joinPoint 切点
     * @param user      用户
     * @param deptAlias 部门别名
     * @param userAlias 用户别名
     */
    public static void dataScopeFilter(JoinPoint joinPoint, SysUser user, String deptAlias, String userAlias) {
        StringBuilder sqlString = new StringBuilder();

        for (SysRole role : user.getRoles()) {
            String dataScope = role.getDataScope();
            if (DATA_SCOPE_ALL.equals(dataScope)) {
                sqlString = new StringBuilder();
                break;
            } else if (DATA_SCOPE_CUSTOM.equals(dataScope)) {
                sqlString.append(StringUtils.format(
                        "SELECT rd2e.* FROM aidev_sys_role_dept rd2e WHERE {}.dept_id = rd2e.dept_id AND rd2e.role_id = {}",
                        deptAlias,
                        role.getRoleId()));
            } else if (DATA_SCOPE_DEPT.equals(dataScope)) {
                sqlString.append(StringUtils.format(
                        "SELECT d2e.* FROM aidev_sys_dept d2e WHERE {}.dept_id = d2e.dept_id AND d2e.dept_id = {}",
                        deptAlias,
                        user.getDeptId()));
            } else if (DATA_SCOPE_DEPT_AND_CHILD.equals(dataScope)) {
                sqlString.append(StringUtils.format(
                        "SELECT d2e.* FROM aidev_sys_dept d2e WHERE {}.dept_id = d2e.dept_id AND d2e.dept_id = {} OR EXISTS ( SELECT da2e.* FROM aidev_sys_dept_ance da2e WHERE d2e.dept_id = da2e.dept_id AND da2e.ance_id = {} )",
                        deptAlias,
                        user.getDeptId(),
                        user.getDeptId()));
            } else if (DATA_SCOPE_SELF.equals(dataScope)) {
                if (StringUtils.isNotBlank(userAlias)) {
                    sqlString.append(StringUtils.format(
                            "SELECT u2e.* FROM aidev_sys_user u2e WHERE {}.user_id = u2e.user_id AND u2e.user_id = {}",
                            userAlias,
                            user.getUserId()));
                } else {
                    // 数据权限为仅本人且没有userAlias别名不查询任何数据
                    sqlString.append(SqlConstants.N_A);
                }
            }
        }

        if (StringUtils.isNotBlank(sqlString.toString())) {
            Object params = joinPoint.getArgs()[0];
            if (Objects.nonNull(params) && params instanceof ParamEntity) {
                ParamEntity paramEntity = (ParamEntity) params;
                paramEntity.setDataScopeSql(sqlString.toString());
            }
        }
    }

    // 配置织入点
    @Pointcut("@annotation(com.aidev.common.annotation.DataScope)")
    public void dataScopePointCut() {
    }

    @Before("dataScopePointCut()")
    public void doBefore(JoinPoint point) throws Throwable {
        clearDataScope(point);
        handleDataScope(point);
    }

    protected void handleDataScope(final JoinPoint joinPoint) {
        // 获得注解
        DataScope controllerDataScope = getAnnotationLog(joinPoint);
        if (controllerDataScope == null) {
            return;
        }
        // 获取当前的用户
        SysUser currentUser = ShiroUtils.getSysUser();
        if (currentUser != null) {
            // 如果是超级管理员，则不过滤数据
            if (!currentUser.isAdmin()) {
                dataScopeFilter(joinPoint, currentUser, controllerDataScope.deptAlias(), controllerDataScope.userAlias());
            }
        }
    }

    /**
     * 是否存在注解，如果存在就获取
     */
    private DataScope getAnnotationLog(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null) {
            return method.getAnnotation(DataScope.class);
        }
        return null;
    }

    /**
     * 拼接权限sql前先清空params.dataScope参数防止注入
     */
    private void clearDataScope(final JoinPoint joinPoint) {
        Object params = joinPoint.getArgs()[0];
        if (Objects.nonNull(params) && params instanceof ParamEntity) {
            ParamEntity paramEntity = (ParamEntity) params;
            paramEntity.setDataScopeSql("");
        }
    }
}
