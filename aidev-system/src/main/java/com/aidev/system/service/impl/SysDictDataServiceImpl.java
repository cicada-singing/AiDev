package com.aidev.system.service.impl;

import com.aidev.common.core.domain.entity.SysDictData;
import com.aidev.common.core.text.Convert;
import com.aidev.common.utils.DictUtils;
import com.aidev.system.mapper.SysDictDataMapper;
import com.aidev.system.service.ISysDictDataService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 字典 业务层处理
 *
 * @author aidev
 */
@Service
public class SysDictDataServiceImpl extends ServiceImpl<SysDictDataMapper, SysDictData> implements ISysDictDataService {
    /**
     * 根据条件分页查询字典数据
     *
     * @param domain 字典数据信息
     * @return 字典数据集合信息
     */
    @Override
    public List<SysDictData> selectDictDataList(SysDictData domain) {
        return lambdaQuery()
                .eq(StringUtils.isNotBlank(domain.getDictType()), SysDictData::getDictType, domain.getDictType())
                .like(StringUtils.isNotBlank(domain.getDictLabel()), SysDictData::getDictLabel, domain.getDictLabel())
                .eq(StringUtils.isNotBlank(domain.getStatus()), SysDictData::getStatus, domain.getStatus())
                .list();
    }

    /**
     * 批量删除字典数据
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    @Override
    public void deleteDictDataByIds(String ids) {
        Long[] dictCodes = Convert.toLongArray(ids);
        for (Long dictCode : dictCodes) {
            SysDictData data = getById(dictCode);
            removeById(dictCode);
            List<SysDictData> dictDatas = getNormalSysDictData(data.getDictType());
            DictUtils.setDictCache(data.getDictType(), dictDatas);
        }
    }

    /**
     * 新增保存字典数据信息
     *
     * @return
     */
    @Override
    public boolean insertDictData(SysDictData data) {
        boolean save = save(data);
        if (save) {
            List<SysDictData> dictDatas = getNormalSysDictData(data.getDictType());
            DictUtils.setDictCache(data.getDictType(), dictDatas);
        }
        return save;
    }

    /**
     * 修改保存字典数据信息
     *
     * @return
     */
    @Override
    public boolean updateDictData(SysDictData data) {
        boolean update = updateById(data);
        if (update) {
            List<SysDictData> dictDatas = getNormalSysDictData(data.getDictType());
            DictUtils.setDictCache(data.getDictType(), dictDatas);
        }
        return update;
    }

    @Override
    public List<SysDictData> getNormalSysDictData(String dictType) {
        return lambdaQuery()
                .eq(SysDictData::getStatus, "0")
                .eq(SysDictData::getDictType, dictType)
                .orderByAsc(SysDictData::getDictSort)
                .list();
    }
}
