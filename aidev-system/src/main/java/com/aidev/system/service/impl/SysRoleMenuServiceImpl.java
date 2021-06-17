package com.aidev.system.service.impl;

import com.aidev.system.domain.SysRoleMenu;
import com.aidev.system.mapper.SysRoleMenuMapper;
import com.aidev.system.service.ISysRoleMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 角色和菜单关联 业务层处理
 *
 * @author aidev
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements ISysRoleMenuService {
}
