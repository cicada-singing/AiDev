package com.aidev.system.mapper;

import com.aidev.system.domain.SysLogininfor;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 系统访问日志情况信息 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysLogininforMapper extends BaseMapper<SysLogininfor> {
    /**
     * 清空系统登录日志
     */
    @Select("TRUNCATE TABLE aidev_sys_logininfor")
    void cleanLogininfor();
}
