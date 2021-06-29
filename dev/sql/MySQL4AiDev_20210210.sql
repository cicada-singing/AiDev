-- ----------------------------
-- 1、部门信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dept;
CREATE TABLE aidev_sys_dept
(
    dept_id     BIGINT(20)  NOT NULL AUTO_INCREMENT COMMENT '部门ID',
    parent_id   BIGINT(20)  DEFAULT 0               COMMENT '父部门ID',
    dept_name   VARCHAR(30) DEFAULT ''              COMMENT '部门名称',
    order_num   INT(4)      DEFAULT 0               COMMENT '显示顺序',
    leader      VARCHAR(20) DEFAULT ''              COMMENT '负责人',
    phone       VARCHAR(11) DEFAULT ''              COMMENT '联系电话',
    email       VARCHAR(50) DEFAULT ''              COMMENT '邮箱',
    status      CHAR(1)     DEFAULT '0'             COMMENT '部门状态（0正常 1停用）',
    del_flag    CHAR(1)     DEFAULT '0'             COMMENT '删除标志（0代表 2删除）',
    create_by   VARCHAR(64) DEFAULT ''              COMMENT '创建者',
    create_time DATETIME                            COMMENT '创建时间',
    update_by   VARCHAR(64) DEFAULT ''              COMMENT '更新者',
    update_time DATETIME                            COMMENT '更新时间',
    PRIMARY KEY (dept_id)
) ENGINE = innodb
  AUTO_INCREMENT = 200 COMMENT = '部门信息表';
