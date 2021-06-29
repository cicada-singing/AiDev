-- ----------------------------
-- 1、部门信息表
-- ----------------------------
CREATE TABLE aidev_sys_dept
(
    dept_id     NUMBER (20)   NOT NULL,
    parent_id   NUMBER (20)   DEFAULT 0,
    dept_name   VARCHAR2 (30) DEFAULT '',
    order_num   NUMBER (4)    DEFAULT 0,
    leader      VARCHAR2 (20) DEFAULT '',
    phone       VARCHAR2 (11) DEFAULT '',
    email       VARCHAR2 (50) DEFAULT '',
    status      CHAR(1)       DEFAULT '0',
    del_flag    CHAR(1)       DEFAULT '0',
    create_by   VARCHAR2 (64) DEFAULT '',
    create_time DATE,
    update_by   VARCHAR2 (64) DEFAULT '',
    update_time DATE
);
CREATE SEQUENCE seq_aidev_sys_dept INCREMENT BY 1 START WITH 200 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_dept ADD CONSTRAINT pk_aidev_sys_dept PRIMARY KEY (dept_id);
COMMENT ON TABLE  aidev_sys_dept             IS '部门信息表';
COMMENT ON COLUMN aidev_sys_dept.dept_id     IS '部门主键seq_aidev_sys_dept.nextval';
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
INSERT INTO aidev_sys_dept VALUES (100, 0,   'AiDev科技', 0, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (101, 100, '深圳总公司', 1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (102, 100, '长沙分公司', 2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (103, 101, '研发部门',   1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (104, 101, '市场部门',   2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (105, 101, '测试部门',   3, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (106, 101, '财务部门',   4, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (107, 101, '运维部门',   5, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (108, 102, '市场部门',   1, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);
INSERT INTO aidev_sys_dept VALUES (109, 102, '财务部门',   2, 'AiDev', '15888888888', 'aidev@qq.com', '0', '0', 'admin', sysdate, '', null);

-- ----------------------------
-- 2、用户信息表
-- ----------------------------
CREATE TABLE aidev_sys_user
(
    user_id         NUMBER (20)    NOT NULL,
    dept_id         NUMBER (20),
    login_name      VARCHAR2 (30)  DEFAULT '',
    user_name       VARCHAR2 (30)  DEFAULT '',
    user_type       VARCHAR2 (2)   DEFAULT '00',
    email           VARCHAR2 (50)  DEFAULT '',
    phonenumber     VARCHAR2 (11)  DEFAULT '',
    sex             CHAR(1)        DEFAULT '0',
    avatar          VARCHAR2 (100) DEFAULT '',
    password        VARCHAR2 (50)  DEFAULT '',
    salt            VARCHAR2 (20)  DEFAULT '',
    status          CHAR(1)        DEFAULT '0',
    del_flag        CHAR(1)        DEFAULT '0',
    login_ip        VARCHAR2 (128) DEFAULT '',
    login_date      DATE,
    pwd_update_date DATE,
    create_by       VARCHAR2 (64)  DEFAULT '',
    create_time     DATE,
    update_by       VARCHAR2 (64)  DEFAULT '',
    update_time     DATE,
    remark          VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_user INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_user ADD CONSTRAINT pk_aidev_sys_user PRIMARY KEY (user_id);
COMMENT ON TABLE  aidev_sys_user                 IS '用户信息表';
COMMENT ON COLUMN aidev_sys_user.user_id         IS '用户主键seq_aidev_sys_user.nextval';
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
COMMENT ON COLUMN aidev_sys_user.del_flag        IS '删除标志（0代表 2删除）';
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
INSERT INTO aidev_sys_user VALUES (1, 103, 'admin', 'Admin', '00', 'aidev@qq.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', sysdate, sysdate, 'admin', sysdate, '', null, '管理员');
INSERT INTO aidev_sys_user VALUES (2, 105, 'aidev', 'AiDev', '00', 'aidev@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', sysdate, sysdate, 'aidev', sysdate, '', null, '测试员');

-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
CREATE TABLE aidev_sys_post
(
    post_id     NUMBER (20)    NOT NULL,
    post_code   VARCHAR2 (64)  DEFAULT '',
    post_name   VARCHAR2 (50)  DEFAULT '',
    post_sort   NUMBER (4)     NOT NULL,
    status      CHAR(1)        DEFAULT '',
    create_by   VARCHAR2 (64)  DEFAULT '',
    create_time DATE,
    update_by   VARCHAR2 (64)  DEFAULT '',
    update_time DATE,
    remark      VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_post INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_post ADD CONSTRAINT pk_aidev_sys_post PRIMARY KEY (post_id);
COMMENT ON TABLE  aidev_sys_post             IS '岗位信息表';
COMMENT ON COLUMN aidev_sys_post.post_id     IS '岗位主键seq_aidev_sys_post.nextval';
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
INSERT INTO aidev_sys_post VALUES (1, 'ceo',  '董事长',   1, '0', 'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_post VALUES (2, 'se',   '项目经理',  2, '0', 'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_post VALUES (3, 'hr',   '人力资源',  3, '0', 'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_post VALUES (4, 'user', '普通员工',  4, '0', 'admin', sysdate, '', null, '');

-- ----------------------------
-- 4、角色信息表
-- ----------------------------
CREATE TABLE aidev_sys_role
(
    role_id     NUMBER (20)    NOT NULL,
    role_name   VARCHAR2 (30)  DEFAULT '',
    role_key    VARCHAR2 (100) DEFAULT '',
    role_sort   NUMBER (4)     NOT NULL,
    data_scope  CHAR(1)        DEFAULT '1',
    status      CHAR(1)        DEFAULT '0',
    del_flag    CHAR(1)        DEFAULT '0',
    create_by   VARCHAR2 (64)  DEFAULT '',
    create_time DATE,
    update_by   VARCHAR2 (64)  DEFAULT '',
    update_time DATE,
    remark      VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_role INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_role ADD CONSTRAINT pk_aidev_sys_role PRIMARY KEY (role_id);
COMMENT ON TABLE  aidev_sys_role             IS '角色信息表';
COMMENT ON COLUMN aidev_sys_role.role_id     IS '角色主键seq_aidev_sys_post.nextval';
COMMENT ON COLUMN aidev_sys_role.role_name   IS '角色名称';
COMMENT ON COLUMN aidev_sys_role.role_key    IS '角色权限字符串';
COMMENT ON COLUMN aidev_sys_role.role_sort   IS '显示顺序';
COMMENT ON COLUMN aidev_sys_role.data_scope  IS '数据范围（1全部数据权限 2自定数据权限 3本部门数据权限 4本部门及以下数据权限）';
COMMENT ON COLUMN aidev_sys_role.status      IS '角色状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_role.del_flag    IS '删除标志（0代表 2删除）';
COMMENT ON COLUMN aidev_sys_role.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_role.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_role.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_role.update_time IS '更新时间';
COMMENT ON COLUMN aidev_sys_role.remark      IS '备注';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
INSERT INTO aidev_sys_role VALUES ('1', '超级管理员', 'admin', 1, 1, '0', '0', 'admin', sysdate, '', null, '超级管理员');
INSERT INTO aidev_sys_role VALUES ('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', sysdate, '', null, '普通角色');


-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
CREATE TABLE aidev_sys_menu
(
    menu_id     NUMBER (20)    NOT NULL,
    menu_name   VARCHAR2 (50)  DEFAULT '',
    parent_id   NUMBER (20)    DEFAULT 0,
    order_num   NUMBER (4)     DEFAULT 0,
    url         VARCHAR2 (200) DEFAULT '#',
    target      VARCHAR2 (20)  DEFAULT '',
    menu_type   CHAR(1)        DEFAULT '',
    visible     CHAR(1)        DEFAULT '0',
    is_refresh  CHAR(1)        DEFAULT '1',
    perms       VARCHAR2 (100) DEFAULT '',
    icon        VARCHAR2 (100) DEFAULT '#',
    create_by   VARCHAR2 (64)  DEFAULT '',
    create_time DATE,
    update_by   VARCHAR2 (64)  DEFAULT '',
    update_time DATE,
    remark      VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_menu INCREMENT BY 1 START WITH 2000 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_menu ADD CONSTRAINT pk_aidev_sys_menu PRIMARY KEY (menu_id);
COMMENT ON TABLE  aidev_sys_menu             IS '菜单权限表';
COMMENT ON COLUMN aidev_sys_menu.menu_id     IS '菜单主键seq_aidev_sys_post.nextval';
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
INSERT INTO aidev_sys_menu VALUES ('1',    '系统管理', '0',   '1', '#',                   '', 'M', '0', '1', '',                        'fa fa-gear',            'admin', sysdate, '', null, '系统管理目录');
INSERT INTO aidev_sys_menu VALUES ('2',    '系统监控', '0',   '2', '#',                   '', 'M', '0', '1', '',                        'fa fa-video-camera',    'admin', sysdate, '', null, '系统监控目录');
INSERT INTO aidev_sys_menu VALUES ('3',    '系统工具', '0',   '3', '#',                   '', 'M', '0', '1', '',                        'fa fa-bars',            'admin', sysdate, '', null, '系统工具目录');
-- 二级菜单
INSERT INTO aidev_sys_menu VALUES ('100',  '用户管理', '1',   '1', '/system/user',        '', 'C', '0', '1', 'system:user:view',        'fa fa-user-o',          'admin', sysdate, '', null, '用户管理菜单');
INSERT INTO aidev_sys_menu VALUES ('101',  '角色管理', '1',   '2', '/system/role',        '', 'C', '0', '1', 'system:role:view',        'fa fa-user-secret',     'admin', sysdate, '', null, '角色管理菜单');
INSERT INTO aidev_sys_menu VALUES ('102',  '菜单管理', '1',   '3', '/system/menu',        '', 'C', '0', '1', 'system:menu:view',        'fa fa-th-list',         'admin', sysdate, '', null, '菜单管理菜单');
INSERT INTO aidev_sys_menu VALUES ('103',  '部门管理', '1',   '4', '/system/dept',        '', 'C', '0', '1', 'system:dept:view',        'fa fa-outdent',         'admin', sysdate, '', null, '部门管理菜单');
INSERT INTO aidev_sys_menu VALUES ('104',  '岗位管理', '1',   '5', '/system/post',        '', 'C', '0', '1', 'system:post:view',        'fa fa-address-card-o',  'admin', sysdate, '', null, '岗位管理菜单');
INSERT INTO aidev_sys_menu VALUES ('105',  '字典管理', '1',   '6', '/system/dict',        '', 'C', '0', '1', 'system:dict:view',        'fa fa-bookmark-o',      'admin', sysdate, '', null, '字典管理菜单');
INSERT INTO aidev_sys_menu VALUES ('106',  '参数设置', '1',   '7', '/system/config',      '', 'C', '0', '1', 'system:config:view',      'fa fa-sun-o',           'admin', sysdate, '', null, '参数设置菜单');
INSERT INTO aidev_sys_menu VALUES ('107',  '通知公告', '1',   '8', '/system/notice',      '', 'C', '0', '1', 'system:notice:view',      'fa fa-bullhorn',        'admin', sysdate, '', null, '通知公告菜单');
INSERT INTO aidev_sys_menu VALUES ('108',  '日志管理', '1',   '9', '#',                   '', 'M', '0', '1', '',                        'fa fa-pencil-square-o', 'admin', sysdate, '', null, '日志管理菜单');
INSERT INTO aidev_sys_menu VALUES ('109',  '在线用户', '2',   '1', '/monitor/online',     '', 'C', '0', '1', 'monitor:online:view',     'fa fa-user-circle',     'admin', sysdate, '', null, '在线用户菜单');
INSERT INTO aidev_sys_menu VALUES ('110',  '定时任务', '2',   '2', '/monitor/job',        '', 'C', '0', '1', 'monitor:job:view',        'fa fa-tasks',           'admin', sysdate, '', null, '定时任务菜单');
INSERT INTO aidev_sys_menu VALUES ('111',  '数据监控', '2',   '3', '/monitor/data',       '', 'C', '0', '1', 'monitor:data:view',       'fa fa-bug',             'admin', sysdate, '', null, '数据监控菜单');
INSERT INTO aidev_sys_menu VALUES ('112',  '服务监控', '2',   '4', '/monitor/server',     '', 'C', '0', '1', 'monitor:server:view',     'fa fa-server',          'admin', sysdate, '', null, '服务监控菜单');
INSERT INTO aidev_sys_menu VALUES ('113',  '缓存监控', '2',   '5', '/monitor/cache',      '', 'C', '0', '1', 'monitor:cache:view',      'fa fa-cube',            'admin', sysdate, '', null, '缓存监控菜单');
INSERT INTO aidev_sys_menu VALUES ('114',  '表单构建', '3',   '1', '/tool/build',         '', 'C', '0', '1', 'tool:build:view',         'fa fa-wpforms',         'admin', sysdate, '', null, '表单构建菜单');
INSERT INTO aidev_sys_menu VALUES ('115',  '代码生成', '3',   '2', '/tool/gen',           '', 'C', '0', '1', 'tool:gen:view',           'fa fa-code',            'admin', sysdate, '', null, '代码生成菜单');
INSERT INTO aidev_sys_menu VALUES ('116',  '系统接口', '3',   '3', '/tool/swagger',       '', 'C', '0', '1', 'tool:swagger:view',       'fa fa-gg',              'admin', sysdate, '', null, '系统接口菜单');
-- 三级菜单
INSERT INTO aidev_sys_menu VALUES ('500',  '操作日志', '108', '1', '/monitor/operlog',    '', 'C', '0', '1', 'monitor:operlog:view',    'fa fa-address-book',    'admin', sysdate, '', null, '操作日志菜单');
INSERT INTO aidev_sys_menu VALUES ('501',  '登录日志', '108', '2', '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o',    'admin', sysdate, '', null, '登录日志菜单');
-- 用户管理按钮
INSERT INTO aidev_sys_menu VALUES ('1000', '用户查询', '100', '1', '#',                   '', 'F', '0', '1', 'system:user:list',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1001', '用户新增', '100', '2', '#',                   '', 'F', '0', '1', 'system:user:add',         '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1002', '用户修改', '100', '3', '#',                   '', 'F', '0', '1', 'system:user:edit',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1003', '用户删除', '100', '4', '#',                   '', 'F', '0', '1', 'system:user:remove',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1004', '用户导出', '100', '5', '#',                   '', 'F', '0', '1', 'system:user:export',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1005', '用户导入', '100', '6', '#',                   '', 'F', '0', '1', 'system:user:import',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1006', '重置密码', '100', '7', '#',                   '', 'F', '0', '1', 'system:user:resetPwd',    '#',                     'admin', sysdate, '', null, '');
-- 角色管理按钮
INSERT INTO aidev_sys_menu VALUES ('1007', '角色查询', '101', '1', '#',                   '', 'F', '0', '1', 'system:role:list',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1008', '角色新增', '101', '2', '#',                   '', 'F', '0', '1', 'system:role:add',         '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1009', '角色修改', '101', '3', '#',                   '', 'F', '0', '1', 'system:role:edit',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1010', '角色删除', '101', '4', '#',                   '', 'F', '0', '1', 'system:role:remove',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1011', '角色导出', '101', '5', '#',                   '', 'F', '0', '1', 'system:role:export',      '#',                     'admin', sysdate, '', null, '');
-- 菜单管理按钮
INSERT INTO aidev_sys_menu VALUES ('1012', '菜单查询', '102', '1', '#',                   '', 'F', '0', '1', 'system:menu:list',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1013', '菜单新增', '102', '2', '#',                   '', 'F', '0', '1', 'system:menu:add',         '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1014', '菜单修改', '102', '3', '#',                   '', 'F', '0', '1', 'system:menu:edit',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1015', '菜单删除', '102', '4', '#',                   '', 'F', '0', '1', 'system:menu:remove',      '#',                     'admin', sysdate, '', null, '');
-- 部门管理按钮
INSERT INTO aidev_sys_menu VALUES ('1016', '部门查询', '103', '1', '#',                   '', 'F', '0', '1', 'system:dept:list',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1017', '部门新增', '103', '2', '#',                   '', 'F', '0', '1', 'system:dept:add',         '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1018', '部门修改', '103', '3', '#',                   '', 'F', '0', '1', 'system:dept:edit',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1019', '部门删除', '103', '4', '#',                   '', 'F', '0', '1', 'system:dept:remove',      '#',                     'admin', sysdate, '', null, '');
-- 岗位管理按钮
INSERT INTO aidev_sys_menu VALUES ('1020', '岗位查询', '104', '1', '#',                   '', 'F', '0', '1', 'system:post:list',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1021', '岗位新增', '104', '2', '#',                   '', 'F', '0', '1', 'system:post:add',         '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1022', '岗位修改', '104', '3', '#',                   '', 'F', '0', '1', 'system:post:edit',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1023', '岗位删除', '104', '4', '#',                   '', 'F', '0', '1', 'system:post:remove',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1024', '岗位导出', '104', '5', '#',                   '', 'F', '0', '1', 'system:post:export',      '#',                     'admin', sysdate, '', null, '');
-- 字典管理按钮
INSERT INTO aidev_sys_menu VALUES ('1025', '字典查询', '105', '1', '#',                   '', 'F', '0', '1', 'system:dict:list',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1026', '字典新增', '105', '2', '#',                   '', 'F', '0', '1', 'system:dict:add',         '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1027', '字典修改', '105', '3', '#',                   '', 'F', '0', '1', 'system:dict:edit',        '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1028', '字典删除', '105', '4', '#',                   '', 'F', '0', '1', 'system:dict:remove',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1029', '字典导出', '105', '5', '#',                   '', 'F', '0', '1', 'system:dict:export',      '#',                     'admin', sysdate, '', null, '');
-- 参数设置按钮
INSERT INTO aidev_sys_menu VALUES ('1030', '参数查询', '106', '1', '#',                   '', 'F', '0', '1', 'system:config:list',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1031', '参数新增', '106', '2', '#',                   '', 'F', '0', '1', 'system:config:add',       '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1032', '参数修改', '106', '3', '#',                   '', 'F', '0', '1', 'system:config:edit',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1033', '参数删除', '106', '4', '#',                   '', 'F', '0', '1', 'system:config:remove',    '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1034', '参数导出', '106', '5', '#',                   '', 'F', '0', '1', 'system:config:export',    '#',                     'admin', sysdate, '', null, '');
-- 通知公告按钮
INSERT INTO aidev_sys_menu VALUES ('1035', '公告查询', '107', '1', '#',                   '', 'F', '0', '1', 'system:notice:list',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1036', '公告新增', '107', '2', '#',                   '', 'F', '0', '1', 'system:notice:add',       '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1037', '公告修改', '107', '3', '#',                   '', 'F', '0', '1', 'system:notice:edit',      '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1038', '公告删除', '107', '4', '#',                   '', 'F', '0', '1', 'system:notice:remove',    '#',                     'admin', sysdate, '', null, '');
-- 操作日志按钮
INSERT INTO aidev_sys_menu VALUES ('1039', '操作查询', '500', '1', '#',                   '', 'F', '0', '1', 'monitor:operlog:list',    '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1040', '操作删除', '500', '2', '#',                   '', 'F', '0', '1', 'monitor:operlog:remove',  '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1041', '详细信息', '500', '3', '#',                   '', 'F', '0', '1', 'monitor:operlog:detail',  '#',                     'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1042', '日志导出', '500', '4', '#',                   '', 'F', '0', '1', 'monitor:operlog:export',  '#',                     'admin', sysdate, '', null, '');
-- 登录日志按钮
INSERT INTO aidev_sys_menu VALUES ('1043', '登录查询', '501', '1', '#',                   '', 'F', '0', '1', 'monitor:logininfor:list',         '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1044', '登录删除', '501', '2', '#',                   '', 'F', '0', '1', 'monitor:logininfor:remove',       '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1045', '日志导出', '501', '3', '#',                   '', 'F', '0', '1', 'monitor:logininfor:export',       '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1046', '账户解锁', '501', '4', '#',                   '', 'F', '0', '1', 'monitor:logininfor:unlock',       '#',             'admin', sysdate, '', null, '');
-- 在线用户按钮
INSERT INTO aidev_sys_menu VALUES ('1047', '在线查询', '109', '1', '#',                   '', 'F', '0', '1', 'monitor:online:list',             '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1048', '批量强退', '109', '2', '#',                   '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1049', '单条强退', '109', '3', '#',                   '', 'F', '0', '1', 'monitor:online:forceLogout',      '#',             'admin', sysdate, '', null, '');
-- 定时任务按钮
INSERT INTO aidev_sys_menu VALUES ('1050', '任务查询', '110', '1', '#',                   '', 'F', '0', '1', 'monitor:job:list',                '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1051', '任务新增', '110', '2', '#',                   '', 'F', '0', '1', 'monitor:job:add',                 '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1052', '任务修改', '110', '3', '#',                   '', 'F', '0', '1', 'monitor:job:edit',                '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1053', '任务删除', '110', '4', '#',                   '', 'F', '0', '1', 'monitor:job:remove',              '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1054', '状态修改', '110', '5', '#',                   '', 'F', '0', '1', 'monitor:job:changeStatus',        '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1055', '任务详细', '110', '6', '#',                   '', 'F', '0', '1', 'monitor:job:detail',              '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1056', '任务导出', '110', '7', '#',                   '', 'F', '0', '1', 'monitor:job:export',              '#',             'admin', sysdate, '', null, '');
-- 代码生成按钮
INSERT INTO aidev_sys_menu VALUES ('1057', '生成查询', '115', '1', '#',                   '', 'F', '0', '1', 'tool:gen:list',                   '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1058', '生成修改', '115', '2', '#',                   '', 'F', '0', '1', 'tool:gen:edit',                   '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1059', '生成删除', '115', '3', '#',                   '', 'F', '0', '1', 'tool:gen:remove',                 '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1060', '预览代码', '115', '4', '#',                   '', 'F', '0', '1', 'tool:gen:preview',                '#',             'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_menu VALUES ('1061', '生成代码', '115', '5', '#',                   '', 'F', '0', '1', 'tool:gen:code',                   '#',             'admin', sysdate, '', null, '');

-- ----------------------------
-- 6、用户和角色关联表  用户1-N角色
-- ----------------------------
CREATE TABLE aidev_sys_user_role
(
    user_id NUMBER (20) NOT NULL,
    role_id NUMBER (20) NOT NULL
);
ALTER TABLE aidev_sys_user_role ADD CONSTRAINT pk_aidev_sys_role_user PRIMARY KEY (user_id, role_id);
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
CREATE TABLE aidev_sys_role_menu
(
    role_id NUMBER (20) NOT NULL,
    menu_id NUMBER (20) NOT NULL
);
ALTER TABLE aidev_sys_role_menu ADD CONSTRAINT pk_aidev_sys_role_menu PRIMARY KEY (role_id, menu_id);
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
CREATE TABLE aidev_sys_role_dept
(
    role_id NUMBER (20) NOT NULL,
    dept_id NUMBER (20) NOT NULL
);
ALTER TABLE aidev_sys_role_dept ADD CONSTRAINT pk_aidev_sys_role_dept PRIMARY KEY (role_id, dept_id);
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
CREATE TABLE aidev_sys_user_post
(
    user_id NUMBER (20) NOT NULL,
    post_id NUMBER (20) NOT NULL
);
ALTER TABLE aidev_sys_user_post ADD CONSTRAINT pk_aidev_sys_user_post PRIMARY KEY (user_id, post_id);
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
CREATE TABLE aidev_sys_oper_log
(
    oper_id        NUMBER (20)     NOT NULL,
    title          VARCHAR2 (50)   DEFAULT '',
    business_type  NUMBER (2)      DEFAULT 0,
    method         VARCHAR2 (100)  DEFAULT '',
    request_method VARCHAR2 (10)   DEFAULT '',
    operator_type  NUMBER (1)      DEFAULT 0,
    oper_name      VARCHAR2 (50)   DEFAULT '',
    dept_name      VARCHAR2 (50)   DEFAULT '',
    oper_url       VARCHAR2 (255)  DEFAULT '',
    oper_ip        VARCHAR2 (128)  DEFAULT '',
    oper_location  VARCHAR2 (255)  DEFAULT '',
    oper_param     VARCHAR2 (2000) DEFAULT '',
    json_result    VARCHAR2 (2000) DEFAULT '',
    status         NUMBER (1)      DEFAULT 0,
    error_msg      VARCHAR2 (2000) DEFAULT '',
    oper_time      DATE
);
CREATE SEQUENCE seq_aidev_sys_oper_log INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_oper_log ADD CONSTRAINT pk_aidev_sys_oper_log PRIMARY KEY (oper_id);
COMMENT ON TABLE  aidev_sys_oper_log                IS '操作日志记录表';
COMMENT ON COLUMN aidev_sys_oper_log.oper_id        IS '日志主键seq_aidev_sys_oper_log.nextval';
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
CREATE TABLE aidev_sys_dict_type
(
    dict_id     NUMBER (20)    NOT NULL,
    dict_name   VARCHAR2 (100) DEFAULT '',
    dict_type   VARCHAR2 (100) DEFAULT '',
    status      CHAR(1)        DEFAULT '0',
    create_by   VARCHAR2 (64)  DEFAULT '',
    create_time DATE,
    update_by   VARCHAR2 (64)  DEFAULT '',
    update_time DATE,
    remark      VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_dict_type INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_dict_type ADD CONSTRAINT pk_aidev_sys_dict_type PRIMARY KEY (dict_id);
CREATE UNIQUE INDEX uidx_aidev_sys_dict_type ON aidev_sys_dict_type (dict_type);
COMMENT ON TABLE  aidev_sys_dict_type             IS '字典类型表';
COMMENT ON COLUMN aidev_sys_dict_type.dict_id     IS '字典主键seq_aidev_sys_dict_type.nextval';
COMMENT ON COLUMN aidev_sys_dict_type.dict_name   IS '字典名称';
COMMENT ON COLUMN aidev_sys_dict_type.dict_type   IS '字典类型';
COMMENT ON COLUMN aidev_sys_dict_type.status      IS '状态（0正常 1停用）';
COMMENT ON COLUMN aidev_sys_dict_type.create_by   IS '创建者';
COMMENT ON COLUMN aidev_sys_dict_type.create_time IS '创建时间';
COMMENT ON COLUMN aidev_sys_dict_type.update_by   IS '更新者';
COMMENT ON COLUMN aidev_sys_dict_type.update_time IS '更新时间';
COMMENT ON COLUMN aidev_sys_dict_type.remark      IS '备注';
-- ----------------------------
-- 初始化-字典类型表数据
-- ----------------------------
INSERT INTO aidev_sys_dict_type VALUES (1, '用户性别', 'sys_user_sex',        '0', 'admin', sysdate, '', null, '用户性别列表');
INSERT INTO aidev_sys_dict_type VALUES (2, '菜单状态', 'sys_show_hide',       '0', 'admin', sysdate, '', null, '菜单状态列表');
INSERT INTO aidev_sys_dict_type VALUES (3, '系统开关', 'sys_normal_disable',  '0', 'admin', sysdate, '', null, '系统开关列表');
INSERT INTO aidev_sys_dict_type VALUES (4, '任务状态', 'sys_job_status',      '0', 'admin', sysdate, '', null, '任务状态列表');
INSERT INTO aidev_sys_dict_type VALUES (5, '任务分组', 'sys_job_group',       '0', 'admin', sysdate, '', null, '任务分组列表');
INSERT INTO aidev_sys_dict_type VALUES (6, '系统是否', 'sys_yes_no',          '0', 'admin', sysdate, '', null, '系统是否列表');
INSERT INTO aidev_sys_dict_type VALUES (7, '通知类型', 'sys_notice_type',     '0', 'admin', sysdate, '', null, '通知类型列表');
INSERT INTO aidev_sys_dict_type VALUES (8, '通知状态', 'sys_notice_status',   '0', 'admin', sysdate, '', null, '通知状态列表');
INSERT INTO aidev_sys_dict_type VALUES (9, '操作类型', 'sys_oper_type',       '0', 'admin', sysdate, '', null, '操作类型列表');
INSERT INTO aidev_sys_dict_type VALUES (10, '系统状态', 'sys_common_status',  '0', 'admin', sysdate, '', null, '登录状态列表');

-- ----------------------------
-- 12、字典数据表
-- ----------------------------
CREATE TABLE aidev_sys_dict_data
(
    dict_code   NUMBER (20)    NOT NULL,
    dict_sort   NUMBER (4)     DEFAULT 0,
    dict_label  VARCHAR2 (100) DEFAULT '',
    dict_value  VARCHAR2 (100) DEFAULT '',
    dict_type   VARCHAR2 (100) DEFAULT '',
    css_class   VARCHAR2 (100) DEFAULT '',
    list_class  VARCHAR2 (100) DEFAULT '',
    is_default  CHAR(1)        DEFAULT 'N',
    status      CHAR(1)        DEFAULT '0',
    create_by   VARCHAR2 (64)  DEFAULT '',
    create_time DATE,
    update_by   VARCHAR2 (64)  DEFAULT '',
    update_time DATE,
    remark      VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_dict_data INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_dict_data ADD CONSTRAINT pk_aidev_sys_dict_data PRIMARY KEY (dict_code);
COMMENT ON TABLE  aidev_sys_dict_data             IS '字典数据表';
COMMENT ON COLUMN aidev_sys_dict_data.dict_code   IS '字典主键seq_aidev_sys_dict_data.nextval';
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
INSERT INTO aidev_sys_dict_data VALUES (1,  1,  '男',     '0',       'sys_user_sex',       '',  '',        'Y', '0', 'admin', sysdate, '', null, '性别男');
INSERT INTO aidev_sys_dict_data VALUES (2,  2,  '女',     '1',       'sys_user_sex',       '',  '',        'N', '0', 'admin', sysdate, '', null, '性别女');
INSERT INTO aidev_sys_dict_data VALUES (3,  3,  '未知',    '2',       'sys_user_sex',       '',  '',        'N', '0', 'admin', sysdate, '', null, '性别未知');
INSERT INTO aidev_sys_dict_data VALUES (4,  1,  '显示',    '0',       'sys_show_hide',      '',  'primary', 'Y', '0', 'admin', sysdate, '', null, '显示菜单');
INSERT INTO aidev_sys_dict_data VALUES (5,  2,  '隐藏',    '1',       'sys_show_hide',      '',  'danger',  'N', '0', 'admin', sysdate, '', null, '隐藏菜单');
INSERT INTO aidev_sys_dict_data VALUES (6,  1,  '正常',    '0',       'sys_normal_disable', '',  'primary', 'Y', '0', 'admin', sysdate, '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (7,  2,  '停用',    '1',       'sys_normal_disable', '',  'danger',  'N', '0', 'admin', sysdate, '', null, '停用状态');
INSERT INTO aidev_sys_dict_data VALUES (8,  1,  '正常',    '0',       'sys_job_status',     '',  'primary', 'Y', '0', 'admin', sysdate, '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (9,  2,  '暂停',    '1',       'sys_job_status',     '',  'danger',  'N', '0', 'admin', sysdate, '', null, '停用状态');
INSERT INTO aidev_sys_dict_data VALUES (10, 1,  '默认',    'DEFAULT', 'sys_job_group',      '',  '',        'Y', '0', 'admin', sysdate, '', null, '默认分组');
INSERT INTO aidev_sys_dict_data VALUES (11, 2,  '系统',    'SYSTEM',  'sys_job_group',      '',  '',        'N', '0', 'admin', sysdate, '', null, '系统分组');
INSERT INTO aidev_sys_dict_data VALUES (12, 1,  '是',      'Y',       'sys_yes_no',         '',  'primary', 'Y', '0', 'admin', sysdate, '', null, '系统默认是');
INSERT INTO aidev_sys_dict_data VALUES (13, 2,  '否',      'N',       'sys_yes_no',         '',  'danger',  'N', '0', 'admin', sysdate, '', null, '系统默认否');
INSERT INTO aidev_sys_dict_data VALUES (14, 1,  '通知',    '1',       'sys_notice_type',    '',  'warning', 'Y', '0', 'admin', sysdate, '', null, '通知');
INSERT INTO aidev_sys_dict_data VALUES (15, 2,  '公告',    '2',       'sys_notice_type',    '',  'success', 'N', '0', 'admin', sysdate, '', null, '公告');
INSERT INTO aidev_sys_dict_data VALUES (16, 1,  '正常',    '0',       'sys_notice_status',  '',  'primary', 'Y', '0', 'admin', sysdate, '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (17, 2,  '关闭',    '1',       'sys_notice_status',  '',  'danger',  'N', '0', 'admin', sysdate, '', null, '关闭状态');
INSERT INTO aidev_sys_dict_data VALUES (18, 99, '其他',    '0',       'sys_oper_type',      '',  'info',    'N', '0', 'admin', sysdate, '', null, '其他操作');
INSERT INTO aidev_sys_dict_data VALUES (19, 1,  '新增',    '1',       'sys_oper_type',      '',  'info',    'N', '0', 'admin', sysdate, '', null, '新增操作');
INSERT INTO aidev_sys_dict_data VALUES (20, 2,  '修改',    '2',       'sys_oper_type',      '',  'info',    'N', '0', 'admin', sysdate, '', null, '修改操作');
INSERT INTO aidev_sys_dict_data VALUES (21, 3,  '删除',    '3',       'sys_oper_type',      '',  'danger',  'N', '0', 'admin', sysdate, '', null, '删除操作');
INSERT INTO aidev_sys_dict_data VALUES (22, 4,  '授权',    '4',       'sys_oper_type',      '',  'primary', 'N', '0', 'admin', sysdate, '', null, '授权操作');
INSERT INTO aidev_sys_dict_data VALUES (23, 5,  '导出',    '5',       'sys_oper_type',      '',  'warning', 'N', '0', 'admin', sysdate, '', null, '导出操作');
INSERT INTO aidev_sys_dict_data VALUES (24, 6,  '导入',    '6',       'sys_oper_type',      '',  'warning', 'N', '0', 'admin', sysdate, '', null, '导入操作');
INSERT INTO aidev_sys_dict_data VALUES (25, 7,  '强退',    '7',       'sys_oper_type',      '',  'danger',  'N', '0', 'admin', sysdate, '', null, '强退操作');
INSERT INTO aidev_sys_dict_data VALUES (26, 8,  '生成代码', '8',       'sys_oper_type',      '',  'warning', 'N', '0', 'admin', sysdate, '', null, '生成操作');
INSERT INTO aidev_sys_dict_data VALUES (27, 9,  '清空数据', '9',       'sys_oper_type',      '',  'danger',  'N', '0', 'admin', sysdate, '', null, '清空操作');
INSERT INTO aidev_sys_dict_data VALUES (28, 1,  '成功',    '0',       'sys_common_status',  '',  'primary', 'N', '0', 'admin', sysdate, '', null, '正常状态');
INSERT INTO aidev_sys_dict_data VALUES (29, 2,  '失败',    '1',       'sys_common_status',  '',  'danger',  'N', '0', 'admin', sysdate, '', null, '停用状态');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------
CREATE TABLE aidev_sys_config
(
    config_id    NUMBER (20)    NOT NULL,
    config_name  VARCHAR2 (100) DEFAULT '',
    config_key   VARCHAR2 (100) DEFAULT '',
    config_value VARCHAR2 (100) DEFAULT '',
    config_type  CHAR(1)        DEFAULT 'N',
    create_by    VARCHAR2 (64)  DEFAULT '',
    create_time  DATE,
    update_by    VARCHAR2 (64)  DEFAULT '',
    update_time  DATE,
    remark       VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_config INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_config ADD CONSTRAINT pk_aidev_sys_config PRIMARY KEY (config_id);
COMMENT ON TABLE  aidev_sys_config              IS '参数配置表';
COMMENT ON COLUMN aidev_sys_config.config_id    IS '参数主键seq_aidev_sys_config.nextval';
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
INSERT INTO aidev_sys_config VALUES (1, '主框架页-默认皮肤样式名称',    'sys.index.skinName',               'skin-blue',  'Y', 'admin', sysdate, '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO aidev_sys_config VALUES (2, '用户管理-账号初始密码',       'sys.user.initPassword',            '123456',     'Y', 'admin', sysdate, '', null, '初始化密码 123456');
INSERT INTO aidev_sys_config VALUES (3, '主框架页-侧边栏主题',         'sys.index.sideTheme',              'theme-dark', 'Y', 'admin', sysdate, '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO aidev_sys_config VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser',         'false',      'Y', 'admin', sysdate, '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO aidev_sys_config VALUES (5, '用户管理-密码字符范围',        'sys.account.chrtype',              '0',          'Y', 'admin', sysdate, '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO aidev_sys_config VALUES (6, '用户管理-初始密码修改策略',     'sys.account.initPasswordModify',   '0',          'Y', 'admin', sysdate, '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO aidev_sys_config VALUES (7, '用户管理-账号密码更新周期',     'sys.account.passwordValidateDays', '0',          'Y', 'admin', sysdate, '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO aidev_sys_config VALUES (8, '主框架页-菜单导航显示风格',     'sys.index.menuStyle',              'DEFAULT',    'Y', 'admin', sysdate, '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO aidev_sys_config VALUES (9, '主框架页-是否开启页脚',        'sys.index.ignoreFooter',           'true',       'Y', 'admin', sysdate, '', null, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- 14、系统访问记录表
-- ----------------------------
CREATE TABLE aidev_sys_logininfor
(
    info_id        NUMBER (20)    NOT NULL,
    login_name     VARCHAR2 (50)  DEFAULT '',
    ipaddr         VARCHAR2 (128) DEFAULT '',
    login_location VARCHAR2 (255) DEFAULT '',
    browser        VARCHAR2 (50)  DEFAULT '',
    os             VARCHAR2 (50)  DEFAULT '',
    status         CHAR(1)        DEFAULT '0',
    msg            VARCHAR2 (255) DEFAULT '',
    login_time     DATE
);
CREATE SEQUENCE seq_aidev_sys_logininfor INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_logininfor ADD CONSTRAINT pk_aidev_sys_logininfor PRIMARY KEY (info_id);
COMMENT ON TABLE  aidev_sys_logininfor                IS '系统访问记录表';
COMMENT ON COLUMN aidev_sys_logininfor.info_id        IS '访问主键seq_seq_aidev_sys_logininfor.nextval';
COMMENT ON COLUMN aidev_sys_logininfor.login_name     IS '登录账号';
COMMENT ON COLUMN aidev_sys_logininfor.ipaddr         IS '登录IP地址';
COMMENT ON COLUMN aidev_sys_logininfor.login_location IS '登录地点';
COMMENT ON COLUMN aidev_sys_logininfor.browser        IS '浏览器类型';
COMMENT ON COLUMN aidev_sys_logininfor.os             IS '操作系统';
COMMENT ON COLUMN aidev_sys_logininfor.status         IS '登录状态（0成功 1失败）';
COMMENT ON COLUMN aidev_sys_logininfor.msg            IS '提示消息';
COMMENT ON COLUMN aidev_sys_logininfor.login_time     IS '访问时间';

-- ----------------------------
-- 15、在线用户记录表
-- ----------------------------
CREATE TABLE aidev_sys_user_online
(
    session_id       VARCHAR2 (50)  DEFAULT '',
    login_name       VARCHAR2 (50)  DEFAULT '',
    dept_name        VARCHAR2 (50)  DEFAULT '',
    ipaddr           VARCHAR2 (128) DEFAULT '',
    login_location   VARCHAR2 (255) DEFAULT '',
    browser          VARCHAR2 (50)  DEFAULT '',
    os               VARCHAR2 (50)  DEFAULT '',
    status           VARCHAR2 (10)  DEFAULT '',
    start_timestamp  DATE,
    last_access_time DATE,
    expire_time      NUMBER (10)    DEFAULT 0
);
ALTER TABLE aidev_sys_user_online ADD CONSTRAINT pk_aidev_sys_user_online PRIMARY KEY (session_id);
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
CREATE TABLE aidev_sys_job
(
    job_id          NUMBER (20)    NOT NULL,
    job_name        VARCHAR2 (64)  DEFAULT '',
    job_group       VARCHAR2 (64)  DEFAULT 'DEFAULT',
    invoke_target   VARCHAR2 (500) NOT NULL,
    cron_expression VARCHAR2 (255) DEFAULT '',
    misfire_policy  VARCHAR2 (20)  DEFAULT '3',
    concurrent      CHAR(1)        DEFAULT '1',
    status          CHAR(1)        DEFAULT '0',
    create_by       VARCHAR2 (64)  DEFAULT '',
    create_time     DATE,
    update_by       VARCHAR2 (64)  DEFAULT '',
    update_time     DATE,
    remark          VARCHAR2 (500) DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_job INCREMENT BY 1 START WITH 100 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_job ADD CONSTRAINT pk_aidev_sys_job PRIMARY KEY (job_id, job_name, job_group);
COMMENT ON TABLE  aidev_sys_job                 IS '定时任务调度表';
COMMENT ON COLUMN aidev_sys_job.job_id          IS '任务主键seq_aidev_sys_job.nextval';
COMMENT ON COLUMN aidev_sys_job.job_name        IS '任务名称';
COMMENT ON COLUMN aidev_sys_job.job_group       IS '任务组名';
COMMENT ON COLUMN aidev_sys_job.invoke_target   IS '调用目标字符串';
COMMENT ON COLUMN aidev_sys_job.cron_expression IS 'cron执行表达式';
COMMENT ON COLUMN aidev_sys_job.misfire_policy  IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
COMMENT ON COLUMN aidev_sys_job.concurrent      IS '是否并发执行（0允许 1禁止）';
COMMENT ON COLUMN aidev_sys_job.status          IS '状态（0正常 1暂停）';
COMMENT ON COLUMN aidev_sys_job.create_by       IS '创建者';
COMMENT ON COLUMN aidev_sys_job.create_time     IS '创建时间';
COMMENT ON COLUMN aidev_sys_job.update_by       IS '更新者';
COMMENT ON COLUMN aidev_sys_job.update_time     IS '更新时间';
COMMENT ON COLUMN aidev_sys_job.remark          IS '备注信息';
-- ----------------------------
-- 初始化-定时任务调度表数据
-- ----------------------------
INSERT INTO aidev_sys_job VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',                                           '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_job VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(''ry'')',                                     '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate, '', null, '');
INSERT INTO aidev_sys_job VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate, '', null, '');

-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------
CREATE TABLE aidev_sys_job_log
(
    job_log_id     NUMBER (20)     NOT NULL,
    job_name       VARCHAR2 (64)   DEFAULT '',
    job_group      VARCHAR2 (64)   DEFAULT '',
    invoke_target  VARCHAR2 (500)  DEFAULT '',
    job_message    VARCHAR2 (500)  DEFAULT '',
    status         CHAR(1)         DEFAULT '0',
    exception_info VARCHAR2 (2000) DEFAULT '',
    create_time    DATE
);
CREATE SEQUENCE seq_aidev_sys_job_log INCREMENT BY 1 START WITH 1 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_job_log ADD CONSTRAINT pk_aidev_sys_job_log PRIMARY KEY (job_log_id);
COMMENT ON TABLE  aidev_sys_job_log                IS '定时任务调度日志表';
COMMENT ON COLUMN aidev_sys_job_log.job_log_id     IS '日志主键seq_aidev_sys_job_log.nextval';
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
CREATE TABLE aidev_sys_notice
(
    notice_id      NUMBER (20)     NOT NULL,
    notice_title   VARCHAR2 (50)   DEFAULT '',
    notice_type    CHAR(1)         DEFAULT '',
    notice_content VARCHAR2 (2000) DEFAULT '',
    status         CHAR(1)         DEFAULT '0',
    create_by      VARCHAR2 (64)   DEFAULT '',
    create_time    DATE,
    update_by      VARCHAR2 (64)   DEFAULT '',
    update_time    DATE,
    remark         VARCHAR2 (255)  DEFAULT ''
);
CREATE SEQUENCE seq_aidev_sys_notice INCREMENT BY 1 START WITH 10 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_sys_notice ADD CONSTRAINT pk_aidev_sys_notice PRIMARY KEY (notice_id);
COMMENT ON TABLE  aidev_sys_notice                IS '通知公告表';
COMMENT ON COLUMN aidev_sys_notice.notice_id      IS '公告主键seq_aidev_sys_notice.nextval';
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
INSERT INTO aidev_sys_notice VALUES ('1', '温馨提醒：2021-07-01 AiDev新版本发布啦', '2', '新版本内容', '0', 'admin', sysdate, '', null, '管理员');
INSERT INTO aidev_sys_notice VALUES ('2', '维护通知：2021-07-01 AiDev系统凌晨维护', '1', '维护内容',   '0', 'admin', sysdate, '', null, '管理员');

-- ----------------------------
-- 19、代码生成业务表
-- ----------------------------
CREATE TABLE aidev_gen_table
(
    table_id          NUMBER (20)     NOT NULL,
    table_name        VARCHAR2 (200)  DEFAULT '',
    table_comment     VARCHAR2 (500)  DEFAULT '',
    sub_table_name    VARCHAR2 (64)   DEFAULT '',
    sub_table_fk_name VARCHAR2 (64)   DEFAULT '',
    class_name        VARCHAR2 (100)  DEFAULT '',
    tpl_category      VARCHAR2 (200)  DEFAULT 'crud',
    package_name      VARCHAR2 (100)  DEFAULT '',
    module_name       VARCHAR2 (30)   DEFAULT '',
    business_name     VARCHAR2 (30)   DEFAULT '',
    function_name     VARCHAR2 (50)   DEFAULT '',
    function_author   VARCHAR2 (50)   DEFAULT '',
    gen_type          CHAR(1)         DEFAULT '0',
    gen_path          VARCHAR2 (200)  DEFAULT '/',
    options           VARCHAR2 (1000) DEFAULT '',
    create_by         VARCHAR2 (64)   DEFAULT '',
    create_time       DATE,
    update_by         VARCHAR2 (64)   DEFAULT '',
    update_time       DATE,
    remark            VARCHAR2 (500)  DEFAULT ''
);
CREATE SEQUENCE seq_aidev_gen_table INCREMENT BY 1 START WITH 1 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_gen_table ADD CONSTRAINT pk_aidev_gen_table PRIMARY KEY (table_id);
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
CREATE TABLE aidev_gen_table_column
(
    column_id      NUMBER (20)    NOT NULL,
    table_id       VARCHAR2 (64)  DEFAULT '',
    column_name    VARCHAR2 (200) DEFAULT '',
    column_comment VARCHAR2 (500) DEFAULT '',
    column_type    VARCHAR2 (100) DEFAULT '',
    java_type      VARCHAR2 (500) DEFAULT '',
    java_field     VARCHAR2 (200) DEFAULT '',
    is_pk          CHAR(1)        DEFAULT '',
    is_increment   CHAR(1)        DEFAULT '',
    is_required    CHAR(1)        DEFAULT '',
    is_insert      CHAR(1)        DEFAULT '',
    is_edit        CHAR(1)        DEFAULT '',
    is_list        CHAR(1)        DEFAULT '',
    is_query       CHAR(1)        DEFAULT '',
    query_type     VARCHAR2 (200) DEFAULT 'EQ',
    html_type      VARCHAR2 (200) DEFAULT '',
    dict_type      VARCHAR2 (200) DEFAULT '',
    sort           NUMBER (4),
    create_by      VARCHAR2 (64)  DEFAULT '',
    create_time    DATE,
    update_by      VARCHAR2 (64)  DEFAULT '',
    update_time    DATE
);
CREATE SEQUENCE seq_aidev_gen_table_column INCREMENT BY 1 START WITH 1 NOMAXVALUE NOMINVALUE CACHE 20;
ALTER TABLE aidev_gen_table_column ADD CONSTRAINT pk_aidev_gen_table_column PRIMARY KEY (column_id);
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
CREATE TABLE aidev_sys_dept_ance
(
    dept_id NUMBER (20) NOT NULL,
    ance_id NUMBER (20) NOT NULL
);
ALTER TABLE aidev_sys_dept_ance ADD CONSTRAINT pk_aidev_sys_dept_ance PRIMARY KEY (dept_id, ance_id);
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