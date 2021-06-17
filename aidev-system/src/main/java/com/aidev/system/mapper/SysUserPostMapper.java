package com.aidev.system.mapper;

import com.aidev.system.domain.SysUserPost;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户与岗位关联表 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysUserPostMapper extends BaseMapper<SysUserPost> {
}
