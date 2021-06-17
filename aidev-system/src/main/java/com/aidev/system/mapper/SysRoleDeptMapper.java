package com.aidev.system.mapper;

import com.aidev.system.domain.SysRoleDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色与部门关联表 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysRoleDeptMapper extends BaseMapper<SysRoleDept> {
}
