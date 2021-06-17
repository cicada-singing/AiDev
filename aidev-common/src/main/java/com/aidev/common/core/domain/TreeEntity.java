package com.aidev.common.core.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Tree基类
 *
 * @author aidev
 */
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Accessors(chain = true)
public class TreeEntity extends BaseEntity {
    private static final long serialVersionUID = 1L;
    /**
     * 父菜单名称
     */
    private String parentName;
    /**
     * 父菜单ID
     */
    private Long parentId;
    /**
     * 显示顺序
     */
    private Integer orderNum;
    /**
     * 祖级列表
     */
//    private String ancestors;
}