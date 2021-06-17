package com.aidev.quartz.mapper;

import com.aidev.quartz.domain.SysJobLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 调度任务日志信息 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysJobLogMapper extends BaseMapper<SysJobLog> {
    /**
     * 清空任务日志
     */
    @Select("TRUNCATE TABLE aidev_sys_job_log")
    void cleanJobLog();
}