-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
INSERT INTO aidev_sys_dept VALUES (100, 0,   'AiDev科技', 0, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (101, 100, '深圳总公司', 1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (102, 100, '长沙分公司', 2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (103, 101, '研发部门',   1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (104, 101, '市场部门',   2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (105, 101, '测试部门',   3, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (106, 101, '财务部门',   4, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (107, 101, '运维部门',   5, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (108, 102, '市场部门',   1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);
INSERT INTO aidev_sys_dept VALUES (109, 102, '财务部门',   2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate(), '', null);

-- ----------------------------
-- 2、用户信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user;
CREATE TABLE aidev_sys_user
(
    user_id         BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    dept_id         BIGINT(20)                           COMMENT '部门ID',
    login_name      VARCHAR(30)  DEFAULT ''              COMMENT '登录账号',
    user_name       VARCHAR(30)  DEFAULT ''              COMMENT '用户昵称',
    user_type       VARCHAR(2)   DEFAULT '00'            COMMENT '用户类型（00系统用户 01注册用户）',
    email           VARCHAR(50)  DEFAULT ''              COMMENT '用户邮箱',
    phonenumber     VARCHAR(11)  DEFAULT ''              COMMENT '手机号码',
    sex             CHAR(1)      DEFAULT '0'             COMMENT '用户性别（0男 1女 2未知）',
    avatar          VARCHAR(100) DEFAULT ''              COMMENT '头像路径',
    password        VARCHAR(50)  DEFAULT ''              COMMENT '密码',
    salt            VARCHAR(20)  DEFAULT ''              COMMENT '盐加密',
    status          CHAR(1)      DEFAULT '0'             COMMENT '帐号状态（0正常 1停用）',
    del_flag        CHAR(1)      DEFAULT '0'             COMMENT '删除标志（0存在 2删除）',
    login_ip        VARCHAR(128) DEFAULT ''              COMMENT '最后登录IP',
    login_date      DATETIME                             COMMENT '最后登录时间',
    pwd_update_date DATETIME                             COMMENT '密码最后更新时间',
    create_by       VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time     DATETIME                             COMMENT '创建时间',
    update_by       VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time     DATETIME                             COMMENT '更新时间',
    remark          VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (user_id)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '用户信息表';
-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
INSERT INTO aidev_sys_user VALUES (1, 103, 'admin', 'Admin', '00', 'aidev@qq.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'admin', sysdate(), '', null, '管理员');
INSERT INTO aidev_sys_user VALUES (2, 105, 'aidev', 'AiDev', '00', 'aidev@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', sysdate(), sysdate(), 'aidev', sysdate(), '', null, '测试员');

-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_post;
CREATE TABLE aidev_sys_post
(
    post_id     BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    post_code   VARCHAR(64)  DEFAULT ''              COMMENT '岗位编码',
    post_name   VARCHAR(50)  DEFAULT ''              COMMENT '岗位名称',
    post_sort   INT(4)       NOT NULL                COMMENT '显示顺序',
    status      CHAR(1)      DEFAULT ''              COMMENT '状态（0正常 1停用）',
    create_by   VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time DATETIME                             COMMENT '创建时间',
    update_by   VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time DATETIME                             COMMENT '更新时间',
    remark      VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (post_id)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '岗位信息表';
-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
INSERT INTO aidev_sys_post VALUES (1, 'ceo',  '董事长',  1, '0', 'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_post VALUES (2, 'se',   '项目经理', 2, '0', 'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_post VALUES (3, 'hr',   '人力资源', 3, '0', 'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_post VALUES (4, 'user', '普通员工', 4, '0', 'admin', sysdate(), '', null, '');

-- ----------------------------
-- 4、角色信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_role;
CREATE TABLE aidev_sys_role
(
    role_id     BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    role_name   VARCHAR(30)  DEFAULT ''              COMMENT '角色名称',
    role_key    VARCHAR(100) DEFAULT ''              COMMENT '角色权限字符串',
    role_sort   INT(4)       NOT NULL                COMMENT '显示顺序',
    data_scope  CHAR(1)      DEFAULT '1'             COMMENT '数据范围（1全部数据权限 2自定数据权限 3本部门数据权限 4本部门及以下数据权限）',
    status      CHAR(1)      DEFAULT '0'             COMMENT '角色状态（0正常 1停用）',
    del_flag    CHAR(1)      DEFAULT '0'             COMMENT '删除标志（0代表 2删除）',
    create_by   VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time DATETIME                             COMMENT '创建时间',
    update_by   VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time DATETIME                             COMMENT '更新时间',
    remark      VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (role_id)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '角色信息表';
-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
INSERT INTO aidev_sys_role VALUES ('1', '超级管理员', 'admin', 1, 1, '0', '0', 'admin', sysdate(), '', null, '超级管理员');
INSERT INTO aidev_sys_role VALUES ('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', sysdate(), '', null, '普通角色');

-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_menu;
CREATE TABLE aidev_sys_menu
(
    menu_id     BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    menu_name   VARCHAR(50)  DEFAULT ''              COMMENT '菜单名称',
    parent_id   BIGINT(20)   DEFAULT 0               COMMENT '父菜单ID',
    order_num   INT(4)       DEFAULT 0               COMMENT '显示顺序',
    url         VARCHAR(200) DEFAULT '#'             COMMENT '请求地址',
    target      VARCHAR(20)  DEFAULT ''              COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
    menu_type   CHAR(1)      DEFAULT ''              COMMENT '菜单类型（M目录 C菜单 F按钮）',
    visible     CHAR(1)      DEFAULT '0'             COMMENT '菜单状态（0显示 1隐藏）',
    is_refresh  CHAR(1)      DEFAULT '1'             COMMENT '是否刷新（0刷新 1不刷新）',
    perms       VARCHAR(100) DEFAULT ''              COMMENT '权限标识',
    icon        VARCHAR(100) DEFAULT '#'             COMMENT '菜单图标',
    create_by   VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time DATETIME                             COMMENT '创建时间',
    update_by   VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time DATETIME                             COMMENT '更新时间',
    remark      VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (menu_id)
) ENGINE = innodb
  AUTO_INCREMENT = 2000 COMMENT = '菜单权限表';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
INSERT INTO aidev_sys_menu VALUES ('1',    '系统管理', '0',   '1', '#',                   '', 'M', '0', '1', '',                        'fa fa-gear',            'admin', sysdate(), '', null, '系统管理目录');
INSERT INTO aidev_sys_menu VALUES ('2',    '系统监控', '0',   '2', '#',                   '', 'M', '0', '1', '',                        'fa fa-video-camera',    'admin', sysdate(), '', null, '系统监控目录');
INSERT INTO aidev_sys_menu VALUES ('3',    '系统工具', '0',   '3', '#',                   '', 'M', '0', '1', '',                        'fa fa-bars',            'admin', sysdate(), '', null, '系统工具目录');
-- 二级菜单
INSERT INTO aidev_sys_menu VALUES ('100',  '用户管理', '1',   '1', '/system/user',        '', 'C', '0', '1', 'system:user:view',        'fa fa-user-o',          'admin', sysdate(), '', null, '用户管理菜单');
INSERT INTO aidev_sys_menu VALUES ('101',  '角色管理', '1',   '2', '/system/role',        '', 'C', '0', '1', 'system:role:view',        'fa fa-user-secret',     'admin', sysdate(), '', null, '角色管理菜单');
INSERT INTO aidev_sys_menu VALUES ('102',  '菜单管理', '1',   '3', '/system/menu',        '', 'C', '0', '1', 'system:menu:view',        'fa fa-th-list',         'admin', sysdate(), '', null, '菜单管理菜单');
INSERT INTO aidev_sys_menu VALUES ('103',  '部门管理', '1',   '4', '/system/dept',        '', 'C', '0', '1', 'system:dept:view',        'fa fa-outdent',         'admin', sysdate(), '', null, '部门管理菜单');
INSERT INTO aidev_sys_menu VALUES ('104',  '岗位管理', '1',   '5', '/system/post',        '', 'C', '0', '1', 'system:post:view',        'fa fa-address-card-o',  'admin', sysdate(), '', null, '岗位管理菜单');
INSERT INTO aidev_sys_menu VALUES ('105',  '字典管理', '1',   '6', '/system/dict',        '', 'C', '0', '1', 'system:dict:view',        'fa fa-bookmark-o',      'admin', sysdate(), '', null, '字典管理菜单');
INSERT INTO aidev_sys_menu VALUES ('106',  '参数设置', '1',   '7', '/system/config',      '', 'C', '0', '1', 'system:config:view',      'fa fa-sun-o',           'admin', sysdate(), '', null, '参数设置菜单');
INSERT INTO aidev_sys_menu VALUES ('107',  '通知公告', '1',   '8', '/system/notice',      '', 'C', '0', '1', 'system:notice:view',      'fa fa-bullhorn',        'admin', sysdate(), '', null, '通知公告菜单');
INSERT INTO aidev_sys_menu VALUES ('108',  '日志管理', '1',   '9', '#',                   '', 'M', '0', '1', '',                        'fa fa-pencil-square-o', 'admin', sysdate(), '', null, '日志管理菜单');
INSERT INTO aidev_sys_menu VALUES ('109',  '在线用户', '2',   '1', '/monitor/online',     '', 'C', '0', '1', 'monitor:online:view',     'fa fa-user-circle',     'admin', sysdate(), '', null, '在线用户菜单');
INSERT INTO aidev_sys_menu VALUES ('110',  '定时任务', '2',   '2', '/monitor/job',        '', 'C', '0', '1', 'monitor:job:view',        'fa fa-tasks',           'admin', sysdate(), '', null, '定时任务菜单');
INSERT INTO aidev_sys_menu VALUES ('111',  '数据监控', '2',   '3', '/monitor/data',       '', 'C', '0', '1', 'monitor:data:view',       'fa fa-bug',             'admin', sysdate(), '', null, '数据监控菜单');
INSERT INTO aidev_sys_menu VALUES ('112',  '服务监控', '2',   '4', '/monitor/server',     '', 'C', '0', '1', 'monitor:server:view',     'fa fa-server',          'admin', sysdate(), '', null, '服务监控菜单');
INSERT INTO aidev_sys_menu VALUES ('113',  '缓存监控', '2',   '5', '/monitor/cache',      '', 'C', '0', '1', 'monitor:cache:view',      'fa fa-cube',            'admin', sysdate(), '', null, '缓存监控菜单');
INSERT INTO aidev_sys_menu VALUES ('114',  '表单构建', '3',   '1', '/tool/build',         '', 'C', '0', '1', 'tool:build:view',         'fa fa-wpforms',         'admin', sysdate(), '', null, '表单构建菜单');
INSERT INTO aidev_sys_menu VALUES ('115',  '代码生成', '3',   '2', '/tool/gen',           '', 'C', '0', '1', 'tool:gen:view',           'fa fa-code',            'admin', sysdate(), '', null, '代码生成菜单');
INSERT INTO aidev_sys_menu VALUES ('116',  '系统接口', '3',   '3', '/tool/swagger',       '', 'C', '0', '1', 'tool:swagger:view',       'fa fa-gg',              'admin', sysdate(), '', null, '系统接口菜单');
-- 三级菜单
INSERT INTO aidev_sys_menu VALUES ('500',  '操作日志', '108', '1', '/monitor/operlog',    '', 'C', '0', '1', 'monitor:operlog:view',    'fa fa-address-book',    'admin', sysdate(), '', null, '操作日志菜单');
INSERT INTO aidev_sys_menu VALUES ('501',  '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o',    'admin', sysdate(), '', null, '登录日志菜单');
-- 用户管理按钮
INSERT INTO aidev_sys_menu VALUES ('1000', '用户查询', '100', '1', '#',                   '', 'F', '0', '1', 'system:user:list',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1001', '用户新增', '100', '2', '#',                   '', 'F', '0', '1', 'system:user:add',         '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1002', '用户修改', '100', '3', '#',                   '', 'F', '0', '1', 'system:user:edit',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1003', '用户删除', '100', '4', '#',                   '', 'F', '0', '1', 'system:user:remove',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1004', '用户导出', '100', '5', '#',                   '', 'F', '0', '1', 'system:user:export',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1005', '用户导入', '100', '6', '#',                   '', 'F', '0', '1', 'system:user:import',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1006', '重置密码', '100', '7', '#',                   '', 'F', '0', '1', 'system:user:resetPwd',    '#',                     'admin', sysdate(), '', null, '');
-- 角色管理按钮
INSERT INTO aidev_sys_menu VALUES ('1007', '角色查询', '101', '1', '#',                   '', 'F', '0', '1', 'system:role:list',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1008', '角色新增', '101', '2', '#',                   '', 'F', '0', '1', 'system:role:add',         '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1009', '角色修改', '101', '3', '#',                   '', 'F', '0', '1', 'system:role:edit',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1010', '角色删除', '101', '4', '#',                   '', 'F', '0', '1', 'system:role:remove',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1011', '角色导出', '101', '5', '#',                   '', 'F', '0', '1', 'system:role:export',      '#',                     'admin', sysdate(), '', null, '');
-- 菜单管理按钮
INSERT INTO aidev_sys_menu VALUES ('1012', '菜单查询', '102', '1', '#',                   '', 'F', '0', '1', 'system:menu:list',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1013', '菜单新增', '102', '2', '#',                   '', 'F', '0', '1', 'system:menu:add',         '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1014', '菜单修改', '102', '3', '#',                   '', 'F', '0', '1', 'system:menu:edit',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1015', '菜单删除', '102', '4', '#',                   '', 'F', '0', '1', 'system:menu:remove',      '#',                     'admin', sysdate(), '', null, '');
-- 部门管理按钮
INSERT INTO aidev_sys_menu VALUES ('1016', '部门查询', '103', '1', '#',                   '', 'F', '0', '1', 'system:dept:list',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1017', '部门新增', '103', '2', '#',                   '', 'F', '0', '1', 'system:dept:add',         '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1018', '部门修改', '103', '3', '#',                   '', 'F', '0', '1', 'system:dept:edit',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1019', '部门删除', '103', '4', '#',                   '', 'F', '0', '1', 'system:dept:remove',      '#',                     'admin', sysdate(), '', null, '');
-- 岗位管理按钮
INSERT INTO aidev_sys_menu VALUES ('1020', '岗位查询', '104', '1', '#',                   '', 'F', '0', '1', 'system:post:list',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1021', '岗位新增', '104', '2', '#',                   '', 'F', '0', '1', 'system:post:add',         '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1022', '岗位修改', '104', '3', '#',                   '', 'F', '0', '1', 'system:post:edit',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1023', '岗位删除', '104', '4', '#',                   '', 'F', '0', '1', 'system:post:remove',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1024', '岗位导出', '104', '5', '#',                   '', 'F', '0', '1', 'system:post:export',      '#',                     'admin', sysdate(), '', null, '');
-- 字典管理按钮
INSERT INTO aidev_sys_menu VALUES ('1025', '字典查询', '105', '1', '#',                   '', 'F', '0', '1', 'system:dict:list',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1026', '字典新增', '105', '2', '#',                   '', 'F', '0', '1', 'system:dict:add',         '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1027', '字典修改', '105', '3', '#',                   '', 'F', '0', '1', 'system:dict:edit',        '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1028', '字典删除', '105', '4', '#',                   '', 'F', '0', '1', 'system:dict:remove',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1029', '字典导出', '105', '5', '#',                   '', 'F', '0', '1', 'system:dict:export',      '#',                     'admin', sysdate(), '', null, '');
-- 参数设置按钮
INSERT INTO aidev_sys_menu VALUES ('1030', '参数查询', '106', '1', '#',                   '', 'F', '0', '1', 'system:config:list',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1031', '参数新增', '106', '2', '#',                   '', 'F', '0', '1', 'system:config:add',       '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1032', '参数修改', '106', '3', '#',                   '', 'F', '0', '1', 'system:config:edit',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1033', '参数删除', '106', '4', '#',                   '', 'F', '0', '1', 'system:config:remove',    '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1034', '参数导出', '106', '5', '#',                   '', 'F', '0', '1', 'system:config:export',    '#',                     'admin', sysdate(), '', null, '');
-- 通知公告按钮
INSERT INTO aidev_sys_menu VALUES ('1035', '公告查询', '107', '1', '#',                   '', 'F', '0', '1', 'system:notice:list',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1036', '公告新增', '107', '2', '#',                   '', 'F', '0', '1', 'system:notice:add',       '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1037', '公告修改', '107', '3', '#',                   '', 'F', '0', '1', 'system:notice:edit',      '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1038', '公告删除', '107', '4', '#',                   '', 'F', '0', '1', 'system:notice:remove',    '#',                     'admin', sysdate(), '', null, '');
-- 操作日志按钮
INSERT INTO aidev_sys_menu VALUES ('1039', '操作查询', '500', '1', '#',                   '', 'F', '0', '1', 'monitor:operlog:list',    '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1040', '操作删除', '500', '2', '#',                   '', 'F', '0', '1', 'monitor:operlog:remove',  '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1041', '详细信息', '500', '3', '#',                   '', 'F', '0', '1', 'monitor:operlog:detail',  '#',                     'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1042', '日志导出', '500', '4', '#',                   '', 'F', '0', '1', 'monitor:operlog:export',  '#',                     'admin', sysdate(), '', null, '');
-- 登录日志按钮
INSERT INTO aidev_sys_menu VALUES ('1043', '登录查询', '501', '1', '#',                   '', 'F', '0', '1', 'monitor:logininfor:list',         '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1044', '登录删除', '501', '2', '#',                   '', 'F', '0', '1', 'monitor:logininfor:remove',       '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1045', '日志导出', '501', '3', '#',                   '', 'F', '0', '1', 'monitor:logininfor:export',       '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1046', '账户解锁', '501', '4', '#',                   '', 'F', '0', '1', 'monitor:logininfor:unlock',       '#',             'admin', sysdate(), '', null, '');
-- 在线用户按钮
INSERT INTO aidev_sys_menu VALUES ('1047', '在线查询', '109', '1', '#',                   '', 'F', '0', '1', 'monitor:online:list',             '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1048', '批量强退', '109', '2', '#',                   '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1049', '单条强退', '109', '3', '#',                   '', 'F', '0', '1', 'monitor:online:forceLogout',      '#',             'admin', sysdate(), '', null, '');
-- 定时任务按钮
INSERT INTO aidev_sys_menu VALUES ('1050', '任务查询', '110', '1', '#',                   '', 'F', '0', '1', 'monitor:job:list',                '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1051', '任务新增', '110', '2', '#',                   '', 'F', '0', '1', 'monitor:job:add',                 '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1052', '任务修改', '110', '3', '#',                   '', 'F', '0', '1', 'monitor:job:edit',                '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1053', '任务删除', '110', '4', '#',                   '', 'F', '0', '1', 'monitor:job:remove',              '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1054', '状态修改', '110', '5', '#',                   '', 'F', '0', '1', 'monitor:job:changeStatus',        '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1055', '任务详细', '110', '6', '#',                   '', 'F', '0', '1', 'monitor:job:detail',              '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1056', '任务导出', '110', '7', '#',                   '', 'F', '0', '1', 'monitor:job:export',              '#',             'admin', sysdate(), '', null, '');
-- 代码生成按钮
INSERT INTO aidev_sys_menu VALUES ('1057', '生成查询', '115', '1', '#',                   '', 'F', '0', '1', 'tool:gen:list',                   '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1058', '生成修改', '115', '2', '#',                   '', 'F', '0', '1', 'tool:gen:edit',                   '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1059', '生成删除', '115', '3', '#',                   '', 'F', '0', '1', 'tool:gen:remove',                 '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1060', '预览代码', '115', '4', '#',                   '', 'F', '0', '1', 'tool:gen:preview',                '#',             'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1061', '生成代码', '115', '5', '#',                   '', 'F', '0', '1', 'tool:gen:code',                   '#',             'admin', sysdate(), '', null, '');

-- ----------------------------
-- 6、用户和角色关联表  用户1-N角色
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user_role;
CREATE TABLE aidev_sys_user_role
(
    user_id BIGINT(20) NOT NULL COMMENT '用户ID',
    role_id BIGINT(20) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (user_id, role_id)
) ENGINE = innodb COMMENT = '用户和角色关联表';
-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
INSERT INTO aidev_sys_user_role VALUES ('1', '1');
INSERT INTO aidev_sys_user_role VALUES ('2', '2');

-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_role_menu;
CREATE TABLE aidev_sys_role_menu
(
    role_id BIGINT(20) NOT NULL COMMENT '角色ID',
    menu_id BIGINT(20) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (role_id, menu_id)
) ENGINE = innodb COMMENT = '角色和菜单关联表';
-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
INSERT INTO aidev_sys_role_menu VALUES ('2', '1');
INSERT INTO aidev_sys_role_menu VALUES ('2', '2');
INSERT INTO aidev_sys_role_menu VALUES ('2', '3');
INSERT INTO aidev_sys_role_menu VALUES ('2', '4');
INSERT INTO aidev_sys_role_menu VALUES ('2', '100');
INSERT INTO aidev_sys_role_menu VALUES ('2', '101');
INSERT INTO aidev_sys_role_menu VALUES ('2', '102');
INSERT INTO aidev_sys_role_menu VALUES ('2', '103');
INSERT INTO aidev_sys_role_menu VALUES ('2', '104');
INSERT INTO aidev_sys_role_menu VALUES ('2', '105');
INSERT INTO aidev_sys_role_menu VALUES ('2', '106');
INSERT INTO aidev_sys_role_menu VALUES ('2', '107');
INSERT INTO aidev_sys_role_menu VALUES ('2', '108');
INSERT INTO aidev_sys_role_menu VALUES ('2', '109');
INSERT INTO aidev_sys_role_menu VALUES ('2', '110');
INSERT INTO aidev_sys_role_menu VALUES ('2', '111');
INSERT INTO aidev_sys_role_menu VALUES ('2', '112');
INSERT INTO aidev_sys_role_menu VALUES ('2', '113');
INSERT INTO aidev_sys_role_menu VALUES ('2', '114');
INSERT INTO aidev_sys_role_menu VALUES ('2', '115');
INSERT INTO aidev_sys_role_menu VALUES ('2', '116');
INSERT INTO aidev_sys_role_menu VALUES ('2', '500');
INSERT INTO aidev_sys_role_menu VALUES ('2', '501');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1000');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1001');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1002');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1003');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1004');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1005');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1006');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1007');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1008');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1009');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1010');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1011');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1012');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1013');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1014');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1015');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1016');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1017');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1018');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1019');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1020');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1021');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1022');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1023');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1024');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1025');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1026');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1027');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1028');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1029');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1030');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1031');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1032');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1033');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1034');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1035');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1036');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1037');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1038');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1039');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1040');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1041');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1042');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1043');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1044');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1045');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1046');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1047');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1048');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1049');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1050');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1051');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1052');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1053');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1054');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1055');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1056');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1057');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1058');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1059');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1060');
INSERT INTO aidev_sys_role_menu VALUES ('2', '1061');

