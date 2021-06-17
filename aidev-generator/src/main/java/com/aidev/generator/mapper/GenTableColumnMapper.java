package com.aidev.generator.mapper;

import com.aidev.generator.domain.GenTableColumn;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 业务字段 数据层
 *
 * @author aidev
 */
@Mapper
public interface GenTableColumnMapper extends BaseMapper<GenTableColumn> {
    /**
     * 根据表名称查询列信息
     */
    List<GenTableColumn> selectByTableId(@Param("tableId") Long tableId);

    /**
     * 批量删除业务字段
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteByTableIds(Long[] ids);
}
