package com.aidev.system.service.impl;

import com.aidev.common.constant.Constants;
import com.aidev.common.constant.UserConstants;
import com.aidev.common.core.text.Convert;
import com.aidev.common.exception.BusinessException;
import com.aidev.common.utils.CacheUtils;
import com.aidev.system.domain.SysConfig;
import com.aidev.system.mapper.SysConfigMapper;
import com.aidev.system.service.ISysConfigService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Objects;

/**
 * 参数配置 服务层实现
 *
 * @author aidev
 */
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig> implements ISysConfigService {
    /**
     * 项目启动时，初始化参数到缓存
     */
    @PostConstruct
    public void init() {
        loadingConfigCache();
    }

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数key
     * @return 参数键值
     */
    @Override
    public String selectConfigByKey(String configKey) {
        String configValue = Convert.toStr(CacheUtils.get(getCacheName(), getCacheKey(configKey)));
        if (StringUtils.isNotEmpty(configValue)) {
            return configValue;
        }
        SysConfig config = lambdaQuery().eq(SysConfig::getConfigKey, configKey).one();
        if (Objects.nonNull(config)) {
            CacheUtils.put(getCacheName(), getCacheKey(configKey), config.getConfigValue());
            return config.getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    /**
     * 查询参数配置列表
     *
     * @param domain 参数配置信息
     * @return 参数配置集合
     */
    @Override
    public List<SysConfig> selectConfigList(SysConfig domain) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(domain.getConfigName()), SysConfig::getConfigName, domain.getConfigName())
                .eq(StringUtils.isNotBlank(domain.getConfigType()), SysConfig::getConfigType, domain.getConfigType())
                .like(StringUtils.isNotBlank(domain.getConfigKey()), SysConfig::getConfigKey, domain.getConfigKey())
                .between(Objects.nonNull(domain.getStartTime()) && Objects.nonNull(domain.getEndTime()), SysConfig::getCreateTime, domain.getStartTime(), domain.getEndTime())
                .list();
    }

    /**
     * 新增参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public boolean insertConfig(SysConfig config) {
        boolean save = save(config);
        if (save) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
        return save;
    }

    /**
     * 修改参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public boolean updateConfig(SysConfig config) {
        boolean update = updateById(config);
        if (update) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
        return update;
    }

    /**
     * 批量删除参数配置对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public void deleteConfigByIds(String ids) {
        Long[] configIds = Convert.toLongArray(ids);
        for (Long configId : configIds) {
            SysConfig config = getById(configId);
            if (StringUtils.equals(UserConstants.YES, config.getConfigType())) {
                throw new BusinessException(String.format("内置参数【%1$s】不能删除 ", config.getConfigKey()));
            }
            removeById(configId);
            CacheUtils.remove(getCacheName(), getCacheKey(config.getConfigKey()));
        }
    }

    /**
     * 加载参数缓存数据
     */
    @Override
    public void loadingConfigCache() {
        List<SysConfig> configsList = lambdaQuery().list();
        for (SysConfig config : configsList) {
            CacheUtils.put(getCacheName(), getCacheKey(config.getConfigKey()), config.getConfigValue());
        }
    }

    /**
     * 清空参数缓存数据
     */
    @Override
    public void clearConfigCache() {
        CacheUtils.removeAll(getCacheName());
    }

    /**
     * 重置参数缓存数据
     */
    @Override
    public void resetConfigCache() {
        clearConfigCache();
        loadingConfigCache();
    }

    /**
     * 校验参数键名是否唯一
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public String checkConfigKeyUnique(SysConfig config) {
        Long configId = Objects.isNull(config.getConfigId()) ? -1L : config.getConfigId();
        List<SysConfig> sysConfigs = lambdaQuery().eq(SysConfig::getConfigKey, config.getConfigKey()).page(new Page<>(1, 1)).getRecords();
        if (!CollectionUtils.isEmpty(sysConfigs) && !Objects.equals(sysConfigs.get(0).getConfigId(), configId)) {
            return UserConstants.CONFIG_KEY_NOT_UNIQUE;
        }
        return UserConstants.CONFIG_KEY_UNIQUE;
    }

    /**
     * 获取cache name
     *
     * @return 缓存名
     */
    private String getCacheName() {
        return Constants.SYS_CONFIG_CACHE;
    }

    /**
     * 设置cache key
     *
     * @param configKey 参数键
     * @return 缓存键key
     */
    private String getCacheKey(String configKey) {
        return Constants.SYS_CONFIG_KEY + configKey;
    }
}
