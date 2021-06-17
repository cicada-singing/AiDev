package com.aidev.generator.service;

import com.aidev.generator.domain.GenTableColumn;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author aidev
 */
public interface IDbTableColumnService extends IService<GenTableColumn> {
    /**
     * 根据表名称查询列信息
     *
     * @param tableName
     * @return
     */
    List<GenTableColumn> selectDbTableColumnsByName(String tableName);
}
