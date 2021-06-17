package com.aidev.generator.service.impl;

import com.aidev.generator.domain.GenTableColumn;
import com.aidev.generator.mapper.GenTableColumnMapper;
import com.aidev.generator.service.IGenTableColumnService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 业务字段 服务层实现
 *
 * @author aidev
 */
@Service
public class GenTableColumnServiceImpl extends ServiceImpl<GenTableColumnMapper, GenTableColumn> implements IGenTableColumnService {
}