package com.aidev.framework.web.service;

import com.aidev.system.service.ISysConfigService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * RuoYi 首创 html 调用 thymeleaf 实现参数管理
 *
 * @author aidev
 */
@Service("config")
public class ConfigService {
    @Resource
    private ISysConfigService configService;

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数键名
     * @return 参数键值
     */
    public String getKey(String configKey) {
        return configService.selectConfigByKey(configKey);
    }
}
