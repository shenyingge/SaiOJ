CREATE DATABASE IF NOT EXISTS `SaiOJ` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE SaiOJ;

-- 用户表
CREATE TABLE `user`(
	`uid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
	`username` VARCHAR(20) NOT NULL COMMENT '用户账号',
	`password` VARCHAR(32) NOT NULL COMMENT '用户密码',
	`problem_ac_num` INT(11) DEFAULT 0 COMMENT '通过题目数',
	`ac_rate` FLOAT DEFAULT 0 COMMENT '题目通过率',
	PRIMARY KEY (`uid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 管理员表
CREATE TABLE `admin`(
	`aid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
	`username` VARCHAR(20) NOT NULL COMMENT '管理员账号',
	`password` VARCHAR(32) NOT NULL COMMENT '管理员密码',
	PRIMARY KEY (`aid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO `admin` VALUES('1','admin','123456');

-- 题目表
CREATE TABLE `problem`(
	`pid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '题目id',
	`title` VARCHAR(32) NOT NULL COMMENT '题目名',
	`description` VARCHAR(200) NOT NULL COMMENT '题目描述',
	`input` VARCHAR(255) NOT NULL COMMENT '题目标准输入',
  	`output` VARCHAR(255) NOT NULL COMMENT '题目标准输出',
	`time_limit` INT(11) NOT NULL COMMENT '题目时间限制',
  	`memory_limit` INT(11) NOT NULL COMMENT '题目内存限制',
	PRIMARY KEY (`pid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 题目标签表
CREATE TABLE `tag`(
	`tid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
	`name` VARCHAR(20) NOT NULL COMMENT '标签名',
	PRIMARY KEY (`tid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 题目-标签关联
CREATE TABLE `problem_tag`(
	`ptid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '题目标签关联id',
	`pid` INT(11) COMMENT '题目id',
	`tid` INT(11) COMMENT '标签id',
	FOREIGN KEY(`pid`) REFERENCES problem(`pid`),
	FOREIGN KEY(`tid`) REFERENCES tag(`tid`),
	PRIMARY KEY (`ptid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- solution表
CREATE TABLE `solution`(
	`sid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'solution_id',
	`date_time` datetime DEFAULT CURRENT_TIMESTAMP,
	`uid` INT(11) COMMENT '用户id',
	`pid` INT(11) COMMENT '题目id',
	`status` INT(11) COMMENT '评测状态：0 等待测评，1 正在测评，2 通过，3 编译错误，4 运行出错，5 运行超时，6 超过内存，7 错误答案', 
	`run_time` DOUBLE DEFAULT NULL,
	`code` TEXT COMMENT '代码',
	FOREIGN KEY(`uid`) REFERENCES USER(`uid`),
	FOREIGN KEY(`pid`) REFERENCES problem(`pid`),
	PRIMARY KEY (`sid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 用户通过题目表
CREATE TABLE `problem_accepted`(
    `paid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '通过题目id',
    `uid` INT(11) COMMENT '用户id',
    `pid` INT(11) COMMENT '题目id',
    FOREIGN KEY(`uid`) REFERENCES user(`uid`),
    FOREIGN KEY(`pid`) REFERENCES problem(`pid`),
    PRIMARY KEY (`paid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 题解表
CREATE TABLE `explanation`(
	`eid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '题解id',
	`uid` INT(11) COMMENT '用户id',
	`pid` INT(11) COMMENT '题目id',
	FOREIGN KEY(`uid`) REFERENCES USER(`uid`),
	FOREIGN KEY(`pid`) REFERENCES problem(`pid`),
	PRIMARY KEY (`eid`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;