-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_role_dept;
CREATE TABLE aidev_sys_role_dept
(
    role_id BIGINT(20) NOT NULL COMMENT '角色ID',
    dept_id BIGINT(20) NOT NULL COMMENT '部门ID',
    PRIMARY KEY (role_id, dept_id)
) ENGINE = innodb COMMENT = '角色和部门关联表';
-- ----------------------------
-- 初始化-角色和部门关联表数据
-- ----------------------------
INSERT INTO aidev_sys_role_dept VALUES ('2', '100');
INSERT INTO aidev_sys_role_dept VALUES ('2', '101');
INSERT INTO aidev_sys_role_dept VALUES ('2', '105');

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user_post;
CREATE TABLE aidev_sys_user_post
(
    user_id BIGINT(20) NOT NULL COMMENT '用户ID',
    post_id BIGINT(20) NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (user_id, post_id)
) ENGINE = innodb COMMENT = '用户与岗位关联表';
-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
INSERT INTO aidev_sys_user_post VALUES ('1', '1');
INSERT INTO aidev_sys_user_post VALUES ('2', '2');

-- ----------------------------
-- 10、操作日志记录表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_oper_log;
CREATE TABLE aidev_sys_oper_log
(
    oper_id        BIGINT(20)    NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    title          VARCHAR(50)   DEFAULT ''              COMMENT '模块标题',
    business_type  INT(2)        DEFAULT 0               COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    method         VARCHAR(100)  DEFAULT ''              COMMENT '方法名称',
    request_method VARCHAR(10)   DEFAULT ''              COMMENT '请求方式',
    operator_type  INT(1)        DEFAULT 0               COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    oper_name      VARCHAR(50)   DEFAULT ''              COMMENT '操作人员',
    dept_name      VARCHAR(50)   DEFAULT ''              COMMENT '部门名称',
    oper_url       VARCHAR(255)  DEFAULT ''              COMMENT '请求URL',
    oper_ip        VARCHAR(128)  DEFAULT ''              COMMENT '主机地址',
    oper_location  VARCHAR(255)  DEFAULT ''              COMMENT '操作地点',
    oper_param     VARCHAR(2000) DEFAULT ''              COMMENT '请求参数',
    json_result    VARCHAR(2000) DEFAULT ''              COMMENT '返回参数',
    status         INT(1)        DEFAULT 0               COMMENT '操作状态（0正常 1异常）',
    error_msg      VARCHAR(2000) DEFAULT ''              COMMENT '错误消息',
    oper_time      DATETIME                              COMMENT '操作时间',
    PRIMARY KEY (oper_id)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '操作日志记录表';

-- ----------------------------
-- 11、字典类型表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dict_type;
CREATE TABLE aidev_sys_dict_type
(
    dict_id     BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    dict_name   VARCHAR(100) DEFAULT ''              COMMENT '字典名称',
    dict_type   VARCHAR(100) DEFAULT ''              COMMENT '字典类型',
    status      CHAR(1)      DEFAULT '0'             COMMENT '状态（0正常 1停用）',
    create_by   VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time DATETIME                             COMMENT '创建时间',
    update_by   VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time DATETIME                             COMMENT '更新时间',
    remark      VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (dict_id),
    UNIQUE (dict_type)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '字典类型表';
-- ----------------------------
-- 初始化-字典类型表数据
-- ----------------------------
INSERT INTO aidev_sys_dict_type VALUES (1, '用户性别', 'sys_user_sex',       '0', 'admin', sysdate(), '', null, '用户性别列表');
INSERT INTO aidev_sys_dict_type VALUES (2, '菜单状态', 'sys_show_hide',      '0', 'admin', sysdate(), '', null, '菜单状态列表');
INSERT INTO aidev_sys_dict_type VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', sysdate(), '', null, '系统开关列表');
INSERT INTO aidev_sys_dict_type VALUES (4, '任务状态', 'sys_job_status',     '0', 'admin', sysdate(), '', null, '任务状态列表');
INSERT INTO aidev_sys_dict_type VALUES (5, '任务分组', 'sys_job_group',      '0', 'admin', sysdate(), '', null, '任务分组列表');
INSERT INTO aidev_sys_dict_type VALUES (6, '系统是否', 'sys_yes_no',         '0', 'admin', sysdate(), '', null, '系统是否列表');
INSERT INTO aidev_sys_dict_type VALUES (7, '通知类型', 'sys_notice_type',    '0', 'admin', sysdate(), '', null, '通知类型列表');
INSERT INTO aidev_sys_dict_type VALUES (8, '通知状态', 'sys_notice_status',  '0', 'admin', sysdate(), '', null, '通知状态列表');
INSERT INTO aidev_sys_dict_type VALUES (9, '操作类型', 'sys_oper_type',      '0', 'admin', sysdate(), '', null, '操作类型列表');
INSERT INTO aidev_sys_dict_type VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', sysdate(), '', null, '登录状态列表');

-- ----------------------------
-- 12、字典数据表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dict_data;
CREATE TABLE aidev_sys_dict_data
(
    dict_code   BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    dict_sort   INT(4)       DEFAULT 0               COMMENT '字典排序',
    dict_label  VARCHAR(100) DEFAULT ''              COMMENT '字典标签',
    dict_value  VARCHAR(100) DEFAULT ''              COMMENT '字典键值',
    dict_type   VARCHAR(100) DEFAULT ''              COMMENT '字典类型',
    css_class   VARCHAR(100) DEFAULT ''              COMMENT '样式属性（其他样式扩展）',
    list_class  VARCHAR(100) DEFAULT ''              COMMENT '表格回显样式',
    is_default  CHAR(1)      DEFAULT 'N'             COMMENT '是否默认（Y是 N否）',
    status      CHAR(1)      DEFAULT '0'             COMMENT '状态（0正常 1停用）',
    create_by   VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time DATETIME                             COMMENT '创建时间',
    update_by   VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time DATETIME                             COMMENT '更新时间',
    remark      VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (dict_code)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '字典数据表';
-- ----------------------------
-- 初始化-字典数据表数据
-- ----------------------------
INSERT INTO aidev_sys_dict_data VALUES (1,  1,  '男',     '0',       'sys_user_sex',       '', '',        'Y', '0', 'admin', sysdate(), '', null, '性别男');
INSERT INTO aidev_sys_dict_data VALUES (2,  2,  '女',     '1',       'sys_user_sex',       '', '',        'N', '0', 'admin', sysdate(), '', null, '性别女');
INSERT INTO aidev_sys_dict_data VALUES (3,  3,  '未知',    '2',       'sys_user_sex',       '', '',        'N', '0', 'admin', sysdate(), '', null, '性别未知');
INSERT INTO aidev_sys_dict_data VALUES (4,  1,  '显示',    '0',       'sys_show_hide',      '', 'primary', 'Y', '0', 'admin', sysdate(), '', null, '显示菜单');
INSERT INTO aidev_sys_dict_data VALUES (5,  2,  '隐藏',    '1',       'sys_show_hide',      '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '隐藏菜单');
INSERT INTO aidev_sys_dict_data VALUES (6,  1,  '正常',    '0',       'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (7,  2,  '停用',    '1',       'sys_normal_disable', '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
INSERT INTO aidev_sys_dict_data VALUES (8,  1,  '正常',    '0',       'sys_job_status',     '', 'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (9,  2,  '暂停',    '1',       'sys_job_status',     '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');
INSERT INTO aidev_sys_dict_data VALUES (10, 1,  '默认',    'DEFAULT', 'sys_job_group',      '',  '',       'Y', '0', 'admin', sysdate(), '', null, '默认分组');
INSERT INTO aidev_sys_dict_data VALUES (11, 2,  '系统',    'SYSTEM',  'sys_job_group',      '',  '',       'N', '0', 'admin', sysdate(), '', null, '系统分组');
INSERT INTO aidev_sys_dict_data VALUES (12, 1,  '是',      'Y',       'sys_yes_no',         '', 'primary', 'Y', '0', 'admin', sysdate(), '', null, '系统默认是');
INSERT INTO aidev_sys_dict_data VALUES (13, 2,  '否',      'N',       'sys_yes_no',         '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '系统默认否');
INSERT INTO aidev_sys_dict_data VALUES (14, 1,  '通知',    '1',       'sys_notice_type',    '', 'warning', 'Y', '0', 'admin', sysdate(), '', null, '通知');
INSERT INTO aidev_sys_dict_data VALUES (15, 2,  '公告',    '2',       'sys_notice_type',    '', 'success', 'N', '0', 'admin', sysdate(), '', null, '公告');
INSERT INTO aidev_sys_dict_data VALUES (16, 1,  '正常',    '0',       'sys_notice_status',  '', 'primary', 'Y', '0', 'admin', sysdate(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (17, 2,  '关闭',    '1',       'sys_notice_status',  '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '关闭状态');
INSERT INTO aidev_sys_dict_data VALUES (18, 99, '其他',    '0',       'sys_oper_type',      '', 'info',    'N', '0', 'admin', sysdate(), '', null, '其他操作');
INSERT INTO aidev_sys_dict_data VALUES (19, 1,  '新增',    '1',       'sys_oper_type',      '', 'info',    'N', '0', 'admin', sysdate(), '', null, '新增操作');
INSERT INTO aidev_sys_dict_data VALUES (20, 2,  '修改',    '2',       'sys_oper_type',      '', 'info',    'N', '0', 'admin', sysdate(), '', null, '修改操作');
INSERT INTO aidev_sys_dict_data VALUES (21, 3,  '删除',    '3',       'sys_oper_type',      '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '删除操作');
INSERT INTO aidev_sys_dict_data VALUES (22, 4,  '授权',    '4',       'sys_oper_type',      '', 'primary', 'N', '0', 'admin', sysdate(), '', null, '授权操作');
INSERT INTO aidev_sys_dict_data VALUES (23, 5,  '导出',    '5',       'sys_oper_type',      '', 'warning', 'N', '0', 'admin', sysdate(), '', null, '导出操作');
INSERT INTO aidev_sys_dict_data VALUES (24, 6,  '导入',    '6',       'sys_oper_type',      '', 'warning', 'N', '0', 'admin', sysdate(), '', null, '导入操作');
INSERT INTO aidev_sys_dict_data VALUES (25, 7,  '强退',    '7',       'sys_oper_type',      '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '强退操作');
INSERT INTO aidev_sys_dict_data VALUES (26, 8,  '生成代码', '8',       'sys_oper_type',      '', 'warning', 'N', '0', 'admin', sysdate(), '', null, '生成操作');
INSERT INTO aidev_sys_dict_data VALUES (27, 9,  '清空数据', '9',       'sys_oper_type',      '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '清空操作');
INSERT INTO aidev_sys_dict_data VALUES (28, 1,  '成功',    '0',       'sys_common_status',  '', 'primary', 'N', '0', 'admin', sysdate(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (29, 2,  '失败',    '1',       'sys_common_status',  '', 'danger',  'N', '0', 'admin', sysdate(), '', null, '停用状态');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_config;
CREATE TABLE aidev_sys_config
(
    config_id    BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    config_name  VARCHAR(100) DEFAULT ''              COMMENT '参数名称',
    config_key   VARCHAR(100) DEFAULT ''              COMMENT '参数键名',
    config_value VARCHAR(500) DEFAULT ''              COMMENT '参数键值',
    config_type  CHAR(1)      DEFAULT 'N'             COMMENT '系统内置（Y是 N否）',
    create_by    VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time  DATETIME                             COMMENT '创建时间',
    update_by    VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time  DATETIME                             COMMENT '更新时间',
    remark       VARCHAR(500) DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (config_id)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '参数配置表';
-- ----------------------------
-- 初始化-参数配置表数据
-- ----------------------------
INSERT INTO aidev_sys_config VALUES (1, '主框架页-默认皮肤样式名称',    'sys.index.skinName',               'skin-blue',   'Y', 'admin', sysdate(), '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO aidev_sys_config VALUES (2, '用户管理-账号初始密码',       'sys.user.initPassword',            '123456',     'Y', 'admin', sysdate(), '', null, '初始化密码 123456');
INSERT INTO aidev_sys_config VALUES (3, '主框架页-侧边栏主题',         'sys.index.sideTheme',              'theme-dark', 'Y', 'admin', sysdate(), '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO aidev_sys_config VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser',         'false',       'Y', 'admin', sysdate(), '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO aidev_sys_config VALUES (5, '用户管理-密码字符范围',        'sys.account.chrtype',              '0',           'Y', 'admin', sysdate(), '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO aidev_sys_config VALUES (6, '用户管理-初始密码修改策略',     'sys.account.initPasswordModify',   '0',           'Y', 'admin', sysdate(), '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO aidev_sys_config VALUES (7, '用户管理-账号密码更新周期',     'sys.account.passwordValidateDays', '0',           'Y', 'admin', sysdate(), '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO aidev_sys_config VALUES (8, '主框架页-菜单导航显示风格',     'sys.index.menuStyle',              'DEFAULT',      'Y', 'admin', sysdate(), '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO aidev_sys_config VALUES (9, '主框架页-是否开启页脚',        'sys.index.ignoreFooter',           'true',         'Y', 'admin', sysdate(), '', null, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- 14、系统访问记录表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_logininfor;
CREATE TABLE aidev_sys_logininfor
(
    info_id        BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    login_name     VARCHAR(50)  DEFAULT ''              COMMENT '登录账号',
    ipaddr         VARCHAR(128) DEFAULT ''              COMMENT '登录IP地址',
    login_location VARCHAR(255) DEFAULT ''              COMMENT '登录地点',
    browser        VARCHAR(50)  DEFAULT ''              COMMENT '浏览器类型',
    os             VARCHAR(50)  DEFAULT ''              COMMENT '操作系统',
    status         CHAR(1)      DEFAULT '0'             COMMENT '登录状态（0成功 1失败）',
    msg            VARCHAR(255) DEFAULT ''              COMMENT '提示消息',
    login_time     DATETIME                             COMMENT '访问时间',
    PRIMARY KEY (info_id)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '系统访问记录表';

-- ----------------------------
-- 15、在线用户记录表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user_online;
CREATE TABLE aidev_sys_user_online
(
    session_id       VARCHAR(50)  DEFAULT '' COMMENT '用户会话ID',
    login_name       VARCHAR(50)  DEFAULT '' COMMENT '登录账号',
    dept_name        VARCHAR(50)  DEFAULT '' COMMENT '部门名称',
    ipaddr           VARCHAR(128) DEFAULT '' COMMENT '登录IP地址',
    login_location   VARCHAR(255) DEFAULT '' COMMENT '登录地点',
    browser          VARCHAR(50)  DEFAULT '' COMMENT '浏览器类型',
    os               VARCHAR(50)  DEFAULT '' COMMENT '操作系统',
    status           VARCHAR(10)  DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
    start_timestamp  DATETIME                COMMENT 'session创建时间',
    last_access_time DATETIME                COMMENT 'session最后访问时间',
    expire_time      INT(5)       DEFAULT 0  COMMENT '超时时间，单位为分钟',
    PRIMARY KEY (session_id)
) ENGINE = innodb COMMENT = '在线用户记录表';

-- ----------------------------
-- 16、定时任务调度表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_job;
CREATE TABLE aidev_sys_job
(
    job_id          BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    job_name        VARCHAR(64)  DEFAULT ''              COMMENT '任务名称',
    job_group       VARCHAR(64)  DEFAULT 'DEFAULT'       COMMENT '任务组名',
    invoke_target   VARCHAR(500) DEFAULT ''              COMMENT '调用目标字符串',
    cron_expression VARCHAR(255) DEFAULT ''              COMMENT 'cron执行表达式',
    misfire_policy  VARCHAR(20)  DEFAULT '3'             COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    concurrent      CHAR(1)      DEFAULT '1'             COMMENT '是否并发执行（0允许 1禁止）',
    status          CHAR(1)      DEFAULT '0'             COMMENT '状态（0正常 1暂停）',
    create_by       VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time     DATETIME                             COMMENT '创建时间',
    update_by       VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time     DATETIME                             COMMENT '更新时间',
    remark          VARCHAR(500) DEFAULT ''              COMMENT '备注信息',
    PRIMARY KEY (job_id, job_name, job_group)
) ENGINE = innodb
  AUTO_INCREMENT = 100 COMMENT = '定时任务调度表';
-- ----------------------------
-- 初始化-定时任务调度表数据
-- ----------------------------
INSERT INTO aidev_sys_job VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',                                          '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_job VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')',                                    '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
INSERT INTO aidev_sys_job VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');

-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_job_log;
CREATE TABLE aidev_sys_job_log
(
    job_log_id     BIGINT(20)    NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    job_name       VARCHAR(64)   DEFAULT ''              COMMENT '任务名称',
    job_group      VARCHAR(64)   DEFAULT ''              COMMENT '任务组名',
    invoke_target  VARCHAR(500)  DEFAULT ''              COMMENT '调用目标字符串',
    job_message    VARCHAR(500)  DEFAULT ''              COMMENT '日志信息',
    status         CHAR(1)       DEFAULT '0'             COMMENT '执行状态（0正常 1失败）',
    exception_info VARCHAR(2000) DEFAULT ''              COMMENT '异常信息',
    create_time    DATETIME                              COMMENT '创建时间',
    PRIMARY KEY (job_log_id)
) ENGINE = innodb COMMENT = '定时任务调度日志表';

-- ----------------------------
-- 18、通知公告表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_notice;
CREATE TABLE aidev_sys_notice
(
    notice_id      INT(4)        NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    notice_title   VARCHAR(50)   DEFAULT ''              COMMENT '公告标题',
    notice_type    CHAR(1)       DEFAULT ''              COMMENT '公告类型（1通知 2公告）',
    notice_content VARCHAR(2000) DEFAULT ''              COMMENT '公告内容',
    status         CHAR(1)       DEFAULT '0'             COMMENT '公告状态（0正常 1关闭）',
    create_by      VARCHAR(64)   DEFAULT ''              COMMENT '创建者',
    create_time    DATETIME                              COMMENT '创建时间',
    update_by      VARCHAR(64)   DEFAULT ''              COMMENT '更新者',
    update_time    DATETIME                              COMMENT '更新时间',
    remark         VARCHAR(255)  DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (notice_id)
) ENGINE = innodb
  AUTO_INCREMENT = 10 COMMENT = '通知公告表';
-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
INSERT INTO aidev_sys_notice VALUES ('1', '温馨提醒：2021-07-01 AiDev新版本发布啦', '2', '新版本内容', '0', 'admin', sysdate(), '', null, '管理员');
INSERT INTO aidev_sys_notice VALUES ('2', '维护通知：2021-07-01 AiDev系统凌晨维护', '1', '维护内容', '0', 'admin', sysdate(), '', null, '管理员');

-- ----------------------------
-- 19、代码生成业务表
-- ----------------------------
DROP TABLE IF EXISTS aidev_gen_table;
CREATE TABLE aidev_gen_table
(
    table_id          BIGINT(20)    NOT NULL AUTO_INCREMENT COMMENT '编号',
    table_name        VARCHAR(200)  DEFAULT ''              COMMENT '表名称',
    table_comment     VARCHAR(500)  DEFAULT ''              COMMENT '表描述',
    sub_table_name    VARCHAR(64)   DEFAULT ''              COMMENT '关联子表的表名',
    sub_table_fk_name VARCHAR(64)   DEFAULT ''              COMMENT '子表关联的外键名',
    class_name        VARCHAR(100)  DEFAULT ''              COMMENT '实体类名称',
    tpl_category      VARCHAR(200)  DEFAULT 'crud'          COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
    package_name      VARCHAR(100)  DEFAULT ''              COMMENT '生成包路径',
    module_name       VARCHAR(30)   DEFAULT ''              COMMENT '生成模块名',
    business_name     VARCHAR(30)   DEFAULT ''              COMMENT '生成业务名',
    function_name     VARCHAR(50)   DEFAULT ''              COMMENT '生成功能名',
    function_author   VARCHAR(50)   DEFAULT ''              COMMENT '生成功能作者',
    gen_type          CHAR(1)       DEFAULT '0'             COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          VARCHAR(200)  DEFAULT '/'             COMMENT '生成路径（不填默认项目路径）',
    options           VARCHAR(1000) DEFAULT ''              COMMENT '其它生成选项',
    create_by         VARCHAR(64)   DEFAULT ''              COMMENT '创建者',
    create_time       DATETIME                              COMMENT '创建时间',
    update_by         VARCHAR(64)   DEFAULT ''              COMMENT '更新者',
    update_time       DATETIME                              COMMENT '更新时间',
    remark            VARCHAR(500)  DEFAULT ''              COMMENT '备注',
    PRIMARY KEY (table_id)
) ENGINE = innodb COMMENT = '代码生成业务表';

-- ----------------------------
-- 20、代码生成业务表字段
-- ----------------------------
DROP TABLE IF EXISTS aidev_gen_table_column;
CREATE TABLE aidev_gen_table_column
(
    column_id      BIGINT(20)   NOT NULL AUTO_INCREMENT COMMENT '编号',
    table_id       VARCHAR(64)  DEFAULT ''              COMMENT '归属表编号',
    column_name    VARCHAR(200) DEFAULT ''              COMMENT '列名称',
    column_comment VARCHAR(500) DEFAULT ''              COMMENT '列描述',
    column_type    VARCHAR(100) DEFAULT ''              COMMENT '列类型',
    java_type      VARCHAR(500) DEFAULT ''              COMMENT 'JAVA类型',
    java_field     VARCHAR(200) DEFAULT ''              COMMENT 'JAVA字段名',
    is_pk          CHAR(1)      DEFAULT ''              COMMENT '是否主键（1是）',
    is_increment   CHAR(1)      DEFAULT ''              COMMENT '是否自增（1是）',
    is_required    CHAR(1)      DEFAULT ''              COMMENT '是否必填（1是）',
    is_insert      CHAR(1)      DEFAULT ''              COMMENT '是否为插入字段（1是）',
    is_edit        CHAR(1)      DEFAULT ''              COMMENT '是否编辑字段（1是）',
    is_list        CHAR(1)      DEFAULT ''              COMMENT '是否列表字段（1是）',
    is_query       CHAR(1)      DEFAULT ''              COMMENT '是否查询字段（1是）',
    query_type     VARCHAR(200) DEFAULT 'EQ'            COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    html_type      VARCHAR(200) DEFAULT ''              COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    dict_type      VARCHAR(200) DEFAULT ''              COMMENT '字典类型',
    sort           INT                                  COMMENT '排序',
    create_by      VARCHAR(64)  DEFAULT ''              COMMENT '创建者',
    create_time    DATETIME                             COMMENT '创建时间',
    update_by      VARCHAR(64)  DEFAULT ''              COMMENT '更新者',
    update_time    DATETIME                             COMMENT '更新时间',
    PRIMARY KEY (column_id)
) ENGINE = innodb COMMENT = '代码生成业务表字段';

-- ----------------------------
-- 21、部门和祖级关联表  部门N-N祖级
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dept_ance;
CREATE TABLE aidev_sys_dept_ance
(
    dept_id BIGINT(20) NOT NULL COMMENT '部门ID',
    ance_id BIGINT(20) NOT NULL COMMENT '祖级ID',
    PRIMARY KEY (dept_id, ance_id)
) ENGINE = innodb COMMENT = '部门和祖级关联表';
-- ----------------------------
-- 初始化-部门和祖级关联表数据
-- ----------------------------
INSERT INTO aidev_sys_dept_ance VALUES ('100', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('101', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('101', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('102', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('102', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('103', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('103', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('103', '101');
INSERT INTO aidev_sys_dept_ance VALUES ('104', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('104', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('104', '101');
INSERT INTO aidev_sys_dept_ance VALUES ('105', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('105', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('105', '101');
INSERT INTO aidev_sys_dept_ance VALUES ('106', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('106', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('106', '101');
INSERT INTO aidev_sys_dept_ance VALUES ('107', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('107', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('107', '101');
INSERT INTO aidev_sys_dept_ance VALUES ('108', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('108', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('108', '102');
INSERT INTO aidev_sys_dept_ance VALUES ('109', '0');
INSERT INTO aidev_sys_dept_ance VALUES ('109', '100');
INSERT INTO aidev_sys_dept_ance VALUES ('109', '102');