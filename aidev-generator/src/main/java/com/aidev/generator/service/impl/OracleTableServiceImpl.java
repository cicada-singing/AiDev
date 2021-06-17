package com.aidev.generator.service.impl;

import com.aidev.generator.domain.GenTable;
import com.aidev.generator.mapper.OracleTableMapper;
import com.aidev.generator.service.IDbTableService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author aidev
 */
@Service
@Profile("oracle")
public class OracleTableServiceImpl extends ServiceImpl<OracleTableMapper, GenTable> implements IDbTableService {
    @Override
    public List<GenTable> selectDbTableList(GenTable genTable) {
        return getBaseMapper().selectDbTableList(genTable);
    }

    @Override
    public List<GenTable> selectDbTableListByNames(String[] tableNames) {
        return getBaseMapper().selectDbTableListByNames(tableNames);
    }
}