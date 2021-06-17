package com.aidev.system.mapper;

import com.aidev.system.domain.SysNotice;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 公告 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysNoticeMapper extends BaseMapper<SysNotice> {
}