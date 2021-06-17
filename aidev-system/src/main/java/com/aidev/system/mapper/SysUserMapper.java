package com.aidev.system.mapper;

import com.aidev.common.core.domain.entity.SysUser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户表 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
    /**
     * 根据条件分页查询用户列表
     *
     * @param wrapper 用户信息
     * @return 用户信息集合信息
     */
    List<SysUser> selectUserList(@Param(Constants.WRAPPER) Wrapper wrapper);

    /**
     * 根据条件分页查询未已配用户角色列表
     *
     * @param wrapper 用户信息
     * @return 用户信息集合信息
     */
    List<SysUser> selectUserList2(@Param(Constants.WRAPPER) Wrapper wrapper);
}
