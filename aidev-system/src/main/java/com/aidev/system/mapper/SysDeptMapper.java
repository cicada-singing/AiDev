package com.aidev.system.mapper;

import com.aidev.common.core.domain.entity.SysDept;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门管理 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {
    /**
     * 查询部门名称
     *
     * @param deptId
     * @return
     */
    String selectDeptNameById(@Param("deptId") Long deptId);

    /**
     * 查询部门管理数据
     *
     * @param wrapper
     * @return
     */
    List<SysDept> selectDeptList(@Param(Constants.WRAPPER) Wrapper wrapper);

    /**
     * 根据角色ID查询部门
     *
     * @param roleId 角色ID
     * @return 部门列表
     */
    List<SysDept> selectRoleDeptTreeByRoleId(@Param("roleId") Long roleId);

    /**
     * 根据ID查询所有子部门（正常状态）
     *
     * @param deptId 部门ID
     * @return 子部门数
     */
    int selectNormalChildrenDeptById(@Param("deptId") Long deptId);
}
