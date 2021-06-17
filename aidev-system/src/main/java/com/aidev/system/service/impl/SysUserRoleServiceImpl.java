package com.aidev.system.service.impl;

import com.aidev.system.domain.SysUserRole;
import com.aidev.system.mapper.SysUserRoleMapper;
import com.aidev.system.service.ISysUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 用户和角色关联 业务层处理
 *
 * @author aidev
 */
@Service
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements ISysUserRoleService {
}
