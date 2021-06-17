package com.aidev.generator.service.impl;

import com.aidev.generator.domain.GenTableColumn;
import com.aidev.generator.mapper.OracleTableColumnMapper;
import com.aidev.generator.service.IDbTableColumnService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author aidev
 */
@Service
@Profile("oracle")
public class OracleTableColumnServiceImpl extends ServiceImpl<OracleTableColumnMapper, GenTableColumn> implements IDbTableColumnService {
    @Override
    public List<GenTableColumn> selectDbTableColumnsByName(String tableName) {
        return getBaseMapper().selectDbTableColumnsByName(tableName);
    }
}