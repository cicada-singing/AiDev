package com.aidev.system.service;

import com.aidev.common.core.domain.entity.SysDictData;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 字典 业务层
 *
 * @author aidev
 */
public interface ISysDictDataService extends IService<SysDictData> {
    /**
     * 根据条件分页查询字典数据
     *
     * @param domain 字典数据信息
     * @return 字典数据集合信息
     */
    List<SysDictData> selectDictDataList(SysDictData domain);

    /**
     * 批量删除字典数据
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    void deleteDictDataByIds(String ids);

    /**
     * 新增保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    boolean insertDictData(SysDictData dictData);

    /**
     * 修改保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    boolean updateDictData(SysDictData dictData);

    /**
     * 获取正常字典数据信息
     *
     * @param dictType
     * @return
     */
    List<SysDictData> getNormalSysDictData(String dictType);
}
