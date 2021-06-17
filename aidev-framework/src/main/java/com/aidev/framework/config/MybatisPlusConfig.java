package com.aidev.framework.config;

import com.aidev.common.utils.ShiroUtils;
import com.aidev.common.utils.snowflakeid.IdUtils;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.autoconfigure.ConfigurationCustomizer;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.core.incrementer.IdentifierGenerator;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.github.pagehelper.PageInterceptor;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @author cicada-singing
 */
@Configuration
public class MybatisPlusConfig {
    /**
     * pagehelper 分页插件
     */
    @Bean
    public PageInterceptor pageInterceptor() {
        return new PageInterceptor();
    }

    /**
     * mybatis-plus-boot-starter 新的分页插件
     */
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.ORACLE));
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.POSTGRE_SQL));
        return interceptor;
    }

    /**
     * mybatis-plus-boot-starter 新的分页插件：
     * 一缓和二缓遵循 mybatis 的规则，需要设置 MybatisConfiguration#useDeprecatedExecutor = false 避免缓存出现问题
     */
    @Bean
    public ConfigurationCustomizer configurationCustomizer() {
        return configuration -> configuration.setUseDeprecatedExecutor(false);
    }

    @Bean
    public IdentifierGenerator identifierGenerator() {
        return entity -> IdUtils.nextId();
    }

    @Bean
    public MetaObjectHandler metaObjectHandler() {
        return new MetaObjectHandler() {
            @Override
            public void insertFill(MetaObject metaObject) {
                if (metaObject.hasGetter("createTime") && Objects.isNull(metaObject.getValue("createTime"))) {
                    this.setFieldValByName("createTime", LocalDateTime.now(), metaObject);
                }
                if (metaObject.hasGetter("createBy")
                        && (Objects.isNull(metaObject.getValue("createBy")) || StringUtils.isBlank(String.valueOf(metaObject.getValue("createBy"))))) {
                    this.setFieldValByName("createBy", ShiroUtils.getLoginName(), metaObject);
                }
                if (metaObject.hasGetter("operTime") && Objects.isNull(metaObject.getValue("operTime"))) {
                    this.setFieldValByName("operTime", LocalDateTime.now(), metaObject);
                }
            }

            @Override
            public void updateFill(MetaObject metaObject) {
                if (metaObject.hasGetter("updateTime")) {
                    this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
                }
                if (metaObject.hasGetter("updateBy")) {
                    this.setFieldValByName("updateBy", ShiroUtils.getLoginName(), metaObject);
                }
            }
        };
    }
}
