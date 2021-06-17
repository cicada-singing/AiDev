package com.aidev.system.service;

import com.aidev.system.domain.SysConfig;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 参数配置 服务层
 *
 * @author aidev
 */
public interface ISysConfigService extends IService<SysConfig> {
    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数键名
     * @return 参数键值
     */
    String selectConfigByKey(String configKey);

    /**
     * 查询参数配置列表
     *
     * @param domain 参数配置信息
     * @return 参数配置集合
     */
    List<SysConfig> selectConfigList(SysConfig domain);

    /**
     * 新增参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    boolean insertConfig(SysConfig config);

    /**
     * 修改参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    boolean updateConfig(SysConfig config);

    /**
     * 批量删除参数配置信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    void deleteConfigByIds(String ids);

    /**
     * 加载参数缓存数据
     */
    void loadingConfigCache();

    /**
     * 清空参数缓存数据
     */
    void clearConfigCache();

    /**
     * 重置参数缓存数据
     */
    void resetConfigCache();

    /**
     * 校验参数键名是否唯一
     *
     * @param config 参数信息
     * @return 结果
     */
    String checkConfigKeyUnique(SysConfig config);
}
