package com.aidev.system.mapper;

import com.aidev.common.core.domain.entity.SysRole;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色表 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {
    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    List<SysRole> selectRolesByUserId(@Param("userId") Long userId);

    /**
     * 根据条件分页查询角色数据
     *
     * @param wrapper 角色信息
     * @return 角色数据集合信息
     */
    List<SysRole> selectRoleList(@Param(Constants.WRAPPER) Wrapper wrapper);
}
