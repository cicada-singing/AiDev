package com.aidev.system.service.impl;

import com.aidev.system.domain.SysRoleDept;
import com.aidev.system.mapper.SysRoleDeptMapper;
import com.aidev.system.service.ISysRoleDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 角色和部门关联 业务层处理
 *
 * @author aidev
 */
@Service
public class SysRoleDeptServiceImpl extends ServiceImpl<SysRoleDeptMapper, SysRoleDept> implements ISysRoleDeptService {
}
