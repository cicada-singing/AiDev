package com.aidev.system.mapper;

import com.aidev.system.domain.SysPost;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 岗位信息 数据层
 *
 * @author aidev
 */
@Mapper
public interface SysPostMapper extends BaseMapper<SysPost> {
    /**
     * 根据用户ID查询岗位
     *
     * @param userId 用户ID
     * @return 岗位列表
     */
    List<SysPost> selectPostsByUserId(@Param("userId") Long userId);
}
