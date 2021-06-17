package com.aidev.generator.mapper;

import com.aidev.generator.domain.GenTable;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 业务 数据层
 *
 * @author aidev
 */
@Mapper
public interface GenTableMapper extends BaseMapper<GenTable> {
}