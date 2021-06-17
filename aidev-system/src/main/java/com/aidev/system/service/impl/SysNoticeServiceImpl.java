package com.aidev.system.service.impl;

import com.aidev.system.domain.SysNotice;
import com.aidev.system.mapper.SysNoticeMapper;
import com.aidev.system.service.ISysNoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 公告 服务层实现
 *
 * @author aidev
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeMapper, SysNotice> implements ISysNoticeService {
}
