package com.aidev.web.controller.demo.domain;

import com.aidev.common.annotation.Excel;
import com.aidev.common.core.domain.DemoBaseEntity;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.*;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class UserOperateModel extends DemoBaseEntity {
    @TableId
    private int userId;

    @Excel(name = "用户编号")
    private String userCode;

    @Excel(name = "用户姓名")
    private String userName;

    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String userSex;

    @Excel(name = "用户手机")
    private String userPhone;

    @Excel(name = "用户邮箱")
    private String userEmail;

    @Excel(name = "用户余额")
    private double userBalance;

    @Excel(name = "用户状态", readConverterExp = "0=正常,1=停用")
    private String status;
}