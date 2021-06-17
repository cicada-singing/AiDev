package com.aidev.generator.mapper;

import com.aidev.generator.domain.GenTable;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 业务 数据层
 *
 * @author aidev
 */
@Mapper
public interface PostgresqlTableMapper extends BaseMapper<GenTable> {
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