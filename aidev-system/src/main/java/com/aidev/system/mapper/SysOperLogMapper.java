package com.aidev.system.mapper;

import com.aidev.system.domain.SysOperLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 操作日志 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysOperLogMapper extends BaseMapper<SysOperLog> {
    /**
     * 清空操作日志
     */
    @Select("TRUNCATE TABLE aidev_sys_oper_log")
    void cleanOperLog();
}
