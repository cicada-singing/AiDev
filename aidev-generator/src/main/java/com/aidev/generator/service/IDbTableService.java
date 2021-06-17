package com.aidev.generator.service;

import com.aidev.generator.domain.GenTable;
import com.aidev.generator.domain.GenTableColumn;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author aidev
 */
public interface IDbTableService extends IService<GenTable> {
    /**
     * 查询数据库列表
     *
     * @param genTable
     * @return
     */
    List<GenTable> selectDbTableList(GenTable genTable);

    /**
     * 查询数据库列表
     *
     * @param tableNames
     * @return
     */
    List<GenTable> selectDbTableListByNames(String[] tableNames);
}
