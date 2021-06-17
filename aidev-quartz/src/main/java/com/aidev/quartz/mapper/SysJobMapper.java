package com.aidev.quartz.mapper;

import com.aidev.quartz.domain.SysJob;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 调度任务信息 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysJobMapper extends BaseMapper<SysJob> {
}
