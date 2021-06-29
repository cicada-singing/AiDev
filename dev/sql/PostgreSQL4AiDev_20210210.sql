-- ----------------------------
-- 1、部门信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dept;
CREATE TABLE aidev_sys_dept
(
    dept_id     BIGSERIAL   NOT NULL,
    parent_id   BIGINT      DEFAULT 0,
    dept_name   VARCHAR(30) DEFAULT '',
    order_num   INT4        DEFAULT 0,
    leader      VARCHAR(20) DEFAULT '',
    phone       VARCHAR(11) DEFAULT '',
    email       VARCHAR(50) DEFAULT '',
    status      CHAR(1)     DEFAULT '0',
    del_flag    CHAR(1)     DEFAULT '0',
    create_by   VARCHAR(64) DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64) DEFAULT '',
    update_time TIMESTAMP,
    CONSTRAINT pk_aidev_sys_dept PRIMARY KEY (dept_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_dept RESTART WITH 200 CACHE 20;
COMMENT ON TABLE  aidev_sys_dept             IS '部门信息表';
COMMENT ON COLUMN aidev_sys_dept.dept_id     IS '部门ID';
COMMENT ON COLUMN aidev_sys_dept.parent_id   IS '父部门ID';
COMMENT ON COLUMN aidev_sys_dept.dept_name   IS '部门名称';
COMMENT ON COLUMN aidev_sys_dept.order_num   IS '显示顺序';
COMMENT ON COLUMN aidev_sys_dept.leader      IS '负责人';
COMMENT ON COLUMN aidev_sys_dept.phone       IS '联系电话';
COMMENT ON COLUMN aidev_sys_dept.email       IS '邮箱';
COMMENT ON COLUMN aidev_sys_dept.status      IS '部门状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_dept.del_flag    IS '删除标志（0代表 2删除）';
COMMENT ON COLUMN aidev_sys_dept.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_dept.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_dept.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_dept.update_time IS '更新时间';
-- ----------------------------
-- 初始化-部门表数据
-- ----------------------------
INSERT INTO aidev_sys_dept VALUES (100, 0,   'AiDev科技', 0, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (101, 100, '深圳总公司', 1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (102, 100, '长沙分公司', 2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (103, 101, '研发部门',   1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (104, 101, '市场部门',   2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (105, 101, '测试部门',   3, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (106, 101, '财务部门',   4, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (107, 101, '运维部门',   5, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (108, 102, '市场部门',   1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);
INSERT INTO aidev_sys_dept VALUES (109, 102, '财务部门',   2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', now(), '', null);

-- ----------------------------
-- 2、用户信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user;
CREATE TABLE aidev_sys_user
(
    user_id         BIGSERIAL    NOT NULL,
    dept_id         BIGINT,
    login_name      VARCHAR(30)  DEFAULT '',
    user_name       VARCHAR(30)  DEFAULT '',
    user_type       VARCHAR(2)   DEFAULT '00',
    email           VARCHAR(50)  DEFAULT '',
    phonenumber     VARCHAR(11)  DEFAULT '',
    sex             CHAR(1)      DEFAULT '0',
    avatar          VARCHAR(100) DEFAULT '',
    password        VARCHAR(50)  DEFAULT '',
    salt            VARCHAR(20)  DEFAULT '',
    status          CHAR(1)      DEFAULT '0',
    del_flag        CHAR(1)      DEFAULT '0',
    login_ip        VARCHAR(128) DEFAULT '',
    login_date      TIMESTAMP,
    pwd_update_date TIMESTAMP,
    create_by       VARCHAR(64)  DEFAULT '',
    create_time     TIMESTAMP,
    update_by       VARCHAR(64)  DEFAULT '',
    update_time     TIMESTAMP,
    remark          VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_user PRIMARY KEY (user_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_user RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_user                 IS '用户信息表';
COMMENT ON COLUMN aidev_sys_user.user_id         IS '用户ID';
COMMENT ON COLUMN aidev_sys_user.dept_id         IS '部门ID';
COMMENT ON COLUMN aidev_sys_user.login_name      IS '登录账号';
COMMENT ON COLUMN aidev_sys_user.user_name       IS '用户昵称';
COMMENT ON COLUMN aidev_sys_user.user_type       IS '用户类型（00系统用户 01注册用户）';
COMMENT ON COLUMN aidev_sys_user.email           IS '用户邮箱';
COMMENT ON COLUMN aidev_sys_user.phonenumber     IS '手机号码';
COMMENT ON COLUMN aidev_sys_user.sex             IS '用户性别（0男 1女 2未知）';
COMMENT ON COLUMN aidev_sys_user.avatar          IS '头像路径';
COMMENT ON COLUMN aidev_sys_user.password        IS '密码';
COMMENT ON COLUMN aidev_sys_user.salt            IS '盐加密';
COMMENT ON COLUMN aidev_sys_user.status          IS '帐号状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_user.del_flag        IS '删除标志（0存在 2删除）';
COMMENT ON COLUMN aidev_sys_user.login_ip        IS '最后登录IP';
COMMENT ON COLUMN aidev_sys_user.login_date      IS '最后登录时间';
COMMENT ON COLUMN aidev_sys_user.pwd_update_date IS '密码最后更新时间';
COMMENT ON COLUMN aidev_sys_user.create_by       IS '创建者';
COMMENT ON COLUMN aidev_sys_user.create_time     IS '创建时间';
COMMENT ON COLUMN aidev_sys_user.update_by       IS '更新者';
COMMENT ON COLUMN aidev_sys_user.update_time     IS '更新时间';
COMMENT ON COLUMN aidev_sys_user.remark          IS '备注';
-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
INSERT INTO aidev_sys_user VALUES (1, 103, 'admin', 'Admin', '00', 'aidev@qq.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', now(), now(), 'admin', now(), '', null, '管理员');
INSERT INTO aidev_sys_user VALUES (2, 105, 'aidev', 'AiDev', '00', 'aidev@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', now(), now(), 'admin', now(), '', null, '测试员');

-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_post;
CREATE TABLE aidev_sys_post
(
    post_id     BIGSERIAL    NOT NULL,
    post_code   VARCHAR(64)  DEFAULT '',
    post_name   VARCHAR(50)  DEFAULT '',
    post_sort   INT4         NOT NULL,
    status      CHAR(1)      DEFAULT '',
    create_by   VARCHAR(64)  DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64)  DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_post PRIMARY KEY (post_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_post RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_post             IS '岗位信息表';
COMMENT ON COLUMN aidev_sys_post.post_id     IS '岗位ID';
COMMENT ON COLUMN aidev_sys_post.post_code   IS '岗位编码';
COMMENT ON COLUMN aidev_sys_post.post_name   IS '岗位名称';
COMMENT ON COLUMN aidev_sys_post.post_sort   IS '显示顺序';
COMMENT ON COLUMN aidev_sys_post.status      IS '状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_post.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_post.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_post.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_post.update_time IS '更新时间';
COMMENT ON COLUMN aidev_sys_post.remark      IS '备注';
-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
INSERT INTO aidev_sys_post VALUES (1, 'ceo',  '董事长',  1, '0', 'admin', now(), '', now(), '');
INSERT INTO aidev_sys_post VALUES (2, 'se',   '项目经理', 2, '0', 'admin', now(), '', now(), '');
INSERT INTO aidev_sys_post VALUES (3, 'hr',   '人力资源', 3, '0', 'admin', now(), '', now(), '');
INSERT INTO aidev_sys_post VALUES (4, 'user', '普通员工', 4, '0', 'admin', now(), '', now(), '');

-- ----------------------------
-- 4、角色信息表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_role;
CREATE TABLE aidev_sys_role
(
    role_id     BIGSERIAL    NOT NULL,
    role_name   VARCHAR(30)  DEFAULT '',
    role_key    VARCHAR(100) DEFAULT '',
    role_sort   INT4         NOT NULL,
    data_scope  CHAR(1)      DEFAULT '1',
    status      CHAR(1)      DEFAULT '0',
    del_flag    CHAR(1)      DEFAULT '0',
    create_by   VARCHAR(64)  DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64)  DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_role PRIMARY KEY (role_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_role RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_role              IS '角色信息表';
COMMENT ON COLUMN aidev_sys_role.role_id      IS '角色ID';
COMMENT ON COLUMN aidev_sys_role.role_name    IS '角色名称';
COMMENT ON COLUMN aidev_sys_role.role_key     IS '角色权限字符串';
COMMENT ON COLUMN aidev_sys_role.role_sort    IS '显示顺序';
COMMENT ON COLUMN aidev_sys_role.data_scope   IS '数据范围（1全部数据权限 2自定数据权限 3本部门数据权限 4本部门及以下数据权限）';
COMMENT ON COLUMN aidev_sys_role.status       IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_role.del_flag     IS '删除标志（0代表 2删除）';
COMMENT ON COLUMN aidev_sys_role.create_by    IS '创建者';
COMMENT ON COLUMN aidev_sys_role.create_time  IS '创建时间';
COMMENT ON COLUMN aidev_sys_role.update_by    IS '更新者';
COMMENT ON COLUMN aidev_sys_role.update_time  IS '更新时间';
COMMENT ON COLUMN aidev_sys_role.remark       IS '备注';
-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
INSERT INTO aidev_sys_role VALUES ('1', '超级管理员', 'admin', 1, 1, '0', '0', 'admin', now(), '', null, '超级管理员');
INSERT INTO aidev_sys_role VALUES ('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', now(), '', null, '普通角色');

-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_menu;
CREATE TABLE aidev_sys_menu
(
    menu_id     BIGSERIAL    NOT NULL,
    menu_name   VARCHAR(50)  DEFAULT '',
    parent_id   BIGINT       DEFAULT 0,
    order_num   INT4         DEFAULT 0,
    url         VARCHAR(200) DEFAULT '#',
    target      VARCHAR(20)  DEFAULT '',
    menu_type   CHAR(1)      DEFAULT '',
    visible     CHAR(1)      DEFAULT '0',
    is_refresh  CHAR(1)      DEFAULT '1',
    perms       VARCHAR(100) DEFAULT '',
    icon        VARCHAR(100) DEFAULT '#',
    create_by   VARCHAR(64)  DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64)  DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_menu PRIMARY KEY (menu_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_menu RESTART WITH 2000 CACHE 20;
COMMENT ON TABLE  aidev_sys_menu             IS '菜单权限表';
COMMENT ON COLUMN aidev_sys_menu.menu_id     IS '菜单ID';
COMMENT ON COLUMN aidev_sys_menu.menu_name   IS '菜单名称';
COMMENT ON COLUMN aidev_sys_menu.parent_id   IS '父菜单ID';
COMMENT ON COLUMN aidev_sys_menu.order_num   IS '显示顺序';
COMMENT ON COLUMN aidev_sys_menu.url         IS '请求地址';
COMMENT ON COLUMN aidev_sys_menu.target      IS '打开方式（menuItem页签 menuBlank新窗口）';
COMMENT ON COLUMN aidev_sys_menu.menu_type   IS '菜单类型（M目录 C菜单 F按钮）';
COMMENT ON COLUMN aidev_sys_menu.visible     IS '菜单状态（0显示 1隐藏）';
COMMENT ON COLUMN aidev_sys_menu.is_refresh  IS '是否刷新（0刷新 1不刷新）';
COMMENT ON COLUMN aidev_sys_menu.perms       IS '权限标识';
COMMENT ON COLUMN aidev_sys_menu.icon        IS '菜单图标';
COMMENT ON COLUMN aidev_sys_menu.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_menu.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_menu.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_menu.update_time IS '更新时间';
COMMENT ON COLUMN aidev_sys_menu.remark      IS '备注';
-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
INSERT INTO aidev_sys_menu VALUES ('1',    '系统管理', '0',   '1', '#',                   '', 'M', '0', '1', '',                        'fa fa-gear',            'admin', now(), '', null, '系统管理目录');
INSERT INTO aidev_sys_menu VALUES ('2',    '系统监控', '0',   '2', '#',                   '', 'M', '0', '1', '',                        'fa fa-video-camera',    'admin', now(), '', null, '系统监控目录');
INSERT INTO aidev_sys_menu VALUES ('3',    '系统工具', '0',   '3', '#',                   '', 'M', '0', '1', '',                        'fa fa-bars',            'admin', now(), '', null, '系统工具目录');
-- 二级菜单
INSERT INTO aidev_sys_menu VALUES ('100',  '用户管理', '1',   '1', '/system/user',        '', 'C', '0', '1', 'system:user:view',        'fa fa-user-o',          'admin', now(), '', null, '用户管理菜单');
INSERT INTO aidev_sys_menu VALUES ('101',  '角色管理', '1',   '2', '/system/role',        '', 'C', '0', '1', 'system:role:view',        'fa fa-user-secret',     'admin', now(), '', null, '角色管理菜单');
INSERT INTO aidev_sys_menu VALUES ('102',  '菜单管理', '1',   '3', '/system/menu',        '', 'C', '0', '1', 'system:menu:view',        'fa fa-th-list',         'admin', now(), '', null, '菜单管理菜单');
INSERT INTO aidev_sys_menu VALUES ('103',  '部门管理', '1',   '4', '/system/dept',        '', 'C', '0', '1', 'system:dept:view',        'fa fa-outdent',         'admin', now(), '', null, '部门管理菜单');
INSERT INTO aidev_sys_menu VALUES ('104',  '岗位管理', '1',   '5', '/system/post',        '', 'C', '0', '1', 'system:post:view',        'fa fa-address-card-o',  'admin', now(), '', null, '岗位管理菜单');
INSERT INTO aidev_sys_menu VALUES ('105',  '字典管理', '1',   '6', '/system/dict',        '', 'C', '0', '1', 'system:dict:view',        'fa fa-bookmark-o',      'admin', now(), '', null, '字典管理菜单');
INSERT INTO aidev_sys_menu VALUES ('106',  '参数设置', '1',   '7', '/system/config',      '', 'C', '0', '1', 'system:config:view',      'fa fa-sun-o',           'admin', now(), '', null, '参数设置菜单');
INSERT INTO aidev_sys_menu VALUES ('107',  '通知公告', '1',   '8', '/system/notice',      '', 'C', '0', '1', 'system:notice:view',      'fa fa-bullhorn',        'admin', now(), '', null, '通知公告菜单');
INSERT INTO aidev_sys_menu VALUES ('108',  '日志管理', '1',   '9', '#',                   '', 'M', '0', '1', '',                        'fa fa-pencil-square-o', 'admin', now(), '', null, '日志管理菜单');
INSERT INTO aidev_sys_menu VALUES ('109',  '在线用户', '2',   '1', '/monitor/online',     '', 'C', '0', '1', 'monitor:online:view',     'fa fa-user-circle',     'admin', now(), '', null, '在线用户菜单');
INSERT INTO aidev_sys_menu VALUES ('110',  '定时任务', '2',   '2', '/monitor/job',        '', 'C', '0', '1', 'monitor:job:view',        'fa fa-tasks',           'admin', now(), '', null, '定时任务菜单');
INSERT INTO aidev_sys_menu VALUES ('111',  '数据监控', '2',   '3', '/monitor/data',       '', 'C', '0', '1', 'monitor:data:view',       'fa fa-bug',             'admin', now(), '', null, '数据监控菜单');
INSERT INTO aidev_sys_menu VALUES ('112',  '服务监控', '2',   '3', '/monitor/server',     '', 'C', '0', '1', 'monitor:server:view',     'fa fa-server',          'admin', now(), '', null, '服务监控菜单');
INSERT INTO aidev_sys_menu VALUES ('113',  '表单构建', '3',   '1', '/tool/build',         '', 'C', '0', '1', 'tool:build:view',         'fa fa-wpforms',         'admin', now(), '', null, '表单构建菜单');
INSERT INTO aidev_sys_menu VALUES ('114',  '代码生成', '3',   '2', '/tool/gen',           '', 'C', '0', '1', 'tool:gen:view',           'fa fa-code',            'admin', now(), '', null, '代码生成菜单');
INSERT INTO aidev_sys_menu VALUES ('115',  '系统接口', '3',   '3', '/tool/swagger',       '', 'C', '0', '1', 'tool:swagger:view',       'fa fa-gg',              'admin', now(), '', null, '系统接口菜单');
-- 三级菜单
INSERT INTO aidev_sys_menu VALUES ('500',  '操作日志', '108', '1', '/monitor/operlog',    '', 'C', '0', '1', 'monitor:operlog:view',    'fa fa-address-book',    'admin', now(), '', null, '操作日志菜单');
INSERT INTO aidev_sys_menu VALUES ('501',  '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o',    'admin', now(), '', null, '登录日志菜单');
-- 用户管理按钮
INSERT INTO aidev_sys_menu VALUES ('1000', '用户查询', '100', '1', '#',                   '', 'F', '0', '1', 'system:user:list',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1001', '用户新增', '100', '2', '#',                   '', 'F', '0', '1', 'system:user:add',         '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1002', '用户修改', '100', '3', '#',                   '', 'F', '0', '1', 'system:user:edit',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1003', '用户删除', '100', '4', '#',                   '', 'F', '0', '1', 'system:user:remove',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1004', '用户导出', '100', '5', '#',                   '', 'F', '0', '1', 'system:user:export',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1005', '用户导入', '100', '6', '#',                   '', 'F', '0', '1', 'system:user:import',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1006', '重置密码', '100', '7', '#',                   '', 'F', '0', '1', 'system:user:resetPwd',    '#',                     'admin', now(), '', null, '');
-- 角色管理按钮
INSERT INTO aidev_sys_menu VALUES ('1007', '角色查询', '101', '1', '#',                   '', 'F', '0', '1', 'system:role:list',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1008', '角色新增', '101', '2', '#',                   '', 'F', '0', '1', 'system:role:add',         '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1009', '角色修改', '101', '3', '#',                   '', 'F', '0', '1', 'system:role:edit',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1010', '角色删除', '101', '4', '#',                   '', 'F', '0', '1', 'system:role:remove',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1011', '角色导出', '101', '5', '#',                   '', 'F', '0', '1', 'system:role:export',      '#',                     'admin', now(), '', null, '');
-- 菜单管理按钮
INSERT INTO aidev_sys_menu VALUES ('1012', '菜单查询', '102', '1', '#',                   '', 'F', '0', '1', 'system:menu:list',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1013', '菜单新增', '102', '2', '#',                   '', 'F', '0', '1', 'system:menu:add',         '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1014', '菜单修改', '102', '3', '#',                   '', 'F', '0', '1', 'system:menu:edit',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1015', '菜单删除', '102', '4', '#',                   '', 'F', '0', '1', 'system:menu:remove',      '#',                     'admin', now(), '', null, '');
-- 部门管理按钮
INSERT INTO aidev_sys_menu VALUES ('1016', '部门查询', '103', '1', '#',                   '', 'F', '0', '1', 'system:dept:list',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1017', '部门新增', '103', '2', '#',                   '', 'F', '0', '1', 'system:dept:add',         '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1018', '部门修改', '103', '3', '#',                   '', 'F', '0', '1', 'system:dept:edit',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1019', '部门删除', '103', '4', '#',                   '', 'F', '0', '1', 'system:dept:remove',      '#',                     'admin', now(), '', null, '');
-- 岗位管理按钮
INSERT INTO aidev_sys_menu VALUES ('1020', '岗位查询', '104', '1', '#',                   '', 'F', '0', '1', 'system:post:list',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1021', '岗位新增', '104', '2', '#',                   '', 'F', '0', '1', 'system:post:add',         '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1022', '岗位修改', '104', '3', '#',                   '', 'F', '0', '1', 'system:post:edit',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1023', '岗位删除', '104', '4', '#',                   '', 'F', '0', '1', 'system:post:remove',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1024', '岗位导出', '104', '5', '#',                   '', 'F', '0', '1', 'system:post:export',      '#',                     'admin', now(), '', null, '');
-- 字典管理按钮
INSERT INTO aidev_sys_menu VALUES ('1025', '字典查询', '105', '1', '#',                   '', 'F', '0', '1', 'system:dict:list',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1026', '字典新增', '105', '2', '#',                   '', 'F', '0', '1', 'system:dict:add',         '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1027', '字典修改', '105', '3', '#',                   '', 'F', '0', '1', 'system:dict:edit',        '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1028', '字典删除', '105', '4', '#',                   '', 'F', '0', '1', 'system:dict:remove',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1029', '字典导出', '105', '5', '#',                   '', 'F', '0', '1', 'system:dict:export',      '#',                     'admin', now(), '', null, '');
-- 参数设置按钮
INSERT INTO aidev_sys_menu VALUES ('1030', '参数查询', '106', '1', '#',                   '', 'F', '0', '1', 'system:config:list',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1031', '参数新增', '106', '2', '#',                   '', 'F', '0', '1', 'system:config:add',       '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1032', '参数修改', '106', '3', '#',                   '', 'F', '0', '1', 'system:config:edit',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1033', '参数删除', '106', '4', '#',                   '', 'F', '0', '1', 'system:config:remove',    '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1034', '参数导出', '106', '5', '#',                   '', 'F', '0', '1', 'system:config:export',    '#',                     'admin', now(), '', null, '');
-- 通知公告按钮
INSERT INTO aidev_sys_menu VALUES ('1035', '公告查询', '107', '1', '#',                   '', 'F', '0', '1', 'system:notice:list',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1036', '公告新增', '107', '2', '#',                   '', 'F', '0', '1', 'system:notice:add',       '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1037', '公告修改', '107', '3', '#',                   '', 'F', '0', '1', 'system:notice:edit',      '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1038', '公告删除', '107', '4', '#',                   '', 'F', '0', '1', 'system:notice:remove',    '#',                     'admin', now(), '', null, '');
-- 操作日志按钮
INSERT INTO aidev_sys_menu VALUES ('1039', '操作查询', '500', '1', '#',                   '', 'F', '0', '1', 'monitor:operlog:list',    '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1040', '操作删除', '500', '2', '#',                   '', 'F', '0', '1', 'monitor:operlog:remove',  '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1041', '详细信息', '500', '3', '#',                   '', 'F', '0', '1', 'monitor:operlog:detail',  '#',                     'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1042', '日志导出', '500', '4', '#',                   '', 'F', '0', '1', 'monitor:operlog:export',  '#',                     'admin', now(), '', null, '');
-- 登录日志按钮
INSERT INTO aidev_sys_menu VALUES ('1043', '登录查询', '501', '1', '#',                   '', 'F', '0', '1', 'monitor:logininfor:list',         '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1044', '登录删除', '501', '2', '#',                   '', 'F', '0', '1', 'monitor:logininfor:remove',       '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1045', '日志导出', '501', '3', '#',                   '', 'F', '0', '1', 'monitor:logininfor:export',       '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1046', '账户解锁', '501', '4', '#',                   '', 'F', '0', '1', 'monitor:logininfor:unlock',       '#',             'admin', now(), '', null, '');
-- 在线用户按钮
INSERT INTO aidev_sys_menu VALUES ('1047', '在线查询', '109', '1', '#',                   '', 'F', '0', '1', 'monitor:online:list',             '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1048', '批量强退', '109', '2', '#',                   '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1049', '单条强退', '109', '3', '#',                   '', 'F', '0', '1', 'monitor:online:forceLogout',      '#',             'admin', now(), '', null, '');
-- 定时任务按钮
INSERT INTO aidev_sys_menu VALUES ('1050', '任务查询', '110', '1', '#',                   '', 'F', '0', '1', 'monitor:job:list',                '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1051', '任务新增', '110', '2', '#',                   '', 'F', '0', '1', 'monitor:job:add',                 '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1052', '任务修改', '110', '3', '#',                   '', 'F', '0', '1', 'monitor:job:edit',                '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1053', '任务删除', '110', '4', '#',                   '', 'F', '0', '1', 'monitor:job:remove',              '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1054', '状态修改', '110', '5', '#',                   '', 'F', '0', '1', 'monitor:job:changeStatus',        '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1055', '任务详细', '110', '6', '#',                   '', 'F', '0', '1', 'monitor:job:detail',              '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1056', '任务导出', '110', '7', '#',                   '', 'F', '0', '1', 'monitor:job:export',              '#',             'admin', now(), '', null, '');
-- 代码生成按钮
INSERT INTO aidev_sys_menu VALUES ('1057', '生成查询', '114', '1', '#',                   '', 'F', '0', '1', 'tool:gen:list',                   '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1058', '生成修改', '114', '2', '#',                   '', 'F', '0', '1', 'tool:gen:edit',                   '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1059', '生成删除', '114', '3', '#',                   '', 'F', '0', '1', 'tool:gen:remove',                 '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1060', '预览代码', '114', '4', '#',                   '', 'F', '0', '1', 'tool:gen:preview',                '#',             'admin', now(), '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1061', '生成代码', '114', '5', '#',                   '', 'F', '0', '1', 'tool:gen:code',                   '#',             'admin', now(), '', null, '');

-- ----------------------------
-- 6、用户和角色关联表  用户1-N角色
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user_role;
CREATE TABLE aidev_sys_user_role
(
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    CONSTRAINT pk_aidev_sys_user_role PRIMARY KEY (user_id, role_id)
);
COMMENT ON TABLE  aidev_sys_user_role         IS '用户和角色关联表';
COMMENT ON COLUMN aidev_sys_user_role.user_id IS '用户ID';
COMMENT ON COLUMN aidev_sys_user_role.role_id IS '角色ID';
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
    role_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    CONSTRAINT pk_aidev_sys_role_menu PRIMARY KEY (role_id, menu_id)
);
COMMENT ON TABLE  aidev_sys_role_menu         IS '角色和菜单关联表';
COMMENT ON COLUMN aidev_sys_role_menu.role_id IS '角色ID';
COMMENT ON COLUMN aidev_sys_role_menu.menu_id IS '菜单ID';
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
    role_id BIGINT NOT NULL,
    dept_id BIGINT NOT NULL,
    CONSTRAINT pk_aidev_sys_role_dept PRIMARY KEY (role_id, dept_id)
);
COMMENT ON TABLE  aidev_sys_role_dept         IS '角色和部门关联表';
COMMENT ON COLUMN aidev_sys_role_dept.role_id IS '角色ID';
COMMENT ON COLUMN aidev_sys_role_dept.dept_id IS '部门ID';
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
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    CONSTRAINT pk_aidev_sys_user_post PRIMARY KEY (user_id, post_id)
);
COMMENT ON TABLE  aidev_sys_user_post         IS '用户与岗位关联表';
COMMENT ON COLUMN aidev_sys_user_post.user_id IS '用户ID';
COMMENT ON COLUMN aidev_sys_user_post.post_id IS '岗位ID';
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
    oper_id        BIGSERIAL     NOT NULL,
    title          VARCHAR(50)   DEFAULT '',
    business_type  INT4          DEFAULT 0,
    method         VARCHAR(100)  DEFAULT '',
    request_method VARCHAR(10)   DEFAULT '',
    operator_type  INT4          DEFAULT 0,
    oper_name      VARCHAR(50)   DEFAULT '',
    dept_name      VARCHAR(50)   DEFAULT '',
    oper_url       VARCHAR(255)  DEFAULT '',
    oper_ip        VARCHAR(128)  DEFAULT '',
    oper_location  VARCHAR(255)  DEFAULT '',
    oper_param     VARCHAR(2000) DEFAULT '',
    json_result    VARCHAR(2000) DEFAULT '',
    status         INT4          DEFAULT 0,
    error_msg      VARCHAR(2000) DEFAULT '',
    oper_time      TIMESTAMP,
    CONSTRAINT pk_aidev_sys_oper_log PRIMARY KEY (oper_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_oper_log RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_oper_log                IS '操作日志记录表';
COMMENT ON COLUMN aidev_sys_oper_log.oper_id        IS '日志主键';
COMMENT ON COLUMN aidev_sys_oper_log.title          IS '模块标题';
COMMENT ON COLUMN aidev_sys_oper_log.business_type  IS '业务类型（0其它 1新增 2修改 3删除）';
COMMENT ON COLUMN aidev_sys_oper_log.method         IS '方法名称';
COMMENT ON COLUMN aidev_sys_oper_log.request_method IS '请求方式';
COMMENT ON COLUMN aidev_sys_oper_log.operator_type  IS '操作类别（0其它 1后台用户 2手机端用户）';
COMMENT ON COLUMN aidev_sys_oper_log.oper_name      IS '操作人员';
COMMENT ON COLUMN aidev_sys_oper_log.dept_name      IS '部门名称';
COMMENT ON COLUMN aidev_sys_oper_log.oper_url       IS '请求URL';
COMMENT ON COLUMN aidev_sys_oper_log.oper_ip        IS '主机地址';
COMMENT ON COLUMN aidev_sys_oper_log.oper_location  IS '操作地点';
COMMENT ON COLUMN aidev_sys_oper_log.oper_param     IS '请求参数';
COMMENT ON COLUMN aidev_sys_oper_log.json_result    IS '返回参数';
COMMENT ON COLUMN aidev_sys_oper_log.status         IS '操作状态（0正常 1异常）';
COMMENT ON COLUMN aidev_sys_oper_log.error_msg      IS '错误消息';
COMMENT ON COLUMN aidev_sys_oper_log.oper_time      IS '操作时间';

-- ----------------------------
-- 11、字典类型表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dict_type;
CREATE TABLE aidev_sys_dict_type
(
    dict_id     BIGSERIAL    NOT NULL,
    dict_name   VARCHAR(100) DEFAULT '',
    dict_type   VARCHAR(100) DEFAULT '' UNIQUE,
    status      CHAR(1)      DEFAULT '0',
    create_by   VARCHAR(64)  DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64)  DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_dict_type PRIMARY KEY (dict_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_dict_type RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_dict_type             IS '字典类型表';
COMMENT ON COLUMN aidev_sys_dict_type.dict_id     IS '字典主键';
COMMENT ON COLUMN aidev_sys_dict_type.dict_name   IS '字典名称';
COMMENT ON COLUMN aidev_sys_dict_type.dict_type   IS '字典类型';
COMMENT ON COLUMN aidev_sys_dict_type.status      IS '状态（0正常 1禁用）';
COMMENT ON COLUMN aidev_sys_dict_type.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_dict_type.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_dict_type.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_dict_type.update_time IS '更新时间';
COMMENT ON COLUMN aidev_sys_dict_type.remark      IS '备注';
-- ----------------------------
-- 初始化-字典类型表数据
-- ----------------------------
INSERT INTO aidev_sys_dict_type VALUES (1, '用户性别', 'sys_user_sex',       '0', 'admin', now(), '', null, '用户性别列表');
INSERT INTO aidev_sys_dict_type VALUES (2, '菜单状态', 'sys_show_hide',      '0', 'admin', now(), '', null, '菜单状态列表');
INSERT INTO aidev_sys_dict_type VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', now(), '', null, '系统开关列表');
INSERT INTO aidev_sys_dict_type VALUES (4, '任务状态', 'sys_job_status',     '0', 'admin', now(), '', null, '任务状态列表');
INSERT INTO aidev_sys_dict_type VALUES (5, '任务分组', 'sys_job_group',      '0', 'admin', now(), '', null, '任务分组列表');
INSERT INTO aidev_sys_dict_type VALUES (6, '系统是否', 'sys_yes_no',         '0', 'admin', now(), '', null, '系统是否列表');
INSERT INTO aidev_sys_dict_type VALUES (7, '通知类型', 'sys_notice_type',    '0', 'admin', now(), '', null, '通知类型列表');
INSERT INTO aidev_sys_dict_type VALUES (8, '通知状态', 'sys_notice_status',  '0', 'admin', now(), '', null, '通知状态列表');
INSERT INTO aidev_sys_dict_type VALUES (9, '操作类型', 'sys_oper_type',      '0', 'admin', now(), '', null, '操作类型列表');
INSERT INTO aidev_sys_dict_type VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', now(), '', null, '登录状态列表');

-- ----------------------------
-- 12、字典数据表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dict_data;
CREATE TABLE aidev_sys_dict_data
(
    dict_code   BIGSERIAL    NOT NULL,
    dict_sort   INT4         DEFAULT 0,
    dict_label  VARCHAR(100) DEFAULT '',
    dict_value  VARCHAR(100) DEFAULT '',
    dict_type   VARCHAR(100) DEFAULT '',
    css_class   VARCHAR(100) DEFAULT '',
    list_class  VARCHAR(100) DEFAULT '',
    is_default  CHAR(1)      DEFAULT 'N',
    status      CHAR(1)      DEFAULT '0',
    create_by   VARCHAR(64)  DEFAULT '',
    create_time TIMESTAMP,
    update_by   VARCHAR(64)  DEFAULT '',
    update_time TIMESTAMP,
    remark      VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_dict_data PRIMARY KEY (dict_code)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_dict_data RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_dict_data             IS '字典数据表';
COMMENT ON COLUMN aidev_sys_dict_data.dict_code   IS '字典编码';
COMMENT ON COLUMN aidev_sys_dict_data.dict_sort   IS '字典排序';
COMMENT ON COLUMN aidev_sys_dict_data.dict_label  IS '字典标签';
COMMENT ON COLUMN aidev_sys_dict_data.dict_value  IS '字典键值';
COMMENT ON COLUMN aidev_sys_dict_data.dict_type   IS '字典类型';
COMMENT ON COLUMN aidev_sys_dict_data.css_class   IS '样式属性（其他样式扩展）';
COMMENT ON COLUMN aidev_sys_dict_data.list_class  IS '表格回显样式';
COMMENT ON COLUMN aidev_sys_dict_data.is_default  IS '是否默认（Y是 N否）';
COMMENT ON COLUMN aidev_sys_dict_data.status      IS '状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_dict_data.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_dict_data.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_dict_data.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_dict_data.update_time IS '更新时间';
COMMENT ON COLUMN aidev_sys_dict_data.remark      IS '备注';
-- ----------------------------
-- 初始化-字典数据表数据
-- ----------------------------
INSERT INTO aidev_sys_dict_data VALUES (1,  1,  '男',    '0',       'sys_user_sex',       '', '',        'Y', '0', 'admin', now(), '', null, '性别男');
INSERT INTO aidev_sys_dict_data VALUES (2,  2,  '女',    '1',       'sys_user_sex',       '', '',        'N', '0', 'admin', now(), '', null, '性别女');
INSERT INTO aidev_sys_dict_data VALUES (3,  3,  '未知',   '2',       'sys_user_sex',       '', '',        'N', '0', 'admin', now(), '', null, '性别未知');
INSERT INTO aidev_sys_dict_data VALUES (4,  1,  '显示',   '0',       'sys_show_hide',      '', 'primary', 'Y', '0', 'admin', now(), '', null, '显示菜单');
INSERT INTO aidev_sys_dict_data VALUES (5,  2,  '隐藏',   '1',       'sys_show_hide',      '', 'danger',  'N', '0', 'admin', now(), '', null, '隐藏菜单');
INSERT INTO aidev_sys_dict_data VALUES (6,  1,  '正常',   '0',       'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', now(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (7,  2,  '停用',   '1',       'sys_normal_disable', '', 'danger',  'N', '0', 'admin', now(), '', null, '停用状态');
INSERT INTO aidev_sys_dict_data VALUES (8,  1,  '正常',   '0',       'sys_job_status',     '', 'primary', 'Y', '0', 'admin', now(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (9,  2,  '暂停',   '1',       'sys_job_status',     '', 'danger',  'N', '0', 'admin', now(), '', null, '停用状态');
INSERT INTO aidev_sys_dict_data VALUES (10, 1,  '默认',   'DEFAULT', 'sys_job_group',      '', '',        'Y', '0', 'admin', now(), '', null, '默认分组');
INSERT INTO aidev_sys_dict_data VALUES (11, 2,  '系统',   'SYSTEM',  'sys_job_group',      '', '',        'N', '0', 'admin', now(), '', null, '系统分组');
INSERT INTO aidev_sys_dict_data VALUES (12, 1,  '是',     'Y',       'sys_yes_no',         '', 'primary', 'Y', '0', 'admin', now(), '', null, '系统默认是');
INSERT INTO aidev_sys_dict_data VALUES (13, 2,  '否',     'N',       'sys_yes_no',         '', 'danger',  'N', '0', 'admin', now(), '', null, '系统默认否');
INSERT INTO aidev_sys_dict_data VALUES (14, 1,  '通知',    '1',      'sys_notice_type',    '', 'warning', 'Y', '0', 'admin', now(), '', null, '通知');
INSERT INTO aidev_sys_dict_data VALUES (15, 2,  '公告',    '2',      'sys_notice_type',    '', 'success', 'N', '0', 'admin', now(), '', null, '公告');
INSERT INTO aidev_sys_dict_data VALUES (16, 1,  '正常',    '0',      'sys_notice_status',  '', 'primary', 'Y', '0', 'admin', now(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (17, 2,  '关闭',    '1',      'sys_notice_status',  '', 'danger',  'N', '0', 'admin', now(), '', null, '关闭状态');
INSERT INTO aidev_sys_dict_data VALUES (18, 99, '其他',    '0',      'sys_oper_type',      '', 'info',    'N', '0', 'admin', now(), '', null, '其他操作');
INSERT INTO aidev_sys_dict_data VALUES (19, 1,  '新增',    '1',      'sys_oper_type',      '', 'info',    'N', '0', 'admin', now(), '', null, '新增操作');
INSERT INTO aidev_sys_dict_data VALUES (20, 2,  '修改',    '2',      'sys_oper_type',      '', 'info',    'N', '0', 'admin', now(), '', null, '修改操作');
INSERT INTO aidev_sys_dict_data VALUES (21, 3,  '删除',    '3',      'sys_oper_type',      '', 'danger',  'N', '0', 'admin', now(), '', null, '删除操作');
INSERT INTO aidev_sys_dict_data VALUES (22, 4,  '授权',    '4',      'sys_oper_type',      '', 'primary', 'N', '0', 'admin', now(), '', null, '授权操作');
INSERT INTO aidev_sys_dict_data VALUES (23, 5,  '导出',    '5',      'sys_oper_type',      '', 'warning', 'N', '0', 'admin', now(), '', null, '导出操作');
INSERT INTO aidev_sys_dict_data VALUES (24, 6,  '导入',    '6',      'sys_oper_type',      '', 'warning', 'N', '0', 'admin', now(), '', null, '导入操作');
INSERT INTO aidev_sys_dict_data VALUES (25, 7,  '强退',    '7',      'sys_oper_type',      '', 'danger',  'N', '0', 'admin', now(), '', null, '强退操作');
INSERT INTO aidev_sys_dict_data VALUES (26, 8,  '生成代码', '8',      'sys_oper_type',      '', 'warning', 'N', '0', 'admin', now(), '', null, '生成操作');
INSERT INTO aidev_sys_dict_data VALUES (27, 9,  '清空数据', '9',      'sys_oper_type',      '', 'danger',  'N', '0', 'admin', now(), '', null, '清空操作');
INSERT INTO aidev_sys_dict_data VALUES (28, 1,  '成功',    '0',      'sys_common_status',  '', 'primary', 'N', '0', 'admin', now(), '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (29, 2,  '失败',    '1',      'sys_common_status',  '', 'danger',  'N', '0', 'admin', now(), '', null, '停用状态');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_config;
CREATE TABLE aidev_sys_config
(
    config_id    BIGSERIAL    NOT NULL,
    config_name  VARCHAR(100) DEFAULT '',
    config_key   VARCHAR(100) DEFAULT '',
    config_value VARCHAR(100) DEFAULT '',
    config_type  CHAR(1)      DEFAULT 'N',
    create_by    VARCHAR(64)  DEFAULT '',
    create_time  TIMESTAMP,
    update_by    VARCHAR(64)  DEFAULT '',
    update_time  TIMESTAMP,
    remark       VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_config PRIMARY KEY (config_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_config RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_config              IS '参数配置表';
COMMENT ON COLUMN aidev_sys_config.config_id    IS '参数主键';
COMMENT ON COLUMN aidev_sys_config.config_name  IS '参数名称';
COMMENT ON COLUMN aidev_sys_config.config_key   IS '参数键名';
COMMENT ON COLUMN aidev_sys_config.config_value IS '参数键值';
COMMENT ON COLUMN aidev_sys_config.config_type  IS '系统内置（Y是 N否）';
COMMENT ON COLUMN aidev_sys_config.create_by    IS '创建者';
COMMENT ON COLUMN aidev_sys_config.create_time  IS '创建时间';
COMMENT ON COLUMN aidev_sys_config.update_by    IS '更新者';
COMMENT ON COLUMN aidev_sys_config.update_time  IS '更新时间';
COMMENT ON COLUMN aidev_sys_config.remark       IS '备注';
-- ----------------------------
-- 初始化-参数配置表数据
-- ----------------------------
INSERT INTO aidev_sys_config VALUES (1, '主框架页-默认皮肤样式名称',    'sys.index.skinName',               'skin-blue',   'Y', 'admin', now(), '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO aidev_sys_config VALUES (2, '用户管理-账号初始密码',       'sys.user.initPassword',            '123456',      'Y', 'admin', now(), '', null, '初始化密码 123456');
INSERT INTO aidev_sys_config VALUES (3, '主框架页-侧边栏主题',         'sys.index.sideTheme',              'theme-dark',  'Y', 'admin', now(), '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO aidev_sys_config VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser',         'false',       'Y', 'admin', now(), '', null, '是否开启注册用户功能');
INSERT INTO aidev_sys_config VALUES (5, '用户管理-密码字符范围',        'sys.account.chrtype',              '0',           'Y', 'admin', now(), '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO aidev_sys_config VALUES (6, '用户管理-初始密码修改策略',     'sys.account.initPasswordModify',   '0',           'Y', 'admin', now(), '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO aidev_sys_config VALUES (7, '用户管理-账号密码更新周期',     'sys.account.passwordValidateDays', '0',           'Y', 'admin', now(), '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO aidev_sys_config VALUES (8, '主框架页-菜单导航显示风格',     'sys.index.menuStyle',              'DEFAULT',     'Y', 'admin', now(), '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO aidev_sys_config VALUES (9, '主框架页-是否开启页脚',        'sys.index.ignoreFooter',           'true',        'Y', 'admin', now(), '', null, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- 14、系统访问记录表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_logininfor;
CREATE TABLE aidev_sys_logininfor
(
    info_id        BIGSERIAL    NOT NULL,
    login_name     VARCHAR(50)  DEFAULT '',
    ipaddr         VARCHAR(50)  DEFAULT '',
    login_location VARCHAR(255) DEFAULT '',
    browser        VARCHAR(50)  DEFAULT '',
    os             VARCHAR(50)  DEFAULT '',
    status         CHAR(1)      DEFAULT '0',
    msg            VARCHAR(255) DEFAULT '',
    login_time     TIMESTAMP,
    CONSTRAINT pk_aidev_sys_logininfor PRIMARY KEY (info_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_logininfor RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_logininfor                IS '系统访问记录表';
COMMENT ON COLUMN aidev_sys_logininfor.info_id        IS '访问ID';
COMMENT ON COLUMN aidev_sys_logininfor.login_name     IS '登录账号';
COMMENT ON COLUMN aidev_sys_logininfor.ipaddr         IS '登录IP地址';
COMMENT ON COLUMN aidev_sys_logininfor.browser        IS '浏览器类型';
COMMENT ON COLUMN aidev_sys_logininfor.login_location IS '登录地点';
COMMENT ON COLUMN aidev_sys_logininfor.os             IS '操作系统';
COMMENT ON COLUMN aidev_sys_logininfor.status         IS '登录状态（0成功 1失败）';
COMMENT ON COLUMN aidev_sys_logininfor.msg            IS '提示消息';
COMMENT ON COLUMN aidev_sys_logininfor.login_time     IS '访问时间';

-- ----------------------------
-- 15、在线用户记录表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_user_online;
CREATE TABLE aidev_sys_user_online
(
    session_id       VARCHAR(50)  DEFAULT '',
    login_name       VARCHAR(50)  DEFAULT '',
    dept_name        VARCHAR(50)  DEFAULT '',
    ipaddr           VARCHAR(128) DEFAULT '',
    login_location   VARCHAR(255) DEFAULT '',
    browser          VARCHAR(50)  DEFAULT '',
    os               VARCHAR(50)  DEFAULT '',
    status           VARCHAR(10)  DEFAULT '',
    start_timestamp  TIMESTAMP,
    last_access_time TIMESTAMP,
    expire_time      INT4         DEFAULT 0,
    CONSTRAINT pk_aidev_sys_user_online PRIMARY KEY (session_id)
);
COMMENT ON TABLE  aidev_sys_user_online                  IS '在线用户记录表';
COMMENT ON COLUMN aidev_sys_user_online.session_id       IS '用户会话ID';
COMMENT ON COLUMN aidev_sys_user_online.login_name       IS '登录账号';
COMMENT ON COLUMN aidev_sys_user_online.dept_name        IS '部门名称';
COMMENT ON COLUMN aidev_sys_user_online.ipaddr           IS '登录IP地址';
COMMENT ON COLUMN aidev_sys_user_online.login_location   IS '登录地点';
COMMENT ON COLUMN aidev_sys_user_online.browser          IS '浏览器类型';
COMMENT ON COLUMN aidev_sys_user_online.os               IS '操作系统';
COMMENT ON COLUMN aidev_sys_user_online.status           IS '在线状态on_line在线off_line离线';
COMMENT ON COLUMN aidev_sys_user_online.start_timestamp  IS 'session创建时间';
COMMENT ON COLUMN aidev_sys_user_online.last_access_time IS 'session最后访问时间';
COMMENT ON COLUMN aidev_sys_user_online.expire_time      IS '超时时间，单位为分钟';

-- ----------------------------
-- 16、定时任务调度表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_job;
CREATE TABLE aidev_sys_job
(
    job_id          BIGSERIAL    NOT NULL,
    job_name        VARCHAR(64)  DEFAULT '',
    job_group       VARCHAR(64)  DEFAULT 'DEFAULT',
    invoke_target   VARCHAR(500) DEFAULT '',
    cron_expression VARCHAR(255) DEFAULT '',
    misfire_policy  VARCHAR(20)  DEFAULT '3',
    concurrent      CHAR(1)      DEFAULT '1',
    status          CHAR(1)      DEFAULT '0',
    create_by       VARCHAR(64)  DEFAULT '',
    create_time     TIMESTAMP,
    update_by       VARCHAR(64)  DEFAULT '',
    update_time     TIMESTAMP,
    remark          VARCHAR(500) DEFAULT '',
    CONSTRAINT pk_aidev_sys_job PRIMARY KEY (job_id, job_name, job_group)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_job RESTART WITH 100 CACHE 20;
COMMENT ON TABLE  aidev_sys_job                   IS '定时任务调度表';
COMMENT ON COLUMN aidev_sys_job.job_id            IS '任务主键';
COMMENT ON COLUMN aidev_sys_job.job_name          IS '任务名称';
COMMENT ON COLUMN aidev_sys_job.job_group         IS '任务组名';
COMMENT ON COLUMN aidev_sys_job.invoke_target     IS '调用目标字符串';
COMMENT ON COLUMN aidev_sys_job.cron_expression   IS 'cron执行表达式';
COMMENT ON COLUMN aidev_sys_job.misfire_policy    IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
COMMENT ON COLUMN aidev_sys_job.concurrent        IS '是否并发执行（0允许 1禁止）';
COMMENT ON COLUMN aidev_sys_job.status            IS '状态（0正常 1暂停）';
COMMENT ON COLUMN aidev_sys_job.create_by         IS '创建者';
COMMENT ON COLUMN aidev_sys_job.create_time       IS '创建时间';
COMMENT ON COLUMN aidev_sys_job.update_by         IS '更新者';
COMMENT ON COLUMN aidev_sys_job.update_time       IS '更新时间';
COMMENT ON COLUMN aidev_sys_job.remark            IS '备注信息';
-- ----------------------------
-- 初始化-定时任务调度表数据
-- ----------------------------
INSERT INTO aidev_sys_job VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',                                          '0/10 * * * * ?', '3', '1', '1', 'admin', now(), '', null, '');
INSERT INTO aidev_sys_job VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(''ry'')',                                    '0/15 * * * * ?', '3', '1', '1', 'admin', now(), '', null, '');
INSERT INTO aidev_sys_job VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', now(), '', null, '');

-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_job_log;
CREATE TABLE aidev_sys_job_log
(
    job_log_id     BIGSERIAL     NOT NULL,
    job_name       VARCHAR(64)   DEFAULT '',
    job_group      VARCHAR(64)   DEFAULT '',
    invoke_target  VARCHAR(500)  DEFAULT '',
    job_message    VARCHAR(500)  DEFAULT '',
    status         CHAR(1)       DEFAULT '0',
    exception_info VARCHAR(2000) DEFAULT '',
    create_time    TIMESTAMP,
    CONSTRAINT pk_aidev_sys_job_log PRIMARY KEY (job_log_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_job_log CACHE 20;
COMMENT ON TABLE  aidev_sys_job_log                IS '定时任务调度日志表';
COMMENT ON COLUMN aidev_sys_job_log.job_log_id     IS '日志主键';
COMMENT ON COLUMN aidev_sys_job_log.job_name       IS '任务名称';
COMMENT ON COLUMN aidev_sys_job_log.job_group      IS '任务组名';
COMMENT ON COLUMN aidev_sys_job_log.invoke_target  IS '调用目标字符串';
COMMENT ON COLUMN aidev_sys_job_log.job_message    IS '日志信息';
COMMENT ON COLUMN aidev_sys_job_log.status         IS '执行状态（0正常 1失败）';
COMMENT ON COLUMN aidev_sys_job_log.exception_info IS '异常信息';
COMMENT ON COLUMN aidev_sys_job_log.create_time    IS '创建时间';

-- ----------------------------
-- 18、通知公告表
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_notice;
CREATE TABLE aidev_sys_notice
(
    notice_id      BIGSERIAL     NOT NULL,
    notice_title   VARCHAR(50)   DEFAULT '',
    notice_type    CHAR(1)       DEFAULT '',
    notice_content VARCHAR(2000) DEFAULT '',
    status         CHAR(1)       DEFAULT '0',
    create_by      VARCHAR(64)   DEFAULT '',
    create_time    TIMESTAMP,
    update_by      VARCHAR(64)   DEFAULT '',
    update_time    TIMESTAMP,
    remark         VARCHAR(255)  DEFAULT '',
    CONSTRAINT pk_aidev_sys_notice PRIMARY KEY (notice_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_sys_notice RESTART WITH 10 CACHE 20;
COMMENT ON TABLE  aidev_sys_notice                IS '通知公告表';
COMMENT ON COLUMN aidev_sys_notice.notice_id      IS '公告主键';
COMMENT ON COLUMN aidev_sys_notice.notice_title   IS '公告标题';
COMMENT ON COLUMN aidev_sys_notice.notice_type    IS '公告类型（1通知 2公告）';
COMMENT ON COLUMN aidev_sys_notice.notice_content IS '公告内容';
COMMENT ON COLUMN aidev_sys_notice.status         IS '公告状态（0正常 1关闭）';
COMMENT ON COLUMN aidev_sys_notice.create_by      IS '创建者';
COMMENT ON COLUMN aidev_sys_notice.create_time    IS '创建时间';
COMMENT ON COLUMN aidev_sys_notice.update_by      IS '更新者';
COMMENT ON COLUMN aidev_sys_notice.update_time    IS '更新时间';
COMMENT ON COLUMN aidev_sys_notice.remark         IS '备注';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
INSERT INTO aidev_sys_notice VALUES ('1', '温馨提醒：2021-07-01 AiDev新版本发布啦', '2', '新版本内容', '0', 'admin', now(), '', null, '管理员');
INSERT INTO aidev_sys_notice VALUES ('2', '维护通知：2021-07-01 AiDev系统凌晨维护', '1', '维护内容', '0', 'admin', now(), '', null, '管理员');

-- ----------------------------
-- 19、代码生成业务表
-- ----------------------------
DROP TABLE IF EXISTS aidev_gen_table;
CREATE TABLE aidev_gen_table
(
    table_id          BIGSERIAL     NOT NULL,
    table_name        VARCHAR(200)  DEFAULT '',
    table_comment     VARCHAR(500)  DEFAULT '',
    sub_table_name    VARCHAR(64)   DEFAULT '',
    sub_table_fk_name VARCHAR(64)   DEFAULT '',
    class_name        VARCHAR(100)  DEFAULT '',
    tpl_category      VARCHAR(200)  DEFAULT 'crud',
    package_name      VARCHAR(100)  DEFAULT '',
    module_name       VARCHAR(30)   DEFAULT '',
    business_name     VARCHAR(30)   DEFAULT '',
    function_name     VARCHAR(50)   DEFAULT '',
    function_author   VARCHAR(50)   DEFAULT '',
    gen_type          CHAR(1)       DEFAULT '0',
    gen_path          VARCHAR(200)  DEFAULT '/',
    options           VARCHAR(1000) DEFAULT '',
    create_by         VARCHAR(64)   DEFAULT '',
    create_time       TIMESTAMP,
    update_by         VARCHAR(64)   DEFAULT '',
    update_time       TIMESTAMP,
    remark            VARCHAR(500)  DEFAULT '',
    CONSTRAINT pk_aidev_gen_table PRIMARY KEY (table_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_gen_table CACHE 20;
COMMENT ON TABLE  aidev_gen_table                   IS '代码生成业务表';
COMMENT ON COLUMN aidev_gen_table.table_id          IS '编号';
COMMENT ON COLUMN aidev_gen_table.table_name        IS '表名称';
COMMENT ON COLUMN aidev_gen_table.table_comment     IS '表描述';
COMMENT ON COLUMN aidev_gen_table.sub_table_name    IS '关联子表的表名';
COMMENT ON COLUMN aidev_gen_table.sub_table_fk_name IS '子表关联的外键名';
COMMENT ON COLUMN aidev_gen_table.class_name        IS '实体类名称';
COMMENT ON COLUMN aidev_gen_table.tpl_category      IS '使用的模板（crud单表操作 tree树表操作 sub主子表操作）';
COMMENT ON COLUMN aidev_gen_table.package_name      IS '生成包路径';
COMMENT ON COLUMN aidev_gen_table.module_name       IS '生成模块名';
COMMENT ON COLUMN aidev_gen_table.business_name     IS '生成业务名';
COMMENT ON COLUMN aidev_gen_table.function_name     IS '生成功能名';
COMMENT ON COLUMN aidev_gen_table.function_author   IS '生成功能作者';
COMMENT ON COLUMN aidev_gen_table.gen_type          IS '生成代码方式（0zip压缩包 1自定义路径）';
COMMENT ON COLUMN aidev_gen_table.gen_path          IS '生成路径（不填默认项目路径）';
COMMENT ON COLUMN aidev_gen_table.options           IS '其它生成选项';
COMMENT ON COLUMN aidev_gen_table.create_by         IS '创建者';
COMMENT ON COLUMN aidev_gen_table.create_time       IS '创建时间';
COMMENT ON COLUMN aidev_gen_table.update_by         IS '更新者';
COMMENT ON COLUMN aidev_gen_table.update_time       IS '更新时间';
COMMENT ON COLUMN aidev_gen_table.remark            IS '备注';

-- ----------------------------
-- 20、代码生成业务表字段
-- ----------------------------
DROP TABLE IF EXISTS aidev_gen_table_column;
CREATE TABLE aidev_gen_table_column
(
    column_id      BIGSERIAL    NOT NULL,
    table_id       VARCHAR(64)  DEFAULT '',
    column_name    VARCHAR(200) DEFAULT '',
    column_comment VARCHAR(500) DEFAULT '',
    column_type    VARCHAR(100) DEFAULT '',
    java_type      VARCHAR(500) DEFAULT '',
    java_field     VARCHAR(200) DEFAULT '',
    is_pk          CHAR(1)      DEFAULT '',
    is_increment   CHAR(1)      DEFAULT '',
    is_required    CHAR(1)      DEFAULT '',
    is_insert      CHAR(1)      DEFAULT '',
    is_edit        CHAR(1)      DEFAULT '',
    is_list        CHAR(1)      DEFAULT '',
    is_query       CHAR(1)      DEFAULT '',
    query_type     VARCHAR(200) DEFAULT 'EQ',
    html_type      VARCHAR(200) DEFAULT '',
    dict_type      VARCHAR(200) DEFAULT '',
    sort           INT4,
    create_by      VARCHAR(64)  DEFAULT '',
    create_time    TIMESTAMP,
    update_by      VARCHAR(64)  DEFAULT '',
    update_time    TIMESTAMP,
    CONSTRAINT pk_aidev_gen_table_column PRIMARY KEY (column_id)
);
ALTER SEQUENCE IF EXISTS seq_aidev_gen_table_column CACHE 20;
COMMENT ON TABLE  aidev_gen_table_column                IS '代码生成业务表字段';
COMMENT ON COLUMN aidev_gen_table_column.column_id      IS '编号';
COMMENT ON COLUMN aidev_gen_table_column.table_id       IS '归属表编号';
COMMENT ON COLUMN aidev_gen_table_column.column_name    IS '列名称';
COMMENT ON COLUMN aidev_gen_table_column.column_comment IS '列描述';
COMMENT ON COLUMN aidev_gen_table_column.column_type    IS '列类型';
COMMENT ON COLUMN aidev_gen_table_column.java_type      IS 'JAVA类型';
COMMENT ON COLUMN aidev_gen_table_column.java_field     IS 'JAVA字段名';
COMMENT ON COLUMN aidev_gen_table_column.is_pk          IS '是否主键（1是）';
COMMENT ON COLUMN aidev_gen_table_column.is_increment   IS '是否自增（1是）';
COMMENT ON COLUMN aidev_gen_table_column.is_required    IS '是否必填（1是）';
COMMENT ON COLUMN aidev_gen_table_column.is_insert      IS '是否为插入字段（1是）';
COMMENT ON COLUMN aidev_gen_table_column.is_edit        IS '是否编辑字段（1是）';
COMMENT ON COLUMN aidev_gen_table_column.is_list        IS '是否列表字段（1是）';
COMMENT ON COLUMN aidev_gen_table_column.is_query       IS '是否查询字段（1是）';
COMMENT ON COLUMN aidev_gen_table_column.query_type     IS '查询方式（等于、不等于、大于、小于、范围）';
COMMENT ON COLUMN aidev_gen_table_column.html_type      IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';
COMMENT ON COLUMN aidev_gen_table_column.dict_type      IS '字典类型';
COMMENT ON COLUMN aidev_gen_table_column.sort           IS '排序';
COMMENT ON COLUMN aidev_gen_table_column.create_by      IS '创建者';
COMMENT ON COLUMN aidev_gen_table_column.create_time    IS '创建时间';
COMMENT ON COLUMN aidev_gen_table_column.update_by      IS '更新者';
COMMENT ON COLUMN aidev_gen_table_column.update_time    IS '更新时间';

-- ----------------------------
-- 21、部门和祖级关联表  部门N-N祖级
-- ----------------------------
DROP TABLE IF EXISTS aidev_sys_dept_ance;
CREATE TABLE aidev_sys_dept_ance
(
    dept_id BIGINT NOT NULL,
    ance_id BIGINT NOT NULL,
    CONSTRAINT pk_aidev_sys_dept_ance PRIMARY KEY (dept_id, ance_id)
);
COMMENT ON TABLE  aidev_sys_dept_ance         IS '部门和祖级关联表';
COMMENT ON COLUMN aidev_sys_dept_ance.dept_id IS '部门ID';
COMMENT ON COLUMN aidev_sys_dept_ance.ance_id IS '祖级ID';
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