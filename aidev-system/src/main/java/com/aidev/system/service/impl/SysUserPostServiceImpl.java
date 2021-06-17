package com.aidev.system.service.impl;

import com.aidev.system.domain.SysUserPost;
import com.aidev.system.mapper.SysUserPostMapper;
import com.aidev.system.service.ISysUserPostService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 用户和岗位关联 业务层处理
 *
 * @author aidev
 */
@Service
public class SysUserPostServiceImpl extends ServiceImpl<SysUserPostMapper, SysUserPost> implements ISysUserPostService {
}
