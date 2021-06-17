package com.aidev.system.mapper;

import com.aidev.system.domain.SysUserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户与角色关联表 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRole> {
}
