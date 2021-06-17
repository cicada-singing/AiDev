package com.aidev.system.service;

import com.aidev.system.domain.SysLogininfor;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 系统访问日志情况信息 服务层
 *
 * @author aidev
 */
public interface ISysLogininforService extends IService<SysLogininfor> {
    /**
     * 查询系统登录日志集合
     *
     * @param domain 访问日志对象
     * @return 登录记录集合
     */
    List<SysLogininfor> selectLogininforList(SysLogininfor domain);

    /**
     * 清空系统登录日志
     */
    void cleanLogininfor();
}
