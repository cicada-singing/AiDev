package com.aidev.generator.mapper;

import com.aidev.generator.domain.GenTableColumn;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 业务 数据层
 *
 * @author aidev
 */
@Mapper
public interface OracleTableColumnMapper extends BaseMapper<GenTableColumn> {
    /**
     * 根据表名称查询列信息
     *
     * @param tableName
     * @return
     */
    List<GenTableColumn> selectDbTableColumnsByName(String tableName);
}