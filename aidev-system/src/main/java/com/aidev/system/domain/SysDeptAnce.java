package com.aidev.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 部门和祖级关联表（部门N-N祖级）
 *
 * @author aidev
 */
@TableName("aidev_sys_dept_ance")
@Data
@Accessors(chain = true)
public class SysDeptAnce {
    /**
     * 部门ID
     */
    private Long deptId;
    /**
     * 祖级ID
     */
    private Long anceId;
}