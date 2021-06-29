-- ----------------------------
-- 1、存储每一个已配置的 jobDetail 的详细信息
-- ----------------------------
DROP TABLE IF EXISTS AIDEV_QRTZ_JOB_DETAILS;
CREATE TABLE AIDEV_QRTZ_JOB_DETAILS
(
    sched_name        VARCHAR(120) NOT NULL,
    job_name          VARCHAR(200) NOT NULL,
    job_group         VARCHAR(200) NOT NULL,
    description       VARCHAR(250),
    job_class_name    VARCHAR(250) NOT NULL,
    is_durable        VARCHAR(1)   NOT NULL,
    is_nonconcurrent  VARCHAR(1)   NOT NULL,
    is_update_data    VARCHAR(1)   NOT NULL,
    requests_recovery VARCHAR(1)   NOT NULL,
    job_data          BLOB,
    PRIMARY KEY (sched_name, job_name, job_group)
) ENGINE = innodb;

-- ----------------------------
-- 2、 存储已配置的 Trigger 的信息
-- ----------------------------
DROP TABLE IF EXISTS AIDEV_QRTZ_TRIGGERS;
CREATE TABLE AIDEV_QRTZ_TRIGGERS
(
    sched_name     VARCHAR(120) NOT NULL,
    trigger_name   VARCHAR(200) NOT NULL,
    trigger_group  VARCHAR(200) NOT NULL,
    job_name       VARCHAR(200) NOT NULL,
    job_group      VARCHAR(200) NOT NULL,
    description    VARCHAR(250),
    next_fire_time BIGINT(13),
    prev_fire_time BIGINT(13),
    priority       INTEGER,
    trigger_state  VARCHAR(16)  NOT NULL,
    trigger_type   VARCHAR(8)   NOT NULL,
    start_time     BIGINT(13)   NOT NULL,
    end_time       BIGINT(13),
    calendar_name  VARCHAR(200),
    misfire_instr  SMALLINT(2),
    job_data       BLOB,
    PRIMARY KEY (sched_name, trigger_name, trigger_group),
    FOREIGN KEY (sched_name, job_name, job_group) REFERENCES AIDEV_QRTZ_JOB_DETAILS (sched_name, job_name, job_group)
) ENGINE = innodb;

-- ----------------------------
-- 3、 存储简单的 Trigger，包括重复次数，间隔，以及已触发的次数
-- ----------------------------
DROP TABLE IF EXISTS AIDEV_QRTZ_SIMPLE_TRIGGERS;
CREATE TABLE AIDEV_QRTZ_SIMPLE_TRIGGERS
(
    sched_name      VARCHAR(120) NOT NULL,
    trigger_name    VARCHAR(200) NOT NULL,
    trigger_group   VARCHAR(200) NOT NULL,
    repeat_count    BIGINT(7)    NOT NULL,
    repeat_interval BIGINT(12)   NOT NULL,
    times_triggered BIGINT(10)   NOT NULL,
    PRIMARY KEY (sched_name, trigger_name, trigger_group),
    FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES AIDEV_QRTZ_TRIGGERS (sched_name, trigger_name, trigger_group)
) ENGINE = innodb;

-- ----------------------------
-- 4、 存储 Cron Trigger，包括 Cron 表达式和时区信息
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_CRON_TRIGGERS;
CREATE TABLE AIDEV_QRTZ_CRON_TRIGGERS
(
    sched_name      VARCHAR(120) NOT NULL,
    trigger_name    VARCHAR(200) NOT NULL,
    trigger_group   VARCHAR(200) NOT NULL,
    cron_expression VARCHAR(200) NOT NULL,
    time_zone_id    VARCHAR(80),
    PRIMARY KEY (sched_name, trigger_name, trigger_group),
    FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES AIDEV_QRTZ_TRIGGERS (sched_name, trigger_name, trigger_group)
) ENGINE = innodb;

-- ----------------------------
-- 5、 Trigger 作为 Blob 类型存储(用于 Quartz 用户用 JDBC 创建他们自己定制的 Trigger 类型，JobStore 并不知道如何存储实例的时候)
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_BLOB_TRIGGERS;
CREATE TABLE AIDEV_QRTZ_BLOB_TRIGGERS
(
    sched_name    VARCHAR(120) NOT NULL,
    trigger_name  VARCHAR(200) NOT NULL,
    trigger_group VARCHAR(200) NOT NULL,
    blob_data     BLOB,
    PRIMARY KEY (sched_name, trigger_name, trigger_group),
    FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES AIDEV_QRTZ_TRIGGERS (sched_name, trigger_name, trigger_group)
) ENGINE = innodb;

