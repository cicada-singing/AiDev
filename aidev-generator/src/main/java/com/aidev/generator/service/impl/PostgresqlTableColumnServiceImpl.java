package com.aidev.generator.service.impl;

import com.aidev.generator.domain.GenTableColumn;
import com.aidev.generator.mapper.MysqlTableColumnMapper;
import com.aidev.generator.mapper.PostgresqlTableColumnMapper;
import com.aidev.generator.mapper.PostgresqlTableMapper;
import com.aidev.generator.service.IDbTableColumnService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author aidev
 */
@Service
@Profile("postgresql")
public class PostgresqlTableColumnServiceImpl extends ServiceImpl<PostgresqlTableColumnMapper, GenTableColumn> implements IDbTableColumnService {
    @Override
    public List<GenTableColumn> selectDbTableColumnsByName(String tableName) {
        return getBaseMapper().selectDbTableColumnsByName(tableName);
    }
}