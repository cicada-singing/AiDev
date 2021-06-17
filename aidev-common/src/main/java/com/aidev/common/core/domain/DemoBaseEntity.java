package com.aidev.common.core.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Entity基类
 *
 * @author aidev
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Accessors(chain = true)
public class DemoBaseEntity extends BaseEntity {
    /**
     * 搜索值
     */
    private String searchValue;
}
