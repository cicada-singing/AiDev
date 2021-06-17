package com.aidev.common.core.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * Entity基类
 *
 * @author aidev
 */
@Data
@Accessors(chain = true)
public class ParamEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 数据范围
     */
    @TableField(exist = false)
    private String dataScopeSql;

    /**
     * 请求参数
     */
    @TableField(exist = false)
    private Map<String, Object> params;

    public Map<String, Object> getParams() {
        if (params == null) {
            params = new HashMap<>();
        }
        return params;
    }
}
