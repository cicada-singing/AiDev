package com.aidev.system.service;

import com.aidev.system.domain.SysOperLog;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 操作日志 服务层
 *
 * @author aidev
 */
public interface ISysOperLogService extends IService<SysOperLog> {
    /**
     * 查询系统操作日志集合
     *
     * @param domain 操作日志对象
     * @return 操作日志集合
     */
    List<SysOperLog> selectOperLogList(SysOperLog domain);

    /**
     * 清空操作日志
     */
    void cleanOperLog();
}
