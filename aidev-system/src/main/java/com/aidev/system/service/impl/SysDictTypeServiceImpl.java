package com.aidev.system.service.impl;

import com.aidev.common.constant.UserConstants;
import com.aidev.common.core.domain.Ztree;
import com.aidev.common.core.domain.entity.SysDictData;
import com.aidev.common.core.domain.entity.SysDictType;
import com.aidev.common.core.text.Convert;
import com.aidev.common.exception.BusinessException;
import com.aidev.common.utils.DictUtils;
import com.aidev.system.mapper.SysDictTypeMapper;
import com.aidev.system.service.ISysDictDataService;
import com.aidev.system.service.ISysDictTypeService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 字典 业务层处理
 *
 * @author aidev
 */
@Service
public class SysDictTypeServiceImpl extends ServiceImpl<SysDictTypeMapper, SysDictType> implements ISysDictTypeService {
    @Resource
    private ISysDictDataService dictDataService;

    /**
     * 项目启动时，初始化字典到缓存
     */
    @PostConstruct
    public void init() {
        loadingDictCache();
    }

    /**
     * 根据条件分页查询字典类型
     *
     * @param domain 字典类型信息
     * @return 字典类型集合信息
     */
    @Override
    public List<SysDictType> selectDictTypeList(SysDictType domain) {
        return lambdaQuery()
                .like(StringUtils.isNotBlank(domain.getDictName()), SysDictType::getDictName, domain.getDictName())
                .eq(StringUtils.isNotBlank(domain.getStatus()), SysDictType::getStatus, domain.getStatus())
                .like(StringUtils.isNotBlank(domain.getDictType()), SysDictType::getDictType, domain.getDictType())
                .between(Objects.nonNull(domain.getStartTime()) && Objects.nonNull(domain.getEndTime()), SysDictType::getCreateTime, domain.getStartTime(), domain.getEndTime())
                .list();
    }

    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    @Override
    public List<SysDictData> selectDictDataByType(String dictType) {
        List<SysDictData> dictDatas = DictUtils.getDictCache(dictType);
        if (CollectionUtils.isNotEmpty(dictDatas)) {
            return dictDatas;
        }
        dictDatas = dictDataService.getNormalSysDictData(dictType);
        if (CollectionUtils.isNotEmpty(dictDatas)) {
            DictUtils.setDictCache(dictType, dictDatas);
            return dictDatas;
        }
        return null;
    }

    /**
     * 批量删除字典类型
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    @Override
    public void deleteDictTypeByIds(String ids) {
        Long[] dictIds = Convert.toLongArray(ids);
        for (Long dictId : dictIds) {
            SysDictType dictType = getById(dictId);
            if (dictDataService.lambdaQuery().eq(SysDictData::getDictType, dictType.getDictType()).count() > 0) {
                throw new BusinessException(String.format("%1$s已分配,不能删除", dictType.getDictName()));
            }
            removeById(dictId);
            DictUtils.removeDictCache(dictType.getDictType());
        }
    }

    /**
     * 加载字典缓存数据
     */
    @Override
    public void loadingDictCache() {
        List<SysDictType> dictTypeList = lambdaQuery().list();
        for (SysDictType dict : dictTypeList) {
            List<SysDictData> dictDatas = dictDataService.getNormalSysDictData(dict.getDictType());
            DictUtils.setDictCache(dict.getDictType(), dictDatas);
        }
    }

    /**
     * 清空字典缓存数据
     */
    @Override
    public void clearDictCache() {
        DictUtils.clearDictCache();
    }

    /**
     * 重置字典缓存数据
     */
    @Override
    public void resetDictCache() {
        clearDictCache();
        loadingDictCache();
    }

    /**
     * 新增保存字典类型信息
     *
     * @return
     */
    @Override
    public boolean insertDictType(SysDictType dict) {
        boolean save = save(dict);
        if (save) {
            DictUtils.setDictCache(dict.getDictType(), null);
        }
        return save;
    }

    /**
     * 修改保存字典类型信息
     *
     * @return
     */
    @Override
    @Transactional
    public boolean updateDictType(SysDictType dict) {
        SysDictType oldDict = getById(dict.getDictId());
        dictDataService.lambdaUpdate().set(SysDictData::getDictType, dict.getDictType()).eq(SysDictData::getDictType, oldDict.getDictType());
        boolean update = updateById(dict);
        if (update) {
            List<SysDictData> dictDatas = dictDataService.getNormalSysDictData(dict.getDictType());
            DictUtils.setDictCache(dict.getDictType(), dictDatas);
        }
        return update;
    }

    /**
     * 校验字典类型称是否唯一
     *
     * @param dict 字典类型
     * @return 结果
     */
    @Override
    public String checkDictTypeUnique(SysDictType dict) {
        Long dictId = Objects.isNull(dict.getDictId()) ? -1L : dict.getDictId();
        List<SysDictType> sysDictTypes = lambdaQuery().eq(SysDictType::getDictType, dict.getDictType()).page(new Page<>(1, 1)).getRecords();
        if (!CollectionUtils.isEmpty(sysDictTypes) && !Objects.equals(sysDictTypes.get(0).getDictId(), dictId)) {
            return UserConstants.DICT_TYPE_NOT_UNIQUE;
        }
        return UserConstants.DICT_TYPE_UNIQUE;
    }

    /**
     * 查询字典类型树
     *
     * @param dictType 字典类型
     * @return 所有字典类型
     */
    @Override
    public List<Ztree> selectDictTree(SysDictType dictType) {
        List<Ztree> ztrees = new ArrayList<>();
        List<SysDictType> dictList = selectDictTypeList(dictType);
        for (SysDictType dict : dictList) {
            if (UserConstants.DICT_NORMAL.equals(dict.getStatus())) {
                Ztree ztree = new Ztree();
                ztree.setId(dict.getDictId());
                ztree.setName(transDictName(dict));
                ztree.setTitle(dict.getDictType());
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }

    public String transDictName(SysDictType dictType) {
        StringBuffer sb = new StringBuffer();
        sb.append("(" + dictType.getDictName() + ")");
        sb.append("&nbsp;&nbsp;&nbsp;" + dictType.getDictType());
        return sb.toString();
    }
}
