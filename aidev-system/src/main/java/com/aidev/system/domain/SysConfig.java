package com.aidev.system.domain;

import com.aidev.common.annotation.Excel;
import com.aidev.common.annotation.Excel.ColumnType;
import com.aidev.common.core.domain.BaseEntityWithRemark;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

/**
 * 参数配置
 *
 * @author aidev
 */
@TableName("aidev_sys_config")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Accessors(chain = true)
public class SysConfig extends BaseEntityWithRemark {
    /**
     * 参数主键
     */
    @Excel(name = "参数主键", cellType = ColumnType.NUMERIC)
    @TableId
    private Long configId;
    /**
     * 参数名称
     */
    @Excel(name = "参数名称")
    @NotBlank(message = "参数名称不能为空")
    @Size(min = 0, max = 100, message = "参数名称不能超过100个字符")
    private String configName;
    /**
     * 参数键名
     */
    @Excel(name = "参数键名")
    @NotBlank(message = "参数键名长度不能为空")
    @Size(min = 0, max = 100, message = "参数键名长度不能超过100个字符")
    private String configKey;
    /**
     * 参数键值
     */
    @Excel(name = "参数键值")
    @NotBlank(message = "参数键值不能为空")
    @Size(min = 0, max = 500, message = "参数键值长度不能超过500个字符")
    private String configValue;
    /**
     * 系统内置（Y是 N否）
     */
    @Excel(name = "系统内置", readConverterExp = "Y=是,N=否")
    private String configType;
    /**
     * 开始时间
     */
    @TableField(exist = false)
    private LocalDateTime startTime;
    /**
     * 结束时间
     */
    @TableField(exist = false)
    private LocalDateTime endTime;
}
