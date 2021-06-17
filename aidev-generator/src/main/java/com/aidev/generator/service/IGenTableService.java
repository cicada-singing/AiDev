package com.aidev.generator.service;

import com.aidev.generator.domain.GenTable;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 业务 服务层
 *
 * @author aidev
 */
public interface IGenTableService extends IService<GenTable> {
    /**
     * 查询业务信息
     */
    GenTable selectGenTableById(Long id);

    /**
     * 修改业务
     */
    void updateGenTable(GenTable genTable);

    /**
     * 删除业务信息
     */
    void deleteGenTableByIds(String ids);

    /**
     * 导入表结构
     */
    void importGenTable(List<GenTable> tableList, String operName);

    /**
     * 预览代码
     */
    Map<String, String> previewCode(Long tableId);

    /**
     * 生成代码（下载方式）
     */
    byte[] downloadCode(String tableName);

    /**
     * 生成代码（自定义路径）
     */
    void generatorCode(String tableName);

    /**
     * 同步数据库
     */
    void synchDb(String tableName);

    /**
     * 批量生成代码（下载方式）
     */
    byte[] downloadCode(String[] tableNames);

    /**
     * 修改保存参数校验
     */
    void validateEdit(GenTable genTable);
}
