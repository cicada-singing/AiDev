package com.aidev.framework.web.service;

import com.aidev.common.core.domain.entity.SysDictData;
import com.aidev.system.service.ISysDictDataService;
import com.aidev.system.service.ISysDictTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * RuoYi 首创 html 调用 thymeleaf 实现字典读取
 *
 * @author aidev
 */
@Service("dict")
public class DictService {
    @Resource
    private ISysDictTypeService dictTypeService;
    @Resource
    private ISysDictDataService dictDataService;

    /**
     * 根据字典类型查询字典数据信息
     *
     * @param dictType 字典类型
     * @return 参数键值
     */
    public List<SysDictData> getType(String dictType) {
        return dictTypeService.selectDictDataByType(dictType);
    }

    /**
     * 根据字典类型和字典键值查询字典数据信息
     *
     * @param dictType  字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
    public String getLabel(String dictType, String dictValue) {
        SysDictData one = dictDataService.lambdaQuery()
                .select(SysDictData::getDictLabel)
                .eq(SysDictData::getDictType, dictType)
                .eq(SysDictData::getDictValue, dictValue)
                .one();
        return Objects.isNull(one) ? "" : one.getDictLabel();
    }
}
