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
public class BaseEntityWithRemark extends BaseEntity {
    /**
     * 备注
     */
    private String remark;
}
