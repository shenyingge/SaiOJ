CREATE DATABASE IF NOT EXISTS `SaiOJ` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE SaiOJ;

-- 用户表
CREATE TABLE `t_user`(
	`uid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
	`username` VARCHAR(20) NOT NULL COMMENT '用户账号',
	`password` VARCHAR(32) NOT NULL COMMENT '用户密码',
    `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
	`problem_ac_num` INT(11) DEFAULT 0 COMMENT '通过题目数',
	`ac_rate` FLOAT DEFAULT 0 COMMENT '题目通过率',
	`rank` INT(11) NULL COMMENT '排名',
	`u1` VARCHAR(20) COMMENT '备用',
	PRIMARY KEY (`uid`),
    UNIQUE KEY `username` (`username`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 角色表
CREATE TABLE `t_role`(
    `rid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
    `role_name` VARCHAR(20) NOT NULL COMMENT '角色名',
    PRIMARY KEY (`rid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `t_role`(`role_name`) VALUES('管理员');
INSERT INTO `t_role`(`role_name`) VALUES('普通用户');

-- 用户-角色关联
CREATE TABLE `t_user_role`(
    `urid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色id',
    `uid` INT(11) NOT NULL COMMENT '用户名',
    `rid` INT(11) NOT NULL COMMENT '角色名',
    FOREIGN KEY(`uid`) REFERENCES t_user(`uid`),
    FOREIGN KEY(`rid`) REFERENCES t_role(`rid`),
    PRIMARY KEY (`urid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `t_user` (`uid`,`username`,`password`) VALUES ('1','admin','123456');

INSERT INTO `t_user_role` (`uid`,`rid`) VALUES ('1','1'),('1','2');


-- 题目表
CREATE TABLE `t_problem`(
	`pid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '题目id',
	`title` VARCHAR(32) NOT NULL COMMENT '题目名',
	`description` VARCHAR(5000) NOT NULL COMMENT '题目描述',
	`input` VARCHAR(500) DEFAULT NULL COMMENT '题目标准输入',
  	`output` VARCHAR(500) DEFAULT NULL COMMENT '题目标准输出',
	`time_limit` INT(11) NOT NULL COMMENT '题目时间限制',
  	`memory_limit` INT(11) NOT NULL COMMENT '题目内存限制',
  	`submit_times` INT(11) DEFAULT 0 COMMENT '提交次数',
    `ac_rate` FLOAT DEFAULT 0 COMMENT '题目通过率',
	PRIMARY KEY (`pid`),
	UNIQUE KEY `title` (`title`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 标签表
CREATE TABLE `t_tag`(
	`tid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
	`name` VARCHAR(20) NOT NULL COMMENT '标签名',
	PRIMARY KEY (`tid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 题目-标签关联
CREATE TABLE `t_problem_tag`(
	`ptid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '题目标签关联id',
	`pid` INT(11) COMMENT '题目id',
	`tid` INT(11) COMMENT '标签id',
	FOREIGN KEY(`pid`) REFERENCES t_problem(`pid`),
	FOREIGN KEY(`tid`) REFERENCES t_tag(`tid`),
	PRIMARY KEY (`ptid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- submission表
CREATE TABLE `t_submission`(
	`sid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'submission_id',
	`lan` VARCHAR(20) NOT NULL COMMENT '语言',
	`date_time` datetime DEFAULT CURRENT_TIMESTAMP,
	`uid` INT(11) COMMENT '用户id',
	`pid` INT(11) COMMENT '题目id',
	`status` INT(11) COMMENT '评测状态',
	`run_time` DOUBLE DEFAULT NULL,
	`code` TEXT COMMENT '代码',
	`is_visible` bit DEFAULT 1 COMMENT '是否可见',
	FOREIGN KEY(`uid`) REFERENCES t_user(`uid`),
	FOREIGN KEY(`pid`) REFERENCES t_problem(`pid`),
	PRIMARY KEY (`sid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 用户通过题目表
CREATE TABLE `t_problem_accepted`(
    `paid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '通过题目id',
    `uid` INT(11) COMMENT '用户id',
    `pid` INT(11) COMMENT '题目id',
    FOREIGN KEY(`uid`) REFERENCES t_user(`uid`),
    FOREIGN KEY(`pid`) REFERENCES t_problem(`pid`),
    PRIMARY KEY (`paid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 竞赛表
CREATE TABLE `t_contest`(
    `cid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '竞赛id',
    `name` VARCHAR(20) NOT NULL COMMENT '竞赛名称',
    `description` VARCHAR(500) NOT NULL COMMENT '描述',
    `start_time` datetime DEFAULT NULL COMMENT '开始时间',
    `end_time` datetime DEFAULT NULL COMMENT '结束时间',
    `user_count` INT(11) DEFAULT 0 COMMENT '比赛人数',
    PRIMARY KEY (`cid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 竞赛题目关联
CREATE TABLE `t_contest_problem`(
    `cpid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '竞赛题目id',
    `cid` INT(11) NOT NULL COMMENT '竞赛id',
    `pid` INT(11) NOT NULL COMMENT '题目id',
    FOREIGN KEY(`cid`) REFERENCES t_contest(`cid`),
    FOREIGN KEY(`pid`) REFERENCES t_problem(`pid`),
    PRIMARY KEY (`cpid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 竞赛用户关联
CREATE TABLE `t_contest_user`(
    `cuid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '竞赛用户id',
    `cid` INT(11) NOT NULL COMMENT '竞赛id',
    `uid` INT(11) NOT NULL COMMENT '用户id',
    `time` TIME DEFAULT NULL COMMENT '所用时间',
    `score` INT(11) DEFAULT 0 COMMENT '分数',
    FOREIGN KEY(`cid`) REFERENCES t_contest(`cid`),
    FOREIGN KEY(`uid`) REFERENCES t_user(`uid`),
    PRIMARY KEY (`cuid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 竞赛用户提交关联
CREATE TABLE `t_contest_submission`(
    `csid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '竞赛提交id',
    `cid` INT(11) NOT NULL COMMENT '竞赛id',
    `sid` INT(11) NOT NULL COMMENT '提交id',
    FOREIGN KEY(`cid`) REFERENCES t_contest(`cid`),
    FOREIGN KEY(`sid`) REFERENCES t_submission(`sid`),
    PRIMARY KEY (`csid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 题解表
CREATE TABLE `t_explanation`(
	`eid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '题解id',
	`uid` INT(11) COMMENT '用户id',
	`pid` INT(11) COMMENT '题目id',
	`content` TEXT COMMENT '题解内容',
	FOREIGN KEY(`uid`) REFERENCES t_user(`uid`),
	FOREIGN KEY(`pid`) REFERENCES t_problem(`pid`),
	PRIMARY KEY (`eid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;