-- ----------------------------
-- 6、 以 Blob 类型存储存放日历信息， quartz可配置一个日历来指定一个时间范围
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_CALENDARS;
CREATE TABLE AIDEV_QRTZ_CALENDARS
(
    sched_name    VARCHAR(120) NOT NULL,
    calendar_name VARCHAR(200) NOT NULL,
    calendar      BLOB         NOT NULL,
    PRIMARY KEY (sched_name, calendar_name)
) ENGINE = innodb;

-- ----------------------------
-- 7、 存储已暂停的 Trigger 组的信息
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_PAUSED_TRIGGER_GRPS;
CREATE TABLE AIDEV_QRTZ_PAUSED_TRIGGER_GRPS
(
    sched_name    VARCHAR(120) NOT NULL,
    trigger_group VARCHAR(200) NOT NULL,
    PRIMARY KEY (sched_name, trigger_group)
) ENGINE = innodb;

-- ----------------------------
-- 8、 存储与已触发的 Trigger 相关的状态信息，以及相联 Job 的执行信息
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_FIRED_TRIGGERS;
CREATE TABLE AIDEV_QRTZ_FIRED_TRIGGERS
(
    sched_name        VARCHAR(120) NOT NULL,
    entry_id          VARCHAR(95)  NOT NULL,
    trigger_name      VARCHAR(200) NOT NULL,
    trigger_group     VARCHAR(200) NOT NULL,
    instance_name     VARCHAR(200) NOT NULL,
    fired_time        BIGINT(13)   NOT NULL,
    sched_time        BIGINT(13)   NOT NULL,
    priority          INTEGER      NOT NULL,
    state             VARCHAR(16)  NOT NULL,
    job_name          VARCHAR(200),
    job_group         VARCHAR(200),
    is_nonconcurrent  VARCHAR(1),
    requests_recovery VARCHAR(1),
    PRIMARY KEY (sched_name, entry_id)
) ENGINE = innodb;

-- ----------------------------
-- 9、 存储少量的有关 Scheduler 的状态信息，假如是用于集群中，可以看到其他的 Scheduler 实例
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_SCHEDULER_STATE;
CREATE TABLE AIDEV_QRTZ_SCHEDULER_STATE
(
    sched_name        VARCHAR(120) NOT NULL,
    instance_name     VARCHAR(200) NOT NULL,
    last_checkin_time BIGINT(13)   NOT NULL,
    checkin_interval  BIGINT(13)   NOT NULL,
    PRIMARY KEY (sched_name, instance_name)
) ENGINE = innodb;

-- ----------------------------
-- 10、 存储程序的悲观锁的信息(假如使用了悲观锁)
-- ---------------------------- 
DROP TABLE IF EXISTS AIDEV_QRTZ_LOCKS;
CREATE TABLE AIDEV_QRTZ_LOCKS
(
    sched_name VARCHAR(120) NOT NULL,
    lock_name  VARCHAR(40)  NOT NULL,
    PRIMARY KEY (sched_name, lock_name)
) ENGINE = innodb;

DROP TABLE IF EXISTS AIDEV_QRTZ_SIMPROP_TRIGGERS;
CREATE TABLE AIDEV_QRTZ_SIMPROP_TRIGGERS
(
    sched_name    VARCHAR(120) NOT NULL,
    trigger_name  VARCHAR(200) NOT NULL,
    trigger_group VARCHAR(200) NOT NULL,
    str_prop_1    VARCHAR(512),
    str_prop_2    VARCHAR(512),
    str_prop_3    VARCHAR(512),
    int_prop_1    INT,
    int_prop_2    INT,
    long_prop_1   BIGINT,
    long_prop_2   BIGINT,
    dec_prop_1    NUMERIC(13, 4),
    dec_prop_2    NUMERIC(13, 4),
    bool_prop_1   VARCHAR(1),
    bool_prop_2   VARCHAR(1),
    PRIMARY KEY (sched_name, trigger_name, trigger_group),
    FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES AIDEV_QRTZ_TRIGGERS (sched_name, trigger_name, trigger_group)
) ENGINE = innodb;

COMMIT;