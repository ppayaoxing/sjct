/*
Navicat MySQL Data Transfer

Source Server         : p2p
Source Server Version : 50600
Source Host           : 192.168.10.101:3306
Source Database       : p2p

Target Server Type    : MYSQL
Target Server Version : 50600
File Encoding         : 65001

Date: 2014-09-02 15:17:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `batch_instance_depend_on`
-- ----------------------------
DROP TABLE IF EXISTS `batch_instance_depend_on`;
CREATE TABLE `batch_instance_depend_on` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `JOB_INSTANCE_ID` bigint(10) DEFAULT NULL,
  `DEPEND_JOB_INSTANCE_ID` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_INSTANCE_DEPEND` (`ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of batch_instance_depend_on
-- ----------------------------
INSERT INTO `batch_instance_depend_on` VALUES ('1', '10086', '10085');
INSERT INTO `batch_instance_depend_on` VALUES ('2', '10087', '10086');
INSERT INTO `batch_instance_depend_on` VALUES ('3', '10090', '10089');
INSERT INTO `batch_instance_depend_on` VALUES ('4', '10091', '10090');
INSERT INTO `batch_instance_depend_on` VALUES ('5', '10094', '10093');
INSERT INTO `batch_instance_depend_on` VALUES ('6', '10095', '10094');
INSERT INTO `batch_instance_depend_on` VALUES ('7', '10096', '10095');

-- ----------------------------
-- Table structure for `batch_job`
-- ----------------------------
DROP TABLE IF EXISTS `batch_job`;
CREATE TABLE `batch_job` (
  `JOB_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(100) DEFAULT NULL,
  `JOB_ALIAS_NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `JAVACLASS` varchar(200) DEFAULT NULL,
  `JOB_ORDER` int(10) DEFAULT NULL,
  `SEDULERDATE` varchar(20) DEFAULT NULL,
  `PARENT_JOB_ID` bigint(10) DEFAULT NULL,
  `ENABLE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`),
  UNIQUE KEY `PK_BATCH_JOB` (`JOB_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of batch_job
-- ----------------------------
INSERT INTO `batch_job` VALUES ('1', '日终任务组', '日终任务组', null, 'com.qfw.batch.bizservice.schedule.common.impl.BatchGroupJob', '0', '0 50 23 * * ?', '0', '1');
INSERT INTO `batch_job` VALUES ('2', '自动还款批处理任务', '自动还款批处理任务', null, 'com.qfw.batch.job.RepayBatchJob', '1', null, '1', '1');
INSERT INTO `batch_job` VALUES ('3', '延期批处理任务', '延期批处理任务', null, 'com.qfw.batch.job.DelayBatchJob', '2', null, '1', '1');
INSERT INTO `batch_job` VALUES ('4', '逾期批处理任务', '逾期批处理任务', null, 'com.qfw.batch.job.OverdueBatchJob', '3', null, '1', '1');
INSERT INTO `batch_job` VALUES ('5', '收益分配批处理任务', '收益分配批处理任务', null, 'com.qfw.batch.job.IncomeBatchJob', '4', null, '1', '1');
INSERT INTO `batch_job` VALUES ('6', '未满标X天批处理任务', '未满标X天批处理任务', null, 'com.qfw.batch.job.InvalidLoanBatchJob', '5', null, '1', '1');

-- ----------------------------
-- Table structure for `batch_job_depend_on`
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_depend_on`;
CREATE TABLE `batch_job_depend_on` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `JOB_ID` bigint(10) DEFAULT NULL,
  `DEPEND_JOB_ID` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_JOB_DEPEND` (`ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of batch_job_depend_on
-- ----------------------------
INSERT INTO `batch_job_depend_on` VALUES ('1', '3', '2');
INSERT INTO `batch_job_depend_on` VALUES ('2', '4', '3');
INSERT INTO `batch_job_depend_on` VALUES ('3', '5', '4');
INSERT INTO `batch_job_depend_on` VALUES ('4', '6', '5');

-- ----------------------------
-- Table structure for `batch_job_instance`
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_instance`;
CREATE TABLE `batch_job_instance` (
  `JOB_INSTANCE_ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `BATCH_NO` bigint(8) DEFAULT NULL,
  `BATCH_SEQ_NO` bigint(6) DEFAULT NULL,
  `JOB_ID` bigint(10) DEFAULT NULL,
  `PARENT_JOB_ID` bigint(10) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ALIAS_NAME` varchar(100) DEFAULT NULL,
  `JOB_GROUP` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `STATUS` varchar(2) DEFAULT NULL,
  `PROGRESS` varchar(20) DEFAULT NULL,
  `TOTALPROGRESS` varchar(20) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `IS_SUB_JOB` varchar(1) DEFAULT NULL,
  `PARAM` varchar(200) DEFAULT NULL,
  `MEMO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `PK_JOB_INSTANCE` (`JOB_INSTANCE_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=10097 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of batch_job_instance
-- ----------------------------
INSERT INTO `batch_job_instance` VALUES ('10084', '20140529', '0', '1', '0', '日终任务组', '日终任务组', null, '2014-05-29 23:50:00', '2014-05-29 23:51:23', '3', '3', '3', null, '0', null, '0');
INSERT INTO `batch_job_instance` VALUES ('10085', '20140529', '0', '2', '10084', '自动还款批处理任务', '自动还款批处理任务', '日终任务组', '2014-05-29 23:50:22', '2014-05-29 23:50:23', '3', '1', '1', null, '1', null, '自动还款批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10086', '20140529', '0', '3', '10084', '延期批处理任务', '延期批处理任务', '日终任务组', '2014-05-29 23:50:52', '2014-05-29 23:50:53', '3', '1', '1', null, '1', null, '延期批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10087', '20140529', '0', '4', '10084', '逾期批处理任务', '逾期批处理任务', '日终任务组', '2014-05-29 23:51:22', '2014-05-29 23:51:23', '3', '1', '1', null, '1', null, '逾期批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10088', '20140604', '0', '1', '0', '日终任务组', '日终任务组', null, '2014-06-04 23:50:04', '2014-06-04 23:51:24', '3', '3', '3', null, '0', null, '0');
INSERT INTO `batch_job_instance` VALUES ('10089', '20140604', '0', '2', '10088', '自动还款批处理任务', '自动还款批处理任务', '日终任务组', '2014-06-04 23:50:20', '2014-06-04 23:50:21', '3', '1', '1', null, '1', null, '自动还款批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10090', '20140604', '0', '3', '10088', '延期批处理任务', '延期批处理任务', '日终任务组', '2014-06-04 23:50:51', '2014-06-04 23:50:52', '3', '1', '1', null, '1', null, '延期批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10091', '20140604', '0', '4', '10088', '逾期批处理任务', '逾期批处理任务', '日终任务组', '2014-06-04 23:51:22', '2014-06-04 23:51:23', '3', '1', '1', null, '1', null, '逾期批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10092', '20140606', '0', '1', '0', '日终任务组', '日终任务组', null, '2014-06-06 09:45:09', '2014-06-06 09:46:56', '3', '4', '4', null, '0', null, '0');
INSERT INTO `batch_job_instance` VALUES ('10093', '20140606', '0', '2', '10092', '自动还款批处理任务', '自动还款批处理任务', '日终任务组', '2014-06-06 09:45:25', '2014-06-06 09:45:25', '3', '1', '1', null, '1', null, '自动还款批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10094', '20140606', '0', '3', '10092', '延期批处理任务', '延期批处理任务', '日终任务组', '2014-06-06 09:45:55', '2014-06-06 09:45:55', '3', '1', '1', null, '1', null, '延期批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10095', '20140606', '0', '4', '10092', '逾期批处理任务', '逾期批处理任务', '日终任务组', '2014-06-06 09:46:25', '2014-06-06 09:46:25', '3', '1', '1', null, '1', null, '逾期批处理执行成功');
INSERT INTO `batch_job_instance` VALUES ('10096', '20140606', '0', '5', '10092', '收益分配批处理任务', '收益分配批处理任务', '日终任务组', '2014-06-06 09:46:55', '2014-06-06 09:46:56', '3', '1', '1', null, '1', null, '延期批处理执行成功');

-- ----------------------------
-- Table structure for `batch_job_param`
-- ----------------------------
DROP TABLE IF EXISTS `batch_job_param`;
CREATE TABLE `batch_job_param` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `JOB_ID` bigint(10) DEFAULT NULL,
  `PARAM_KEY` varchar(100) DEFAULT NULL,
  `PARAM_VALUE` varchar(200) DEFAULT NULL,
  `PARAM_TYPE` varchar(200) DEFAULT NULL,
  `MEMO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PK_JOB_PARAM` (`ID`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of batch_job_param
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_account`
-- ----------------------------
DROP TABLE IF EXISTS `biz_account`;
CREATE TABLE `biz_account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `ACCOUNT` varchar(50) DEFAULT NULL COMMENT '账号',
  `ACCOUNT_TYPE_CD` varchar(2) DEFAULT NULL,
  `ACCOUNT_BAL_AMT` decimal(16,2) DEFAULT NULL COMMENT '账户余额',
  `FREEZE_BAL_AMT` decimal(16,2) DEFAULT NULL COMMENT '冻结余额',
  `USABLE_BAL_AMT` decimal(16,2) DEFAULT NULL COMMENT '可用余额',
  `PM_AMT` decimal(16,2) DEFAULT NULL COMMENT 'PM币',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员账户表';

-- ----------------------------
-- Records of biz_account
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_account_detail`
-- ----------------------------
DROP TABLE IF EXISTS `biz_account_detail`;
CREATE TABLE `biz_account_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `ACCOUNT` varchar(50) NOT NULL COMMENT '账号',
  `ACCOUNT_BAL_AMT` decimal(16,2) NOT NULL COMMENT '账户余额',
  `FREEZE_BAL_AMT` decimal(16,2) NOT NULL COMMENT '冻结余额',
  `PM_AMT` decimal(16,2) NOT NULL COMMENT 'PM币',
  `TX_NO` varchar(20) NOT NULL COMMENT '交易编号',
  `EVENT_TYPE_CD` varchar(2) NOT NULL COMMENT '交易型态EVENT_TYPE_CD:',
  `TX_AMT` decimal(16,2) NOT NULL COMMENT '交易金额',
  `TX_DATE` datetime NOT NULL COMMENT '交易日期',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现表';

-- ----------------------------
-- Records of biz_account_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_agent_income`
-- ----------------------------
DROP TABLE IF EXISTS `biz_agent_income`;
CREATE TABLE `biz_agent_income` (
  `ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SETTLEMENT_DATE` date NOT NULL COMMENT '结算日期',
  `AGENT_ID` bigint(22) NOT NULL COMMENT '经纪人ID',
  `AGENT_NAME` varchar(32) DEFAULT NULL COMMENT '经纪人姓名',
  `TEL` varchar(11) DEFAULT NULL COMMENT '经纪人电话',
  `CARD_ID` varchar(20) DEFAULT NULL COMMENT '经纪人证件号码',
  `LEADER_ID` bigint(22) DEFAULT NULL COMMENT '团队长ID',
  `LEADER_NAME` varchar(32) DEFAULT NULL COMMENT '团队长姓名',
  `INVESTOR_COUNT` int(10) NOT NULL COMMENT '投资人总数',
  `INVEST_AMOUNT` decimal(16,2) NOT NULL COMMENT '投资总额',
  `COMMISION` decimal(16,2) NOT NULL COMMENT '投资提成',
  `AGENT_COUNT` int(10) NOT NULL COMMENT '经纪人总数',
  `AGENT_INCOME` decimal(16,2) NOT NULL COMMENT '经纪人收益总额',
  `LEADER_COMMISION` decimal(16,2) NOT NULL COMMENT '团队长抽成',
  `TOTAL_INCOME` decimal(16,2) NOT NULL COMMENT '总收益',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经纪人收益表';

-- ----------------------------
-- Records of biz_agent_income
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_agent_income_detail`
-- ----------------------------
DROP TABLE IF EXISTS `biz_agent_income_detail`;
CREATE TABLE `biz_agent_income_detail` (
  `ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SETTLEMENT_DATE` date NOT NULL COMMENT '结算日期',
  `AGENT_ID` bigint(22) NOT NULL COMMENT '收益人编号',
  `AGENT_NAME` varchar(32) DEFAULT NULL COMMENT '收益人姓名',
  `INCOME_TYPE` int(1) NOT NULL COMMENT '收益类型（1-经纪人收益 2-团队长收益）',
  `LEADER_ID` bigint(22) DEFAULT NULL COMMENT '团队长ID',
  `LEADER_NAME` varchar(32) DEFAULT NULL COMMENT '团队长姓名',
  `INVESTOR_ID` bigint(22) NOT NULL COMMENT '投资人登录号',
  `INVESTOR_NAME` varchar(32) DEFAULT NULL COMMENT '投资人姓名',
  `INVESTOR_INCOME` decimal(16,2) NOT NULL COMMENT '投资人收益金额',
  `TOTAL_INCOME` decimal(16,2) NOT NULL COMMENT '收益金额',
  `LEADER_INCOME` decimal(16,2) NOT NULL COMMENT '团队长收益金额',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经纪人收益表';

-- ----------------------------
-- Records of biz_agent_income_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_agent_info`
-- ----------------------------
DROP TABLE IF EXISTS `biz_agent_info`;
CREATE TABLE `biz_agent_info` (
  `ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` bigint(22) NOT NULL COMMENT '用户ID',
  `AGENT_NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `ENABLE_DATE` date NOT NULL COMMENT '启用日期',
  `STATE` int(1) NOT NULL DEFAULT '0' COMMENT '状态(0：未启用；1：启用)',
  `LEADER_ID` bigint(22) DEFAULT NULL COMMENT '团队长ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经纪人信息表';

-- ----------------------------
-- Records of biz_agent_info
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_arrears_detail`
-- ----------------------------
DROP TABLE IF EXISTS `biz_arrears_detail`;
CREATE TABLE `biz_arrears_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LOAN_ID` int(11) NOT NULL COMMENT '借据ID',
  `REPAY_PLAN_DETAIL_ID` int(11) NOT NULL COMMENT '还款计划明细表',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `LOAN_APPROVE_ID` int(11) NOT NULL COMMENT '借款发布ID',
  `PERIOD` int(11) NOT NULL COMMENT '还款期次',
  `REPAY_PLAN_DATE` date NOT NULL COMMENT '计划还款日',
  `GRACE_DAYS` int(11) NOT NULL COMMENT '当期宽限期天数',
  `DELAY_DAYS` int(11) NOT NULL COMMENT '当期展期天数',
  `OVERDUE_DAYS` int(11) NOT NULL COMMENT '当期逾期天数',
  `REPAY_DATE` date DEFAULT NULL COMMENT '实际还款日期',
  `DELAY_RATE` decimal(8,6) NOT NULL COMMENT '展期年利率',
  `OVERDUE_RATE` decimal(8,6) NOT NULL COMMENT '逾期年利率',
  `UNPAID_PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '未还本金',
  `UNPAID_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '未还利息',
  `UNPAID_PENALTY_AMT` decimal(16,2) NOT NULL COMMENT '未还罚息',
  `ARREARS_FLAG_CD` varchar(2) NOT NULL COMMENT '欠款标识ARREARS_FLAG_CD:正常0宽限期1展期2逾期3呆账4',
  `LAST_INTEREST_DATE` date NOT NULL COMMENT '上次计息时间用于到期后按天计算使用',
  `ARREARS_STATUS_CD` varchar(2) NOT NULL COMMENT '状态ARREARS_STATUS_CD:未还0已还1平台垫付2呆账3',
  `WORK_ITEM_ID` varchar(20) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_arrears_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_auth`
-- ----------------------------
DROP TABLE IF EXISTS `biz_auth`;
CREATE TABLE `biz_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `REL_ID` varchar(20) NOT NULL COMMENT '关联ID',
  `REL_TYPE_CD` varchar(2) NOT NULL COMMENT '关联类型',
  `AUTH_ITEM_CD` varchar(2) NOT NULL COMMENT '认证项目AUTH_ITEM_CD:身份认证0工作认证1居住地认证2信用报告3收入认证4房产5购车6结婚7学历8技术9手机10微博11现场12抵押认证13担保认证14其他资料15',
  `AUTH_STATUS_CD` varchar(2) NOT NULL COMMENT '认证状态AUTH_STATUS_CD:等待资料上传0审核中1通过2不通过3失效4',
  `SUBMIT_DATE` date DEFAULT NULL COMMENT '提交时间',
  `PASS_DATE` date DEFAULT NULL COMMENT '通过时间',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员认证情况表';

-- ----------------------------
-- Records of biz_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_card`
-- ----------------------------
DROP TABLE IF EXISTS `biz_card`;
CREATE TABLE `biz_card` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUST_ID` varchar(20) DEFAULT NULL COMMENT '会员ID',
  `BANK_TYPE` varchar(10) DEFAULT NULL COMMENT '行别',
  `BANK_NAME` varchar(32) DEFAULT '行别名称',
  `ACCOUNT_NUM` varchar(20) DEFAULT NULL COMMENT '账号',
  `ACCOUNT_NAME` varchar(20) DEFAULT NULL COMMENT '户名',
  `ACCOUNT_BANK` varchar(50) DEFAULT NULL COMMENT '开户行',
  `AREA_PROVINCE` varchar(50) DEFAULT '地区（省）',
  `AREA_CITY` varchar(50) DEFAULT '地区（市）',
  `SYS_CREATE_USER` varchar(20) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` varchar(20) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行卡表';

-- ----------------------------
-- Records of biz_card
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_collateral_info`
-- ----------------------------
DROP TABLE IF EXISTS `biz_collateral_info`;
CREATE TABLE `biz_collateral_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CREDIT_LIMIT_ID` int(11) NOT NULL COMMENT '额度申请ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `GUARANT_TYPE_CD` varchar(2) NOT NULL COMMENT '担保类型GUARANT_TYPE_CD:抵押1质押2',
  `COLLATERAL_TYPE` varchar(2) DEFAULT NULL COMMENT '担保品类型房产、车、车位',
  `COLLATERAL_NAME` varchar(50) DEFAULT NULL COMMENT '担保品名称',
  `COLLATERAL_WORTH` decimal(16,2) DEFAULT NULL COMMENT '担保品价值',
  `COLLATERAL_EXPLAIN` varchar(100) DEFAULT NULL COMMENT '担保品说明',
  `GUARANTOR_NAME` varchar(50) DEFAULT NULL COMMENT '抵质押人姓名',
  `GUARANTOR_PA_TYPE` varchar(2) DEFAULT NULL COMMENT '抵质押人证件类型0-身份证；\r\n1-户口簿；\r\n2-护照；\r\n3-军官证；\r\n4-士兵证；\r\n5-港澳居民来往内地通行证；\r\n6-台湾同胞来往内地通行证；\r\n7-临时身份证；\r\n8-外国人居留证；\r\n9-警官证；\r\nA-香港身份证；\r\nB-澳门身份证；\r\nC-台湾身份证；\r\nX-其他证件。',
  `GUARANTOR_PA_NO` varchar(20) DEFAULT NULL COMMENT '抵质押人证件号码',
  `COLLATERAL_NAME1` varchar(100) DEFAULT NULL COMMENT '担保品附件名称1',
  `COLLATERAL_ATT1` varchar(500) DEFAULT NULL COMMENT '担保品附件1',
  `COLLATERAL_NAME2` varchar(100) DEFAULT NULL COMMENT '担保品附件名称2',
  `COLLATERAL_ATT2` varchar(500) DEFAULT NULL COMMENT '担保品附件2',
  `COLLATERAL_NAME3` varchar(100) DEFAULT NULL COMMENT '担保品附件名称3',
  `COLLATERAL_ATT3` varchar(500) DEFAULT NULL COMMENT '担保品附件3',
  `COLLATERAL_NAME4` varchar(100) DEFAULT NULL COMMENT '担保品附件名称4',
  `COLLATERAL_ATT4` varchar(500) DEFAULT NULL COMMENT '担保品附件4',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='担保人信息表';

-- ----------------------------
-- Records of biz_collateral_info
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `biz_contacts`;
CREATE TABLE `biz_contacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `CONTACTS_NAME` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `CONTACTS_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '联系人类型CONTACTS_TYPE_CD:本人0夫妻1父亲2母亲3孩子4姐妹5兄弟6朋友7同事8',
  `CERTIFICATE_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '证件类型CERTIFICATE_TYPE_CD:身份证0军官证1组织机构代码证2',
  `CERTIFICATE_NUM` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `TELEPHONE` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `MOBILE_TELEPHONE` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '居住地址',
  `JOB_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '职业状态JOB_STATUS_CD:在校学生0固定工作者1待业/无业/失业2退休3其他4',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员联系人表';

-- ----------------------------
-- Records of biz_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_cost`
-- ----------------------------
DROP TABLE IF EXISTS `biz_cost`;
CREATE TABLE `biz_cost` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `RELATE_ID` int(11) NOT NULL COMMENT '关联ID债权ID、借款ID与关联类型组合使用',
  `RELATE_TYPE_CD` varchar(2) NOT NULL COMMENT '关联类型RELATE_TYPE_CD:债权0借款1',
  `COST_AMT` decimal(16,2) NOT NULL COMMENT '费用金额',
  `COST_RATE` decimal(8,6) NOT NULL COMMENT '费率值',
  `COST_BASIC_AMT` decimal(16,2) NOT NULL COMMENT '计费金额',
  `CURRENCY` varchar(10) NOT NULL COMMENT '币种人民币',
  `EXCHANGE_RATE` decimal(8,6) NOT NULL COMMENT '汇率默认1',
  `COST_TYPE_CD` varchar(2) NOT NULL COMMENT '费用类型COST_TYPE_CD:借款服务费1借款管理费2提现费用3充值费用4逾期罚息5逾期管理费6',
  `COST_STATUS_CD` varchar(2) NOT NULL COMMENT '费用状态COST_STATUS_CD:待扣费0未扣费1已扣费2',
  `COST_HAPPEN_DATE` date NOT NULL COMMENT '费用产生日期',
  `COST_GATHER_DATE` date DEFAULT NULL COMMENT '费用扣收日期',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='费用表';

-- ----------------------------
-- Records of biz_cost
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_creditor_right`
-- ----------------------------
DROP TABLE IF EXISTS `biz_creditor_right`;
CREATE TABLE `biz_creditor_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CR_TYPE_CD` varchar(2) NOT NULL COMMENT '债权类型CR_TYPE_CD:投标0转让1',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `LOAN_CUST_ID` int(11) NOT NULL COMMENT '借款会员ID',
  `LOAN_APPROVE_ID` int(11) NOT NULL COMMENT '借款发布ID',
  `LOAN_ID` int(11) DEFAULT NULL COMMENT '借款借据ID',
  `LOAN_NAME` varchar(200) NOT NULL COMMENT '借款名称',
  `LOAN_AMT` decimal(16,2) NOT NULL COMMENT '借款金额',
  `CR_AMT` decimal(16,2) NOT NULL COMMENT '债权金额',
  `TURNOVER_COUNT` int(11) NOT NULL COMMENT '成交份数',
  `PER_TENDER_AMT` decimal(16,2) NOT NULL,
  `SURPLUS_COUNT` int(11) NOT NULL COMMENT '剩余份数',
  `RETRIEVE_AMT` decimal(16,2) NOT NULL COMMENT '回收金额',
  `UNRETRIEVE_AMT` decimal(16,2) NOT NULL COMMENT '待收本金',
  `TENDER_TYPE_CD` varchar(2) NOT NULL COMMENT '投标方式TENDER_TYPE_CD:自动投标0手动投标1',
  `LOAN_RATE` decimal(8,6) NOT NULL COMMENT '年利率',
  `TOTAL_PERIOD` int(11) NOT NULL COMMENT '总期数',
  `SURPLUS_PERIOD` int(11) NOT NULL COMMENT '剩余期数',
  `NEXT_GATHER_DATE` date DEFAULT NULL COMMENT '下个收款日',
  `CR_STATUS_CD` varchar(2) NOT NULL COMMENT '状态CR_STATUS_CD:正常0逾期1结清2',
  `TOTAL_PROFIT_AMT` decimal(16,2) NOT NULL COMMENT '总收益金额',
  `SETTLE_DATE` date DEFAULT NULL COMMENT '结清日期',
  `REPAY_TYPE_CD` varchar(2) NOT NULL COMMENT '还款方式REPAY_TYPE_CD:等额本息0等额本金1利随本清2按固定周期付息,到期还款3',
  `CR_ID` int(11) DEFAULT NULL COMMENT '债权转让ID非转让的债权为空,转入的债权有值',
  `CR_TRAN_DATE` date DEFAULT NULL,
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='债权信息表';

-- ----------------------------
-- Records of biz_creditor_right
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_creditor_right_tran`
-- ----------------------------
DROP TABLE IF EXISTS `biz_creditor_right_tran`;
CREATE TABLE `biz_creditor_right_tran` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CR_ID` int(11) NOT NULL COMMENT '债权ID',
  `LOAN_APPROVE_ID` int(11) NOT NULL,
  `LOAN_ID` int(11) NOT NULL,
  `SURPLUS_PERIOD` int(11) NOT NULL COMMENT '剩余期数',
  `LOAN_RATE` decimal(8,6) NOT NULL COMMENT '年利率',
  `PER_TENDER_AMT` decimal(16,2) NOT NULL,
  `TRAN_TTL_COUNT` int(11) NOT NULL COMMENT '转让份数',
  `TRAN_OUT_COUNT` int(11) NOT NULL COMMENT '转出份数',
  `TRAN_TTL_AMT` decimal(16,2) NOT NULL COMMENT '转出债权总价值',
  `TRAN_OUT_AMT` decimal(16,2) NOT NULL COMMENT '转出总成交金额',
  `TAKE_AMT` decimal(16,2) NOT NULL COMMENT '接手奖金',
  `TAKE_BAL_AMT` decimal(16,2) DEFAULT NULL,
  `CRT_STATUS_CD` varchar(2) NOT NULL COMMENT '状态CRT_STATUS_CD:',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `TRAN_TERM` int(11) DEFAULT '0' COMMENT '转让期限(天)',
  `TRAN_DATE` datetime DEFAULT NULL COMMENT '转让开始日期',
  `TRAN_DUE_DATE` datetime DEFAULT NULL COMMENT '转让结束日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='债权转让发布表';

-- ----------------------------
-- Records of biz_creditor_right_tran
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_credit_limit`
-- ----------------------------
DROP TABLE IF EXISTS `biz_credit_limit`;
CREATE TABLE `biz_credit_limit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `REL_ID` varchar(20) NOT NULL COMMENT '关联流水号',
  `REL_TYPE_CD` varchar(2) NOT NULL COMMENT '关联类型REL_TYPE_CD:会员id0',
  `START_DATE` date NOT NULL COMMENT '生效时间',
  `END_DATE` date NOT NULL COMMENT '失效时间',
  `CL_AMT` decimal(16,2) NOT NULL COMMENT '额度金额',
  `FREEZE_AMT` decimal(16,2) NOT NULL COMMENT '冻结金额',
  `CREDIT_STATE_CD` varchar(2) NOT NULL COMMENT '状态CREDIT_STATE_CD:未生效0生效1冻结2',
  `OPSTATE_CD` varchar(2) NOT NULL COMMENT '操作状态OPSTATE_CD:新增0修改1删除2',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作项id',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='额度主表';

-- ----------------------------
-- Records of biz_credit_limit
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_credit_limit_apply`
-- ----------------------------
DROP TABLE IF EXISTS `biz_credit_limit_apply`;
CREATE TABLE `biz_credit_limit_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `APPLY_TERM` int(11) NOT NULL COMMENT '额度期限',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `LIMIT_APPLY` decimal(16,2) NOT NULL COMMENT '申请额度',
  `TENDER_TYPE` varchar(2) NOT NULL COMMENT '担保类型TENDER_TYPE:抵押1担保2信用3',
  `APPLY_STARTDATE` datetime NOT NULL COMMENT '申请开始时间',
  `APPLY_ENDDATE` datetime NOT NULL COMMENT '申请结束时间',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `APPLY_STATUS_CD` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请额度信息表';

-- ----------------------------
-- Records of biz_credit_limit_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_credit_report`
-- ----------------------------
DROP TABLE IF EXISTS `biz_credit_report`;
CREATE TABLE `biz_credit_report` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `credit_amt` decimal(22,2) DEFAULT NULL COMMENT '信用额度',
  `remain_amt` decimal(22,2) DEFAULT NULL COMMENT '剩余额度',
  `apply_loan_num` int(11) DEFAULT NULL COMMENT '申请借款笔数',
  `approve_num` int(11) DEFAULT NULL COMMENT '成功借款笔数',
  `Pay_off_num` int(11) DEFAULT NULL COMMENT '还清笔数',
  `loan_tol_amt` decimal(22,2) DEFAULT NULL COMMENT '还款总金额',
  `loan_bal` decimal(22,2) DEFAULT NULL,
  `overdue_amt` decimal(22,2) DEFAULT NULL COMMENT '逾期总额',
  `overdue_num` int(11) DEFAULT NULL COMMENT '逾期次数',
  `Ser_overdue_num` int(11) DEFAULT NULL COMMENT '严重逾期',
  `principa_interest_amt` decimal(22,2) DEFAULT NULL COMMENT '待还本息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信用报告';

-- ----------------------------
-- Records of biz_credit_report
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_credit_tx_record`
-- ----------------------------
DROP TABLE IF EXISTS `biz_credit_tx_record`;
CREATE TABLE `biz_credit_tx_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TX_NO` varchar(20) NOT NULL COMMENT '交易编号',
  `EVENT_TYPE_CD` int(11) NOT NULL COMMENT '交易型态',
  `CL_ID` int(11) NOT NULL COMMENT '额度id',
  `TX_AMT` decimal(16,2) NOT NULL COMMENT '交易金额',
  `CL_AMT` decimal(16,2) NOT NULL COMMENT '额度金额',
  `TX_DATE` date NOT NULL COMMENT '交易日期',
  `CTR_STATE_CD` varchar(2) DEFAULT NULL COMMENT '状态CTR_STATE_CD:未生效0生效1',
  `OPSTATE_CD` varchar(2) DEFAULT NULL COMMENT '操作类型OPSTATE_CD:新增0修改1删除2',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作项id',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='额度交易记录表';

-- ----------------------------
-- Records of biz_credit_tx_record
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_credit_use`
-- ----------------------------
DROP TABLE IF EXISTS `biz_credit_use`;
CREATE TABLE `biz_credit_use` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CL_ID` int(11) NOT NULL COMMENT '额度ID',
  `TIEUP_AMT` decimal(16,2) NOT NULL COMMENT '已占用金额',
  `PRE_TIEUP_AMT` decimal(16,2) NOT NULL COMMENT '待审核占用金额',
  `PRE_RESTORE_AMT` decimal(16,2) NOT NULL COMMENT '待审核恢复金额',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='额度动用表';

-- ----------------------------
-- Records of biz_credit_use
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_customer`
-- ----------------------------
DROP TABLE IF EXISTS `biz_customer`;
CREATE TABLE `biz_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID关联用户表',
  `CUST_NAME` varchar(20) DEFAULT NULL COMMENT '会员名称',
  `CUST_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '会员类型CUST_TYPE_CD:个人0企业1',
  `CERTIFICATE_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '证件类型CERTIFICATE_TYPE_CD:身份证0军官证1组织机构代码证2',
  `CERTIFICATE_NUM` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `AGE` int(11) DEFAULT NULL COMMENT '年龄',
  `SEX` varchar(2) DEFAULT NULL COMMENT '性别',
  `domicile` varchar(50) DEFAULT NULL COMMENT '户籍',
  `education_cd` varchar(2) DEFAULT NULL COMMENT '学历',
  `MARITAL_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '婚姻状况MARITAL_STATUS_CD:已婚0未婚1离异1丧偶1',
  `HAS_CHILDREN_CD` varchar(2) DEFAULT NULL COMMENT '有无子女HAS_CHILDREN_CD:无0有1',
  `COUNTY_CD` varchar(10) DEFAULT NULL COMMENT '国家代码COUNTY_CD:参照地区表',
  `PROVINCE_CD` varchar(10) DEFAULT NULL COMMENT '省份代码PROVINCE_CD:参照地区表',
  `CITY_CD` varchar(10) DEFAULT NULL COMMENT '城市代码CITY_CD:参照地区表',
  `NATIONALITY_CD` varchar(10) DEFAULT NULL COMMENT '地区代码NATIONALITY_CD:参照地区表',
  `STREET_ADDRESS` varchar(200) DEFAULT NULL COMMENT '街道地址',
  `LIVE_COUNTY_CD` varchar(10) DEFAULT NULL,
  `LIVE_PROVINCE_CD` varchar(10) DEFAULT NULL,
  `LIVE_CITY_CD` varchar(10) DEFAULT NULL,
  `LIVE_NATIONALITY_CD` varchar(10) DEFAULT NULL,
  `LIVE_STREET_ADDRESS` varchar(200) DEFAULT NULL,
  `ZIP_NUM` varchar(6) DEFAULT NULL COMMENT '邮编',
  `TELEPHONE` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `MOBILE_TELEPHONE` varchar(20) DEFAULT NULL COMMENT '移动电话',
  `FAX` varchar(20) DEFAULT NULL COMMENT '传真',
  `QQ` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `WEBSITE` varchar(200) DEFAULT NULL COMMENT '网站',
  `SCORE` int(11) DEFAULT NULL COMMENT '评分',
  `EMAIL` varchar(100) DEFAULT NULL,
  `REFEREE_NAME` varchar(100) DEFAULT NULL COMMENT '推荐人',
  `CUST_MANAGER_ID` int(11) DEFAULT NULL COMMENT '客户经理id',
  `CUST_MANAGER_NAME` varchar(20) DEFAULT NULL COMMENT '客户经理名称',
  `DEPT_ID` int(11) DEFAULT NULL,
  `DEPT_NAME` varchar(20) DEFAULT NULL COMMENT '所属机构',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `CREDIT_RATE` varchar(20) DEFAULT NULL COMMENT '信用等级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员基本信息表';

-- ----------------------------
-- Records of biz_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_family`
-- ----------------------------
DROP TABLE IF EXISTS `biz_family`;
CREATE TABLE `biz_family` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT '会员ID',
  `MARRY_STATUS_CD` varchar(2) NOT NULL COMMENT '婚姻状况MARRY_STATUS_CD:未婚0已婚1离异2',
  `CHILDREN_CD` varchar(2) NOT NULL COMMENT '有无子女CHILDREN_CD:无0有1',
  `DIRECT_LINE_NAME` varchar(50) NOT NULL COMMENT '直系姓名',
  `DIRECT_LINE_RELATE` varchar(100) NOT NULL COMMENT '直系关系',
  `DIRECT_LINE_PHONE` varchar(20) NOT NULL COMMENT '直系手机',
  `OTHER_RELATE_NAME` varchar(50) NOT NULL COMMENT '其他联系人姓名',
  `OTHER_RELATE_TYPE` varchar(100) NOT NULL COMMENT '其他人关系',
  `OTHER_RELATE_PHONE` varchar(20) NOT NULL COMMENT '其他人手机',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员家庭信息表';

-- ----------------------------
-- Records of biz_family
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_financial_product`
-- ----------------------------
DROP TABLE IF EXISTS `biz_financial_product`;
CREATE TABLE `biz_financial_product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UNIT_AMT` decimal(16,2) NOT NULL COMMENT '单份金额',
  `LEAST_INVEST_AMT` decimal(16,2) NOT NULL COMMENT '最小投资金额',
  `CREDIT_GRADE_CD` varchar(2) NOT NULL COMMENT '信用评级',
  `FINANCIAL_PRODUCT_CD` varchar(2) NOT NULL COMMENT '理财类型FINANCIAL_PRODUCT_CD:月息宝0日息宝1',
  `TITLE` varchar(50) NOT NULL COMMENT '标题',
  `FINANCIAL_PRODUCT_DESC` varchar(200) NOT NULL COMMENT '产品描述',
  `APPYY_USER_ID` int(11) NOT NULL COMMENT '借款者',
  `CREDIT_INDEX_CD` varchar(2) NOT NULL COMMENT '信用指数',
  `FINANCIAL_PRODUCT_AMT` decimal(16,2) NOT NULL COMMENT '金额',
  `FINANCIAL_PRODUCT_INT_RATE` decimal(8,6) NOT NULL COMMENT '利率',
  `FINANCIAL_PRODUCT_DUE_DATE` date NOT NULL COMMENT '期限',
  `FP_STATUS_CD` varchar(2) NOT NULL COMMENT '状态',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理财产品表';

-- ----------------------------
-- Records of biz_financial_product
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_guarantee_info`
-- ----------------------------
DROP TABLE IF EXISTS `biz_guarantee_info`;
CREATE TABLE `biz_guarantee_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GUARANTEE_ID` int(11) DEFAULT NULL COMMENT '担保ID',
  `CREDIT_LIMIT_ID` int(11) DEFAULT NULL COMMENT '额度申请ID',
  `CUST_ID` int(11) DEFAULT NULL COMMENT '会员ID',
  `GUARANTOR_CON_NO` varchar(50) DEFAULT NULL COMMENT '担保合同编号(纸质合同编号)',
  `GUARANTOR_TYPE` varchar(2) DEFAULT NULL COMMENT '担保人类型GUARANTOR_NAME:抵押1质押2多人分保3多人联保4单人保证5多人保证6',
  `GUARANTOR_AMT` decimal(16,2) DEFAULT NULL COMMENT '担保金额',
  `GUARANTOR_NAME` varchar(50) DEFAULT NULL COMMENT '担保人名称(或抵质押人)',
  `GUARANTOR_PA_TYPE` varchar(2) DEFAULT NULL COMMENT '担保人证件类型(或抵质押人)',
  `GUARANTOR_PA_NO` varchar(20) DEFAULT NULL COMMENT '担保人证件号码(或抵质押人)',
  `GUARANTEE_TYPE` varchar(2) DEFAULT NULL COMMENT '担保品类型',
  `GUARANTEE_NAME` varchar(30) DEFAULT NULL COMMENT '担保品名称',
  `GUARANTEE_WORTH` decimal(16,2) DEFAULT NULL COMMENT '担保品价值',
  `GUARANTEE_EXPLAIN` varchar(100) DEFAULT NULL COMMENT '担保品说明',
  `GUARANTEE_ATT1` varchar(100) DEFAULT NULL COMMENT '担保品附件1',
  `GUARANTEE_ATT2` varchar(100) DEFAULT NULL COMMENT '担保品附件2',
  `GUARANTEE_ATT3` varchar(100) DEFAULT NULL COMMENT '担保品附件3',
  `GUARANTOR_ATT1` varchar(100) DEFAULT NULL COMMENT '担保人信息附件1',
  `GUARANTOR_ATT2` varchar(100) DEFAULT NULL COMMENT '担保人信息附件2',
  `GUARANTOR_ATT3` varchar(100) DEFAULT NULL COMMENT '担保人信息附件3',
  `GUARANTOR_EXPLAIN` varchar(100) DEFAULT NULL COMMENT '担保说明',
  `SYS_CREATE_USER` varchar(20) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` varchar(20) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='担保信息表';

-- ----------------------------
-- Records of biz_guarantee_info
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_guarantor_info`
-- ----------------------------
DROP TABLE IF EXISTS `biz_guarantor_info`;
CREATE TABLE `biz_guarantor_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CREDIT_LIMIT_ID` int(11) NOT NULL COMMENT '额度申请ID',
  `CUST_ID` int(11) DEFAULT NULL COMMENT '会员ID',
  `GUARANTOR_NAME` varchar(50) DEFAULT NULL COMMENT '担保人名称',
  `GUARANTOR_PA_TYPE` varchar(2) DEFAULT NULL COMMENT '担保人证件类型',
  `GUARANTOR_PA_NO` varchar(20) DEFAULT NULL COMMENT '担保人证件号码',
  `GUARANTOR_AMT` decimal(16,2) DEFAULT NULL COMMENT '担保金额',
  `GUARANT_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '担保类型GUARANT_TYPE_CD1:多人分保3多人联保4单人保证5多人保证6',
  `GUARANTOR_NAME1` varchar(100) DEFAULT NULL,
  `GUARANTOR_ATT1` varchar(500) DEFAULT NULL COMMENT '担保人信息附件1',
  `GUARANTOR_NAME2` varchar(100) DEFAULT NULL,
  `GUARANTOR_ATT2` varchar(500) DEFAULT NULL COMMENT '担保人信息附件2',
  `GUARANTOR_NAME3` varchar(100) DEFAULT NULL,
  `GUARANTOR_ATT3` varchar(500) DEFAULT NULL COMMENT '担保人信息附件3',
  `GUARANTOR_NAME4` varchar(100) DEFAULT NULL,
  `GUARANTOR_ATT4` varchar(500) DEFAULT NULL COMMENT '担保人信息附件4',
  `GUARANTOR_EXPLAIN` varchar(100) DEFAULT NULL COMMENT '担保说明',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='担保品信息表';

-- ----------------------------
-- Records of biz_guarantor_info
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_income_detail`
-- ----------------------------
DROP TABLE IF EXISTS `biz_income_detail`;
CREATE TABLE `biz_income_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `INCOME_REL_ID` int(11) NOT NULL COMMENT '收益关联IDINCOME_TYPE_CD=0时保存债权ID',
  `INCOME_TYPE_CD` varchar(2) NOT NULL COMMENT '收益类型INCOME_TYPE_CD:债权0理财1',
  `INCOME_SOUR_TYPE_CD` varchar(2) NOT NULL COMMENT '收益来源类型',
  `INCOME_SOUR_REL_ID` int(11) NOT NULL COMMENT '收益来源关联ID',
  `INCOME_START_DATE` date NOT NULL COMMENT '收益起始日期',
  `INCOME_END_DATE` date NOT NULL COMMENT '收益截止日期',
  `INCOME_BASE_AMT` decimal(16,2) NOT NULL COMMENT '基数金额投资金额,计算收益基数金额',
  `TENDER_SCALE` decimal(8,6) NOT NULL COMMENT '投资占比',
  `INCOME_RATE` decimal(8,6) NOT NULL COMMENT '收益年利率',
  `INCOME_DAY` int(11) NOT NULL COMMENT '收益天数',
  `INCOME_AMT` decimal(16,2) NOT NULL COMMENT '收益金额',
  `INCOME_TENDER_AMT` decimal(16,2) NOT NULL COMMENT '回收投资金额',
  `INCOME_TAKE_AMT` decimal(16,2) NOT NULL COMMENT '收益抽成',
  `INCOME_DATE` date NOT NULL COMMENT '收益日期',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收益明细表';

-- ----------------------------
-- Records of biz_income_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_inner_account`
-- ----------------------------
DROP TABLE IF EXISTS `biz_inner_account`;
CREATE TABLE `biz_inner_account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ACCOUNT_TYPE_CD` varchar(2) NOT NULL COMMENT '账号类型',
  `ACCOUNT` varchar(50) NOT NULL COMMENT '账号',
  `ACCOUNT_BAL_AMT` decimal(16,2) NOT NULL COMMENT '账户余额',
  `FREEZE_BAL_AMT` decimal(16,2) NOT NULL COMMENT '冻结余额',
  `USABLE_BAL_AMT` decimal(16,2) NOT NULL COMMENT '可用余额',
  `WORK_ITEM_ID` varchar(255) NOT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员账户表';

-- ----------------------------
-- Records of biz_inner_account
-- ----------------------------
INSERT INTO `biz_inner_account` VALUES ('1', '1', '123', '1048.00', '0.00', '1048.00', '0', '1', '2014-04-06 21:40:53', '1', '2014-04-12 20:56:32');

-- ----------------------------
-- Table structure for `biz_job`
-- ----------------------------
DROP TABLE IF EXISTS `biz_job`;
CREATE TABLE `biz_job` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `JOB_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '职业状态JOB_STATUS_CD:在校学生0固定工作者1待业/无业/失业2退休3其他4',
  `JOB_COMPANY_NAME` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `JOB_DEPT_NAME` varchar(50) DEFAULT NULL COMMENT '所在部门',
  `COMPANY_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '公司类别COMPANY_TYPE_CD:国家机关0事业单位1英企2国企3世界500强4外资企业5一般上市企业6一般民营企业7个体经营者8其他9',
  `COMPANY_INDUSTRY_CD` varchar(50) DEFAULT NULL COMMENT '公司行业COMPANY_INDUSTRY_CD:制造业0IT1政府机关2媒体/广告3零售/批发4教育/培训5公共事业6交通运输业7房地产业8能源业9金融/法律10餐饮/旅馆业11医疗/卫生12/保健建筑工程13农业娱乐服务业14体育/艺术15公益组织16',
  `COMPANY_SCALE_CD` varchar(50) DEFAULT NULL COMMENT '公司规模COMPANY_SCALE＿CD:10人以下010~100人1100~500人2500人以上3',
  `JOB_POSITION` varchar(200) DEFAULT NULL COMMENT '职位',
  `JOB_EMALIL` varchar(200) DEFAULT NULL COMMENT '工作邮箱',
  `COMPANY_PHONE` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `COMPANY_ADDRESS` varchar(200) DEFAULT NULL COMMENT '公司地址',
  `JOB_YEAR_CD` int(11) DEFAULT NULL COMMENT '在现单位工作年限JOB_YEAR_CD:一年(含)以下01~3年(含)13~5年(含)25年以上3',
  `JOB_INCOME_CD` varchar(2) DEFAULT NULL COMMENT '月收入JOB_INCOME_CD:1000以下11000~2000 22000~5000 35000~10000 410000~20000 520000~50000 650000以上 7',
  `JOB_YEAR_INCOME_CD` varchar(2) DEFAULT NULL COMMENT '年收入JOB_YEAR_INCOME_CD:3-5W 15-10W 210-15W 315-20W 420-30W 530-50W 650W以上 7',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员工作信息表';

-- ----------------------------
-- Records of biz_job
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_loan`
-- ----------------------------
DROP TABLE IF EXISTS `biz_loan`;
CREATE TABLE `biz_loan` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LOAN_APPROVE_ID` int(11) NOT NULL COMMENT '借款发布ID',
  `LOAN_NAME` varchar(20) DEFAULT NULL COMMENT '借款名称',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `CONTRACT_NUM` varchar(32) DEFAULT NULL COMMENT '合同编号',
  `LOAN_AMT` decimal(16,2) DEFAULT NULL COMMENT '借款金额',
  `LOAN_BAL_AMT` decimal(16,2) DEFAULT NULL COMMENT '借款余额',
  `CURRENCY_CD` varchar(5) DEFAULT NULL COMMENT '币种CURRENCY_CD:人民币CNY',
  `EXCHANGE_RATE` decimal(8,6) DEFAULT NULL COMMENT '汇率默认1',
  `LOAN_TERM` int(11) DEFAULT NULL COMMENT '借款期限',
  `LOAN_DATE` date DEFAULT NULL COMMENT '放款日期',
  `LOAN_DUE_DATE` date DEFAULT NULL COMMENT '到期日期',
  `REPAY_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '还款方式REPAY_TYPE_CD:等额本息0等额本金1利随本清2按固定周期付息,到期还款3',
  `REPAY_CYCLE` int(11) DEFAULT NULL COMMENT '还款周期',
  `CYCLE_UNIT_CD` varchar(2) DEFAULT NULL COMMENT '周期单元DATE_UNIT_CD:天0月1年2',
  `TOTAL_PERIOD` int(11) DEFAULT NULL COMMENT '总期数',
  `REPAYED_PERIOD` int(11) DEFAULT NULL COMMENT '已还期数',
  `SURPLUS_PERIOD` int(11) DEFAULT NULL COMMENT '剩余期数',
  `LOAN_RATE` decimal(8,6) DEFAULT NULL COMMENT '借款年利率',
  `DELAY_RATE` decimal(8,6) DEFAULT NULL COMMENT '展期年利率',
  `OVERDUE_RATE` decimal(8,6) DEFAULT NULL COMMENT '逾期年利率',
  `TTL_PRINCIPAL_INTEREST_AMT` decimal(16,2) DEFAULT NULL COMMENT '借款总本息',
  `TTL_INTEREST_AMT` decimal(16,2) DEFAULT NULL COMMENT '借款总利息',
  `TTL_PENALTY_AMT` decimal(16,2) DEFAULT NULL COMMENT '累计产生罚息',
  `TTL_REPAYED_AMT` decimal(16,2) DEFAULT NULL COMMENT '累计已还款金额',
  `TTL_PLAT_REPAYED_AMT` decimal(16,2) DEFAULT NULL COMMENT '累计平台垫付金额',
  `EARLY_REPAY_DATE` date DEFAULT NULL COMMENT '提前还款日期',
  `EARLY_REPAY_AMT` decimal(16,2) DEFAULT NULL COMMENT '提前还款金额',
  `EARLY_REPAY_REASON` varchar(300) DEFAULT NULL COMMENT '提前还款原因',
  `REPAY_END_WAY` varchar(2) DEFAULT NULL COMMENT '还款结清方式正常还款，提前还款,平台垫款',
  `PAYMENT_WAY_CD` varchar(2) DEFAULT NULL,
  `TRUSTEE_CUST_ID` int(11) DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL COMMENT '备注',
  `LOAN_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '状态LOAN_STATUS_CD:未结清0结清1展期2逾期3平台垫款4呆账5',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `PRODUCT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_NAME` varchar(200) DEFAULT NULL,
  `LOAN_TYPE_CD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借据信息表';

-- ----------------------------
-- Records of biz_loan
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_loan_apply`
-- ----------------------------
DROP TABLE IF EXISTS `biz_loan_apply`;
CREATE TABLE `biz_loan_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` varchar(20) NOT NULL COMMENT '会员ID',
  `CUST_NAME` varchar(50) DEFAULT NULL COMMENT '申请人姓名',
  `JOB_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '职业身份',
  `SEX` varchar(2) DEFAULT NULL COMMENT '性别',
  `TEL` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `ADDR` varchar(200) DEFAULT NULL COMMENT '通讯地址',
  `LOAN_TYPE_CD` varchar(1) DEFAULT NULL COMMENT '借款类型LOAN_TYPE_CD:普通贷款0工薪贷1生意贷2',
  `LOAN_NAME` varchar(200) DEFAULT NULL COMMENT '借款名称',
  `APPLY_AMT` decimal(16,2) NOT NULL COMMENT '申请金额',
  `LOAN_TERM` int(11) NOT NULL COMMENT '借款期限',
  `TERM_UNIT_CD` varchar(2) NOT NULL COMMENT '借款期限单位DATE_UNIT_CD:天0月1年2',
  `LOAN_PURPOSE` varchar(100) DEFAULT NULL COMMENT '项目用途',
  `TENDER_TERM` int(11) DEFAULT NULL COMMENT '筹标期限(天)',
  `EXPECT_LOAN_RATE` decimal(8,6) DEFAULT NULL COMMENT '期望年利率',
  `REPAY_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '还款方式REPAY_TYPE_CD:等额本息0等额本金1利随本清2按固定周期付息,到期还款3',
  `APPLY_DATE` date DEFAULT NULL COMMENT '申请时间',
  `APPLY_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '申请状态APPLY_STATUS_CD:审批中0审批通过1审批不通过2',
  `PAYMENT_WAY_CD` varchar(2) DEFAULT NULL,
  `TRUSTEE_CUST_ID` int(11) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `PRODUCT_ID` varchar(20) DEFAULT NULL COMMENT '产品ID',
  `TEMDER_COUNT_AMT` decimal(16,2) DEFAULT NULL,
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款申请表';

-- ----------------------------
-- Records of biz_loan_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_loan_approve`
-- ----------------------------
DROP TABLE IF EXISTS `biz_loan_approve`;
CREATE TABLE `biz_loan_approve` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `LOAN_APPLY_ID` varchar(20) NOT NULL COMMENT '借款申请ID',
  `LOAN_NUM` varchar(20) DEFAULT NULL COMMENT '借款编号',
  `LOAN_NAME` varchar(50) DEFAULT NULL COMMENT '借款名称',
  `LOAN_AMT` decimal(16,2) DEFAULT NULL COMMENT '借款金额',
  `LOAN_TERM` int(11) DEFAULT NULL COMMENT '借款期限',
  `TERM_UNIT_CD` varchar(2) DEFAULT NULL COMMENT '借款期限单位DATE_UNIT_CD:天0月1年2',
  `TENDER_BAL_AMT` decimal(16,2) DEFAULT NULL COMMENT '竞标剩余金额',
  `TENDER_USE_AMT` decimal(16,2) DEFAULT NULL COMMENT '已投标金额',
  `TENDER_LIMIT_AMT` decimal(16,2) DEFAULT NULL COMMENT '最小投资金额',
  `LOAN_PURPOSE` varchar(200) NOT NULL DEFAULT '' COMMENT '借款用途',
  `TENDER_TERM` int(11) DEFAULT NULL COMMENT '筹标期限(天)',
  `TENDER_APPROVE_TIME` datetime DEFAULT NULL COMMENT '竞标发布时间',
  `TENDER_DUE_TIME` datetime DEFAULT NULL COMMENT '竞标截止时间',
  `LOAN_RATE` decimal(8,6) DEFAULT NULL COMMENT '借款年利率',
  `REPAY_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '还款方式REPAY_TYPE_CD:等额本息0等额本金1利随本清2按固定周期付息,到期还款3',
  `TENDER_TTL_COUNT` int(11) DEFAULT NULL COMMENT '总投标数',
  `TENDER_USE_COUNT` int(11) DEFAULT NULL COMMENT '已投标数',
  `TENDER_BAL_COUNT` int(11) DEFAULT NULL COMMENT '剩余投标数',
  `APPROVE_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '发布状态APPROVE_STATUS_CD:',
  `PAYMENT_WAY_CD` varchar(2) DEFAULT NULL,
  `TRUSTEE_CUST_ID` int(11) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `PRODUCT_ID` varchar(60) DEFAULT NULL,
  `PRODUCT_NAME` varchar(200) DEFAULT NULL,
  `LOAN_TYPE_CD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`,`LOAN_PURPOSE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款发布表';

-- ----------------------------
-- Records of biz_loan_approve
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_loan_intention`
-- ----------------------------
DROP TABLE IF EXISTS `biz_loan_intention`;
CREATE TABLE `biz_loan_intention` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` varchar(20) NOT NULL COMMENT '会员ID',
  `CUST_NAME` varchar(50) DEFAULT NULL COMMENT '申请人姓名',
  `JOB_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '职业身份',
  `SEX` varchar(2) DEFAULT NULL COMMENT '性别',
  `TEL` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `ADDR` varchar(200) DEFAULT NULL COMMENT '通讯地址',
  `LOAN_TYPE_CD` varchar(1) DEFAULT NULL COMMENT '借款类型LOAN_TYPE_CD:普通贷款0工薪贷1生意贷2',
  `LOAN_NAME` varchar(200) DEFAULT NULL COMMENT '借款名称',
  `APPLY_AMT` decimal(16,2) NOT NULL COMMENT '申请金额',
  `LOAN_TERM` int(11) NOT NULL COMMENT '借款期限',
  `TERM_UNIT_CD` varchar(2) NOT NULL COMMENT '借款期限单位DATE_UNIT_CD:天0月1年2',
  `LOAN_PURPOSE` varchar(100) DEFAULT NULL COMMENT '项目用途',
  `TENDER_TERM` int(11) DEFAULT NULL COMMENT '筹标期限(天)',
  `EXPECT_LOAN_RATE` decimal(8,6) DEFAULT NULL COMMENT '期望年利率',
  `REPAY_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '还款方式REPAY_TYPE_CD:等额本息0等额本金1利随本清2按固定周期付息,到期还款3',
  `APPLY_DATE` date DEFAULT NULL COMMENT '申请时间',
  `PROCESS_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '处理状态APPLY_STATUS_CD:审批中0审批通过1审批不通过2',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `REFUSE_REASON` varchar(255) DEFAULT NULL,
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `PRODUCT_ID` varchar(20) DEFAULT NULL COMMENT '产品ID',
  `TEMDER_COUNT_AMT` decimal(16,2) DEFAULT NULL COMMENT '最小份数金额',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款意向表';

-- ----------------------------
-- Records of biz_loan_intention
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_message_conf`
-- ----------------------------
DROP TABLE IF EXISTS `biz_message_conf`;
CREATE TABLE `biz_message_conf` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员id会员id',
  `MSG_TYPE_CD` varchar(2) NOT NULL COMMENT '提醒类型MSG_TYPE_CD:短信提醒0邮件提醒1系统消息2',
  `EVENT_TYPE` varchar(2) NOT NULL COMMENT '交易类型',
  `IS_ENABLE` varchar(2) NOT NULL COMMENT '消息模板代码',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提示消息配置';

-- ----------------------------
-- Records of biz_message_conf
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_payment_info`
-- ----------------------------
DROP TABLE IF EXISTS `biz_payment_info`;
CREATE TABLE `biz_payment_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` int(11) DEFAULT NULL COMMENT '客户id',
  `Mer_No` varchar(20) DEFAULT NULL COMMENT '商户号商户号',
  `Bill_No` varchar(100) NOT NULL COMMENT '订单号订单号',
  `Amount` varchar(190) DEFAULT NULL COMMENT '金额金额',
  `Return_URL` varchar(200) DEFAULT NULL COMMENT '返回地址返回地址',
  `Advice_URL` varchar(190) DEFAULT NULL COMMENT '后台返回地址后台返回地址',
  `Sign_Info` varchar(256) DEFAULT NULL COMMENT '签名签名',
  `order_Time` date DEFAULT NULL COMMENT '订单时间订单时间',
  `default_Bank_Number` varchar(7) DEFAULT NULL COMMENT '银行银行',
  `Remark` varchar(7) DEFAULT NULL COMMENT '备注备注',
  `products` varchar(170) DEFAULT NULL COMMENT '物品信息物品信息',
  `status` varchar(2) DEFAULT NULL COMMENT '状态状态',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间系统更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Bill_No` (`Bill_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值信息';

-- ----------------------------
-- Records of biz_payment_info
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_product`
-- ----------------------------
DROP TABLE IF EXISTS `biz_product`;
CREATE TABLE `biz_product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PRODUCT_NAME` varchar(50) DEFAULT NULL COMMENT '产品标题',
  `PRODUCT_DESC` varchar(200) DEFAULT NULL COMMENT '产品描述',
  `PRODUCT_NUM` varchar(50) DEFAULT NULL COMMENT '产品码',
  `PRODUCT_IMG_URL` varchar(200) DEFAULT NULL COMMENT '产品图片地址',
  `LEAST_RATE_YEAR` decimal(8,6) DEFAULT NULL COMMENT '最小年化利率',
  `MOST_RATE_YEAR` decimal(8,6) DEFAULT NULL COMMENT '最大年化利率',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of biz_product
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_recharge_card`
-- ----------------------------
DROP TABLE IF EXISTS `biz_recharge_card`;
CREATE TABLE `biz_recharge_card` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `BATCH_NO` varchar(32) DEFAULT '''0''',
  `CARD_CD` varchar(20) NOT NULL COMMENT '卡号',
  `CARD_PWD` varchar(32) NOT NULL COMMENT '密码',
  `AMT` decimal(16,2) NOT NULL COMMENT '金额',
  `START_DATE` datetime DEFAULT NULL COMMENT '有效起始时间',
  `END_DATE` datetime DEFAULT NULL COMMENT '有效截止时间',
  `RECHARGE_DATE` datetime DEFAULT NULL COMMENT '充值时间',
  `ACCOUNT_ID` int(11) DEFAULT NULL COMMENT '充值账号ID',
  `ACCOUNT` varchar(50) DEFAULT NULL COMMENT '充值账号',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '状态',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='欠款明细表';

-- ----------------------------
-- Records of biz_recharge_card
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_repay_detail`
-- ----------------------------
DROP TABLE IF EXISTS `biz_repay_detail`;
CREATE TABLE `biz_repay_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LOAN_ID` int(11) NOT NULL COMMENT '借据ID',
  `REPAY_PLAN_DETAIL_ID` int(11) NOT NULL COMMENT '还款计划明细ID',
  `ARREARS_DETAIL_ID` int(11) NOT NULL COMMENT '欠款明细ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `LOAN_APPROVE_ID` int(11) NOT NULL COMMENT '借款发布ID',
  `REPAY_DATE` date DEFAULT NULL COMMENT '还款日期',
  `PERIOD` int(11) NOT NULL COMMENT '还款期次',
  `REPAYED_PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '当期已还本金',
  `REPAYED_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '当期已还利息',
  `REPAYED_PENALTY_AMT` decimal(16,2) NOT NULL COMMENT '当期已还罚息',
  `TTL_REPAYED_AMT` decimal(16,2) NOT NULL COMMENT '当期已还总金额',
  `PLAT_REPAYED_PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '当期平台垫付本金',
  `PLAT_REPAYED_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '当期平台垫付利息',
  `PLAT_REPAYED_PENALTY_AMT` decimal(16,2) NOT NULL COMMENT '当期平台垫付罚息',
  `PLAT_REPAYED_AMT` decimal(16,2) NOT NULL COMMENT '当期平台垫付总额',
  `PLAT_REPAYED_DATE` date DEFAULT NULL COMMENT '平台垫款日期',
  `PLAT_REPAYED_FLAG_CD` varchar(2) NOT NULL COMMENT '平台是否垫款PLAT_REPAYED_FLAG_CD:是1否0',
  `REPAY_STATUS_CD` varchar(2) NOT NULL COMMENT '还款状态REPAY_STATUS_CD:未还0已还1展期未还2逾期未还3平台垫付4',
  `REPAY_WAY_CD` varchar(2) NOT NULL COMMENT '还款结清方式REPAY_WAY_CD:正常还款1提前还款2平台垫付3',
  `IS_INCOME_CD` varchar(2) NOT NULL DEFAULT '0' COMMENT '是否完成收益分配',
  `UNINCOME__PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '剩余可分配本金',
  `UNINCOME_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '剩余可分配利息',
  `UNINCOME_PENALTY_AMT` decimal(16,2) NOT NULL COMMENT '剩余可分配罚息',
  `TTL_INCOME_PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '总已分配本金',
  `TTL_INCOME_PENALTY_AMT` decimal(16,2) NOT NULL COMMENT '总已分配利息',
  `TTL_INCOME_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '总已分配罚息',
  `COMMENT` varchar(200) DEFAULT NULL COMMENT '备注',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='还款明细表';

-- ----------------------------
-- Records of biz_repay_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_repay_plan_detail`
-- ----------------------------
DROP TABLE IF EXISTS `biz_repay_plan_detail`;
CREATE TABLE `biz_repay_plan_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LOAN_ID` int(11) NOT NULL COMMENT '借据ID',
  `LOAN_APPROVE_ID` int(11) NOT NULL COMMENT '借款发布ID',
  `CUST_ID` int(11) NOT NULL COMMENT '会员ID',
  `VERSION` int(11) NOT NULL COMMENT '版本号',
  `PERIOD` int(11) NOT NULL COMMENT '当前期数',
  `LOAN_RATE` decimal(16,2) NOT NULL COMMENT '借款年利率',
  `START_INTEREST_DATE` date NOT NULL COMMENT '当期计息起日',
  `REPAYPLAN_DATE` date NOT NULL COMMENT '当期计划还款日',
  `PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '当期应还本金',
  `INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '当期应还利息',
  `PRINCIPA_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '当期应还总额（本息）',
  `TTL_PRINCIPAL_AMT` decimal(16,2) NOT NULL COMMENT '截止当期累计还本金',
  `TTL_INTEREST_AMT` decimal(16,2) NOT NULL COMMENT '截止当期累计还息',
  `LOAN_BAL_AMT` decimal(16,2) NOT NULL COMMENT '截止当期本金余额',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='还款计划明细表';

-- ----------------------------
-- Records of biz_repay_plan_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_trade`
-- ----------------------------
DROP TABLE IF EXISTS `biz_trade`;
CREATE TABLE `biz_trade` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TRADE_NUM` varchar(20) NOT NULL COMMENT '交易编号',
  `TRADA_TIME` datetime NOT NULL COMMENT '交易时间',
  `ACCOUNT_NUM` varchar(20) DEFAULT NULL COMMENT '资金账号平台账号',
  `ACCOUNT_BAL` decimal(16,2) NOT NULL COMMENT '资金账号结余',
  `TRADE_AMT` decimal(16,2) NOT NULL COMMENT '交易金额',
  `TRADE_TYPE_CD` varchar(2) NOT NULL COMMENT '交易类型TRADE_TYPE_CD:充值1提现2投资3',
  `COMMENT` varchar(200) DEFAULT NULL COMMENT '备注',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易记录表';

-- ----------------------------
-- Records of biz_trade
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `biz_user_online`;
CREATE TABLE `biz_user_online` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LOGIN_USER_ID` int(11) DEFAULT NULL COMMENT '登陆人ID',
  `LOGIN_USER_NAME` varchar(32) DEFAULT NULL COMMENT '登陆人姓名',
  `LOGIN_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '登陆方式LOGIN_TYPE_CD:网页端0Android端1IOS端2微信3',
  `LOGIN_IP` varchar(32) DEFAULT NULL COMMENT '登陆IP',
  `LOGIN_TIME` datetime DEFAULT NULL COMMENT '登陆时间',
  `LOGOUT_TIME` datetime DEFAULT NULL COMMENT '登出时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆信息表';

-- ----------------------------
-- Records of biz_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for `biz_withdrawals`
-- ----------------------------
DROP TABLE IF EXISTS `biz_withdrawals`;
CREATE TABLE `biz_withdrawals` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OUT_ACCOUNT` varchar(50) NOT NULL COMMENT '转出账号',
  `INPUT_ACCOUNT` varchar(50) NOT NULL COMMENT '转入账号',
  `TRADE_NUM` varchar(20) DEFAULT NULL COMMENT '交易编号',
  `TX_AMT` decimal(16,2) NOT NULL COMMENT '提现金额',
  `FEE_AMT` decimal(16,2) NOT NULL COMMENT '费用',
  `TX_DATE` date NOT NULL COMMENT '交易日期',
  `CTR_STATE_CD` varchar(2) NOT NULL COMMENT '状态CTR_STATE_CD:未生效0生效1',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `CUST_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现表';

-- ----------------------------
-- Records of biz_withdrawals
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `cms_catalog`;
CREATE TABLE `cms_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `type` int(11) NOT NULL COMMENT '栏目类型',
  `htmlFilePath` varchar(255) DEFAULT NULL COMMENT '静态页面地址',
  `isPublication` int(1) NOT NULL COMMENT '是否发布',
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `catalog_type_index` (`type`),
  KEY `catalog_ispublication_index` (`isPublication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_catalog
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_catalog_type`
-- ----------------------------
DROP TABLE IF EXISTS `cms_catalog_type`;
CREATE TABLE `cms_catalog_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `ftlFilePath` varchar(255) DEFAULT NULL COMMENT '模板地址',
  `sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_catalog_type
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendlink`;
CREATE TABLE `cms_friendlink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `url` varchar(255) NOT NULL COMMENT '友情链接URL',
  `logo` varchar(255) DEFAULT NULL COMMENT 'LOGO地址',
  `sort` int(11) NOT NULL COMMENT '排序',
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `cms_navigation`;
CREATE TABLE `cms_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `position` int(1) NOT NULL DEFAULT '0' COMMENT '位置(0:顶部;1:中间;2:底部)',
  `isblanktarget` int(1) NOT NULL DEFAULT '0' COMMENT '是否在新窗口中打开',
  `isvisible` int(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `nav_name_index` (`name`),
  KEY `nav_position_index` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_navigation
-- ----------------------------

-- ----------------------------
-- Table structure for `dual`
-- ----------------------------
DROP TABLE IF EXISTS `dual`;
CREATE TABLE `dual` (
  `DUMMY` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dual
-- ----------------------------
INSERT INTO `dual` VALUES ('X');

-- ----------------------------
-- Table structure for `jbpm4_audit_opinion`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_audit_opinion`;
CREATE TABLE `jbpm4_audit_opinion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `APPROVAL_USER_ID` int(11) DEFAULT NULL COMMENT '审批人用户ID',
  `APPROVAL_USER_NAME` varchar(32) DEFAULT NULL COMMENT '审批人名称',
  `APPROVAL_ROLE_ID` int(11) DEFAULT NULL COMMENT '审批角色ID',
  `APPROVAL_ROLE_NAME` varchar(32) DEFAULT NULL COMMENT '审批角色名称',
  `AUDIT_STATUS_CD` varchar(2) DEFAULT NULL COMMENT '审批状态代码',
  `COMMENT` varchar(1024) DEFAULT NULL COMMENT '审批意见',
  `REMARK` varchar(1024) DEFAULT NULL COMMENT '备注',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_audit_opinion
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_deployment`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_deployment
-- ----------------------------
INSERT INTO `jbpm4_deployment` VALUES ('120008', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('700001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1390001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1470001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1480001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1740001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1740002', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1740003', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1750001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1750002', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('1770001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('2000061', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('2000068', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('2070001', null, '0', 'active');
INSERT INTO `jbpm4_deployment` VALUES ('2160008', null, '0', 'active');

-- ----------------------------
-- Table structure for `jbpm4_deployprop`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`) ,
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`) ,
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_deployprop
-- ----------------------------
INSERT INTO `jbpm4_deployprop` VALUES ('120011', '120008', 'withdrawals_apply', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('120012', '120008', 'withdrawals_apply', 'pdid', 'withdrawals_apply-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('120013', '120008', 'withdrawals_apply', 'pdkey', 'withdrawals_apply', null);
INSERT INTO `jbpm4_deployprop` VALUES ('120014', '120008', 'withdrawals_apply', 'pdversion', null, '1');
INSERT INTO `jbpm4_deployprop` VALUES ('1470004', '1470001', 'limits_apply', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('1470005', '1470001', 'limits_apply', 'pdid', 'limits_apply-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('1470006', '1470001', 'limits_apply', 'pdkey', 'limits_apply', null);
INSERT INTO `jbpm4_deployprop` VALUES ('1470007', '1470001', 'limits_apply', 'pdversion', null, '1');
INSERT INTO `jbpm4_deployprop` VALUES ('1480004', '1480001', 'limits_loan_apply', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('1480005', '1480001', 'limits_loan_apply', 'pdid', 'limits_loan_apply-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('1480006', '1480001', 'limits_loan_apply', 'pdkey', 'limits_loan_apply', null);
INSERT INTO `jbpm4_deployprop` VALUES ('1480007', '1480001', 'limits_loan_apply', 'pdversion', null, '1');
INSERT INTO `jbpm4_deployprop` VALUES ('2000064', '2000061', 'loan_apply', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2000065', '2000061', 'loan_apply', 'pdid', 'loan_apply-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2000066', '2000061', 'loan_apply', 'pdkey', 'loan_apply', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2000067', '2000061', 'loan_apply', 'pdversion', null, '1');
INSERT INTO `jbpm4_deployprop` VALUES ('2000071', '2000068', 'pre_loan_apply', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2000072', '2000068', 'pre_loan_apply', 'pdid', 'pre_loan_apply-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2000073', '2000068', 'pre_loan_apply', 'pdkey', 'pre_loan_apply', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2000074', '2000068', 'pre_loan_apply', 'pdversion', null, '1');
INSERT INTO `jbpm4_deployprop` VALUES ('2070004', '2070001', 'pre_limits_loan_apply', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2070005', '2070001', 'pre_limits_loan_apply', 'pdid', 'pre_limits_loan_apply-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2070006', '2070001', 'pre_limits_loan_apply', 'pdkey', 'pre_limits_loan_apply', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2070007', '2070001', 'pre_limits_loan_apply', 'pdversion', null, '1');
INSERT INTO `jbpm4_deployprop` VALUES ('2160011', '2160008', 'loan', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2160012', '2160008', 'loan', 'pdid', 'loan-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2160013', '2160008', 'loan', 'pdkey', 'loan', null);
INSERT INTO `jbpm4_deployprop` VALUES ('2160014', '2160008', 'loan', 'pdversion', null, '1');

-- ----------------------------
-- Table structure for `jbpm4_execution`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`) ,
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`) ,
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`) ,
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`) ,
  KEY `IDX_EXEC_PARENT` (`PARENT_`) ,
  KEY `FK_EXEC_PARENT` (`PARENT_`) ,
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`) ,
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`) ,
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`) ,
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_execution
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_expand`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_expand`;
CREATE TABLE `jbpm4_expand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `WORK_ITEM_ID` varchar(255) DEFAULT NULL COMMENT '工作流ID',
  `APPLY_USER_ID` int(11) DEFAULT NULL COMMENT '申请人ID',
  `APPLY_USER_NAME` varchar(32) DEFAULT NULL COMMENT '申请人名称',
  `DEPT_ID` int(11) DEFAULT NULL COMMENT '所属机构',
  `DEPT_NAME` varchar(32) DEFAULT NULL COMMENT '机构名称',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '状态',
  `REMARK` varchar(1024) DEFAULT NULL COMMENT '备注',
  `HTML` longtext COMMENT '审批完成后历史内容',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IND_WORK_ITEM_ID` (`WORK_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_expand
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_grant_user`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_grant_user`;
CREATE TABLE `jbpm4_grant_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GRANT_USER_ID` int(11) NOT NULL COMMENT '授权用户ID',
  `GRANTED_USER_ID` int(11) NOT NULL COMMENT '被授权用户ID',
  `FLOW_KEY` varchar(255) DEFAULT NULL COMMENT '流程名称',
  `START_DATE` date NOT NULL COMMENT '开始日期',
  `END_DATE` date NOT NULL COMMENT '结束日期',
  `SYS_CREATE_USER` int(11) NOT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime NOT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) NOT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime NOT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务委托表';

-- ----------------------------
-- Records of jbpm4_grant_user
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_actinst`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`) ,
  KEY `IDX_HTI_HTASK` (`HTASK_`) ,
  KEY `FK_HACTI_HPROCI` (`HPROCI_`) ,
  KEY `FK_HTI_HTASK` (`HTASK_`) ,
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_hist_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_detail`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`) ,
  KEY `IDX_HDET_HPROCI` (`HPROCI_`) ,
  KEY `IDX_HDET_HVAR` (`HVAR_`) ,
  KEY `IDX_HDET_HTASK` (`HTASK_`) ,
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`) ,
  KEY `FK_HDETAIL_HACTI` (`HACTI_`) ,
  KEY `FK_HDETAIL_HTASK` (`HTASK_`) ,
  KEY `FK_HDETAIL_HVAR` (`HVAR_`) ,
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_hist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_procinst`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_hist_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_task`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`) ,
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`) ,
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_hist_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_var`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`) ,
  KEY `IDX_HVAR_HTASK` (`HTASK_`) ,
  KEY `FK_HVAR_HPROCI` (`HPROCI_`) ,
  KEY `FK_HVAR_HTASK` (`HTASK_`) ,
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_hist_var
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_group`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`) ,
  KEY `FK_GROUP_PARENT` (`PARENT_`) ,
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_membership`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_USER` (`USER_`) ,
  KEY `IDX_MEM_GROUP` (`GROUP_`) ,
  KEY `FK_MEM_GROUP` (`GROUP_`) ,
  KEY `FK_MEM_USER` (`USER_`) ,
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_user`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_job`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`) ,
  KEY `IDX_JOB_CFG` (`CFG_`) ,
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`) ,
  KEY `IDX_JOB_EXE` (`EXECUTION_`) ,
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`) ,
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`) ,
  KEY `FK_JOB_CFG` (`CFG_`) ,
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_job
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_lob`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`) ,
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`) ,
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_lob
-- ----------------------------
INSERT INTO `jbpm4_lob` VALUES ('120009', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D227769746864726177616C735F6170706C792220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232332C32312C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E794B3E8AFB7E68F90E78EB0222F3E0D0A093C2F73746172743E0D0A093C7461736B2061737369676E65653D22237B6170706C79557365727D2220666F726D3D222F70616765732F6170702F7061796F75742F7375626D69745769746864726177616C732E6A73662220673D223230302C3130302C39322C353222206E616D653D22E794B3E8AFB7E68F90E78EB0223E0D0A09093C7472616E736974696F6E20673D223132362C3132353A32392C2D313722206E616D653D22E692A4E994802220746F3D2263616E63656C222F3E0D0A09093C7472616E736974696F6E20673D222D33312C2D313422206E616D653D22E68F90E4BAA42220746F3D22E8B4A2E58AA1E7AEA1E79086E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B2063616E6469646174652D67726F7570733D22237B6175646974526F6C657D2220666F726D3D222F70616765732F6170702F7061796F75742F617070726F76616C5769746864726177616C732E6A73662220673D223230302C3230302C39322C353222206E616D653D22E8B4A2E58AA1E7AEA1E79086E5AEA1E6A0B8223E0D0A2020202020203C7472616E736974696F6E20673D222D33302C2D3922206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A2020202020203C7472616E736974696F6E20673D223335332C3232353B3335332C3132363A2D32392C2D313322206E616D653D22E98080E59B9E2220746F3D22E794B3E8AFB7E68F90E78EB0222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232332C3237392C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223130352C3236352C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '120008', 'withdrawals_apply.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('120010', '0', 0x89504E470D0A1A0A0000000D494844520000026E0000014E0802000000B08E06EF00002C9349444154789CEDDD7D7014E79DE0F1ADDA3FF39F53A9DA63B79C5CAEB6EA62C71B92AD759CAA6C8A6473E5A42E17C7716267BDD98D13C7C06EECB59D043B2F260801966CCB77C2C801DB10842D24215B080C0441240B245E040809904002460C0884D0EB441242AF0BF79B7E665A3D2F528F66A6E7D14C7F3FD545E6A5BB67A6E39AAF9E9E99EEBFB803000012F017BA9F000000E98D9402009010520A004042482900000921A5000024849402009010520A004042482900000921A5000024849402009010520A004042482900000921A5000024849402009010520A004042482900000921A5000024849402009010520A004042482900000921A5000024849402009010520A004042482900000921A5000024849422A3DCBE7DFBBF0C535353933390BBD43C32B3EEE70B201390526408155129E5F8F8F8E8E8E8C8C8C8CD9B378723C88D7297CC20B3C9CC041540E24829D29E19D1B1B13129E5AEA3056B36FFF3BFBFFCF7FFFCABBBBFFBF34F7CE7B98FCB2417E4AADC28777D78A4A0BFBF7F707050669645082A80049152A4316B448786070B3E78FAA9ECBF7B74D982FFC8F98757DFFBB7F2DABC46EFDEEB375B65920B72556E94BB6406994D66BED1DDE5F3F9082A80049152A42BD5D18989895BB76E15EDCB5ABCEA733F5E71CFDA6D4BCE771FF14D75CC32C90C329BCC2C8BBCB72FABA7A74746A8B212591535051007528AB4A43A3A3E3E3E3232B2FA0F8F3EFEEB4FE5972E9EBDA091932C220BCAE29D9D9D030303B22A592135053057A414E9C7EC68579FF78537FED7D3AF3C50776EDB5C3BAA2659501697955CF036F7F5F50D0F0F53530073454A9166CC8E4AF62481BF5AF760F7E885F83AAA26595C5622ABBA72E54A6F6F2F35053057A41469467D3E3A3232B26AD3F76540996047CD9ACAAA64855253199BCACAD5E7A6BA5F2B80F4404A914E64A438393979EBD6AD2D952F3DFEEB4FC5BD5F37EA9E5E5961E1DE973A3A3A060606E421E481189802880529453A9191E2D8D898EFCFFD4FADFA5CACDF339A9CC3B79064B5E75A5B3A3B3B070707E58118980288052945DA5043D29B376FE6972DF9F18ACFF48DB7F78D5FEA9D6897A94FFE1DBFE4BF3AEEBFE0BF3CA126B9EB92718B7F6659A457AE4EA819FC0BFA6F9F08DE387149562B2BF7783C3D3D3DF2400C4C01C48294226D0486A43EDF4F577EF6F59227BB6EB55EB74C72B56BC4F8575D1D316E57B78CB475DD6AEB0ACE363DFFADC03CE65559ADACBCB9B9F9EAD5ABF2400C4C01C48294223D9843D2B29A57BFBF6C41C3E53F5E1E6C32A653F2EF157579C87F415DBE32D4149861E8949AE7B2FF965357FCD3F4CCE60C578C451ABC7B64E525D539172F5E64600A2046A414E941FD0066707030EB9D8797ACF9FCF9BE23E7FB8F5E5053DF11359DEF93CBEA96A3E7FD937163BF71D998D3F8F78871BB71D5BC575D95BBFA8FC8CA57BCF3704B4BCBB56BD7E4E1D40F6374BF7A00F31A29457A909E8D8E8EF6F7FBBF7024356DBEF151739731DDF8E84C70326EAC961BCF747D1498E14675B3BA5D5DE832663366F02F12BCD03CBDF847D251798893274F7ABD5E79387950520A6076A414E9616A6A6A6464A4B7B7F7B117FF66C3AE9F375CFD63C3D53DC6BFFEE9A4BAD061DE28FFEE3969DC72522EABDB3BD43CE652C15B2C37CACCB272798863C78E793C1E793879507968DDAF1EC0BC464A911ED407A5DDDDDD0F3FFF89EDF5FFF7C8A5ED47BC15472E551CF54E4FFE5BBCDB8F7AB7AB0B4702376E97998D19D45DEAAA9A02B39973CA8DB2727988C3870F9F3F7F5E1E4E7D5CAAFBD50398D74829D283F46C7878B8ABABEB3BCF7DBCEADC965ACF3699EA8C7F03172EAAAB65C6D5B2BA8B65A1F7CAEDFE5BD48D7517CDC5CB0257FDF3FB67A83EBB451EA2AEAEAEB5B5551E4E1E949402981D29457AB0A6F44F2D7F3870A1E4C085E2E0541272F5A2FFEAC10BC5072F16AB0B072E16FBAFAA1B03F307EFBD586C5D8FCCB3BF65B33C446D6D2D29051023528AF460A6F4E1E73F517638D79FC08B25812E5E5481943AAAA69604235AA2EE5597031D0DB6F360B0B2817902CB166F3B942B0F21293D77EE1C2905100B528AF460A6F4B117FE665DC5CFD4BED93A8FB9DB36B07B56EDDDADF54CEFDD3567A89D9E4DCD604EDB2C17B6C9CAE521482980D89152A40733A53FCDBEEFB71BBE65FDB6D1D1CB215F3E8A7ECBECB75B2659B93C043B7801C48E94223D98295DBEE1FF3CB5EAEFCC9FC1A85FC29C347F0F635EBE367DFBC9F0D9F69EF44F7F0C9F8C4564E5F2107CED0840EC4829D283F96398F7F6677DFF97FFED605B49F38D9AE0E11702538BE5DFE0BD352DE60C5D35D38B040FEF103C92438DBAA5B6B544565EB8F777FC180640EC4829D2837988068FC7F393AC7B73DFFB61E0188181630706A6E9A309F687DE1B7135702841CB5D728BAC5656BE77EF5E0ED1002076A414E9C13C70A0D7EBCD2BFEF113BFFB9F9787D431E8CDC3D99FF25FF64FC1ABC6BD811BD5E1ECFD93FF96C08243C6D1EDD5BDFE959C92D5CACAABAAAA38702080D89152A407F370F6D7AE5D6B6E3EFDD3ECFBA479E649D3BA42CEB6D6163C7B5A9B79F634E396B6E0E5E973AE056E34CEC5262B94D5EEDAFD616D6D2D87B307103B528AF4609E64ADA7A7E7E2C58BEFEC5AF6F8AF3F75B0B9D83877F72575DE6FFF89BE83E7F7362EB7F759CE0A6E9C27DC721AF009756FE00CE1075B8A65856F7FB86CDFBE7DC78F1FE7246B0062474A9136CC537F5FBD7AB5B9B979E5C6479E7EE581EED10BBEA98E04275989AC4A56B86BD72E199272EA6F0073424A9136AC03538FC7D3D0D0B06CED3FFD6ADD83D16A7A654E1D9595C8AA2A2A2AAAABAB65B5B27286A40062474A914ED4C0747070B0B3B3B3B5B5B5EE78952450069475E7B6C5331E9DEC9005657159C9CEBDDBF6EFDF5F5F5F2FAB9595CB433024051023528A74A206A6B76EDD1A1818E8E8E8387BF6EC912347B2373EF2F8AF3F955FBA78AE2995456441597CFBF6EDFBF6ED9355C90A65B5B272790886A40062444A916664A4383131313232D2D7D777E5CA9596961649E0A6DD2F3EB5EA733F5E71CFDA6D4BCE771F99BDA03283CC2633CB221B77BD58515121E3515989AC4A5628AB9595CB433024051023528A34232345F5C398E1E1E1DEDE5E899F0C25EBEBEBAB3FAACADFB6E4A7D9F73DBA6CC17FE4FCC3ABEFFD5B796D5EA377EFF59BAD32C905B92A37CA5D3283CC2633976FFF60D7AE5DD5D5D5B2B8AC4456252B94D5AA1FC03024051023528AF463ADA90C223B3A3A5A5B5B1B1A1A6A6B6BF7EDDB5752F5F2AA4D8F2E5DF3F7FFFCABBBBFFBF34F7CE7B98FCB2417E4AADC2877C90CE5E5E51251995916910565715989AC8A8E02880329455A326B3A3232323030D0D9D9E9F1789A9B9B8F1F3F2E75ACAAAADABB77EFEEDDBBA5971F7EF8E14E835C90AB72A3DC2533C86C32B32C220BCAE2B21259151D051007528A74A56A3A313171EBD6ADC1C1C19E9E9EAB57AF5EBC78B1A5A5E5E4C993C78E1D3B7CF8705D5D5DAD855C951BE52E994166939965115950169795A8CF47E92880B922A54863AAA6939393636363376FDEF4F97CD2C56BD7AE79BD5E196B9E3F7FBED570CEA02ECB8D7297CC20B3C9CCB2882C288BCB4AE82880F89052A4BDB0A0CA10B3BFBFBFB7B7B7BBBBBB2B82DC2877C90C321B11059014A41419C20CEAF8F8F8E8E8E8C8C88894723882DC2877C90C321B11059014A414194505554C4D4D4DCE40EE52F310510049414A01004808294586DBB16387EEA70020C3915264B8ACAC2CDD4F01408623A5C870A41480D34829321C2905E034528A0C474A01388D9422C39152004E23A5C870A41480D34829321C2905E034528A0C474A01388D9422C39152004E23A5C870A41480D34829321C2905E034528A0C474A01388D9422C39152004E23A5C870A41480D34829321C2905E034528A0C474A01388D9422C39152004E23A5C870A41480D34829321C2905E034528A0C474A01388D9422C39152004E23A5C870A41480D3482932D39A356BB2426DD8B041F793029099482932D3D6AD5BAD1DDDB973676969A9EE27052033915264A61B376E646767AB8EAE5EBD7AD3A64D5EAF57F793029099482932564141814A695959197B77013887942263353535AD5CB952A5F4C48913BA9F0E808C454A91C972727224A5F9F9F9939393BA9F0B808C454A91C9F6EFDF2F29ADACACD4FD44006432528A4C2683D1ECECECE1E161DD4F04402623A5000024849402009010520A004042482900000921A5000024849402009010520ACD6EDFBEB3E774C7EF76342CCADB2DD35F2E7D7B9E4F0FE4EC90E7F96CE9D1ADF59E91F129DDDB0F807EA414DAF4DF1C7FF183E3773D5FA8BD8E894C3FDA7CC0D33DA47B5B02D08994428FA27ACF826545AA460B57952FAF68D8D77C5DA681A1A95BA377E6F3A49EE76BFBCE9863E88F3DB34946D532BC06E04EA414A926C979B6F4A88AD0836BF7365DF669AF63DC536BE7D0636F55ABD7F2D0EFF7CB385BF7D605A0012945AAA98ECA486E5DD539ED2D4CD63855EDA696712A6353C0854869066AAB587FA8CFBC5CD116E5E63B77FA0EADB75E8D7283238AEA3DAAA3921FED094CE224636BB5BFFAC50F8E3BBD0D01CC37A4340319CD9432665954B4C90D66552DE18CBCD0569165993199AE0D8CA8DEBC7DF0BCF6F8257D3AD8D62D7F22C8AB3B79D9F1BF4800CC2BA434D3040BEAAF61DFA1436DF24F45B0906656EF4C87565537F86F9BDCEE5047EF0477ED3EF4E67EEDD973685A5ED1A076F33AB50501CC4BA43403451D955618BB77034353EBBEDEB019CD0E27DBC8F8941AB4A5F5F78C669F0686A6D4B0BBF10A0353C0454869060AFD505409ECBE5577C9BFEBD70707A56D213B7ED5AC4EA4B4FCA4578DD8B407CFD169F17B75F23257EC6C48FE1604305F91D20C64ECCA5D2FC350CB28B3AD4DC6A5D6CF4BAD9F91A66454BAB4C8DF9855BB9BB4D7CED1E9C3C60E79999F5F5D9EFC2D0860BE22A599C60863605FAED94AF5C1E9FAC05E5ECBC7A62AB9291995AA031A64D8177723A72EDFB8BCCC05CB8A92BF0501CC57A43403B5053F160D1D65FA6F08F98834B5A3D24FFFA6441AD3DA39A4BD764E4FEA23E1E46F4100F31529CD40664A4346A5C658347A4A53322A5587044AF67101EB7372EB436FE92C5E92574B4A01A41029CD40D146A57DC6AF5C2C8761302E1EAAC8AA38145E4E877E57AA521A779F3C254B179774CE74BBFCBB289AC0227579810B97DE5F1C368751E2DA5CCB22B979E1F32C79DF3397A7AA5E69F2B72080F98A94661A23A081CF46A7879D15E6977A835FEF353E2F0D7E86DA16B86BFAB7A6C97F620EA5D43F0CCDB5A62EDAA8D49A52EB2836E46A7D8E4AA6DC18D2CEE0EDA414C00C4869C60A0E3B9D4AE35CCD3DA512C5A843CD6823C5C8E1A621A7CE3AE2CCAB9D61541A35A5B5B94B8B2F915200F648295224AE94AA98458C4A03B50BB43674B49AB451A9D3296D6F6FDFB871636969690A363E00479152A48803293533593FE3F855CD169867C651A9F5A3D69C12C7537AF8F0E1BCBC3CF393EC94FD5F00C021A4541B199144FC08254314161646BE5EA776F006479CB5B9FEDDB996C5CD04AAF54C577986296C546A8E6E9396D2E1E1E1F2F2F2D5AB57876D2EE7FF5B03E02C52AA4D7E7EBECFE7D3FD2C52C7C9516920A5D1726BACA4C4986786CF5383550E4B697D4EE0AEA4A574CD9A355AFEB249D0860D1B52FF5F0B905E48A936A434E9299D61546AF9AC74747A6DA13347A45416C9CD5B3CC788CE9E52F9BFBBAAAAEAD5575F7DE38D3756AD5A65B62AF5FF5FCCC9FC7F868076A4541B529ABC1DBCEFE72CCACB893E2A0D4D69F07B46211F8ED605536A7E7AAA6A6A063BECCB4AF1A654999C9C6C6A6A5AB76EDDDAB56B25ABF33F54F3FF1902DA91526D48695246A54614FD1F6AC6302A9DFEC66FD8A854ED1C368FE7A05678CB99949ABC5EEF071F7C909B9B9B828D9F08520AD822A5DA90D2394D331FA2613A87813AFA5B389DC6602665E41A9821FCD048964CFA679EBE3A3D2C8ED81B9C8494A60B520AD822A5DA90D24C9D4829E036A4541B529AA9132905DC86946AE3B6942E5856E49293ACA957AA7B7B270D29056C91526D366EDC78F5EA55DDCF22751EC8D9218139D8D6AD3D754E4FF232EF7A3ECA412AD21429056C91526D0A0B0BBD5EAFEE67913A3F78BB5A1AF3F6C1F3DA53E7E874ACBD4F5EE63D2BCA746FEFA421A5802D52AA8DDB52FA66CD3969CC636F556BAF9DA3D3F28A0679994B8BEA746FEFA421A5802D52AA8DDB52DADE33248DF9D8339BBC3D23DA83E7DCB47055B9BCCC3D673A746FEFA421A5802D52AA8DDB522A1EFAFD7EC9CC7F961CD51E3C87A6778F78E4052E5856746B7C4AF7C64E1A520AD822A5DAB830A5272FF7A981E9B1F63EEDD94BFAD4E51B57DFDD7DB3E69CEE2D9D4CA414B0454AB571614AC58FFE704062F3E9DF9464D86EDE81A1A94579BBE5A53D90B3E3F66DDD5B39A94829608B946AE3CE948E8C4FA95FC5DCB3A2ACE9B24F7B029332C97854755446A5ED3D43BAB771929152C01629D5C69D29159EEEA185ABCBD58F2FD7559DD31EC204A7B2135EB55F575ECEC92B7DBAB76EF29152C01629D566C78E1D4D4D4DBA9F851E2363538F193F3355C3D3E5150D69F7E9696BE7D06BFBCEA8EFEBCA247F1C64DE785421A5802D52AA8D9B532A6EDFBEB3FB74877454A5484D6A7837CFA7C8E7FCFA9FCE64D8E7A356A414B0454AB571794A15295079A37769515D5A44D43ADDF57CE1139B0F6CADF764D2EF5EA222A5802D52AA0D29455A20A5802D52AA0D29455A20A5802D52AA0D29455A20A5802D52AA0D29455A20A5802D52AA0D29455A20A5802D52AACDEEDDBB4F9C38A1FB5900364829608B946A5363D0FD2C329F8CFE753F85F4464A015BA4541B529A1A9420416C40C01629D58694A6062548101B10B0454AB521A5A9410912C406046C91526D48696A508204B101015BA4541B529A1A9420416C40C01629D58694A6062548101B10B0454AB521A5A9410912C406046C91526D8E1E3D5A5959A9FB59643E4A90203620608B946AD3D4D4C4D10352801224880D08D822A5DA90D2D4A00409620302B648A936A43435284182D880802D52AA0D290DD156B1FE509FFF42DFA1F559A12ADA22E6F6CF14E5E668284182D880802D52AA0D290D614DA9359261572DF3670516B0E1A212F8FFC0B0FB8324F20EBB3F5B5CB401817891526D48A949B238FD563E43042CF3C45E013F979520F027C68C7F90C8A519FF0489FE678BCB3620100F52AA0D290D31D75169CCDC5982D946A5A414483652AA0D290DE14F699BFFADDCE6B3D2904F4963F9C8D49D25B01D95866DE6E06DA414880729D5C6EBF5161616EA7E16F3847A63B7FBF033F0F66F992DB0DB77B605DD5302EBD6B11D955AB319EDB669EED98040DC48A936A4D4E47F273F5411F8882FEAE7A0729FBF9AC61BFDF42ECAE0578F661D9CBAAB04C1FDE4AA8AE65EF3905C925220D948A936A43484E55D5F99E5435295CE18BFC3EBAE1284A634F0D7469BFF0F948AB6BEBE3E76F0028E20A5DA90D210115F3BB2BED747BCC11B3B76F9314CA4B094FAFFE7D0F44F64EE302A051C414AB521A521020D98FE3834FAFBBAF5E3527599AF1D5905531AFA2172E80F4EF9062F906CA4541B526A52EFFBFECF4B83650CFFCCD4D89D1BFD0B46C11F9CCE1408179520B829641B465631F46F95999052201EA4541B529A1AEE29817D2C5563199502C9464AB521A5A9410912C406046C91526DAE5EBDBA71E346DDCF22F3518204B101015BA4541B9FCF979F9FAFFB59643E4A90203620608B946A434A53831224880D08D822A5DA90D2D4A00409620302B648A936A43435284182D880802D52AA0D294D0D4A90203620608B946A434A53831224880D08D822A5DA90D2D4A00409620302B648A936A43435284182D880802D52AACDE8E8686E6EAEEE6791F9284182D880802D52AA136F5229C0464E101B10B0454A75E24D2A05D8C809620302B648A94EBC49A5001B39416C40C01629D58937A914602327880D08D822A53AF12695026CE404B101015BA45427DEA49CB366CD9AB0F35E6FD8B041F7934A4BFC570AD822A53AF126E59CAD5BB75A3BBA73E7CED2D252DD4F2A2DF15F29608B94EAC49B94736EDCB8919D9DAD3ABA7AF5EA4D9B3679BD5EDD4F2A2DF15F29608B94EA949797373C3CACFB5964AC82820295D2B2B232F6EEC68D9402B648A94EF9F9F93E9F4FF7B3C8584D4D4D2B57AE54293D71E284EEA793AE4829608B94EA444A9D969393232590ED3C3939A9FBB9A42B520AD822A53A9152A7EDDFBF5F4A505959A9FB89A431520AD822A53A9152A7C960343B3B9B0FA413414A015BA45427528AF98F9402B648A94EA414F31F29056C91529D4829E63F520AD822A53A151414F4F6F6EA7E16C06C4829608B94EA545858C8217830CF9152C01629D5899462FE23A5802D52AA132915B76FDFD973BAE3773B1A16E5ED96E92F97BE3DCFA7077276C8F37CB6F4E8D67ACFC8F894EEEDE738520AD822A53AB93CA5FD37C75FFCE0F85DCF176AAF6322D38F361FF0740FE9DE960E22A5802D52AA939B535A54EF59B0AC48D568E1AAF2E5150DFB9AAFCB343034756BF4CE7C9ED4F37C6DDF19730CFDB16736C9A85A86D719899402B648A94EEE4CA924E7D9D2A32A420FAEDDDB74D9A7BD8E714FAD9D438FBD55AD5ECB43BFDF2FE36CDD5B37F94829608B94EAE4CE94AA8ECA486E5DD539ED2D4CD63855EDA696716AE68D4D4929608B94EAE4C29416D57B5447253FDA1398C449C6D66A7FF58B1F1CD7BD8D938C9402B648A94EA5A5A5ADADADBA9F45EA5C1B1851BD79FBE079EDF14BFA74B0AD5BFE44905777F2729FEE2D9D4CA414B0454A75DAB16347535393EE67913A6AD7EE436FEED79E3D87A6E5150D6A37AFEE2D9D4CA414B0454A7572554A47C6A7D4A02DADBF6734FB343034A586DD8D573267604A4A015BA4542757A5B4FCA4578DD8B407CFD169F17B75F23257EC6CD0BDBD93869402B648A94EAE4AE9D2227F6356ED6ED25E3B47A70F1B3BE4657E7E75B9EEED9D34A414B0454A7572554AD5010D32EC8BBB9153976F5C5EE6826545BAB777D29052C01629D5C95529FDF46F4AA431AD9D43DA6BE7F4A43E12D6BDBD93869402B648A94EAE4AA93A24D0FC3F2E20290D434A015BA4542717A634D09B4BEF2F5E342DA76EBA439E92A5D6ABB746EB73162D2DBE3473BAEAF2162DCAAB9DBEA5B378897585FEABD30F949BB7285CE4CAC3D610FA6496BCEFB1DC529B1B654EF54A756FEFA421A5802D52AA535555555D5D9DEE679122E129CDAD8FDACEB0ABD2AA68CCFE4968432D59BA38E4AA513EF3E1A4BBC685E0A348358D55D545263644F02985A7D4F89BC01A72520AB81129D5A9C6A0FB59A4489494D6E52D2EE934AA1659447FB1FC1DCDCDCB096D9571637DC86509A131BFACCA18A1FAD7163258B4A6346A958D6732D3C0D752F7404A8D078A10AC2C2905DC8694EA444A8329B50EF2021594DB83790BA6D172AF65EF6E0CA349DB5169443B23CA6ADD511C5844421E982DB4C4A414701B52AA13290D4B696DEED29CDCA5E19F3ECEFCC16A2CA349CB2EE2A5C525337F563A7395A71F3138FC0D2F7DE85E5F520AB80D29D5899486A4D418325AC68BE13B4EC33F3D0DECE68DD8391C59DC5846A5962A5B47A5A1A58F9ADA583F2B2D2C2CCC4A43B9B9B9A9FFAF05482FA4542797A754152BD0AAE0F77722BEC16B3BFA8CF82A50E4176B2DDF728A0CA4EDBE624BE9F3421F6BBAC4D6FA66D8A814802D52AA93CB53AA8217FCDAD1749382910BF91D4BF4BDB2338F4A43E609A634EAD785CC52CE3E2AADCD35BED064D9C1BBC8F29C1759524D4A01B721A53AB937A58104E6E5E4FA6B641D44461B95867D3948AE5AF7A9461995AA8F5D43521A1AD77846A5D38FE58FB7F52B51612366520AB80D29D5C9C529F58F388D02857F8736CABED9B00F3E8D06C79CD2C0D0362C9C51536AFB5969E863A935CBA318172CCF8194026E434A756A6A6ADAB16387EE679122D6944EFF8C44F5C9BF77D4DC9D1BCCA41A269A89B27C8F37741418C30EDE883584882871B41FC384A4D4F8FE51E8FA2D5FEE25A580DB90529D5C9BD2CC9E4829E036A45427529A91132905DC8694EAE4AA942E5856E49293ACA957AA7B7B03481D52AA93AB52FA40CE0E09CCC1B66EEDA9737A929779D7F385BAB73780D421A53AB92AA53F78BB5A1AF3F6C1F3DA53E7E874ACBD4F5EE63D2BCA746F6F00A9434A7572554ADFAC39278D79ECAD6AEDB573745A5ED1202F7369915BCE9D07E00E29D5CB55296DEF1992C67CEC994DDE9E11EDC1736E5AB8AA5C5EE69E331DBAB73780D421A53AB5B6B6969696EA7E16A9F3D0EFF74B66FEB3E4A8F6E03934BD7BC4232F70C1B2A25BE353BA373680D421A53A79BDDEC242177D3FE5E4E53E35303DD6DEA73D7B499FBA7CE3EABBBB6FD69CD3BDA501A41429D5C96D29153FFAC30189CDA77F539261BB790786A616E5ED9697F640CE8EDBB7756F6500A9454A7572614A47C6A7D4AF62EE5951D674D9A73D814999643CAA3A2AA3D2F69E21DDDB1840AA91529D5C9852E1E91E5AB8BA5CFDF8725DD539ED214C702A3BE155FB75E5E59CBCD2A77BEB02D08094EAE4CE948A91B1A9C78C9F99AAE1E9F28A86B4FBF4B4B573E8B57D67D4F77565923F0E188F02AE454A75726D4AC5EDDB77769FEE908EAA14A9490DEFE6F914F99C5FFFD3193E1F05DC8C94EAE4E6942A52A0F246EFD2A2BAB488A875BAEBF9C227361FD85AEFE1772F0048A94EA41400320029D5A9B7B7B7A0A040F7B30000248494EAE4F3F9F2F3F3753F0B00404248A94EA41400320029D5899402400620A53A915200C800A45427529A02EE398D1D005D48A94EA43405B2B2B2743F0500198E94EA444A53809402701A29D58994A6002905E03452AA196FF44E630B03701A29D563CD9A3559A1366CD8A0FB496526520AC069A4548FAD5BB75A3BBA73E7CED2D252DD4F2A339152004E23A57ADCB871233B3B5B7574F5EAD59B366DF27ABDBA9F94567D87D667AD3FD4A72E44AA689379DA2A8C3922B455A8FBA322A5009C464AB52928285095282B2B63EFAE41921868A55C927C1EF25735A49ED1A3494A0168454AB5696A6A5AB972A54AE9891327743F9DF9C3C868D451A9BA57DA1A7516EB5C16A41480D348A94E393939F2469F9F9F3F3939A9FBB9CC1FE618D3BCD07768FDCCA3CE3B8C4A0168464A75DABF7FBFBCD1575656EA7E22FAA90F488D9DB9338E4AD51DC10F542DF124A500B422A53AC960343B3B7B787858F713991F02DF2A9A75543AFDCD234B3F492900AD4829E68DE994CEFC29A8F54BBC6661492900AD4829E68DB98D4A431624A5003422A59837A2A5B4420D51CD7E86A6D41CC0CEF2AD24520AC069A414F3435B5833A3E9B37C392966A41480D348A94EB767A0FB7969101C6DCEF48B51FFC033384FF4E321F1BB5200BA90D29452A5FC2FC3D4D4D4E4E4E44404B951EE52F3B8B6AC49444A01388D94A688195129E5C8E050FBF193676B6A0FBCB3A5E6ADCD6A3AB567FF8523C77C7DFD232323A3A3A36363632AAB04353E9C7B0740CA9052C7991195821E7EB764E3E34FFEF2AF3FF3DCC7FF7BD449EE7AE7911F4A627B6EDC181E1E96AC4A53096A1C38F70E809421A5CE5211951CCAB8F3A57BBF684DE62BFFF88DFC6F7CB7E8A96764920B72D59A589979CF1B1BFA7A7A2383AAFB35A507CEBD03206548A98354473B4EB7ACF9D2D755205FF8E467373FB1F4F4BB5B472F5E9CEAE8089BE4C6C62DC53283D9D4D5F77FED6C4D6D7F7FBF04757474746262829AC68E73EF00480D52EA14D5D1537BF6AB2E3EFF89FF51FAB35FF89A4E4516347292D964A82A8BA8F1EB81ADDB7A7A7A06070765784A4D63C7B97700A406297584D951954319955E3B58174B44AD932CB2F20B5F5119AE2A2AB97EFDBACFE7A3A673C2B97700A400294D3ED5D1B335B5AAA3EF3CF2C3A8BB73639964C182877EA06A2A63536A3A579C7B07400A90D224531DED3A7FF1854F7E5612F8C6B71E9DB87C39BE8EAA49167FFDC187D5E7AC8D076AA9E99C70EE1D0029404A934CDA363A3ABAFAFEAF49FC567EE12B37CFB526D25135C94AD4B77F572CFCF2F9B6B6EEEEEEC1C1417914E904290500ED486932A921E9AEFF5720D9FBF95FFD6D1C9F8FCEF2B9A9AC5056FBDE6F577ABDDE9E9E1E19698D8D8D31300500ED486932A9E330A85DBBD2BCC8220E9F3DF7AAF1C398A227FE3DF25EB951EE921964B6C87B4B7FF60BB59BF74C63634747477FBFFFB848EAC7A6BA5F3700B81A294D1A35243DF0CE16153C5FD3A9718F67BCBDDD98E482476E7935F803535553B9712C3883EAA89A6436DF2959BCDD7FAFC798DA3D43A79BD5EF6ACA72F23C1ECFF5EBD70707071998028076A43469A4673246CCFFC677FD997CEA9991B367C3266B47D5B4E5F127E5761983CA85B0BB64E6C8356C7E62A9FFA7355FF9664B4B8B75604A4A67C2B97700A400294D1AB57757FD00E67451B1AFA1C1D770C2F8B7C177C23F453DE8AE4434B2A36AFAF389C08281F59C6838FDEE56F5C39886FA633230EDEEEE1E1E1E565FE5D5FDEAE70BCEBD0320F54869D2C8FBF28523C7D4F189BA0F1E8C9CDE79E487331DC53E729299A3AE447DF968D796A2F36D6DD67DBCBA5FBD7E91E7DE69FE538DF5DC3B729573EF007002294D1A19E81CD9562E9D7BE51FBF71AD72AF7FDA5B1998829763ACA9CC16650DC6557538DFB29C3CEB3E5E7968DDAF5EA7B99E7BE7ADEFFDAB24B6BBB39373EF00480A529A1CEA83D28FD66F5221BCB47DFB4CD386FFFDBDD93B2A33CCB2F81BDF7A547D3DF8F4E9D35EAF978F4BADE7DE597ECFFDE1E7DEF9E623454F3E2D935C083BF78ECC5CB9763DE7DE019038529A1CF2FE3B3131A1522AA3A20BC525D35349F185E2E20B25EAB2FC5B3C4B4DE52EFFCCC5C517CD05D58592C05535AE95943636367A3C9E9E9E1E75E42377064075B4F36CDBF4B977EEBE77F3134BECCEBDB3C46CEAAAFBBF7AB6F630E7DE019008529A1C2AA5D5C194B66ED932CB347B4A675F362CA5E6378F5CF8EE1F3867C0AECA38CFBDF3E4D39C7B07405290D2E4B0A6B4E0A11F0407949661A57F842A83CBD986A4D303D3E07834303635A7E212F5631B526A76D43CF74EE7DC8F2D75B5E6A08C4A5586ABB76CEDEAEAE2F8C600E2404A9343A5D4FCDA51DC1F94DA7E5CAA8EEE5B9693E7E694AA8E36FFA94675F4ADEFFD6BB2CEBD434D01C4819426874AE9D99A5AB5C3F0EA9E3D81EFDC5AA6B9FE18C6FAD55F7541566BFE18C6B529353F1FFDD5A7EE934D91FFCD479276EE9DBBEF6D3C504B4D01CC15294D0E95525F5FBF1A271D2BD810F993D0999239536223D720AB55E3A79AEA6AD77EED489D7B47ED98CD5AF8E59B67CF460D644FFDF19A9CD765C0BAEEC187D554F4E4D3B201A39F7BE7ECD9ACFBBEA456C8B97700CC15294D0EF56318A99A1ADF6C7E62A93A50D19F2DFFE61AFB66ADD396C79FF4359C907B230F782433078F9774C2BCB0D1986DCD97BE7EF8F06177FE18460D49F7BDBEEE39E3DC3B513F1F952E4A35671AEECB5856121BB95467F0DC3BEFBE94CDB97700CC09294D9AA9A92919C7EC79C33F707CE1939FED3D5A1F7604DDFE63C7AD87E15507E05553D86178A5A33273D8E2B242F555D54D2FBC242975E7211AD47118D4AEDD0F7FF9DBC8227654D5A87B679F64B41A399CAD78F605B59B9773EF009813529A34EA4001DD9D9DEA246BA53FFB85FFCC30FE499D19C67F8217DFA953E649D6C6DADBC7023378D4E95FCC93ACF94F0B639C4C46EE0ACCD3DE5EF4D433EA83D8AACACAE3C78FB7B6B6BAEDC08121E7DEB9FBDEA1D3CDC113EF0426EF1F2B63E9A89A643B872D6E9E7BE7FD975FF3783C5D5D5D9C7B07402C4869D2A8940E0F0FEF58FD9ADAFD2823A444BE0E1336D852BB1F373CFD0B19925ABF73E4AA94FACFBDF3CD47FC7F8B3CF9B40C2BC3A6C873EFCC3EC9B836640D2D67373FB1E439CEBD03608E4869D2981F97F6DCB8B1F20B5F9177E4150BBF1CF524DE739D64252FDDFB4559A1FC5B535D2D435277BED1CF7AEE9D13FB96AF9A5347D5240359599673EF004804294D1AF360B0838383678F1E53BB795F7FF0E1C47FAAF1CAD7BFAD3E7FDDB5A5487DE1C89DA7FEB69E7BA7E7E0C1B0C97A00DED82719DD86ADC77AEE9DCECE4E57ED4207101F529A4CF2862B23181929CA78F1C8B672357ECAFFC677E31E9BCA82EA2BC1B2AA92D7D7D6D6D6363636B6B6B69A4352570D986639F78EFA99501C9304D8FF23E08873EF94E6E5BBF38B5D00E2404A93C91C980E0F0FF7F4F41CD8BA4DD5F4A57BBF786DEE87B59345D47E5DB3A36AD7AE3B7FAAA1F69FD7BCB5597DFF36EC20501FFEF2B7F1A554A6B055A9CF62DF7D29DB9D3F37021007529A64EA1D7F7474747070B0BBBBBBAAA844EDE9FDF95FFDEDE627960E9D6E8E25A2329BCCACF634FEF2AF3F63EDA8FA00CF850710083B6180E510C7FEA9E85F7E12774A0FE7E65957259D562975ED413000CC15294D32353055BB797D3EDFF5EBD71B0FD4AE58F865F5AE2D5D940C346E291E6F6F8F2CA8DC287759CF5C2DA3D25D5B8AAC1D9515BAF3B076B39F7B27C1945A57159652171E9A11C05C91D2E48BACE9F9B6B6B29C3C353C359BBAFAFEAFBDFEE0C332FA94492EC855EB89A965E64D2FBC54535DAD7EFAE2F28EDE893CF74EE8A8541D5D21BE296C55E60E5E520A2046A4D411613595B7E3CB972F9F696C94A04A35D59EDBA893DCF5CAD7BFFDDE6F575655564A4465307AFAF4E9D6D656595C56E2DA8EDEB13BF74E225F3B0A5B953ABAEFFB2FBF464A01C488943AC55AD3C1C1C19E9E9E8E8E0E796B96F16543FDB1AAA2923D6F6C90649A53C9EB6B776D2952C3D0E30689A81A8CCA829C983A70EE9DDAC3CFCD70EE9D387F0CF32F3FE1DC3B0012444A1D64D674747454DE8EFBFBFBE57D5905F57C5B5B8B417AD96871DA20B7CB0C2AA2B2882C288BCB4A5CDBD13BD1CEBD13F67BD0F80ED120C350EB4A38F70E8038905267A99A4E4E4E8E8D8DC93BB219D4EBD7AF4B262F5FBEECF57A3D1672556E94BB64061551351895C5D571D55DFB861E71EE9D25D1CEBDF3D53975B4E2D91738F70E80C49152C7DD3684055502393030206FD33D866E83BA2C37CA5D3283CC16165197BF9B4F4D4DC906A95CBBFE39E370F6BD47EBC38EC1EBD9B12BF6C3D9AFFDA76FDF6C09599C73EF00880F294D116B50272626545395610BF34699416623A256D3E7DEB9FBDEE7D4B977424FEDA24E0EA34EE23DFBE41FD4369D0A5B569DE554566E9E7B870307028805294D2933A842063A2AAB61E446B94BCD4344AD544A470687DE7F79B673EFC8F87296DFC648688F156CE0DC3B00928894EA747B06BA9FD73C653DF78EFAC94AD6C22FDF6C093F83B719D49A9CD765A0B9EEC187D5247D6DDC521C7DE696B36A2CBBFC9EFBDD7CEE1D00F121A5481BE1E7DE3176F326F3DC3B77DF6B3DF70EA7FE061023528A7412FDDC3BDF7C44C6A0F175541634CFBD539A97AF7ED4EBDA73EF00880F29453A99E9DC3B59F77DA973EEE7DE9145D4811D54475D7EEE1D007123A5483361E7DE919AAA3DBDC6B97796CCF4D169B473EF2C51DF3392C5AD1D75EDB97700C48D9422CD841DDFB8ABABABF1406D56BCE7DE91E16CD8B97764856E3ED63180389052A49FC89A9E6F6B7BFFE5D7ACC7679058AEBAFFABC6B97796C82417E46AC8B977EEBE37F2DC3B7414401C4829D2D24CE7DE29CDCB8FE5DC3BEFBE94CDB97700240B2945BA9AE5DC3B278ED6576DDDB67DDD7A49A639C955F3DC3B3203E7DE01902CA41469CCF6DC3BEA4C3B9C7B0780A34829D2DB4CE7DEE9ECEC9CFDDC3B3203E7DE019014A414698F73EF00D08B94224370EE1D00BA90526414CEBD0320F548293219E7DE019002A4140080849052000012424A010048082905002021A4140080849052000012424A010048C8FF0749880C55A477F8CE0000000049454E44AE426082, '120008', 'withdrawals_apply.png');
INSERT INTO `jbpm4_lob` VALUES ('1470002', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D226C696D6974735F6170706C792220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232342C31372C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A093C2F73746172743E0D0A093C7461736B2061737369676E65653D22237B6170706C79557365727D2220666F726D3D222F70616765732F6170702F6C696D69742F6372656469744C696D69744170706C792E6A73662220673D223230302C3130302C39322C353222206E616D653D22E5AEA2E688B7E7BB8FE79086E5B297223E0D0A09093C7472616E736974696F6E20673D223132362C3132353A32392C2D313722206E616D653D22E692A4E994802220746F3D2263616E63656C222F3E0D0A09093C7472616E736974696F6E20673D222D33312C2D313422206E616D653D22E68F90E4BAA42220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C696D69742F6372656469744C696D69744170706C79417070726F2E6A73662220673D223230302C3230302C39322C353222206E616D653D22E9A38EE68EA7E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657231222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336372C3232373B3336372C3132353A2D32382C2D3822206E616D653D22E98080E59B9E2220746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A09093C7472616E736974696F6E20673D222D33322C2D313222206E616D653D22E9809AE8BF872220746F3D22E59088E8A784E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C696D69742F6372656469744C696D69744170706C79417070726F2E6A73662220673D223230332C3239312C39322C353222206E616D653D22E59088E8A784E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657232222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336382C3331383B3336372C3232363A2D32382C2D313122206E616D653D22E98080E59B9E2220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A09093C7472616E736974696F6E20673D222D33302C2D3722206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232362C3337392C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223130332C3235352C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '1470001', 'limits_apply.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('1470003', '0', 0x89504E470D0A1A0A0000000D494844520000024D000001AB0802000000526D340D00003AC749444154789CED9D7D7015D77DB03BD33FF39F33994949A74DD3C9CC1B27699D769A3A334986B67EC7C9BC7DE33A6EE3D44D1BA74E8036766D27C1CE8709428808DB725E6170906D0860EB0B1959C240108A1481C4874042B21020615DF90A8110121237D245E8D3F0FEEE3DF7AEF67EE98B7BF7ECC7F3CC99EBBDBB67CFDD3D5A9F87DFD97376FFE0360000807BF903DD070000009041F01C0000B8193C0700006E06CF0100809BC1730000E066F01C0000B8193C0700006E06CF0100809BC1730000E066F01C0000B8193C0700006E06CF0100809BC1730000E066F01C0000B8193C0700006E06CF0100809BC1730000E066F01C0000B8193C0700006E06CF0100809BC1730000E066F01CB88D5BB76E7D10666666663A05B249E591CCBA8F1700320B9E03F7A00C271A9B9C9C1C1F1F1F1B1BBB71E346300159299B24836493CCD80EC0DDE039700386E12626264463FB4E6CD9B0E35FFFEB177FFDAF3FFE93AFFFE023FFF4D48725C9827C9595B2E99DE35B86878747464624B3EC82ED005C0C9E03676336DC687064CB9EC7BF97FD17DF58BDECBF73FFE68537FFA3BC3EAFC57FF0CA8D0E49B2205F65A56C920C924D325F1DE80F0402D80EC0C5E03970304A72535353376FDE2C3C94B562FD5F7E67EDDD9B76AFBC30703C30D33B47920C924D32CB2E6F1ECA1A1C1C94D84E0A91A2501D80CBC073E05494E4262727C7C6C6727EFD8D477EF2F1FCD21573EB2D31C92EB2A3ECDED7D777FDFA75294A0A4475006E02CF81233124D73FE47FE6E5FFFDF8F3F7369CDFBD58C9A9243BCAEE52C87BFEF6A1A1A1603088EA00DC049E03E761484E9C247EFAF1E6FB07C6DF5B9AE45492DDA51029EAE2C58BD7AE5D4375006E02CF81F350F7E4C6C6C6D66FFF1709C5EE507286EAA42829505427519D14AEEED5E93E5700B853F01C380C89B1A6A7A76FDEBCB9ABEAB9477EF2F125775726EDC09402771E7CAEB7B7F7FAF5EBF213F2438474004E07CF81C390186B626222F0FBE1EFADFFCB850E3C995EC4B01429F67CC7D9BEBEBE919111F921423A00A783E7C049A860EEC68D1BF9652BBFB3F6534393DD4393EF5F9BEA9634249F93EF87BE4E861642CB532AC9A6F7C36B429965976BF2754A6508ED185A3F155D39F5BE142B85FB7CBEC1C141F921423A00A783E7C0494482B940E0BBEB3EF352C963FD373BAE98927CED1F0B7FAAAF63E1F56ACD5867FFCDCEFE68B6D9FC3723798CAF52AC14DEDEDE7EE9D225F921423A00A783E7C03118C15C59DD0BFFB27A5973CF6F7A465AC3E95DF9BCA89647430B6AF9E2686B24C3E8BB2A4F4F68CDBB17436936B391E162789766FF0129BCA436B7ABAB8B900EC005E039700C6A2EC1C8C848D6EB0FAEDCF0B90B43C72F0C9F784FA5A1E32A5D189265B5E6C485500AAF1C0E2F8773863F8F87D787BF1A5BD557D9347C5C0A5FFBFA8367CF9EBD7CF9B2FC9C9A63A0FBEC016089E039700C229BF1F1F1E1E1D00814515DFBD5DFB5F787D3D5DF9D89A6F0CA5A5979A6FF77910C576BDBD57AB5D01FCE16CE10DA25BAD03EBBFBEF4472F213A74F9FF6FBFDF273F2A3780EC0B9E039700C333333636363D7AE5D7BF8D93F2ED8F783E64BBF69BE7420FC194AA7D542AFB1523E0F9C0EAF392DCB6A7DAFCA63EC155D635A2999A570F98993274FFA7C3EF939F951F969DD670F004B04CF81635037E70606061E7CFA236F37FEF2F8FB6F1FF7571C7FBFE2847F3685D6F8DF3EE17F5B2D1C8FAC7C5B328733A84DEAAB4A916C464E592985CB4F1C3B76ECC2850BF273EA169DEEB307802582E7C031886C82C1607F7FFF3F3DF5E19AF3BBEA7DBB2535843F230B5DEA6B59F86B59435759EC56591F5AA356367419BB9745BE86F28732D49EDB253FD1D0D0D0D1D1213F273F8AE7009C0B9E03C760F6DC6FCFFEFAF07B2587DF2B8EA69298AF5DA1AF47DE2B3ED255AC160E771587BEAA9591FCD1AD5DC5E672244FF5D91DF213F5F5F5780EC005E039700C86E71E7CFA2365C73686FCD45512915697B297A84B09AF246AB812B5552D47241715DB91A802237922FB16EF3EBA517E423C77FEFC793C07E074F01C3806C3730F3FF3C79B2BBEAFBA1C1B7C466F64A4D751755AD6FB663B2D8D0CF5B3D9540623ED362DEC96C2E527F01C803BC073E0180CCF7D37FBB33F2BF847F3F093133D31A35192AF997BBD2949E1F213F45B02B8033C078EC1F0DC9A82FFFBBDF57F61CC2850930A4E1B530B8CE5CBB3EB4FC7673B783A947E139FC2BB48E1F2138C43017007780E1C8331AFE0CDEAAC7FF9D11F1DE92C69BF5A179D031E49674D9FD1AD75678D0CFD75B3BB44E79847A793D7A935F51D2552F8CE833F675E01803BC073E0188C79E23E9FEF3FB33EBDF1CD6F451EF11579F45724CD3E0C6C38766BC2D7C893C04C9B648D142B851F3C789079E200EE00CF8163309EFBE5F7FBF38ABFF3E8CFFF57CFA87AF8B2F11CE77743CBA114FD1ADE1A59A99EE31C4AA135911D47C38F75565B4385BC2BC54AE13535353CF70BC01DE039700CC6739C2F5FBEDCDEDEF6DDECCF8A908CF7ECF4C7BCA0A733FAC29D4EE3853BE1359DD1E5D9D7F44456865FDF23054AB1FBF6BF535F5FCF739C01DC019E03C760BC97677070B0ABABEBF57DAB1FF9C9C78FB417875F94FABE7AC96AE8ADAAD197A98697BB874CAF600DBF94D5F4CED529B535F23AD623678BA5C0D7DE597DE8D0A153A74EF15E1E007780E7C04918EF59BD74E9527B7BFBBA6D0F3DFEFCBD03E3EF05667AEF304921529414B86FDF3E09E678CF2A806BC073E024CC219DCFE76B6E6E5EBDE91F7EBCF9FE64AABBB828C9492152544545456D6DAD142B8513CC01B8033C070E4385742323237D7D7D1D1D1D0DA76AC44F128A359CDFBD94486EBA577694DDA590BD07775757573736364AB152B8FC04C11C800BC073E030544877F3E6CDEBD7AFF7F6F69E3B77EEF8F1E3D9DB1E7AE4271FCF2F5DB158CFC92EB2A3ECFEF6DB6F1F3A74488A9202A558295C7E82600EC005E039701E12634D4D4D8D8D8D0D0D0D5DBC78F1ECD9B3E2A7EDFB9FFDDEFABFFCCEDABB37ED5E7961E0F8DC7A930C924D32CB2EDBF63D5B515121919C142245498152AC142E3F413007E002F01C380F89B1D41C83603078EDDA35319304618D8D8DB5BFABC9DFBDF2BBD99FFDC6EA65FF9DFB372FBCF91FE5F5792DFE83576E74489205F92A2B659364906C92B9FCED3DFBF6EDABADAD95DDA510294A0A9462D55C028239001780E7C091985527E1576F6F6F4747477373737D7DFDA143874A6A7EB17EFB37566DF8EB7FFDF19F7CFD071FF9A7A73E2C4916E4ABAC944D92A1BCBC5C0C27996517D951769742A4282407E032F01C38154375636363D7AF5FEFEBEBF3F97CEDEDEDA74E9D1275D5D4D41C3C7870FFFEFD22B377DE79676F185990AFB252364906C926996517D951769742A4282407E032F01C3818A5BAA9A9A99B376F8E8C8C0C0E0E5EBA74A9ABABEBECD9B3A74F9F3E79F2E4B163C71A1A1AEA4DC85759299B24836493CCB28BEC28BB4B21EA9E1C92037013780E9C8D52DDF4F4F4C4C4C48D1B3702818048EBF2E5CB7EBF5FA2B40B172E7484391F462DCB4AD92419249B64965D6447D95D0A417200EE03CF811B88B39D0467C3C3C3D7AE5D1B1818E84F4056CA26C920D9301C80EBC173E01E0CDB4D4E4E8E8F8F8F8D8D89C68209C84AD92419241B8603703D780EDC86B29D303333339D02D9A4F2603800D783E7C0FD545656EA3E0400D0069E03F7939595A5FB1000401B780EDC0F9E03F032780EDC0F9E03F032780EDC0F9E03F032780E5C4E2010C8CFCFD77D1400A00D3C072E07CF01781C3C072E07CF01781C3C072E07CF01781C3C072EE7D2A54BDBB66DD37D1400A00D3C072EC7EFF7EFDCB953F751008036F01CB81C3C07E071F01CB81C3C07E071F01CB89CAEAEAEC2C242DD470100DAC073E0725A5B5B795F018097C173E072F01C80C7C173E072F01C80C7C173E072F01C80C7C173E072EAC2E83E0A00D0069E039783E7003C0E9E039783E7003C0E9E039783E7003C0E9E039753555575E2C409DD470100DAC073E0722A2B2B5B5B5B751F05006803CF81CBC173001E07CF81CBC173001E07CF81CBD9B3674F7B7BBBEEA300006DE03970393B77EEF4FBFDBA8F0200B481E7C09D6CD8B0212B96828202DD0705001AC073E04E8A8A8ACC92DBBB776F6969A9EE8302000DE039702757AF5ECDCECE56925BBF7EFDF6EDDBE9BD04F026780E5CCB962D5B94E70A0B0BE9B404F02C780E5C4B6B6BEBBA75EBC4734545454D4D4DBA0F0700F480E7C0CDE4E6E6AE5FBFFE97BFFCE5F4F4B4EE6301003DE0397033D5D5D512D2EDDDBB57F781008036F01CB81909E3249E1B1A1AD27D2000A00D3C0700006E06CF0100809BC1730000E066F01C0000B8193C0700006E06CF0100809BC173A0995BB76E1F68EBFD7965F3F2BCFD92FE70D56B364FF7E656CA713E597AA2A8D1373639A3BBFE00601EF01C6863F8C6E4B37B4EDDF5F44EEDEABA93F4ED1D877D03A3BAEB12005282E7400F858DBE65AB0B952AEE595FBEA6A2F950FB1549D747676E8EDFB67352C7F9E2A13346F4F9A127B64B3C2A812900D8103C0756233E78B2F48432C4FD9B0EB6F604B4AB6BC9A9A36FF4E1576BD5B93CF0AB6A895075D72E00C483E7C06A94E42406DA5C735EBBA8D215E1A9DE5789F088EA00EC069E73219D155B8F0E19CB159D4956DFBE3D7474ABF96B921519A1B0D1A724276ED0EEA73426894A5537ECB37B4E65BA0E016051E0391712169A682BCB4445A7AC309467B25AE24267459629633AB97C7D4CC9E0B52317B49B29EDE948E780F85BCEEE740F8F8D06B01178CE6D44F51652D5D0D1A39DF25111D597E1BCDBB316544A8C7E76CAFA0C49EE76B4C7F28157AAB53B2943694D45B3EABDCC540D02C0E2C1732E24693C5711EEB58C0475E62ECCB88C8624D3CDD8E48C0A771C3DF064EE747D744605AC2D1709E900EC029E7321B137E214915E49B5493EB76E8D86739D31FD992A6B263C577EDAAF621DED36CA685AF166839CE6DABDCDE9AF4100581278CE85847B28B74A00678ACF3A3B25A233DFA333DF97B3249E5B551812C0FAFDADDA5594D1F44E4BAF9CE6E772CAD35F8300B024F09CDB085B2BD24569884CDDACDB1AE9BC34DDAA533EB4249E53B3AA5D36CC3231F50726E53497AD2E4C7F0D02C092C0732EA4337A2B2E363E0BAD88B92D676D3CF7899F9688003AFA46B5AB28D349DD864C7F0D02C092C0732EC4F05C4C3C178EE2927BCE92784E3D34C4FE8FF5C273002E03CFB99064F1DC5078C280692E7878F1684556C5D178AD6568FE9CF2DCC254D157BC72796EC3BC795615BFBFD84D91C20D7237E62D8F27C9BEBE92552B4AFA16E83975A6E9AF4100581278CE6D84ED16B91F371BB055184330A38331C3F7E8A2F7ED3A239B66E7D4A5FFC0E6F1DCFB6FAD48108E9924DA6BC85BBEF22D5F6251B27E63636421965957C9CF1979C20B62B2F04FCC3AB27EE3EC8FC678CED817CF0138013CE75AA2015BA6BCB558E6F75CAC78E2C2A9887212D4354BC47922AABCFAE41E35AD37FF5C8A784E3C97927478AEBBBB7BDBB66DA5A5A516543E8097C17360110BE9B74CAE1673D0D69097A2FFB031379CCD14969942C090CC62E5B780786EC9695ECF1D3B762C2F2FCFE855B6EC4F00E04DF01C58C47C9E6BCC0D392DAFB864D56CB414F253AC75E6F1DCECBDB74836D51DBAF12DB55E99CF64D355C525A9E2B998DB7873A977C19E0B0683E5E5E539393971A35BADFF5B00780A3CA78D82828284F1FC2E61E7CE9D89E7BB887128465F6262F7E0FCFD96D1104D192E564821C3A932E78FE754FF675C2FA8B26924765CACE7366CD8A0FB2F9359E492CEFCFF37008B06CF6923CB63FF909FD373B1C1534C3C17A3B1D4E31EA3EE493538252E258C2599BD05387B4861C3857C69984F2D2CD1738140A0A6A6E685175E78F9E597D7AF5F6FE8C1FABF458670D3B9809BC073DAF05AA3B080782E4557A1492A09364A5D82EC9518FC1945453D270526FE6034B0332239D5A76AF4A02ED1738AE9E9E9D6D6D6CD9B376FDAB4499CE7A6CBC04DE7026E02CF69C36B8DC2C23C973806C42C95146329E74BF51B138A8D4C63985D9F329E8B86742B561AD312EEC873067EBF7FCF9E3D1B376EB4A0F2ADC16B973438053CA70DAF350A6988E7924D3948DE2719EBB058CFF599C7A4CCDB6F190EF894F0423B8655971ECFB90FAF5DD2E014F09C36BCD628DC793C97242C4B6A4A953FC5C4F398DB7BA926A747866EE6D5C79B551D219E4B8ED72E69700A784E1B5E6B1416F3DC2F3BA4647DA4730C04C573DEBBA4C129E0396D78AD51709AE7969EF01C80ADC073DAF05AA3B06C75A147DECBA3CE54777D6BC06B973438053CA70DAF350AF7E6564AEB7FA47340BB87329DE434EF7A3AC94C79D7E3B54B1A9C029ED386D71A856FBE562B0278EDC805ED1ECA683AD93D24A779F7DA32DDF5AD01AF5DD2E014F09C36BCD628BC52775E04F0F0ABB5DA5594D1B4A6A2594E73556183EEFAD680D72E69700A784E1B5E6B14BA074745001F7A62BB7F704CBB8D3297EE595F2EA779E04CAFEEFAD680D72E69700A784E1B1E6C141EF855B538E07F4A4E68B75186D21BC77D7282CB5617DE9C9CD15DD91AF0E0250D8E00CF69C3838DC2E99E2115D29DEC1ED2EEA4B4A7FEC0A41A69F94ADD79DD35AD070F5ED2E008F09C36BCD9287CFBD787C5049FF86989CB7A2FAF8FCE2CCFDB2FA7766F6EE5AD5BBA6B5913DEBCA4C1FEE0396D78B351189B9C51130CEE5E5BD6DA13D0EEA7B42489E494E4249EEB1E1CD55DC7DAF0E6250DF607CF69C3B38D826F60F49E9C7235C96C73CD79ED96BAC354D6E457DD95723AA72F0EE9AE5D9D78F692069B83E7B4E1E546616C62E6E1F0743A15D8ADA96876DC1DBB8EBED1170F9D51A32B2589B9BD1CC929BC7C49839DC173DAF078A370EBD6EDFD6DBD2239E50995546064F39478CC2FFDF68C67EFC999F1F8250DB605CF698346E176D876E52DFE55850D8E309C39DDF5F4CE47771C2E6AF479730A4152B8A4C19EE0396DD02880CBE092067B82E7B441A3002E834B1AEC099ED3068D02B80C2E69B027784E1B340AE032B8A4C19EE0396DD02880CBE092067B82E7B441A3002E834B1AEC099ED3068D8235545656EA3E04AFC0250DF604CF698346C11AA867CBA0AAC19EE0396DD0285803F56C195435D8133CA70D1A056BA09E2D83AA067B82E7B441A3600DD4B36550D5604FF09C366814AC817AB60CAA1AEC099ED3068D823550CF964155833DC173DAA051B006EAD932A86AB027784E1B340AD6403D5B06550DF604CF698346C11AA867CBA0AAC19EE0396DD0285803F56C195435D8133CA70D1A056BA09E2D83AA067B82E7B441A3104367C5D6A343A185A1A35BB362A9E84CC81DCA94647532A867CBA0AAC19EE0396DD028C460F69CD960715F4DF9B3223BCC03F56C195435D8133CA70D1A050371D66CEC96229E33E549418AF88E7AB60CAA1AEC099ED3068D420C8B8DE7160CF56C195435D8133CA70D1A8518429EEB0C396D9EFB733177E616729B8E7AB60CAA1AEC099ED3068D820925B7F96EB8451468CA16E9CD9C6B47EAD932A86AB027784E1B340A0647B76E3D7A34DC6F9918CC65454516525A38761B0A650F7B2D3A1665CEB08E7AB60CAA1AEC099ED3068D420CC6FDB92873DC98535E5BE0884BEA3939A14A9C6F2A47AA7F76A418F94355833DC173DAA0518821611C8AB98D4D105EB8BF927905774AE49F0A2987FECC86CE8924F97708550DF604CF698346218688E7666FC1258FE7CCB7E8D432E350EE98B9E2393C07CE07CF698346C1408D2609DDA38BB6B0F12D6FB89732F98893E8C4BA540D32F53C2FF3C673717F8EE83A3C07CE00CF698346C11AA8E7A49887AECE1BCF999D966C5D04AA1AEC099ED3068D823550CF2989DE1355CA328D0432B90CCF81F3C173DAA051B006EA3925B19E8B0C4BE90C0577159D434343F45B824BC073DAA051B006EA3925719E0BFDE7E8EC6C83DBC473E012F09C366814AC817A4E49D473B1637C6227D631DE129C0F9ED3068D823550CFC9898E531559252A2B7696472AF01C38033CA70D1A056BA09E9332BFC9940089E7C0F9E0396DD0285803F56C195435D8133CA70D1A056BA09E2D83AA067B82E7B441A3600DD4B36550D5604FF09C366814AC817AB60CAA1AEC099ED3068D823550CF964155833DC173DAA051B006EAD932A86AB027784E1B340AD6403D5B06550DF604CF698346C11AA867CBA0AAC19EE0396DD0285803F56C195435D8133CA70D1A056BA09E2D83AA067B82E7B441A39051366CD810F71CAB828202DD07E572B8A4C19EE0396DD0286494A2A222B3E4F6EEDD5B5A5AAAFBA05C0E9734D8133CA70D1A858C72F5EAD5ECEC6C25B99C9C9CEDDBB7FBFD7EDD07E572B8A4C19EE0396DD028649A2D5BB628CF959595D16969015CD2604FF09C366814324D6B6BEBBA75EB94E79A9A9A741F8EFBE192067B82E7B441A36001B9B9B952CFF9F9F9D3D3D3BA8FC5FD7049833DC173DAA051B080EAEA6AA9E7AAAA2ADD07E209B8A4C19EE0396DD02858808471D9D9D9C16050F78178022E69B027784E1B340AE032B8A4C19EE0396DD02880CBE092067B82E7B441A3002E834B1AEC099ED3068D02B80C2E69B027784E1B340AE032B8A4C19EE0396DD02880CBE092067B82E7B441A3A0B875EBF681B6DE9F57362FCFDB2FE90F57BD66F3746F6EA51CE793A5278A1A7D639333BAEBCF467049833DC173DAA05118BE31F9EC9E53773DBD53BBBAEE247D7BC761DFC0A8EEBAB4055CD2604FF09C363CDE281436FA96AD2E54AAB8677DF99A8AE643ED57245D1F9DB9397EDBCE491DE78B87CE18D1E7879ED82EF1A804A61EC7E39734D8163CA70DCF360AE283274B4F2843DCBFE9606B4F40BBBA969C3AFA461F7EB5569DCB03BFAA96085577EDEAC4B39734D81C3CA70DCF360A4A7212036DAE39AF5D54E98AF054EFAB44785E8EEA3C7B4983CDC173DAF066A350D8E85392133768F7531A9344A5AA1BF6D93DA774D7B136BC794983FDC173DAF060A370F9FA9892C16B472E683753DAD391CE01F1B79CDDE99E21DD35AD070F5ED2E008F09C363CD828A81ECB075EA9D6EEA40CA53515CDAAF752774DEBC183973438023CA70DAF350A6393332ADC71F4C093B9D3F5D11915B0B65CF46248E7B54B1A9C029ED386D71A85F2D37E15EB68B75146D38A371BE434D7EE6DD65DDF1AF0DA250D4E01CF69C36B8DC2AAC29000D6EF6FD5AEA28CA6775A7AE5343F9753AEBBBE35E0B54B1A9C029ED386D71A0535ABDA65C32C13537F60524E73D9EA42DDF5AD01AF5DD2E014F09C36BCD6287CE2A72522808EBE51ED2ACA7452B72175D7B706BC76498353C073DAF05AA3A01E1A62FFC77AE1B925E3B54B1A9C029ED386D71A05E5B939F450BF71797256BEE533B2BDFFD68A8D8D37CD5FCD5B1392AF64D58A92BE39B5D457BC72796E43D24D8DB9B185CB11A6C81993D499EAAE6F0D78ED9206A780E7B4E1B54661019E5B55FCFE7CB289F35CD83D712633DB28C673C6BE0D79298C1A21BA7BBCE742252CCFABC77329F0DA250D4E01CF69C36B8DC2C23C67564B636E482AC69A50E015252F3759F0A7FC94322E14A29E9B23C81335C6794ED6CC1365E2B9305EBBA4C129E0396D78AD5158603C17924AD846D1502C793C97D88568F2D3E252B2BE4DB3532351E66CE038A72617EEB9EEEEEE6DDBB69596965A50F9D6E0B54B1A9C029ED386D71A8505F75B866F9895183D8473F45B4AC01755E36C77A25951A983B0D45D97B3B2943CD1FC26172674662EDE73C78E1DCBCBCBCB8A62D99F20D3B8E95CC04DE0396D78AD5158C4FDB9D06DB01437C9C29B24C6CADD68769B729EDA453C27EBD5A7696BA8105351A698CC1CCF9983C214FD9F4BBF3F170C06CBCBCB737272B262B1FE6F9121DC742EE026F09C36BCD628CCE7393153D4732AD88AC46D09F7E7528E2551068A1A2E64442340540B319E9B279E930C1BF36243B7D9239C7B18672ACF65676767B99DE9E969EB2F2D80B9C173DAC8C273F19E8B76542E57019952CEFCE32D636FCB9923B9509067DC60BBB99878AE7EA379088CEA1A9D95DCF2D86358A0E72E5EBC28F1DCC68D1B7FF9CB5F9A9DE79F8F13274ED42D899D4BA2A0A06069925BB76E5D2010B0FED202981B3CA70D3C17932233E1CCB3D9A2E32DE5D39827B728CF8543BA152B9727B9B5B690FB73466FE7725309CBE3A7312CF6FE9C443CADADAD9B376FDEB469D30B2FBCE0A6CB203F3F1FCF810DC173DA705303B710E6F65C24488A1BCA18FADA18EA2D6C88EA6DC19E330D4E09B9337EE8E602EECFC58692AAD75442BAF0C29C43511638DE5202B53D7BF648786741E55B039E037B82E7B481E76275957492F86CEC25FA510343424E4A158D851418F65CE8EE9A5987EAD65AF2A192A96FB645F2877F37F6F04C433197EC39F781E7C09EE0396DE0B9CCA4B89196B1BD9473DE574B57C27300B602CF6903CFB935E139005B81E7B4E135CF2D5B5DE891F7F2A833D55DDF1AC073604FF09C36BCE6B97B732BA5F53FD239A0DD43994E729A773DBD53777D6B00CF813DC173DAF09AE7BEF95AAD08E0B52317B47B28A3E964F7909CE6DD6BCB74D7B706F01CD8133CA70DAF79EE95BAF32280875FADD5AEA28CA63515CD729AAB0A1B74D7B706F01CD8133CA70DAF79AE7B705404F0A127B6FB07C7B4DB2873E99EF5E5729A07CEF4EAAE6F0DE039B027784E1B5EF39CF0C0AFAAC501FF537242BB8D3294DE38EE93135CB6BAF0E6E48CEECAD6C0B66DDB2E5DBAA4FB2800E2C173DAF0A0E74EF70CA990EE64F7907627A53DF50726D548CB57EACEEBAE693DECDCB9D3EFF7EB3E0A8078F09C363CE839E1DBBF3E2C26F8C44F4B5CD67B797D746679DE7E39B57B732B6FDDD25DCB9AC073604FF09C36BCE9B9B1C91935C1E0EEB565AD3D01ED7E4A4B92484E494EE2B9EEC151DD75AC0D3C07F604CF69C39B9E137C03A3F7E494AB49669B6BCE6BB7D41DA6B226BFEAAE94D3397D714877EDEA04CF813DC173DAF0ACE784B1899987C3D3E95460B7A6A2D97177EC3AFA465F3C74468DAE9424E6F67224A7C073604FF09C36BCEC39E1D6ADDBFBDB7A4572CA132AA9C0C8E629F1985FFAED19CFDE933383E7C09EE0396D78DC730AD143798B7F556183230C674E773DBDF3D11D878B1A7DDE9C4290143C07F604CF6903CF81CBC073604FF09CD56CD8B0212B96828202DD07059006F01CD8133C673545454566C9EDDDBBB7B4B454F74101A4013C07F604CF59CDD5AB57B3B3B395E4727272B66FDF4ED300EEA0B0B0B0ABAB4BF75100C483E734B065CB16E5B9B2B2323A2DC135545656B6B6B6EA3E0A8078F09C06A42D58B76E9DF25C535393EEC301480F780EEC099ED3436E6EAE782E3F3F7F7A7A5AF7B1B89FFDFBF753CF1680E7C09EE0393D5457578BE7AAAAAA741F8827E0BD68D680E7C09EE0393D4878919D9D1D0C06751F8827C073D680E7C09EE039703F78CE1AF01CD8133C07EE07CF59039E037B82E7C0FD141414F4F7F7EB3E0AF783E7C09EE039703F3CA7C31AF01CD8133CA7875B29D07D5CEE04CF59039E037B82E72C4269EC8330333333D3D3D35309C84AD9A4F2A0BD3482E7AC01CF813DC17319C7309C686C6C64B4FBD4E97375F5875FDF55F7EA0E95DE3D50FDDEF19381A1E1B1B1B1F1F1F1898909E53C6C972EF09C35D4D4D4343434E83E0A8078F05C06310C277A3BF646C9B6471EFBD1C73EF5D487FF2C69924DAF3FF42DF1DFE0D5ABC160509C27C2F38AED868E6ECDDA7A74482D2452D129793A2BC23912E8AC50DBE760CF9E3DEDEDED99387030531746F75100C483E73285329CB84A22B6E73EFDB7669F3DFFA5AFE47FE5EB85DF7B42922CC857B3FF24F381970B8606AF25DA4EF7396514F1554464B2246E3B1A525E8CDA921B6D019EA33FCD1AF01CD8133C971194E47ADBCE6EF8C27DCA5ECFFCE967763CBAAAED8DA2F1AEAE99DEDEB8242B5B76154B064378399FFFFB7375F5C3C3C362BBF1F1F1A9A9290FA8EE76C47149E339B555C497348B395702782E09460C9D2C8A8ED465F2F03A658DE339B027782EFD28C9BD7BA05A49EBE98FFC79E9F77F18687D37516F8949B2499027BBA8C8EF70D1EEC1C1C191911109ECBCA13A233A3316A4AD9D335E239E5B3A91183AAE8A67BFCA52F2CEE2DB49FF2E780EEC099E4B3386E494AB249EBB7CA46121863327D965DD5F7D5939B2A6B0E4CA952B8140C0C5AA535143B8454D19CFA90DD19B78A61616CFDD3173C573780E9C0F9E4B274A72E7EAEA95E45E7FE85B497B29179264C72D0F7C53A94EA23AD7AB2E3ACC64CE786E76288A496E0BF01CEDEFDCCC1BCFC58930C9BF36C250CF604FF05CDA5092EBBFD0F5CC9F7E46FCF4F23F7E63AAA76769925349767FE9FE07D5BDBD96C3F52E57DDACE752DF07320FB9349A593CB7244C31F4FCF19CD969C9D645A09EC19EE0B9B421E2191F1FCFF9FCDF8B99D6FDD5976F9CEFB813C9A92485A8B19A6BEFF9E285CECE818181919111F995E9E969F77A6E21F15CCC8E786E8944EB5355B1A9764D2EC373E07CF05C7A50C1DCBEFFB7459CF4838F7E7209F7E4E6B85727054AB16FFE6C9DDFEF1F1C1C0C06831313136E0BE99279AEA262B69BCC94C7D863DE819611687F9313EBB9C8B094CE507057D139343444BF25B8043C971ED46470D56329424AD455F0DCF917C2730C0A1FFDAFC4ADB252364906C996B8B5F4FB3F54BD97675A5A7A7B7B8787434F4E5193EA749F779AE88C135A3286CC3D6D8BA3A1A1A1A6A6E60E8ECFA5C4792EF49FA3B3B30D6E13CF814BC07369400573875FDFA56C14687D77D2E79BECEE0E2759F0C99A17A213E994EA64E5443483929C4A922DF0AEECDE1DDAEA0BA76EDF685BBB9AA250969BE7F3F9AE5CB9323232E2A6902EDADEA69A19178A2F4C6D72CA3CA9CA6F6D6DADACACB4EE7C9C425CBD9B66D3CD2E2E66BC25FF9E007B82E7D280C846A2ABFCAF7C3DE4B0EF3D3176EE5C5C324B4EA55D8F3C26EB257A9385B84D9239B1841D8FAE0ACD52F8F257CF9E3D6B0EE9DCE1B94C83E79210FD4785C82A515911032E729E38F50CF604CFA501D569A9E612B41516079A9B03CD4DE1CFE6405328257DA0A5182E51722AFDBE29B263A49CA6E6B6378AD41C83E6C69312D20D0C0C04834135F052F7D93B00DADF44E6379912E062E239EA19EC099E4B03229BF78E9F544F301938722431BDFED0B7523DBE393149E6A485A8D128FB76155EE8EC34775DEA3E7B0740FB6B0DD433D8133C97066666668EEF2E17093DFFA5AF5CAE3A184A07AB2229BABC40D549B6242584BFAA476596E5E699BB2EE5A7759FBD03E8E8E8282D2DD57D14EE07CF813DC173778ABA39F7BBADDB95A5DE7FFBED54A9E0FFFCF3DC92930C73ECFEF23F7E430DE66C6B6BF3FBFDDCA25B38525D3B77EED47D14EE07CF813DC173778A68666A6A4A796EDB238FBD575C329B4A8ADF2B2E7EAF442DCB67F11CAA934DA1CCC5C55DC68E6AA124F2554584E2B99696169FCF373838A89E8D82E7E605CF59039E037B82E7EE14E5B9DAA8E73A76ED9A23CDEDB9B9F78DF39C311405CFCD0B9EB3063C07F604CFDD2966CF6D79E09BD150CC149085623B09CBE60AE66643BA68241789EA8C545CA2E62DE0B92580E7AC01CF813DC173778AF29C310E65C937E7E6BD45A79E9C59969B87E716CBB56BD7B66CD9A2FB28DC0F9E037B82E7EE14E5B97375F56A5EC1A503072223244D69B1F30ACC0335D582146BCC2BC0738B251008E4E7E7EB3E0AF783E7C09EE0B93B45792E3034ACE6899FDC529038F52D95CF52F92FB1042956CD13AFABAD651CCAC2D9B06143DCECE7828202DD07E55AF01CD8133C77A7A87905A21CF5AEB81D8FAE528F32F9BDE97363B8CBD19C763DF258A0B949B6263E124532479FA8D2642C6C0B67DBF085FB8E1D3BC6BC82855354546496DCDEBD7B99489739BABABA0A0B0B751F05403C782E0DCCCCCC8C8F8F1F783914723DF3A79FB976A231EEE994C3274F991F71A91E6EA952DC232E457292396E7729503DC779FB33CF89E79827BE70AE5EBD9A9D9DAD24979393B37DFB76F92782EE83722D8CF7017B82E7D2C0071F7C30313131D0D7A7DECB53FAFD1F86DE57104AEA7D05A1D70E04DE7DD7782FCF4477F74424834FBD94C0782F4FE86505E1571CC8A6489EEEEEC2EF3DA16EFED554559D3A75AAA3A383E77E2D9C2D5BB628CF959595D1699951F01CD8133C970694E782C16065CE8B4F85DFB3DA5B5397AEF7AC4A516A044AC1E33F9460CE3C0805CF2D84D6D6D675EBD629CF353535E93E1C3783E7C09EE0B93460DCA21BBC7A75DD5F7D599CB4F69E2F267D63EA629314F2DCA7FF560A94CFBADA5A09E6782FCF12C8CDCD15CFE5E7E74B8DE93E163783E7C09EE0B934A0DEB32AD1D5C8C8C8B9132755EFE54BF73F38D5D373279293DD9FBFEF6BEA9EDFBE5D856A048A2BDFB39A69AAABABC573555555BA0FC4E5E039B027782E3D8872A6A6A624C69248EBF8EE7235C720FF2B5F5F7254273BAA019C5254C94B9BEAEBEB5B5A5A3A3A3A8C608E97CF2D1C09E3B2B3B383C1A0EE037139780EEC099E4B0F4648278DE9E0E0E0E1A2DD4A75CF7DFA6F2F1F6958ACE46417D55D69484EF5584A3B22851B77E608E6C056E039B027782E6DA8BB74E3E3E3232323030303358525AA03F3071FFDE48E47578DB6B52FC470924D32AB81273FFAD8A7CC9253C34FA470F909EECC810DC173604FF05CDA50219DEABD0C040257AE5C69395CBFF69E2FAA897122AD6D8F3CD6B2AB78B2BB3B516FB252364906354F4E0582FB76159A2527054AB1468F259E03BB81E7C09EE0B97492A8BA0B9D9D65B9792AB0338497F3F9BF7FE9FE07256E93240BF2D5D09B1A75B2FD99E7EA6A6BD52C0224074E01CF813DC17369264E750303033D3D3D675A5AC476A234D5219934C9A6E7EFFBDA9B3F5B57535525869330AEADADADA3A343769742901CD89F4B972E6DDBB64DF75100C483E7D28F5975232323838383BDBDBD12934964D6DC78B2A6B0E4C0CB05E2332395BCB469DFAE4215C09D0A238653619CEC28BB4B21480EEC0FEF85007B82E73282A1BAF1F1F16030383C3C2C3199B2DD85CECEB36144662D26DAC2C87AC9A00C27BBC88EB2BB14E205C9C9C91D68EBFD7965F3F2BCFD92FE70D56B364FF7E656CA713E597AA2A8D13736C98346F11CD8143C972994EAA6A7A7272626241A336C77E5CA1571584F4F8FDFEFF79990AFB252364906653815C6C9EE5288BB25377C63F2D93DA7EE7A7AA77675DD49FAF68EC3BE8151DD75A9133C07F604CF65905B61E26C27F6BA7EFDBA686C30CC4018B52C2B659364906C718673B1E40A1B7DCB56172A55DCB3BE7C4D45F3A1F62B92AE8FCEDC1CBF6DE7A48EF3C543678CE8F3434F6C9778D4BD7FAB79C073604FF05CC631DB6E6A6A4A094F113461AC940C92CD0B8693337BB2F48432C4FD9B0EB6F604B4AB6BC9A9A36FF4E1576BD5B93CF0AB6A895075D7AE06F01CD8133C671186ED84999919E5BC3864A56C5279DC6D3885929CC4409B6BCE6B1755BA223CD5FB2A119EDBFF7A49C073604FF09C1E6EA540F771594761A34F494EDCA0DD4F694C1295AA6ED867F79CD25DC75683E7C09EE039D0C0E5EB634A06AF1DB9A0DD4C694F473A07C4DF7276A77B8674D7B4A5E039B027780E34A07A2C1F78A55ABB933294D65434ABDE4BDD356D29780EEC099E03AB199B9C51E18EA3079ECC9DAE8FCEA880B5E5A287423A3C07F604CF81D5949FF6AB5847BB8D329A56BCD920A7B9766FB3EEFAB60E3C07F604CF81D5AC2A0C0960FDFE56ED2ACA687AA7A5574EF37339E5BAEBDB3AA6A7A7737272741F05403C780EAC46CDAA76D930CBC4D41F9894D35CB6BA50777D5B4A565696EE43008807CF81D57CE2A72522808EBE51ED2ACA7452B72175D7B7A5E039B021780EAC463D34C4FE8FF5C2734B00CF810DC1736035CA730B5485AF64D5F2E579F54936F515AF54EB6561792C49F24B392B4AFAE6FCAD5039B90D493735E6AE7CCB675A53BF3155CE98A4CE54777D5B0A9E031B82E7C06A16EEB990E444300D79CB633593E0B955C5EF9B9C14F59CD946319E7BFFAD151B1B430B52F29C44778FF75CA884E4F6C573780E6C079E03AB5998E7C2515AD42E71515DF86B949579B961CF454D16E3B994443D3747902705C6792EE677670F20D1C1780EC046E039B09AF93DA7C22CA5A258B7997A0BE3E3B944CF2D3625EBDB34778A46A246D16724DB9C9AC473003601CF81D5CCED391584AD589924728AAC8CF82F89E7C216343C9778DF2E591096BAEB72D6A9A68E53930B133A33F11C9E035B82E7C06A16350E650E171A61D68A949E93054387E61E4893A24C3199399E33755AA6EAFFE4FE5C12F01CD8103C0756B300CF89ABE6558BD96721CF856D246BE23CA7C68CA82E4763C44A8CE7E689E724C3C6BCD8D06D76E4CBDCC3385379AEB2B272E7E2292D2DAD5B12FE25313E3EBE843F2E9E031B82E7C06A16E4B9B906588653C85ECB8D7B66A1AFA1012966119AF32B711AC3321711CFD56F0CBB336644CCACE4E26E222ED07381406009E2E9E8E8589AE796E05461E3C68D598B47F6B2FE8A02981B3C07569316CF45078388C0C43A2AC0320570A1DD4DF9C321DD8A95CB93DC5A5BC8FD39A3B773B9A984D965FA2D016C0D9E03AB4943BF65CCF4B5D07893B0724C9E0B855991AFA6390946CEC5DD9F8BF5AE1ADEA2B43AD7A4023C076013F01C58CD9DC773F51B672786CF8EF2370D18092B2A9C3F7477AD31B610D937F950C9D437DB22F9C3E59BE7A4C70CC5C47300F604CF81D5DCF978CB85A5B89196B1BD9473DE574B57C273007600CF81D558E539FD09CF01D8013C0756B36C75A147DECBA3CE54777D03781D3C0756736F6EA5B4FE473A07B47B28D3494EF3AEA777EAAE6F00AF83E7C06ABEF95AAD08E0B52317B47B28A3E964F7909CE6DD6BCB74D73780D7C1736035AFD49D17013CFC6AAD76156534ADA96896D35C55D8A0BBBE01BC0E9E03ABE91E1C15017CE889EDFEC131ED36CA5CBA677DB99CE68133BDBAEB1BC0EBE039D0C003BFAA1607FC4FC909ED36CA507AE3B84F4E70D9EAC29B9333BA2B1BC0EBE039D0C0E99E2115D29DEC1ED2EEA4B4A7FEC0A41A69F94ADD79DD350D00780E34F1ED5F1F16137CE2A7252EEBBDBC3E3AB33C6FBF9CDABDB995B76EE9AE6500C073A08BB1C91935C1E0EEB565AD3D01ED7E4A4B92484E494EE2B9EEC151DD750C0021F01C68C337307A4F4EB99A64B6B9E6BC764BDD612A6BF2ABEE4A399DD3178774D72E0044C073A093B1899987C3D3E95460B7A6A2D97177EC3AFA465F3C74468DAE9424E6269203B015780E3473EBD6EDFD6DBD2239E50995546064F39478CC2FFDF60CF7E400EC069E035B207A286FF1AF2A6C7084E1CCE9AEA7773EBAE37051A38F290400F604CF0100809BC1730000E066F01C0000B8193C0700006E06CF0100809BC1730000E066F01C7885CACA4ADD8700001AC073E015B2B2B2741F02006800CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF81CD183ABA356BEBD121B5904845A7E4E9AC08E748A0B3426D4F0A9E03F026780E6C88F82A22325912B71D0D292F466DC98D86E70020013C07B625ECB8A4F19CDA2AE24B9AC59CCB049E03F026780E6C8B119D190B4347B7A68ED76E13CF014012F01CD80B75532EDC4799329E531BA237F14C66C3730090009E03FB11196632673C373B14C524373C070009E039B01FB39E4B7DE7CD3CE4D2D01F9E038004F01CD88FC5C573313BE239008803CF81FD48E6B90A15DC19728BF59C11FACD314C05CF0178133C0736A3334E68C918328D565930780EC09BE039B017D1382DD5CCB850C816CD93FC8929CC9F030033780EBC029E03F026780EBC029E03F026780EBC029E03F026780EBC029E03F026780E5CCE860D1BE206A9141414E83E2800B00E3C072EA7A8A8C82CB9BD7BF7969696EA3E2800B00E3C072EE7EAD5ABD9D9D94A72393939DBB76FF7FBFDBA0F0A00AC03CF81FBD9B2658BF25C5959199D96005E03CF81FB696D6D5DB76E9DF25C535393EEC301004BC173E009727373C573F9F9F9D3D3D3BA8F05002C05CF8127A8AEAE16CF555555E93E1000B01A3C079E40C2B8ECECEC6030A8FB4000C06AF01C0000B8193C0700006E06CF0100809BC1730000E066F01C78825B29D07D5C009071F01CB813A5B10FC2CCCCCC4C4F4F4F25202B6593CA83F600DC0A9E03B761184E34363632DA7DEA74FB6FEB0EBFBEABEED51D2AC9D7F78E9F0C0C0D8F8D8D8D8F8F4F4C4C28E7613B005782E7C03D188613BD1D7BA364DB238FFDE8639F7AEAC37F9634C9A657FFF9DFC57F037D7DC160509C27C2C37600EE03CF814B5086135749C4B6E6EECF9B7DF6FC97BE92FFD5870A1F7B5C922CC857B3FF2473D5A6AD4383D7126DA7FB9C00200DE03970034A727DE73A377CE13E65AF67FEE4D33B1E5DD9F646D17857D74C6F6F5C92952DBB8A258321BCF59FFFBB73F5C7868787C576E3E3E3535353A80EC01DE039703C4A72EFEEAB52D27AFA237F5EFAFD1F065ADF4DD45B62926C12E4C92E2AF23B5CB47B707070646444023B5407E00EF01C381B4372CA5512CFF51D695888E1CCE952DD1189E794236B7715F5F7F70702015407E00EF01C381825B9F6DFD629C9BDFACFFF9EB49772214976DCF2C03795EA24AA437500AE01CF815331EEC9FDF8E39F153FE57FF5A1A99E9EA5494E25D9FDA5FB1F54F7F65A0ED7A33A007780E7C0A98878C6C7C7557F63D63D5FBC71EE5C527B0D369EAACB7D4942BDCDF73FA852E1638F9FDC529034B31492F5D92FA8022F74760E0C0C8C8C8CC8AF4C4F4FE339008782E7C091A860EED04B9BC5493FF8E82793DE93136989D252CD9F932850FC97B8971425054A86379ECBF6FBFD838383C16070626282900EC0A1E03970246A32B8EAB17CE7473F4BD4556F4D9DDA3A7792382F3110AC78F219D57B79A6A5454A1A1E0E3D39454DAAD37DDE00B068F01C380F15CC1D7E7D97B2D1685BFB6477B739F97F53B510C9A9F4C217EE8BDB5D0A545314DEFAC58B3E9FAFBFBF7F646484900EC0A1E039701E221B89AEF2BFFA90A8A8F0B1C725208B4B2F44678B2F3049441853C2D9733B1E5D199AA5F0E5AF9E3D7BD61CD2E13900C781E7C079A84E4B3597A0ADB038D0DC1C686E0A7F36079A9A0EAD59BF28C9A92421A0EC1B29A7A9B9ED8D2235C7A0B9F1A48474030303C160500DBCD47DF600B038F01C380F91CD7BC74FAA27980C1E391297CC0FB75C7892B830AE1C351A65DFAEC20B9D9D7D7D7D46D7A5EEB30780C581E7C079CCCCCC1CDF5D2E127AFE4B5FB95C7530940E56A974724BC11224A79EE67CE9C0815021D102D5A3324BF3F2CD5D97F2D3BACF1E0016079E0387A16ECED5BDBA438D967CFFEDB7CDE99D1FFD6C699E93145794BAFFF7C673D96D6D6D7EBF9F5B74000E05CF81C310CD4C4D4DD56EDD2E12DAF6C863EF15179B53E1BFFDE7923D776C639EB92891A8F25C4B4B8BCFE71B1C1C54CF46C17300CE02CF81C388F35CC7AE5DE674879E331715E73963280A9E037016780E1C86D9735B1EF8665C3CA7A6782F2DC51565F45BE239004783E7C06128CF19E350E26EAADDC93894B8A2D49333DFFAC58B780EC0D1E0397018CA73E7EA8F3D159E57101A24A9464846D312E715FCDB7F46066D86075B4AB1C6BC023C07E068F01C380CE5B9C0D0B09A272E015CDCBCB7A5CD139700CE5C888A0BE527EA6A6B198702E068F01C380C35AF4094A3DE15B7E3D19581A6D0134C7E6FFADC18EE725C78AA78F299F093509AA28F5669DAF6C8634F85DF4E7EECD831E61500381A3C07CE636666469453B569EB53E1E7385F3BD118F77C4B5FE5BE853FC779D33F7CEDC6D998DDA540F51CE7EDCF3C279E639E3880A3C173E03C3EF8E08389898981BE3E919CD8A8F4FB3F8C7BE1807A65817A63EADC29140EB6BE1BB7AF7A6B9D145E535575EAD4A98E8E0E9EFB05E05CF01C380FE5B9B191D1B77EF1E253E1F7ACF6D6D4257DCFEA1CD30CC48249DF2A2E45A91128058FFF508239F320143C07E044F01C380FE316DDE0D5AB6AF47FD63D5FBC7136FE75A986EDEA725F92106DF3FD0FAA24F26BD9559C3CF3D9732A0A5C73F7E7EB6A6B2598E3BD3C004E07CF81F350EF5995E86A6464E4DC8993AAF7F2A5FB1F9CEAE9496AAF0526D9FDF9FBBEA67A2CF7ED2A54235078CF2A80D3C173E0484439535353126349A4757C77B99A6390FFD587247A5B9AE464473580538A2ACDCB17C9A93B734630C7CBE7001C0A9E0347628474C160707070F070D16EA5BAACCF7EA1EF48C3622527BBA8D9E54A72F5F5F5AAC7D2EFF74BE1C69D398239002782E7C0A9A8BB74E3E3E3232323030303A23AD581F9838F7E72C7A32B53DDAE8B4BA36DED92590D3C91DDCD9253C34FA470F909EECC0138173C074E458574AAF7321008F4F7F7B71CAECFBAE78B6A38E58F3EF6A96D8F3CD6B2AB78B2BB3B516FB252364906354F4E0582FB76159A2527054AB1468F259E037028780E1C4CA2EA2E7476BEF58B17CD93C4C564EB3FFF772FDDFFA0C46D926441BE1A7A5361DCF6679EABABAD55B308901C80CBC073E06CE254373030D0D3D373A6A5A5342F5F94A63A249326D9F4FC7D5F7BE3B9EC9AAA2A35EAA4ADADADA3A343769742901C806BC073E078CCAA1B1919191C1CECEDED95984C22B3A6138D3545BBDFDEBC557C6624F9BA6F57A10AE02483329C0AE36447D95D0A417200AE01CF811B3054373E3E1E0C06878787252653B6BBD0D9290E6B0BD36242AD914D9241194E76911D65772904C901B8063C072E41A96E7A7A3AF448B0B131C3767D7D7DE2B09E9E1EBFDFEF33215F65A56C920CCA702A8C93DDA5102407E01AF01CB8875B61E26C27F6BA7EFDBA686C30CC4018B52C2B659364906C7186437200AE01CF81DB30DB6E6A6A4A094F113461AC940C920DC301B8153C07EEC4B09D303333A39C1787AC944D2A0F8603702B780E3CC1AD14E83E2E00C838FF1F51713ADCAA7E25A30000000049454E44AE426082, '1470001', 'limits_apply.png');
INSERT INTO `jbpm4_lob` VALUES ('1480002', '0', 0x89504E470D0A1A0A0000000D494844520000024D000001AB0802000000526D340D00003AAB49444154789CED9D7D7015D77DB03BD33FF39F33994949A74DD3C9CC1B27699D769A3A334986B67EC7C9BC7DE33A6EE3D44D1BA74E8036766D27C1CE87092020C2B69C571839C83604B0F5858C2C301084224520F12190902C0448982B5F21104242E246BA087D5DC3FBBBF7DCBBDAFBA5CF7BF7ECC7F3CC1965EFEED9B3BB87CD79FC3B7BCEEE1FDC010000702F7FA0FB04000000B2089E0300003783E70000C0CDE03900007033780E0000DC0C9E0300003783E70000C0CDE03900007033780E0000DC0C9E0300003783E70000C0CDE03900007033780E0000DC0C9E0300003783E70000C0CDE03900007033780E0000DC0C9E0300003783E70000C0CDE03900007033780E0000DC0C9E03B771FBF6ED0F228442A1A934C826954732EB3E5F00C82E780EDC83329C686C6262626C6C6C7474F4E6CD9BC12464A56C920C924D32633B007783E7C00D18861B1F1F178DED3B51B061FBBFFED72FFEFA5F7FFC275FFFC147FEE9A90F4B9205F9292B65D33BC70B86868686878725B3EC82ED005C0C9E03676336DC4870B860F7E3DFCBF98B6FAC5CF2DFB97FF3C29BFF51519FD7E23F78F566872459909FB252364906C92699AFF5F70502016C07E062F01C381825B9C9C9C95BB76E151D5AB36CDD5F7E67F5DD9B762DBFD07F3C10EA99214906C926996597370FAD19181890D84E0A91A2501D80CBC073E05494E4262626464747D7FFFA1B8FFCE4E3F965CB66D65B72925D6447D9BDB7B7F7C68D1B52941488EA00DC049E03476248AE6FD0FFCCCBFFFBF1E7EF6D38BF6BBE9253497694DDA590F7FCED838383C16010D501B8093C07CEC3909C3849FCF4E3CDF7F78FBDB730C9A924BB4B2152D4A54B97AE5FBF8EEA00DC049E03E7A19EC98D8E8EAEDBF62F128A2D527286EAA42829505427519D14AE9ED5E9BE5600582C780E1C86C458535353B76EDDDA59F5DC233FF9F882BB2B5376604A813B0E3ED7D3D373E3C60D39841C88900EC0E9E039701812638D8F8F077E3FF4BD757F39D7812753F3189622C59EEF38DBDBDB3B3C3C2C0722A403703A780E9C840AE66EDEBC995FBEFC3BAB3F3538D13538F1FEF5C92E4983F277E2FDF0CF89F04278795225D9F47E644D38B3EC725D7E4EAA0CE11DC3EB27632B27DF9762A5709FCF373030200722A403703A780E9C4434980B04BEBBF6332F953ED677ABE3AA29C9CFBED1C85FF57334B25EAD19EDECBBD5D917CB369DFF56348FF1538A95C2DBDBDB2F5FBE2C0722A403703A780E1C8311CC95D7BDF02F2B973477FFA67BB83592DE95BF97D4F24878412D5F1A698D66187957E5E90EAF79F752384D6736325C8AECD2EC3F208597D6E65EBC7891900EC005E039700C6A2EC1F0F0F09AD71F5CBEE17317068F5F183AF19E4A83C755BA3028CB6ACD890BE114593914598EE48CFC3D1E591FF9696C553F65D3D071297CF5EB0F9E3D7BF6CA952B723835C740F7D503C002C173E01844366363634343E11128A2BAF66BBF6BEF8BA46BBF3B134B9195B5B2F24CDFEFA219AED5B6ABF56AA12F922D9221BC4B6CA17D7AF7DF89E4E410A74F9FF6FBFD723839289E03702E780E1C4328141A1D1DBD7EFDFAC3CFFE71E1BE1F345FFE4DF3E50391BFE1745A2DF4182BE5EF81D39135A76559ADEF51798CBD626B4C2B25B3142E873879F2A4CFE793C3C941E5D0BAAF1E0016089E03C7A01ECEF5F7F73FF8F447DE6EFCE5F1F7DF3EEEAF3CFE7EE509FF740AAFF1BF7DC2FFB65A381E5DF9B6648E64509BD44F95A2D98C9CB2520A97431C3B76ECC2850B7238F5884EF7D503C002C173E0184436C160B0AFAFEF9F9EFA70CDF99DF5BE5D921A227FA30B17D5CFF2C8CFF2868BE5F15B657D788D5AD970D1D8BD3CFA339C3F9CA1F6DC4E39444343434747871C4E0E8AE7009C0B9E03C760F6DC6FCFFEFAF07BA587DF2B89A5D2B89F17C33F8FBC5772E462895A387CB124FC53AD8CE68F6DBD58622E47F2549FDD2E87A8AFAFC773002E00CF8163303CF7E0D31F293FB631ECA78BA551695D54F6127529E195C60C57AAB6AAE5A8E462623B125360344F74DF925D4737CA21C473E7CF9FC773004E07CF8163303CF7F0337FBCB9F2FBAACBB1C167F446467B1D55A765BD6FBAD3D2C8503F9D4D6530D22ED3C22E295C0E81E700DC019E03C76078EEBB399FFD59E13F9A879F9CE88E1B8D927ACDCCEB4D490A9743D06F09E00EF01C3806C373AB0AFFEFF7D6FD8531A3404D2A386D4C2D3096AF4CAF3F9D98EDE0E970FA4D628AEC2285CB21188702E00EF01C3806635EC19BD56BFEE5477F74A4B3B4FD5A5D6C0E78349D35FD8D6DAD3B6B64E8AB9BDE2536C73C369DBC4EADA9EF2895C2771CFC39F30A00DC019E03C760CC13F7F97CFFB9E6D31BDFFC56F4155FD1577F45D3F4CBC086E2B726FD8CBE09CCB449D648B152F8C1830799270EE00EF01C3806E3BD5F7EBF3FAFE43B8FFEFC7F758FA8972F1BEF717E37BC1C4EB19F91ADD195EA3DCEE1145E13DD7124F25A67B5355CC8BB52AC145E5353C37BBF00DC019E03C760BCC7F9CA952BEDED6DDFCDF9AC08C9F8CE4E5FDC077A3A631FDCE9343EB81359D3195B9EFE4C4F7465E4F33D52A014BB6FFF3BF5F5F5BCC719C01DE039700CC677790606062E5EBCF8FABE958FFCE4E347DA4B221F4A7D5F7D6435FC55D5D8C75423CB5D83A64FB0463ECA6AFAE6EAA4DA1AFD1CEB91B32552E06BEFAC3C74E8D0A953A7F82E0F803BC073E0248CEFAC5EBE7CB9BDBD7DEDD6871E7FFEDEFEB1F702A19E452629448A9202F7EDDB27C11CDF5905700D780E9C8439A4F3F97CCDCDCD2B37FDC38F37DF9F4A7597E6253929448AAAACACACADAD9562A5708239007780E7C061A8906E7878B8B7B7B7A3A3A3E1548DF84942B186F3BB1612C94DF5C88EB2BB14B2F7E0AEEAEAEAC6C64629560A974310CC01B8003C070E438574B76EDDBA71E3464F4FCFB973E78E1F3F9EB3F5A1477EF2F1FCB265F3F59CEC223BCAEE6FBFFDF6A14387A42829508A95C2E5100473002E00CF81F390186B7272727474747070F0D2A54B67CF9E153F6DDBFFECF7D6FDE57756DFBD69D7F20BFDC767D69B64906C925976D9BAEFD9CACA4A89E4A410294A0A9462A5703904C11C800BC073E03C24C652730C82C1E0F5EBD7C54C1284353636D6FEAE267FD7F2EFE67CF61B2B97FC77EEDFBCF0E67F54D4E7B5F80F5EBDD9214916E4A7AC944D9241B249E68AB777EFDBB7AFB6B656769742A42829508A55730908E6005C009E034762569D845F3D3D3D1D1D1DCDCDCDF5F5F5870E1D2AADF9C5BA6DDF58B1E1AFFFF5C77FF2F51F7CE49F9EFAB02459909FB2523649868A8A0A319C64965D6447D95D0A91A2901C80CBC073E0540CD58D8E8EDEB871A3B7B7D7E7F3B5B7B79F3A754AD455535373F0E0C1FDFBF78BCCDE79E79DBD1164417ECA4AD92419249B64965D6447D95D0A91A2901C80CBC073E06094EA2627276FDDBA353C3C3C303070F9F2E58B172F9E3D7BF6F4E9D3274F9E3C76EC58434343BD09F9292B659364906C925976911D657729443D934372006E02CF81B351AA9B9A9A1A1F1FBF79F366201010695DB972C5EFF74B9476E1C2858E08E723A86559299B24836493CCB28BEC28BB4B21480EC07DE039700309B693E06C6868E8FAF5EBFDFDFD7D49C84AD92419241B8603703D780EDC8361BB898989B1B1B1D1D151D158300959299B248364C37000AE07CF81DB50B61342A1D0541A6493CA83E1005C0F9E03F7B367CF1EDDA70000DAC073E07ED6AC59A3FB1400401B780EDC0F9E03F032780EDC0F9E03F032780EDC0F9E03F032780E5C4E2010C8CFCFD77D1600A00D3C072E07CF01781C3C072E07CF01781C3C072E07CF01781C3C072EE7F2E5CB5BB76ED57D1600A00D3C072EC7EFF7EFD8B143F759008036F01CB81C3C07E071F01CB81C3C07E071F01CB89C8B172F161515E93E0B00D0069E0397D3DADACAF70A00BC0C9E039783E7003C0E9E039783E7003C0E9E039783E7003C0E9E0397531741F759008036F01CB81C3C07E071F01CB81C3C07E071F01CB81C3C07E071F01CB89CAAAAAA13274EE83E0B00D0069E0397B367CF9ED6D656DD670100DAC073E072F01C80C7C173E072F01C80C7C173E07276EFDEDDDEDEAEFB2C00401B780E5CCE8E1D3BFC7EBFEEB300006DE03970271B366C58134F6161A1EE9302000DE0397027C5C5C566C9EDDDBBB7ACAC4CF749018006F01CB8936BD7AEE5E4E428C9AD5BB76EDBB66DF45E0278133C07AEA5A0A04079AEA8A8884E4B00CF82E7C0B5B4B6B6AE5DBB563C575C5CDCD4D4A4FB7400400F780EDC4C6E6EEEBA75EB7EF9CB5F4E4D4DE93E1700D0039E0337535D5D2D21DDDEBD7B759F08006803CF819B91304EE2B9C1C141DD270200DAC0730000E066F01C0000B8193C0700006E06CF0100809BC1730000E066F01C0000B8193C079AB97DFBCE81B69E9FEF695E9AB75FD21FAE78CDE6E9DEDC3D729E4F969D286EF48D4E8474D71F00CC029E036D0CDD9C7876F7A9BB9EDEA15D5D8B49DFDE7ED8D73FA2BB2E01202D780EF450D4E85BB2B248A9E29E7515AB2A9B0FB55F95746324746BEC8E9D933ACF170F9D31A2CF0F3DB14DE251094C01C086E039B01AF1C19365279421EEDF74B0B53BA05D5D0B4E1DBD230FBF5AABAEE5815F554B84AABB760120113C0756A3242731D0E69AF3DA4595A9084FF5BE4A844754076037F09C0BE9ACDC7274D058AEEC4CB1FACE9DC1A35BCC3F53ACC80A458D3E25397183763F65304954AABA619FDD7D2ADB750800F302CFB99088D0445B6B4C5476CA0A437926AB252F7456AE3165CC24576E8C2A19BC76E4827633653C1DE9EC177FCBD59DEEE6B5D1003602CFB98D98DEC2AA1A3C7AB453FE54C6F46538EFCEB4059512637F3B657D96247727D663F9C02BD5DA9D94A5B4AAB259F55E66AB060160FEE0391792329EAB8CF45A46833A7317664246439299667422A4C21D470F3C9939DD1809A980B5E512211D805DC0732E24FE419C22DA2BA936C9DF2D5B62E15C675C7FA6CA9A0DCF559CF6AB5847BB8DB29A96BDD92097B97A6F73E66B100016049E7321911ECA2D12C099E2B3CE4E89E8CCCFE8CCCFE52C89E756148505B06E7FAB76156535BDD3D22397F9B9F51599AF4100581078CE6D44AC15EDA23444A61ED66D89765E9A1ED5291F5A12CFA959D52E1B66999CFA021372994B561665BE06016041E03917D2197B14171F9F8557C43D96B3369EFBC44F4B45001DBD23DA5594EDA41E4366BE06016041E0391762782E2E9E8B4471A93D67493CA75E1A62FFD77AE139009781E75C48AA786E303261C034173CB278B4724DE5D144AD6569FE9CF2DCDC54D15BB27C696EC3AC795694BC3FDF4DD1C20D7237E62D4D24C5BEBED215CB4A7BE7E83975A599AF4100581078CE6D44EC167D1E371DB0551A433063833123CFE862CFED3AA39BA6E7D465FEC466F1DCFB6F2D4B128E9914DA6BC85BBAFC2D5F7251B27E636374219E6957C9E18C3C91053159E410D38EACDF387DD038CF19FBE239002780E75C4B2C60CB96B7E6CBEC9E8B174F423815554E92BAA6893A4F4495579FDAA3A6F5E6C3A589E7C47369C984E7BABABAB66EDD5A56566641E50378193C071631977ECBD46A31076D0D7969FA0F1B7323D94C619929040CCB2C5E7E7388E7169C66F5DCB163C7F2F2F28C5E65CBFE0900BC099E038B98CD738DB961A7E59594AE988E96C27E8AB7CE2C9E9B7EF616CDA6BA4337BEA5D62BF3996CBAA2A4345D3C17F7186F26F5CED973C160B0A2A262FDFAF509A35BADFFB700F014784E1B85858549E3F95DC28E1D3B92AF771EE3508CBEC4E4EEC1D9FB2D63219A325CBC90C2865365CE1ECFA9FECF845E5065D368EC385FCF6DD8B041F7BF4C76915B3AFBFFBF019837784E1B6B3CF61FF2337A2E3E788A8BE7E234967EDC63CC3DE906A724A4A4B124D38F00A74F2962B8B02F0DF3A985057A2E1008D4D4D4BCF0C20B2FBFFCF2BA75EB0C3D58FF6F9125DC742DE026F09C36BCD628CC219E4BD35568924A928DD297207B25077F465131CF4981C9078C05764624A7FA548D1ED4057A4E313535D5DADABA79F3E64D9B3689F3DC741BB8E95AC04DE0396D78AD51989BE792C78098A592662CE56CA97E6352B1D1690CD3EBD3C673B1906ED972635AC2A23C67E0F7FB77EFDEBD71E3460B2ADF1ABC764B8353C073DAF05AA39081782ED59483D47D92F10E8BF75CAF794CCAACFD9691804F092FBC63447599F19CFBF0DA2D0D4E01CF69C36B8DC2E2E3B91461594A53AAFC69269EC73DDE4B37393D3A7433AF3ED1ACEA0CF15C6ABC764B8353C073DAF05AA3309FF77ED921A5EA239D6120289EF3DE2D0D4E01CF69C36B8D82D33CB7F084E7006C059ED386D71A85252B8B3CF25D1E75A5BAEB5B035EBBA5C129E0396D78AD51B837778FB4FE473AFBB57B28DB492EF3AEA753CC94773D5EBBA5C129E0396D78AD51F8E66BB52280D78E5CD0EEA1ACA6935D83729977AF2ED75DDF1AF0DA2D0D4E01CF69C36B8DC22B75E745000FBF5AAB5D45594DAB2A9BE532571435E8AE6F0D78ED9606A780E7B4E1B546A16B604404F0A127B6F90746B5DB287BE99E7515729907CEF4E8AE6F0D78ED9606A780E7B4E1C146E1815F558B03FEA7F484761B6529BD71DC2717B86465D1AD8990EECAD680076F697004784E1B1E6C144E770FAA90EE64D7A07627653CF50526D448CB57EACEEBAE693D78F096064780E7B4E1CD46E1DBBF3E2C26F8C44F4B5DD67B796324B4346FBF5CDABDB97B6EDFD65DCB9AF0E62D0DF607CF69C39B8DC2E844484D30B87B75796B7740BB9F3292249253929378AE6B6044771D6BC39BB734D81F3CA70DCF360ABEFE917BD657A849669B6BCE6BB7D4225379935F7557CAE59CBE34A8BB7675E2D95B1A6C0E9ED386971B85D1F1D0C391E9742AB05B55D9ECB827761DBD232F1E3AA346574A12737B39925378F996063B83E7B4E1F146E1F6ED3BFBDB7A4472CA132AA9C0C8E629F99C5FFAED19CF3E9333E3F15B1A6C0B9ED3068DC29D88ED2A5AFC2B8A1A1C613873BAEBE91D8F6E3F5CDCE8F3E6148294704B833DC173DAA0510097C12D0DF604CF698346015C06B734D8133CA70D1A057019DCD2604FF09C366814C065704B833DC173DAA0510097C12D0DF604CF698346015C06B734D8133CA70D1A056BD8B3678FEE53F00ADCD2604FF09C366814AC817AB60CAA1AEC099ED3068D823550CF964155833DC173DAA051B006EAD932A86AB027784E1B340AD6403D5B06550DF604CF698346C11AA867CBA0AAC19EE0396DD0285803F56C195435D8133CA70D1A056BA09E2D83AA067B82E7B441A3600DD4B36550D5604FF09C366814AC817AB60CAA1AEC099ED3068D823550CF964155833DC173DAA051B006EAD932A86AB027784E1B340A7174566E393A185E183CBA654D3C959D49B9C39952AC4E05F56C195435D8133CA70D1A8538CC9E331B2CE1A729FF9AE80EB3403D5B06550DF604CF698346C1409C351DBBA589E74C79D29026BEA39E2D83AA067B82E7B441A310C77CE3B939433D5B06550DF604CF698346218EB0E73AC34E9BE5F95CDC93B9B93CA6A39E2D83AA067B82E7B441A36042C96DB6076E51059AB2457B3367DA917AB60CAA1AEC099ED3068D82C1D12D5B8E1E8DF45B2607736B62220B2B2D12BB0D86B347BC161B8B326358473D5B06550DF604CF698346210EE3F95C8C191ECC29AFCD71C425F59C9A7025CE369523DD7F76A419F94355833DC173DAA0518823691C8AB98D4D125EA4BF9279058B25FA9F0A6987FE4C87CEC9A4F8EF10AA1AEC099ED3068D421C51CF4D3F824B1DCF991FD1A965C6A12C9A99E2393C07CE07CF698346C1408D26093FA38BB5B0892D6FA49732F58893D8C4BA740D32F53C2BB3C67309FF1CB175780E9C019ED3068D823550CF29310F5D9D359E333B2DD5BA285435D8133CA70D1A056BA09ED3127B26AA94651A096472199E03E783E7B441A3600DD4735AE23D171D96D2190EEE2A3B070707E9B7049780E7B441A3600DD4735A123C17FE9FA3D3B30DEE10CF814BC073DAA051B006EA392D31CFC58FF1899F58C7784B703E784E1B340AD6403DA726364E556495ACACF8591EE9C073E00CF09C366814AC817A4EC9EC265302249E03E783E7B441A3600DD4B36550D5604FF09C366814AC817AB60CAA1AEC099ED3068D823550CF964155833DC173DAA051B006EAD932A86AB027784E1B340AD6403D5B06550DF604CF698346C11AA867CBA0AAC19EE0396DD0285803F56C195435D8133CA70D1A056BA09E2D83AA067B82E7B441A3600DD4B36550D5604FF09C366814AC817AB60CAA1AEC099ED3068D4256D9B06143C27BAC0A0B0B759F94CBE196067B82E7B441A390558A8B8BCD92DBBB776F595999EE937239DCD2604FF09C366814B2CAB56BD772727294E4D6AF5FBF6DDB36BFDFAFFBA45C0EB734D8133CA70D1A856C535050A03C575E5E4EA7A505704B833DC173DAA051C836ADADAD6BD7AE559E6B6A6AD27D3AEE875B1AEC099ED3068D8205E4E6E64A3DE7E7E74F4D4DE93E17F7C32D0DF604CF698346C102AAABABA59EABAAAA749F8827E096067B82E7B441A3600112C6E5E4E4048341DD27E209B8A5C19EE0396DD02880CBE096067B82E7B441A3002E835B1AEC099ED3068D02B80C6E69B027784E1B340AE032B8A5C19EE0396DD02880CBE096067B82E7B441A3002E835B1AEC099ED3068D82E2F6ED3B07DA7A7EBEA77969DE7E497FB8E2359BA77B73F7C8793E5976A2B8D1373A11D25D7F36825B1AEC099ED3068DC2D0CD8967779FBAEBE91DDAD5B598F4EDED877DFD23BAEBD216704B833DC173DAF078A350D4E85BB2B248A9E29E7515AB2A9B0FB55F95746324746BEC8E9D933ACF170F9D31A2CF0F3DB14DE251094C3D8EC76F69B02D784E1B9E6D14C4074F969D5086B87FD3C1D6EE8076752D3875F48E3CFC6AADBA96077E552D11AAEEDAD589676F69B039784E1B9E6D1494E42406DA5C735EBBA83215E1A9DE5789F0BC1CD579F696069B83E7B4E1CD46A1A8D1A724276ED0EEA70C26894A5537ECB3BB4FE9AE636D78F39606FB83E7B4E1C146E1CA8D512583D78E5CD06EA68CA7239DFDE26FB9BAD3DD83BA6B5A0F1EBCA5C111E0396D78B051503D960FBC52ADDD49594AAB2A9B55EFA5EE9AD683076F697004784E1B5E6B144627422ADC71F4C09399D38D91900A585B2E7931A4F3DA2D0D4E01CF69C36B8D42C569BF8A75B4DB28AB69D99B0D7299ABF736EBAE6F0D78ED9606A780E7B4E1B5466145515800EBF6B76A575156D33B2D3D72999F5B5FA1BBBE35E0B55B1A9C029ED386D71A0535ABDA65C32C93535F60422E73C9CA22DDF5AD01AFDDD2E014F09C36BCD6287CE2A7A522808EDE11ED2ACA76528F2175D7B706BC764B8353C073DAF05AA3A05E1A62FFD77AE1B905E3B55B1A9C029ED386D71A05E5B919F450BF71696A96BFE533B2BDFFD6B28D8DB7CC3FCD5B9392AF74C5B2D2DE19B5D45BB27C696E43CA4D8DB9F185CB19A6C91997D495EAAE6F0D78ED9606A780E7B4E1B546610E9E5B51F2FE6CB249F05CC43D092633DB28CE73C6BE0D79698C1A25B67BA2E7C2252CCDABC77369F0DA2D0D4E01CF69C36B8DC2DC3C67564B636E582AC69A70E015232F3755F0A7FC94362E14629E9B21C8133526784ED6CC1265E2B9085EBBA5C129E0396D78AD5198633C17964AC446B1502C753C97DC8568F2D3FC52AABE4DB353A351E674E038A326E7EEB9AEAEAEAD5BB79695955950F9D6E0B55B1A9C029ED386D71A8539F75B461E98951A3D8433F45B4AC01753E37477A25951E983B0F45D97D3B2943CB1FC2617267566CEDF73C78E1DCBCBCB5B13C3B27F826CE3A66B013781E7B4E1B546611ECFE7C28FC1D23C248B6C92182B77A3D96DCA796A17F19CAC577F4D5BC385988A32C564E678CE1C14A6E9FF5CF8F3B96030585151B17EFDFA35F158FF6F9125DC742DE026F09C36BCD628CCE6393153CC732AD88AC66D49CFE7D28E2551068A192E6C442340540B719E9B259E930C1BF3E243B7E9339C7918673ACFE5E4E4AC713BD6DF5700B382E7B4E1B546610E9E8B75542E55019952CEECE32DE31FCB9923B97090673C60BB359F78AE7EA379088CEA1A9D96DCD2F87398A3E72E5DBA24F1DCC68D1B7FF9CB5F9A9DE79F8D13274ED42D881D0BA2B0B010CF819BC073DAF05AA3308BE7A233E1CCB3D962E32DE5AF314F6E5E9E8B8474CB962F4DF1686D2ECFE78CDECEA5A61296264E6398EFF3B9A9A9A9D6D6D6CD9B376FDAB4E985175E70D36DE0A66B013781E7B4E1B5466166CF4583A484A18CE19F8DE1DEC28698DEE6EC39D3E094B03B13876ECEE1F95C7C28A97A4D25A48B2CCC3814658EE32D2550DBBD7BB784771654BE3578ED9606A780E7B4E1B5466166CFA599243E1D7B897ED4C090B093D245636105463C177EBA66D6A17AB4967AA864FA876DD1FC91E3C69F9E6928E6823DE73EBC764B8353C073DAF05AA330EB78CB0CA5849196F1BD94333E57CB54C27300B602CF69C36B8D82559ED39FF01C80ADC073DAF05AA3B064659147BECBA3AE54777D6BC06BB73438053CA70DAF350AF7E6EE91D6FF4867BF760F653BC965DEF5F40EDDF5AD01AFDDD2E014F09C36BCD6287CF3B55A11C06B472E68F75056D3C9AE41B9CCBB5797EBAE6F0D78ED9606A780E7B4E1B546E195BAF32280875FADD5AEA2ACA65595CD72992B8A1A74D7B706BC764B8353C073DAF05AA3D035302202F8D013DBFC03A3DA6D94BD74CFBA0AB9CC03677A74D7B706BC764B8353C073DAF060A3F0C0AFAAC501FF537A42BB8DB294DE38EE930B5CB2B2E8D6444877655B4D2010C8CFCFD77D160029C07356B361C386845702161616EA3E298B38DD3DA842BA935D83DA9D94F1D4179850232D5FA93BAFBBA63580E7C0B6E039AB292E2E364B6EEFDEBD6EFAD2E6AC7CFBD787C5049FF869A9CB7A2F6F8C8496E6ED974BBB3777CFEDDBBA6B5907780E6C0B9EB39A6BD7AE19EFAA5FBF7EFDB66DDBFC7EBFEE93B28ED189909A6070F7EAF2D6EE80763F65244924A72427F15CD7C088EE3AD6039E03DB82E734505050A03C575E5EEE9D4E4B035FFFC83DEB2BD424B3CD35E7B55B6A91A9BCC9AFBA2BE5724E5F1AD45DBBDAC073605BF09C065A5B5BD7AE5DAB3CD7D4D4A4FB7434303A1E7A38329D4E0576AB2A9B1DF7C4AEA377E4C54367D4E84A49626ECF46720A3C07B605CFE9213737573C27EDC2D4D494EE73D1C3EDDB77F6B7F588E4942754528191CD53F239BFF4DB33DE7C266706CF816DC1737AA8AEAE16CF555555E93E11CD881E2A5AFC2B8A1A1C613873BAEBE91D8F6E3F5CDCE8F3E0148294E039B02D784E0F12C6E5E4E4048341DD27029019F01CD8163C07001900CF816DC173009001F01CD8163C070019E0F2E5CB5BB76ED57D160029C073009001FC7EFF8E1D5EFCEA1ED81F3CA787DB69D07D5E000B04CF816DC17316A134F641845028343535359984AC944D2A0FDACB20FBF7EFF7EC3C45CBC073605BF05CD6310C274DEDE8F048D7A9D3E7EAEA0FBFBEB3EED5ED2ABD7BA0FABDE327038343A3A3A3636363E3E3E3CA79D82E53E4E7E7070201DD67E172F01CD8163C97450CC389DE8EBD51BAF591C77EF4B14F3DF5E13F4B9964D3EB0F7D4BFC3770ED5A301814E789F0B05D46C0731680E7C0B6E0B96CA10C27AE9288EDB94FFFADD967CF7FE92BF95FF97AD1F79E90240BF2D3EC3FC97CE0E5C2C181EBC9B6D37D4D4E05CF59009E03DB82E7B282925C4FDBD90D5FB84FD9EB993FFDCCF64757B4BD513C76F162A8A72721C9CA969D2592C110DEFACFFFFDB9BAFAA1A121B1DDD8D8D8E4E424AA5B3078CE02F01CD8163C977994E4DE3D50ADA4F5F447FEBCECFB3F0CB4BE9BACB7E424D924C8935D54E477B878D7C0C0C0F0F0B00476A86EC1141616F6F5F5E93E0B9783E7C0B6E0B90C63484EB94AE2B92B471AE6623873925DD6FED59795236B8A4AAF5EBD2AE108AA5B30D2FE7AEA63B65AC073605BF05C2651923B5757AF24F7FA43DF4AD94B3997243B163CF04DA53A89EA50DD62C0731680E7C0B6E0B98CA124D777E1E2337FFA19F1D3CBFFF88DC9EEEE85494E25D9FDA5FB1F54CFF65A0ED7A3BA0583E72CE0E2C58B454545BACF022005782E638878C6C6C6D67FFEEFC54C6BFFEACB37CF772C46722A49216AACE6EA7BBE78A1B3B3BFBF7F7878588E32353585E7E60E9EB380D6D6D63D7BF6E83E0B8014E0B9CCA082B97DFFAF409CF4838F7E7201CFE466785627054AB16FFE6CAD34D6030303C160707C7CDC5521DDE0D12D6BB61C1D540BC954764A9ECECA488E243A2BD5F619D8BD7B777B7B7B364E1C0CF01CD8163C9719D46470D56329424AD655F0DCF91722730C8A1EFDAFE4ADB252364906C996BCB5ECFB3F54BD97675A5A7A7A7A8686C26F4E5193EA745F7706115F4545264BE2B6A361E5C5A92DB5D1E6E039697FA515CEE8D93A1CE33F2C52FDA745B43A53FF3747622E033C07B605CF650015CC1D7E7DA7B251A0F5DD099F6FA2AB2B9264C1276B5E884DA453AA9395E3B10C4A722A49B6C0BBB27B5778AB2F92BA7C236DED6A8A42796E9ECFE7BB7AF5EAF0F0B0DB42BA2811C7A56D5223315DCA2C291ADE69F05C2AA2FF61213A33D7DCF44F594A1D41C7E532C073605BF05C0610D9487495FF95AF871DF6BD2746CF9D4B4866C9A9B4F391C764BD446FB290B049322797B0FDD115E1590A5FFEEAD9B367CD219D1B3DA71A50632145939A7A8FF4E0B91998299EC373E00AF05C06509D966A2E415B5149A0B939D0DC14F9DB1C680AA7942FB414C3254B4EA5DF3745778C96D3D4DCF646B19A63D0DC785242BAFEFEFE6030A8065EEABEFA0CA05ADA48A39A369E531B620FF14C8D2C9E5B1CB3C67309224CF14F1001CF816DC173194064F3DEF193EA0D26FD478E24A7D71FFA56BAD7372727C99CB210351A65DFCEA20B9D9DE6AE4BDD579F21A2C34C668CE7A687A298E43607CFD545C8CE793B12D37F58CC1ECF999D966A5D143C07B605CF65805028747C578548E8F92F7DE54AD5C1703A58154DB1E539AA4EB2A52821F253BD2AB33C37CFDC752987D67DF51962DA73E99FBC99875C1A2D2D9E5B18B1CA541569AA5A93CBF01CB8023CB758D4C3B9DF6DD9A62CF5FEDB6FA74B85FFE79F67969C649861F797FFF11B6A30675B5B9BDFEF77DB23BAF9C573713BE2B98510EFB9E8B094CE707057D939383848BF25B8073CB7584433939393CA735B1F79ECBD92D2E9545AF25E49C97BA56A59FE96CCA03AD914CE5C5272D1D8512D94467FAA88503CD7D2D2E2F3F9060606D4BB515CECB9CACAE996D594C7D863D6819651F05C0A123C17FE9FA3D3B30DEE10CF817BC0738B4579AE36E6B98E9D3B6748337B6EE67D133C670C457183E73A1384968A41F343A5F9D1D0D0505353B388F3732331CFC5D77DFCC43AC65B822BC0738BC5ECB98207BE190BC54C015938B693B06CA6606E3AA48B4572D1A8CE4825A56ADE822B3D97D0E4A67C42670A3FD2E649573E4D7022B19A963A4B5656B4AAE7394F9CA0196C0B9E5B2CCA73C63894053F9C9BF5119D7A7366796E9EFB3C976DF05C02B39B4C09703EF11C9E03DB82E7168BF2DCB9BA7A35AFE0F28103D11192A634DF7905E6819A6A418A35E615E0B9F982E72C00CF816DC1738B45792E3038A4E6899F2C284C9EFA96CE67E9FC975C8214ABE689D7D5D6BA731C4A36C1731680E7C0B6E0B9C5A2E6158872D4B7E2B63FBA42BDCAE4F7A6BF1B235D8EE6B4F391C702CD4DB235F995289239F646952663616B24DB862FDC77ECD83177CE2BC8261D1D1D656565BACFC2E5E039B02D782E038442A1B1B1B1032F8743AE67FEF433D74F3426BC9D72E8E429F32B2ED5CB2D554A78C5A5484E3227EC2E05AAF7386F7BE639F19C3BE78967133E756D01780E6C0B9ECB001F7CF0C1F8F8787F6FAFFA2E4FD9F77F18FE5E4138A9EF15843F3B1078F75DE3BB3CE35D5DE3D10C3EF55102E3BB3CE18F15443E71209BA279BABA8ABEF7847AF857535575EAD429894E5CF8DEAF6C82E72C00CF816DC1731940792E180CEE59FFE25391EFACF6D4D465EA3BAB52941A8152F8F80F2598330F42C1737304CF59009E03DB82E73280F1886EE0DAB5B57FF56571D2EA7BBE98F28BA9F34D52C8739FFE5B2950FED6D5D64A30E7F6EFF264053C6701780E6C0B9ECB00EA3BAB125D0D0F0F9F3B7152F55EBE74FF8393DDDD8B919CECFEFC7D5F53CFFCF6ED2C522350DCFE9DD5AC70FDFAF5828202DD67E172F01CD8163C97194439939393126349A4757C57859A6390FF95AF2F38AA931DD5004E29AAF4A54DF5F5F52D2D2D1D1D1D4630E79A8FCF59402010C8CFCFD77D162E07CF816DC17399C108E982C1E0C0C0C0E1E25D4A75CF7DFA6FAF1C6998AFE46417D55D69484EF558FAFD7E29DC78324730372B1B366C4878D1476161A1EE937227555555274E9CD07D160029C07319433DA51B1B1B1B1E1EEEEFEFAF292A551D983FF8E827B73FBA62A4AD7D2E86936C92590D3CF9D1C73E65969C1A7E2285CB21783237478A8B8BCD92DBBB772F13E9B2041F6D07DB82E732860AE954EF652010B87AF56ACBE1FAD5F77C514D8C13696D7DE4B1969D25135D5DC97A9395B24932A879722A10DCB7B3C82C3929508A357A2CF1DC5CB876ED5A4E4E8E92DCFAF5EBB76DDB2631B1EE937227780E6C0B9ECB24C9AABBD0D9599E9BA7023B4378EB3FFFF72FDDFFA0C46D9264417E1A7A53A34EB63DF35C5D6DAD9A4580E41649414181F25C7979399D96D903CF816DC17319264175FDFDFDDDDDDD675A5AC476A234D5219932C9A6E7EFFBDA9B3F5B5B535525869330AEADADADA3A34376974290DC8291C677EDDAB5CA734D4D4DBA4FC7B5E039B02D782EF39855373C3C3C3030D0D3D32331994466CD8D276B8A4A0FBC5C283E3352E94B9BF6ED2C5201DCA908623815C6C98EB2BB1482E416436E6EAE782E3F3F7F6A6A4AF7B9B8163C07B605CF65054375636363C16070686848623265BB0B9D9D672388CC5A4CB44590F59241194E76911D65772904C92D86EAEA6AF15C555595EE137133780E6C0B9ECB164A7512408C8F8F4B3466D8EEEAD5ABE2B0EEEE6EBFDFEF33213F65A56C920CCA702A8C93DDA51024B718A402737272E49F40F789B8193C07B605CF6591DB11126C27F6BA71E386686C20427F04B52C2B659364906C098643726073F01CD8163C9775CCB69B9C9C54C253044D182B258364C370E02CF01CD8163C671186ED845028A49C9780AC944D2A0F86036781E7C0B6E0393DDC4E83EEF3025820BB77EF6E6F6FD77D160029C07300900176ECD8C1BB66C09EE03900C800780E6C0B9E03BB70FBF69D036D3D3FDFD3BC346FBFA43F5CF19ACDD3BDB97BE43C9F2C3B51DCE81B9D08E9AE3FCDE039B02D780EF4337473E2D9DDA7EE7A7A8776752D267D7BFB615FFF88EEBAD4069E03DB82E74033458DBE252B8B942AEE5957B1AAB2F950FB5549374642B7C6EED839A9F37CF1D01923FAFCD013DB241EF5E670223C07B605CF8136C4074F969D5086B87FD3C1D6EE8076752D3875F48E3CFC6AADBA96077E552D11AAEEDAB51A3C07B605CF813694E42406DA5C735EBBA83215E1A9DE5789F0BC16D5E139B02D780EF450D4E85392133768F753069344A5AA1BF6D9DDA774D7B1A5E039B02D780E3470E5C6A892C16B472E683753C6D391CE7EF1B75CDDE9EE41DD356D1D780E6C0B9E030DA81ECB075EA9D6EEA42CA55595CDAAF752774D5B079E03DB82E7C06A4627422ADC71F4C09399D38D91900A585B2E7925A4C373605BF01C584DC569BF8A75B4DB28AB69D99B0D7299ABF736EBAE6F8B282828B87EFDBAEEB30048019E03AB59511416C0BAFDADDA5594D5F44E4B8F5CE6E7D657E8AE6F8BC8CFCF0F0402BACF022005780EAC46CDAA76D930CBE4D4179890CB5CB2B248777D5B049E03DB82E7C06A3EF1D352114047EF887615653BA9C790BAEBDB22F01CD8163C0756A35E1A62FFD77AE1B97981E7C0B6E039B01AE5B939AAC257BA62E9D2BCFA149B7A4B96ABF5B2B0349E14F9A59C65A5BD331E2B5C4E6E43CA4D8DB9CBDFF299D6D46F4C97332EA92BD55DDF1681E7C0B6E039B09AB97B2E2C39114C43DED278CD24796E45C9FB2627C53C67B6519CE7DE7F6BD9C6C6F082943C23B1DD133D172E21B57DF11C80EDC073603573F35C244A8BD92521AA8BFC8CB13C2F37E2B998C9E23C979698E76608F2A4C004CFC51D77FA04921D8CE7006C049E03AB99DD732ACC522A8A779BA9B730319E4BF6DC7C53AABE4D73A768346A147D46B3CDA8493C076013F01C58CDCC9E5341D8B2E52922A7E8CAA8FF52782E6241C373C9CFED520561E9BB2EA79D6AEA3835B930A93313CFE139B025780EAC665EE3506670A111662D4BEB3959307468EE813429CA149399E33953A765BAFE4F9ECFC581E7C0B6E039B09A39784E5C35AB5ACC3E0B7B2E62235993E03935664475391A2356E23C374B3C271936E6C5876ED3235F661EC699CE733B76EC58E33A366EDC38363666FDED04302B780EAC664E9E9B6980652485EDB5D4786616FE191E906216A139BF12A7312C731EF15CFDC6883BE346C44C4B2EE121A297E33900DB82E7C06A32E2B9D86010119858470558A6002EBCBB297F24A45BB67C698A476B73793E67F4762E359530BD8CE7006C0D9E03ABC940BF65DCF4B5F0789388724C9E0B8759D19FA6390946CEF93D9F8BF7AE1ADEA2B43AD3A4023C076013F01C58CDE2E3B9FA8DD313C3A747F99B068C441415C91F7EBAD6185F88EC9B7AA864FA876DD1FC91F2CD73D2E38662E239007B82E7C06A163FDE726E2961A4657C2FE58CCFD53295F01C801DC073603556794E7FC273007600CF81D52C5959E491EFF2A82BD55DDF005E07CF81D5DC9BBB475AFF239DFDDA3D94ED249779D7D33B74D73780D7C1736035DF7CAD5604F0DA910BDA3D94D574B26B502EF3EED5E5BAEB1BC0EBE039B09A57EACE8B001E7EB556BB8AB29A565536CB65AE286AD05DDF005E07CF81D5740D8C88003EF4C436FFC0A8761B652FDDB3AE422EF3C0991EDDF50DE075F01C68E0815F558B03FEA7F484761B6529BD71DC2717B86465D1AD8990EECA06F03A780E3470BA7B50857427BB06B53B29E3A92F30A1465ABE52775E774D03009E034D7CFBD787C5049FF869A9CB7A2F6F8C8496E6ED974BBB3777CFEDDBBA6B1900F01CE8627422A42618DCBDBABCB53BA0DD4F194912C929C9493CD73530A2BB8E01200C9E036DF8FA47EE595FA126996DAE39AFDD528B4CE54D7ED55D299773FAD2A0EEDA058028780E74323A1E7A38329D4E0576AB2A9B1DF7C4AEA377E4C54367D4E84A49626E2239005B81E74033B76FDFD9DFD62392539E50490546364FC9E7FCD26FCFF04C0EC06EE039B005A2878A16FF8AA2064718CE9CEE7A7AC7A3DB0F1737FA984200604FF01C0000B8193C0700006E06CF0100809BC1730000E066F01C0000B8193C0700006E06CF8157D8B3678FEE5300000DE039F00A6BD6ACD17D0A00A0013C075E01CF0178133C075E01CF0178133C075E01CF0178133C075E01CF0178133C075E01CF0178133C075E01CF0178133C075E01CF0178133C075E01CF0178133C075E01CF0178133C07F663F0E896355B8E0EAA85642A3B254F67652447129D956A7B32780EC09BE039B027E2ABA8C86449DC7634ACBC38B5A5361A9E038078F01CD89988E352C6736AAB882F651673AE18780EC09BE039B0334674662C0C1EDD92265E4BD823093C07E04DF01CD80EF5502ED24799369E531B620FF14C66C37300100F9E035B121D6632633C373D14C524373C0700F1E039B025D39E4BFFE4CD3CE4D2D01F9E038078F01CD892F9C573713BE239003083E7C096A4F25CA50AEE0CB9C57BCE08FDD20D53C17300DE04CF81FDE84C105A2A064DA355E6069E03F026780E6C472C4E4B37332E1CB2C5F2A47E630AF3E700C000CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF8157C07300DE04CF81CBD9B06143C28C83C2C242DD270500D681E7C0E51417179B25B777EFDEB2B232DD270500D681E7C0E55CBB762D272747496EFDFAF5DBB66DF3FBFDBA4F0A00AC03CF81FB292828509E2B2F2FA7D312C06BE039703FADADAD6BD7AE559E6B6A6AD27D3A006029780E3C416E6EAE782E3F3F7F6A6A4AF7B90080A5E039F004D5D5D5E2B9AAAA2ADD2702005683E7C0134818979393130C06759F0800580D9E0300003783E70000C0CDE03900007033780E0000DC0C9E034F703B0DBACF0B00B20E9E0377A234F641845028343535359984AC944D2A0FDA03702B780EDC866138D1D8E8F048D7A9D3EDBFAD3BFCFACEBA57B7AB243FDF3B7E323038343A3A3A3636363E3EAE9C87ED005C099E03F760184EF476EC8DD2AD8F3CF6A38F7DEAA90FFF59CA249B5EFDE77F17FFF5F7F6068341719E080FDB01B80F3C072E41194E5C2511DBAABB3F6FF6D9F35FFA4AFE571F2A7AEC7149B2203FCDFE93CC559BB60C0E5C4FB69DEE6B02800C80E7C00D28C9F59EEBDCF085FB94BD9EF9934F6F7F7479DB1BC563172F867A7A1292AC6CD95922190CE1ADFBFCDF9DAB3F36343424B61B1B1B9B9C9C447500EE00CF81E351927B775F9592D6D31FF9F3B2EFFF30D0FA6EB2DE92936493204F765191DFE1E25D030303C3C3C312D8A13A007780E7C0D9189253AE9278AEF748C35C0C674E97EB8E483CA71C59BBB3B8AFAF2F1008A03A007780E7C0C128C9B5FFB64E49EED57FFEF794BD947349B263C103DF54AA93A80ED501B8063C074EC57826F7E38F7F56FC94FFD58726BBBB1726399564F797EE7F503DDB6B395C8FEA00DC019E03A722E2191B1B53FD8D6BEEF9E2CD73E752DA6BA0F1545DEE4B12EA6DBEFF41958A1E7BFC644161CACC52C89ACF7E411578A1B3B3BFBF7F7878588E32353585E7001C0A9E0347A282B9432F6D1627FDE0A39F4CF94C4EA4254A4B377F4EA240F15FF25E5294142819DE782EC7EFF70F0C0C0483C1F1F171423A008782E7C091A8C9E0AAC7F29D1FFD2C59573D35756AEBCC49E2BCE440B0F2C96754EFE599961629696828FCE61435A94EF77503C0BCC173E03C543077F8F59DCA46236DED135D5DE6E4FF4DD55C24A7D20B5FB82F617729504D5178EB172FFA7CBEBEBEBEE1E161423A008782E7C079886C24BACAFFEA43A2A2A2C71E97802C21BD109B2D3EC72411615C0967CF6D7F74797896C297BF7AF6EC59734887E7001C079E03E7A13A2DD55C82B6A292407373A0B929F2B739D0D47468D5BA79494E25090165DF68394DCD6D6F14AB3906CD8D2725A4EBEFEF0F06836AE0A5EEAB0780F981E7C079886CDE3B7E52BDC164E0C89184647EB9E5DC93C48509E5A8D128FB76165DE8ECECEDED35BA2E755F3D00CC0F3C07CE23140A1DDF5521127AFE4B5FB95275309C0E56A974B2A0700192536F73BE7CE040B8905881EA55996579F9E6AE4B39B4EEAB0780F981E7C061A8877375AF6E57A325DF7FFB6D737AE7473F5B98E7242514A59EFFBDF15C4E5B5B9BDFEFE7111D8043C173E0304433939393B55BB68984B63EF2D87B2525E654F46FFFB960CF1DDB98672E4A24AA3CD7D2D2E2F3F9060606D4BB51F01C80B3C073E030123CD7B173A7392DD273E6A2123C670C45C17300CE02CF81C3307BAEE0816F26C4736A8AF7C252425146BF259E037034780E1C86F29C310E25E1A1DA62C6A12414A5DE9CF9D62F5EC473008E06CF81C3509E3B577FECA9C8BC82F02049354232961638AFE0DFFE333A683332D8528A35E615E039004783E7C06128CF050687D43C7109E012E6BD2D6C9EB80470E642545C2887A8ABAD651C0A80A3C173E030D4BC02518EFA56DCF64797079AC26F30F9BDE9EFC64897E3DC53E593CF44DE84D2147BB54AD3D6471E7B2AF275F263C78E31AF00C0D1E039701EA150489453B569CB5391F7385F3FD198F07E4BDF9E7D737F8FF3A67FF8DACDB371BB4B81EA3DCEDB9E794E3CC73C71004783E7C0797CF0C107E3E3E3FDBDBD2239B151D9F77F98F0C101F5C902F5C5D49953381C6C7D37615FF5D53A29BCA6AAEAD4A9531D1D1DBCF70BC0B9E039701ECA73A3C3236FFDE2C5A722DF59EDA9A94BF99DD519A6198805537E555C8A5223500A1FFFA10473E64128780EC089E039701EC623BA816BD7D4E8FF35F77CF1E6D9C4CFA51AB6ABCB7D4942B4CDF73FA892C8AF656749EACC67CFA92870D5DD9FAFABAD95608EEFF200381D3C07CE437D6755A2ABE1E1E173274EAADECB97EE7F70B2BB3BA5BDE69864F7E7EFFB9AEAB1DCB7B3488D40E13BAB004E07CF812311E54C4E4E4A8C2591D6F15D156A8E41FE571F92E86D6192931DD5004E29AA2C2F5F24A79ECC19C11C1F9F037028780E1C8911D20583C1818181C3C5BB94EAD67CF60BBD471AE62B39D945CD2E5792ABAFAF573D967EBF5F0A379ECC11CC0138113C074E453DA51B1B1B1B1E1EEEEFEF17D5A90ECC1F7CF493DB1F5D9EEE715D421A696B97CC6AE089EC6E969C1A7E2285CB21783207E05CF01C381515D2A9DECB4020D0D7D7D772B87ECD3D5F54C3297FF4B14F6D7DE4B1969D25135D5DC97A9395B24932A879722A10DCB7B3C82C3929508A357A2CF11C8043C173E060925577A1B3F3AD5FBC689E242E265BF7F9BF7BE9FE07256E93240BF2D3D09B0AE3B63DF35C5D6DAD9A4580E4005C069E036793A0BAFEFEFEEEEEEE332D2D6579F9A234D5219932C9A6E7EFFBDA1BCFE5D45455A951276D6D6D1D1D1DB2BB1482E4005C039E03C76356DDF0F0F0C0C0404F4F8FC4641299359D68AC29DEF5F6E62DE23323C9CF7D3B8B5400271994E15418273BCAEE52089203700D780EDC80A1BAB1B1B16030383434243199B2DD85CE4E71585B8416136A8D6C920CCA70B28BEC28BB4B21480EC035E03970094A75535353E157828D8E1AB6EBEDED1587757777FBFD7E9F09F9292B659364508653619CEC2E85203900D780E7C03DDC8E90603BB1D78D1B3744630311FA23A86559299B2483644B301C9203700D780EDC86D9769393934A788AA00963A564906C180EC0ADE039702786ED845028A49C9780AC944D2A0F8603702B780E3CC1ED34E83E2F00C83AFF1FC3284B8F68F3578B0000000049454E44AE426082, '1480001', 'limits_loan_apply.png');
INSERT INTO `jbpm4_lob` VALUES ('1480003', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D226C696D6974735F6C6F616E5F6170706C792220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232342C31372C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A093C2F73746172743E0D0A093C7461736B2061737369676E65653D22237B6170706C79557365727D2220666F726D3D222F70616765732F6170702F6D657267652F6D657267654170706C792E6A73662220673D223230302C3130302C39322C353222206E616D653D22E5AEA2E688B7E7BB8FE79086E5B297223E0D0A09093C7472616E736974696F6E20673D223132362C3132353A32392C2D313722206E616D653D22E692A4E994802220746F3D2263616E63656C222F3E0D0A09093C7472616E736974696F6E20673D222D33312C2D313422206E616D653D22E68F90E4BAA42220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6D657267652F617070726F76654D657267652E6A73662220673D223230302C3230302C39322C353222206E616D653D22E9A38EE68EA7E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657231222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336372C3232373B3336372C3132353A2D32382C2D3822206E616D653D22E98080E59B9E2220746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A09093C7472616E736974696F6E20673D222D33322C2D313222206E616D653D22E9809AE8BF872220746F3D22E59088E8A784E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6D657267652F617070726F76654D657267652E6A73662220673D223230332C3239312C39322C353222206E616D653D22E59088E8A784E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657232222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336362C3331373B3336372C3232363A2D32382C2D313122206E616D653D22E98080E59B9E2220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A09093C7472616E736974696F6E20673D222D32392C2D3922206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232362C3337392C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223130332C3234372C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '1480001', 'limits_loan_apply.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('2000062', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D226C6F616E5F6170706C792220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232312C31342C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A093C2F73746172743E0D0A093C7461736B2061737369676E65653D22237B6170706C79557365727D2220666F726D3D222F70616765732F6170702F6C6F616E2F626F72726F7765722F626F72726F7765722E6A73662220673D223230302C3130302C39322C353222206E616D653D22E5AEA2E688B7E7BB8FE79086E5B297223E0D0A09093C7472616E736974696F6E20673D223132362C3132353A32392C2D313722206E616D653D22E692A4E994802220746F3D2263616E63656C222F3E0D0A09093C7472616E736974696F6E20673D222D33312C2D313422206E616D653D22E68F90E4BAA42220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C6F616E2F626F72726F7765722F617070726F76616C4C6F616E4170706C792E6A73662220673D223230302C3230302C39322C353222206E616D653D22E9A38EE68EA7E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657231222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336372C3232373B3336372C3132353A2D32382C2D3822206E616D653D22E98080E59B9E2220746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A09093C7472616E736974696F6E20673D222D33322C2D313222206E616D653D22E9809AE8BF872220746F3D22E59088E8A784E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C6F616E2F626F72726F7765722F617070726F76616C4C6F616E4170706C792E6A73662220673D223230332C3239312C39322C353222206E616D653D22E59088E8A784E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657232222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336362C3331373B3336372C3232363A2D32382C2D313122206E616D653D22E98080E59B9E2220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A09093C7472616E736974696F6E20673D222D32392C2D313322206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232362C3337392C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223130332C3233332C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '2000061', 'loan_apply.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('2000063', '0', 0x89504E470D0A1A0A0000000D4948445200000246000001AB0802000000AA8DCFFA00003A7E49444154789CEDDD7B7054F77DF7F1CEF4CFFCE74C6652D269D37432F3C4495AA79DA6CE4C92A1AD9F71324F9FB88EDB3875D3C6A913A08D5DDB49B07331010444D896F3082307D98600B66EC8C802034128520412178184642140C2ACBC42208484C4465A846E6B78BEBBBFDDA3B3375D77CFEF5CDEAFF98DBC7BF677CE9E3DDEB31FBEE7FCCEEE1FDC0100C015FE40F70A00009019441A00C025883400804B106900009720D200002E41A401005C82480300B8049106007009220D00E012441A00C025883400804B106900009720D200002E41A401005C82480300B8049106007009220D00E012441A00C0258834B8C4EDDBB73F880885425369C843AA8F74D6BDBE00328F4883E3A93093C49A9898181B1B1B1D1DBD79F36630894C9487A4837493CE041BE03E441A1CCC08B3F1F17149AC7D270A366CFFD7FFFAC55FFFEB8FFFE4EB3FF8C83F3DF561697243EECA4479E89DE305434343C3C3C3D2596621D8009721D2E048E6301B090E17EC7EFC7B397FF18D954BFE3BF76F5E78F33F2AEAF35AFC07AFDEEC902637E4AE4C9487A4837493CED7FAFB028100C106B80C9106E7517936393979EBD6ADA2436B96ADFBCBEFACBE7BD3AEE517FA8F07423D3334E920DDA4B3CCF2E6A13503030352B1C9426451A41AE002441A1C46E5D9C4C4C4E8E8E8FA5F7FE3919F7C3CBF6CD9CC4996DC6416995166EFEDEDBD71E3862C4A1648AA014E47A4C1498C3CEB1BF43FF3F2FF7EFCF97B1BCEEF9A6F9EA92633CAECB290F7FCED838383C1609054039C8E488363187926F12351F4E3CDF7F78FBDB7B03C534D669785C8A22E5DBA74FDFA75520D703A220D8EA1CE9F8D8E8EAEDBF62F52602D32CF8C549345C90225D5A4569385ABF36ABA5F2B808520D2E00C52394D4D4DDDBA756B67D5738FFCE4E30B3EDE98F208A42C70C7C1E77A7A7A6EDCB8214F214F44A106381191066790CA697C7C3CF0FBA1EFADFBCBB98E07999AC7681159ECF98EB3BDBDBDC3C3C3F244146A80131169700055A2DDBC7933BF7CF977567F6A70A26B70E2FDEB935DD206E5EFC4FBE1BB13E11BE1DB93AAC943EF47A6843BCB2CD7E5EEA4EA109E313C7D323671F27D59AC2CDCE7F30D0C0CC81351A8014E44A4C101A2255A20F0DDB59F79A9F4B1BE5B1D574D4DEEF68D46FEAABBA391E96ACA6867DFADCEBE58B7E9FEB7A27D8CBBB25859787B7BFBE5CB97E58928D4002722D260774689565EF7C2BFAC5CD2DCFD9BEEE1D6487B57FE5E52B747C237D4ED4B23ADD10E23EFAA3EDDE129EF5E0AB7E9CE46874B91599AFD0764E1A5B5B9172F5EA450031C8A4883DDA981FBC3C3C36B5E7F70F986CF5D183C7E61E8C47BAA0D1E57EDC2A0DC56534E5C08B7C8C4A1C8ED48CFC8DFE391E991BBC6A3EAAE3C34745C16BEFAF507CF9E3D7BE5CA15793A35A05FF7AB07300F441AEC4E72656C6C6C68283C304452ADFDDAEFDAFB22EDDAEFCEC45A6462AD4C3CD3F7BB68876BB5ED6ABABAD117E916E9109E2576A37D7AF6DF499EC9539C3E7DDAEFF7CBD3C993126980B31069B0BB5028343A3A7AFDFAF5879FFDE3C27D3F68BEFC9BE6CB07227FC3EDB4BAD1634C94BF074E47A69C96DB6A7A8FEA63CC159B629A289D65E1F214274F9EF4F97CF274F2A4F2D4BA5F3D807920D26077EA445A7F7FFF834F7FE4EDC65F1E7FFFEDE3FECAE3EF579EF04FB7F014FFDB27FC6FAB1BC7A313DF96CE910EEA217557B56837A3A74C9485CB531C3B76ECC2850BF274EA749AEE570F601E8834D89DE44A3018ECEBEBFBA7A73E5C737E67BD6F97B486C8DFE88D8BEA6E79E46E79C3C5F2F847657A788A9AD870D198BD3C7A37DC3FDCA1F6DC4E798A8686868E8E0E793A7952220D7016220D76678EB4DF9EFDF5E1F74A0FBF57126BA571772F86EF1E79AFE4C8C51275E3F0C592F05D3531DA3FF6E8C512F372A44FF5D9EDF214F5F5F5441AE050441AECCE88B4079FFE48F9B18DE128BA581ACDA78B2AA824A554B695C6C2AC543DAA6E47F32C966147626917ED139DB764D7D18DF2141269E7CF9F27D2002722D2607746A43DFCCC1F6FAEFCBE3A66D8E0330E27460F1BAAA38EF5BEE9A38E4687FAE96EAA83D176996EEC9285CB53106980731169B03B23D2BE9BF3D99F15FEA37954C889EEB84122A9A7CC3CDDD464E1F2141C78049C8B4883DD1991B6AAF0FF7E6FDD5F18C3F7D508FED3C6387EE3F695E9E9A713BB1D3C1D6EBF496C915964E1F2140C0F019C8B4883DD1983F8DFAC5EF32F3FFAA3239DA5EDD7EA62975147DB59D3DFD8A375678D0E7D75D3B3C42ED38E5D915DA7A6D47794CAC2771CFC3983F801E722D26077C6A5D63E9FEF3FD77C7AE39BDF8A7EF755F43BB1A26DFA5BB286E21F4DBA1BFD8A2CD3433245162B0B3F78F020975A03CE45A4C1EE8C2FC4F2FBFD7925DF79F4E7FFAB7B447DD7B0F1B5C5EF866F875BEC6EE4D1E844F5B5C5E1169E129D7124F22DC6EAD1F042DE95C5CAC26B6A6AF8422CC0B98834D89DF1B5C557AE5C696F6FFB6ECE67257B8C1F8BE98BFB9599CED8AFC6741ABF1A1399D219BB3DFD5B33D18991DFA09105CA62F7ED7FA7BEBE9EAF2D069C8B4883DD193F2E33303070F1E2C5D7F7AD7CE4271F3FD25E12F90DCFF7D5EF7F867FF033F63B9F91DB5D83A65F078DFC5EA8E9E74027D5A3D15F0A3D72B64416F8DA3B2B0F1D3A74EAD4297E5C06702E220D0E60FC04E8E5CB97DBDBDBD76E7DE8F1E7EFED1F7B2F10EA59649385C8A26481FBF6ED93128D9F00051C8D488303980B359FCFD7DCDCBC72D33FFC78F3FDA952EDD2BCF24C16228BAAACACACADAD95C5CAC229D100E722D2E00CAA501B1E1EEEEDEDEDE8E86838552351240556C3F95D0BA9CFA67A6446995D16B2F7E0AEEAEAEAC6C64659AC2C5C9E82120D7028220DCEA00AB55BB76EDDB871A3A7A7E7DCB973C78F1FCFD9FAD0233FF9787ED9B2F9469ACC2233CAEC6FBFFDF6A143876451B24059AC2C5C9E82120D7028220D8E2195D3E4E4E4E8E8E8E0E0E0A54B97CE9E3D2B51B46DFFB3DF5BF797DF597DF7A65DCB2FF41F9F39C9A4837493CE32CBD67DCF5656564A7D260B9145C90265B1B270790A4A34C0A188343886544E6A407F3018BC7EFDBA849094568D8D8DB5BFABC9DFB5FCBB399FFDC6CA25FF9DFB372FBCF91F15F5792DFE83576F7648931B725726CA43D241BA49E78AB777EFDBB7AFB6B656669785C8A26481B25835709F120D7028220D4E624E3529AA7A7A7A3A3A3A9A9B9BEBEBEB0F1D3A545AF38B75DBBEB162C35FFFEB8FFFE4EB3FF8C83F3DF561697243EECA4479483A5454544898496799456694D96521B228F20C7001220D0E63A4DAE8E8E88D1B377A7B7B7D3E5F7B7BFBA953A724A56A6A6A0E1E3CB87FFF7EC9AD77DE79676F84DC90BB32511E920ED24D3ACB2C32A3CC2E0B91459167800B1069701E956A939393B76EDD1A1E1E1E1818B87CF9F2C58B17CF9E3D7BFAF4E993274F1E3B76ACA1A1A1DE44EECA4479483A4837E92CB3C88C32BB2C449D3F23CF00A723D2E0482AD5A6A6A6C6C7C76FDEBC190804249FAE5CB9E2F7FBA5F6BA70E14247C4F908755B26CA43D241BA496799456694D96521E419E00E441A1C2C21D8A4E41A1A1ABA7EFD7A7F7F7F5F1299280F4907E9469801AE44A4C1F18C609B9898181B1B1B1D1D95C40A269189F29074906E8419E04A441A5C42059B0885425369C843AA0F6106B8129106D7DABF7F3F3F4B0D780A9106D7CACFCF0F0402BAD70280758834B8169106780D9106D722D200AF21D2E05A441AE035441A5CABB0B0B0AFAF4FF75A00B00E9106D7DAB16387DFEFD7BD1600AC43A4C1B58834C06B8834B8169106780D9106D722D200AF21D2E05ABB77EF6E6F6FD7BD1600AC43A4C1B5F6ECD9D3DADAAA7B2D00588748836B116980D71069702D220DF01A220DAE45A4015E43A4C1B5EA2274AF0500EB1069702D220DF01A220DAE45A4015E43A4C1B58834C06B8834B8564343434D4D8DEEB500601D220DAED5DADABA67CF1EDD6B01C03A441A5C8B4803BC8648836B116980D71069702D220DF01A220DAED5D1D1515656A67B2D00588748836BF9FDFE1D3B76E85E0B00D621D2E05A441AE035441A5C8B4803BC8648836B116980D7106970ADEBD7AF171414E85E0B00D621D2E05A8140203F3F5FF75A00B00E910617DAB061C39A78858585BA570A40D6116970A1E2E262739EEDDDBB970BD4002F20D2E042D7AE5DCBC9C95179B67EFDFA6DDBB6F9FD7EDD2B0520EB8834B8534141818AB4F2F2728E3A021E41A4C19D5A5B5BD7AE5DAB22ADA9A949F7EA00B0029106D7CACDCD9548CBCFCF9F9A9AD2BD2E00AC40A4C1B5AAABAB25D2AAAAAA74AF08008B1069702D29CE72727282C1A0EE15016011220D00E012441A00C025883400804B106900009720D200002E41A401005C82488366B76FDF39D0D6F3F33DCD4BF3F64BFBC315AFD9BCDD9BBB47D6F3C9B213C58DBED18990EEED07601A91066D866E4E3CBBFBD45D4FEFD09E528B69DFDE7ED8D73FA27B5B020823D2A04751A36FC9CA22950AF7ACAB5855D97CA8FDAAB41B23A15B6377ECDCD47ABE78E88C51537EE8896D52654AB909402F220D56938FFE27CB4EA830B87FD3C1D6EE80F6945A70EBE81D79F8D55AF55A1EF855B5D49DBAB72EE069441AACA6F24C2A9BCD35E7B56752A6EA3675F854EA366A35402322CD853A2BB71C1D346E5776A6987CE7CEE0D12DE6BB2926644551A34FE599C480F628CA60935A531D477D76F7A96C6F4300E910692E14C92E49A83526959D32C14837538025DFE8AC5C63EA9849576E8CAACFFDD78E5CD01E42196F473AFB25AAE5D59DEECEFABF0C00A444A4B94D2CC9C2A93478F468A7FCA98C2595116F77A6034FA55FEC6FA74CCF529EDD891D727CE0956AEDF193A5B6AAB2591D7ECCD61604302322CD855256699591C38ED152CD7C0C32A1A3918799363A1152458CA3C783CCDC6E8C845419DA7289420DD0804873A1F893664AF4B0A27A48FE6ED9122BD23AE30E48AAAED988B48AD37E55C1680F9EACB6656F36C8CB5CBDB739F35B10C06C8834178A1C62DC226599A9EAEAEC943ACD7C3ECD7C0ECD922A6D4551F8B37EDDFE56EDA993D5F64E4B8FBCCCCFADAFC8FC1604301B22CD6D2201153DC66864963AB1B6257AF4D1745A4D459F25559ABA30D965031D935B5F60425EE692954599DF82006643A4B95067ECB4597CD5159E10770ACDDA2AED133F2D95CFFA8EDE11EDA993EDA64E19667E0B02980D91E64246A4C5556991DA2C75A45952A5A9AFD8B0FFF75D1169807311692E94AA4A1B8C8CCE375D4E1DB979B4724DE5D1C404CBD275692AD2E6960ABD25CB97E636CCDA6745C9FBF37D28BA7043EEC6BCA58952CCEB2B5DB1ACB4778E91A65E69E6B72080D910696E1309B2E8B9B3E932ACD21804191B0E19399F163BC7D6197D68FA5AB5CCAFD82C91F6FE5BCB92B2C52C45C235E42D5DFE962F7951327D6363F446BCE95892A733FA446E4868459E623A0EEB374E3F695CA419F3126980CD1069AE152BC3B21551F3357BA4C5674C4291144D97A4949A168D37C9A4BCFAD491699A6E7EBA34559A445A5A9988B4AEAEAEAD5BB796959559B0F1018F20D26091B91C784C9D22E652AC212FCD01C0C6DC483753B1652AECC2B9159F7373A8D216DC668DB463C78EE5E5E51987852DFB5F00B81E91068BCC16698DB9E1F8CA2B295D315D0385A3283E606689B4E9F364D16EEA78E6C6B7D4741572A6E05C51529AAE4A8B3BE53653CACE39D282C1604545C5FAF5EB13C6975AFFFF02702B224D9BC2C2C2A4C1F32EB163C78EE4D73B8FE121C6C1C0E4E37BB31F788C155E2ACCE2B3271C666A99B35769EA0066C2614C159CD18A70BE91B661C306DDFF67B24BDED2D9DF6F80991069DAACF1D83FCF678CB4F89228AE4A8B4BACF4230F6331936ECC48424B1AE2317DBA6E7A952261168E4623E4D48D05465A2010A8A9A979E185175E7EF9E575EBD6194960FDFF8B2C71D36B81431169DA786DFF9F439596E6589F293F928227FD1264AEE492CE58542CD26481C94F182BD78CFA4C1D14350E812E30D294A9A9A9D6D6D6CD9B376FDAB449E2CD4D6F0337BD16381491A68DD7F6FFB9455AF2D00C737EA419CD385BABDF98B4D8E83503D3D3D35669B1426DD972E31A8045459AC1EFF7EFDEBD7BE3C68D166C7C6B78ED2D0D1B22D2B4F1DAFE9F812A2DD5F8FED40715E3E32A3ED27ACD4345663DF01829E354B685678CA45A6622CD7DBCF696860D1169DA786DFF5F7C9596A2D84A198AAA7F9A6BB7E34EC5A5BBBE3B3A7832AF3E3144D51A1269A979ED2D0D1B22D2B4F1DAFE3F9F2FC4B2434B75907386A198449AF7DED2B021224D1BAFEDFF4E8BB48537220DD08548D3C66BFBFF9295451EF97119F54A756F6F0DBCF696860D1169DA786DFFBF37778F7CD01FE9ECD71E39D96EF232EF7A3AC5C5E6AEE7B5B7346C8848D3C66BFBFF375FAB95CFFAD78E5CD01E39596D27BB06E565DEBDBA5CF7F6D6C06B6F69D81091A68DD7F6FF57EACECB67FDC3AFD66A4F9DACB65595CDF232571435E8DEDE1A78ED2D0D1B22D2B4F1DAFEDF3530229FF51F7A629B7F60547BF064AFDDB3AE425EE681333DBAB7B7065E7B4BC38688346D3CB8FF3FF0AB6AF9B8FF9FD213DA83274BED8DE33E79814B5616DD9A08E9DED81A78F02D0DBB21D2B4F1E0FE7FBA7B50156A27BB06B5C74FC65B5F60428D757CA5EEBCEE2DAD8707DFD2B01B224D1B6FEEFFDFFEF561F9D0FFC44F4B5D76F8F1C6486869DE7E7969F7E6EEB97D5BF756D6C49B6F69D80A91A68D37F7FFD189901ACD7FF7EAF2D6EE80F628CA4893FA4CE59954695D0323BAB7B136DE7C4BC35688346D3CBBFFFBFA47EE595FA12EDEDA5C735E7B202DB29537F9D5F1467939A72F0DEADEBA3A79F62D0DFB20D2B4F1F2FE3F3A1E7A3872999A2AD75655363BEEEC5A47EFC88B87CEA8F18DD224A4BD5C9F295E7E4BC32688346D3CBEFFDFBE7D677F5B8FE4998A04D554B963F396BCCE2FFDF68C67CF9F9979FC2D0D3B20D2B461FFBF1309B68A16FF8AA206478499B9DDF5F48E47B71F2E6EF47973BC7E4ABCA5A11D91A60DFB3F5C86B734B423D2B461FF87CBF0968676449A36ECFF7019DED2D08E48D386FD1F2EC35B1ADA1169DAB0FFC365784B433B224D1BF67FB80C6F696847A469C3FE6F8D3D7BF6E85E05AFE02D0DED88346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFB706DBD9326C6A6847A469C3FE6F0DB6B365D8D4D08E48D386FDDF1A6C67CBB0A9A11D91A60DFBBF35D8CE966153433B224D1BF67F6BB09D2DC3A68676449A36ECFFD6603B5B864D0DED88346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFB706DBD9326C6A6847A469C3FE1FA7B372CBD1C1F08DC1A35BD6C4ABEC4CEA1DEE9462722A6C67CBB0A9A11D91A60DFB7F1C73A499C32AE1AEA9FF9AE80CB3603B5B864D0DED88346DD8FF0D124FD315599A2ACDD4278D34551BDBD9326C6A6847A469C3FE1F67BE55DA9CB19D2DC3A68676449A36ECFF71C291D6198EAF59CEA5C59D459BCB2935B6B365D8D4D08E48D386FDDF44E5D86C27C7A26967EA163D1C39D38C6C67CBB0A9A11D91A60DFBBFE1E8962D478F460E3C2697686B6299154EAF48453618EE1E89B0D81091198B35B6B365D8D4D08E48D386FD3F8E712E2D668693682AC2E638E691ED9C5A7823CE76DD44BA7F61A41990C3A68676449A36ECFF71928687983F4E93B22D72C09141FC8B15FD5741DA1139D30571B214FFE46053433B224D1BF6FF38D1489B3E5D96BA4A339F4E53B7191EB268335569441A1C8548D386FDDFA0067984CFA7C53E4C133F64238719530F04895DB096EEB397ED3CAB59ABB484FF1DB169441A6C8748D386FDDF1A6CE794CC834767ADD2CCF1956A5A149B1ADA1169DAB0FF5B83ED9C56ECFCA54A27D3001D536C11697014224D1BF67F6BB09DD38A8FB4E86891CE70C956D9393838C88147380F91A60DFBBF35D8CE6925445AF83F47A787F6DFA14A83F31069DAB0FF5B83ED9C562CD2E287DEC45FB0C68847380A91A60DFBBF35D8CEA9C5468A4A2E25A753FC2515E91069B01D224D1BF67F6BB09D539A3DB454D651A5C15188346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFB706DBD9326C6A6847A469C3FE6F0DB6B365D8D4D08E48D386FDDF1A6C67CBB0A9A11D91A60DFBBF35D8CE966153433B224D1BF67F6BB09D2DC3A68676449A36ECFFD6603B5B864D0DED88346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFCFAA0D1B36247CC1536161A1EE957239DED2D08E48D386FD3FAB8A8B8BCD79B677EFDEB2B232DD2BE572BCA5A11D91A60DFB7F565DBB762D272747E5D9FAF5EBB76DDBE6F7FB75AF94CBF1968676449A36ECFFD9565050A022ADBCBC9CA38E16E02D0DED88346DD8FFB3ADB5B575EDDAB52AD29A9A9A74AF8EFBF1968676449A36ECFF16C8CDCD95ED9C9F9F3F3535A57B5DDC8FB734B423D2B461FFB7407575B56CE7AAAA2ADD2BE209BCA5A11D91A60DFBBF05A438CBC9C9090683BA57C413784B433B224D1BF67FB80C6F696847A469C3FE0F97E12D0DED88346DD8FFE132BCA5A11D91A60DFB3F5C86B734B423D2B461FF87CBF0968676449A36ECFF7019DED2D08E48D386FD5FB97DFBCE81B69E9FEF695E9AB75FDA1FAE78CDE6EDDEDC3DB29E4F969D286EF48D4E84746F3F1BE12D0DED88346DD8FF876E4E3CBBFBD45D4FEFD09E528B69DFDE7ED8D73FA27B5BDA026F696847A469E3F1FDBFA8D1B76465914A857BD655ACAA6C3ED47E55DA8D91D0ADB13B766E6A3D5F3C74C6A8293FF4C436A932A5DCF4388FBFA56107449A369EDDFFE5A3FFC9B2132A0CEEDF74B0B53BA03DA516DC3A7A471E7EB556BD96077E552D75A7EEADAB9367DFD2B00F224D1BCFEEFF2ACFA4B2D95C735E7B2665AA6E53874FA56EF372ADE6D9B734EC8348D3C69BFB7F51A34FE599C480F628CA60935A531D477D76F729DDDB581B6FBEA5612B449A361EDCFFAFDC18559FFBAF1DB9A03D8432DE8E74F64B54CBAB3BDD3DA87B4BEBE1C1B734EC8648D3C683FBBF3AE4F8C02BD5DAE3274B6D5565B33AFCA87B4BEBE1C1B734EC8648D3C66BFBFFE8444815318E1E0F3273BB3112526568CB252F166A5E7B4BC38688346DBCB6FF579CF6AB0A467BF064B52D7BB3415EE6EABDCDBAB7B7065E7B4BC38688346DBCB6FFAF280A7FD6AFDBDFAA3D75B2DADE69E99197F9B9F515BAB7B7065E7B4BC38688346DBCB6FFAB0B935D36D031B9F50526E4652E5959A47B7B6BE0B5B7346C8848D3C66BFBFF277E5A2A9FF51DBD23DA5327DB4D9D32D4BDBD35F0DA5B1A3644A469E3B5FD5F7DC586FDBFEF8A485B30AFBDA56143449A365EDBFF55A4CD9004F51B97A6B6FC2D9FD1EDFDB7966D6CBC65BE6B7E34A9F94A572C2BED9D31817A4B962FCD6D48F950636EFCC2650DD3F48C6BEA95EADEDE1A78ED2D0D1B22D2B4F1DAFE3F87485B51F2FE6CB9921069919849082D73F0C4459A316F435E9AF08C8ACD9E1869E1252CCDAB27D2D2F0DA5B1A3644A469E3B5FD7F6E91664E91C6DC707E1853C2E5544C5E6EAA924E4551DA6A4FC4226D86D24D523021D264CA2CB5239116E1B5B7346C8848D3C66BFBFF1CABB4707E4482275660A5AED2928F019AA2687E2DD5C149737C466BC7E97270C6449C7BA47575756DDDBAB5ACACCC828D6F0DAFBDA56143449A365EDBFFE77CE0317272ABD438C437C3814729E36229387D3CD09C46E94BABF4C71EA77351FAC4FA9B622FE968E4FC23EDD8B1637979796B622CFB5F906D6E7A2D702822CD6A1B366C5813AFB0B050F74A59611EE7D2C2A7ACD29CD08A3C249553EE46738CA97853B348A4C974F5D7F4687821A645992A2D7395662EF5D21CC05CF8B9B46030585151B17EFDFA843780F5FF2FB2C44DAF050E45A459ADB8B8D8FC71B677EF5E371D7A9AC16C912621148B34554245ABB1A47369698778A8B089855938FC8CB24FDD888BB459AA34E9B0312FBE209B5EC3990752A68BB49C9C9C356E67FDFB0A3023D2AC76EDDA35E3A34DFEC1BE6DDB36BFDFAF7BA5AC3087488B1D695CAACA2C952EB38F788C3F8566AECFC2A59B7132ECD67CAAB4FA8DE69129EAD8E6749E2D8D5F873946DAA54B97A44ADBB871E32F7FF94B73BCF96773E2C489BA05D9B120858585441A1C8A48D3A0A0A040EDFFE5E5E51E39EA7867D6488B5E6166BE4A2C36E251FE1AD79FCD2BD22285DAB2E54B539C069BCBB934E370E552D31296265E3330DF7369535353ADADAD9B376FDEB469D30B2FBCE0A61870D36B814311691AC827DADAB56B55A4353535E95E1D8BCC1C69D1D227613061F86E63F8705F432CC9E61C69A63123E1984C1C3C39877369F105A23AEC29855AE4C68C2344E638E251CAAFDDBB774BD166C1C6B7069106ED88343D72737365FFCFCFCF977FB3EB5E178BCC1C6969AEB39EAEA82469D4788D70FCA4ABB1C2691789B4F0993073F2A9D360A9072BA63F3116ED1F79DEF8D5330D865C70A4B90F9106ED88343DAAABAB65FFAFAAAAD2BD22D69975C463865AC258C7F8C38C339E03CB5423D2005D88343DA438CBC9C9090683BA57C43A56459AFE46A401BA1069B0C89295451EF97119F54A756F6F0D88346847A4C122F7E6EE910FFA239DFDDA2327DB4D5EE65D4FEFD0BDBD3520D2A01D91068B7CF3B55AF9AC7FEDC805ED9193D576B26B505EE6DDABCB756F6F0D88346847A4C122AFD49D97CFFA875FADD59E3A596DAB2A9BE565AE286AD0BDBD3520D2A01D91A6C7ED3474AF5716750D8CC867FD879ED8E61F18D51E3CD96BF7ACAB909779E04C8FEEEDAD019106ED88348BA8C4FA2022140A4D4D4D4D269189F290EAE3CA847BE057D5F271FF3FA527B4074F96DA1BC77DF20297AC2CBA3511D2BDB1AD160804F2F3F375AF05BC8E48CB3A23CC24B1468747BA4E9D3E57577FF8F59D75AF6E57EDDD03D5EF1D3F19181C1A1D1D1D1B1B1B1F1F57F1E6BE603BDD3DA80AB5935D83DAE327E3AD2F30A1C63ABE52775EF796D68048831D10695964849924D9B1374AB73EF2D88F3EF6A9A73EFC67299B3CF4FA43DF92A81BB8762D180C4ABC49B6B92FD8BEFDEBC3F2A1FF899F96BAECF0E38D91D0D2BCFDF2D2EECDDDE396FF57F343A4C10E88B46C516126B12475D8739FFE5B73743DFFA5AFE47FE5EB45DF7B429ADC90BBE6A893CE075E2E1C1CB89E1C6CBA5F53068C4E84D468FEBB5797B77607B44751469AD4672ACFA44AEB1A18D1BD8DF520D26007445A56A83CEB693BBBE10BF7A9A07AE64F3FB3FDD1156D6F148F5DBC18EAE9496832B16567897430B26DFDE7FFFE5C5DFDD0D09004DBD8D8D8E4E4A46B52CDD73F72CFFA0A75F1D6E69AF3DA036991ADBCC9AF8E37CACB397D6950F7D6D58648831D106999A7F2ECDD03D52A9F9EFEC89F977DFF8781D67793932CB9493729DD641655CF1D2EDE353030303C3C2CE59A9B526D743CF470E4323555AEADAA6C76DCD9B58EDE91170F9D51E31BA549487BB63E538834D801919661469EA958922AEDCA9186B98499B9C92C6BFFEACB2A0E6B8A4AAF5EBD2A9F172E4B357911FBDB7A24CF5424A8A6CA1D9BB7E4757EE9B7675CF1FF64518834D8019196492ACFCED5D5AB3C7BFDA16FA53CCC38972633163CF04D956A52ABB932D5EE4482ADA2C5BFA2A8C11161666E773DBDE3D1ED878B1B7D1E1CAF9F1291063B20D23246E559DF858BCFFCE967248A5EFEC76F4C76772F2CCF5493D95FBAFF41751EAEE570BD5B530DEE40A4C10E88B48C918C191B1B5BFFF9BF97105AFB575FBE79BE633179A69A2C448D965C7DCF172F7476F6F7F70F0F0FCBB34C4D4D1169B015220D7640A465862AD1F6FDBF02899F1F7CF4930B387F36C3793559A02CF6CD9FADF5FBFD030303C160707C7C9C420DB642A4C10E88B4CC50D753AB438E923DC9C9143C77FE85C880FEA247FF2BF95199280F4907E996FC68D9F77FA80E3F9E6969E9E9E9191A0A7FCF88BA584DF7EB06A22E5FBEBC75EB56DD6B01AF23D232409568875FDFA98227D0FAEE84CF37D1D5156972C327535E885DA0A6524D268EC73AA83C534DBA05DE95D9BBC28FFA22ADCB37D2D6AEAE0728CFCDF3F97C57AF5E1D1E1EA65083ADF8FDFE1D3BBCF82B71B015222D032457A466CAFFCAD7C371F5BD2746CF9D4B68E63C536DE7238FC974A9C9E446C243D2397909DB1F5D11BE24E0CB5F3D7BF6ACB95023D26013441AEC8048CB0075D4510DDC6F2B2A093437079A9B227F9B034DE196F24B1D25CC92F34CB5DF3745678C2EA7A9B9ED8D6235A0BFB9F1A4146AFDFDFDC160500D7DD4FDEA1D60FFFEFD12FFBAD7C2E58834D801919601922BEF1D3FA9BEEFA3FFC891E4F6FA43DF4AF76DC5C94D3AA75C881A24B26F67D185CE4EF3B147DDAFDE01F2F3F3038180EEB57039220D7640A4654028143ABEAB42F2E6F92F7DE54AD5C1703B58156DB1DB734C35E996620991BBEAEB22CB73F3CCC71EE5A975BF7A0720D22C40A4C10E88B4C55227D27EB7659B0AA4F7DF7E3B5D2BFC3FFF3C739E498719667FF91FBFA18653B6B5B5C9C707A7D3E68E48B30091063B20D2164B126572725245DAD6471E7BAFA474BA9596BC5752F25EA9BA2D7F4B6648357928DCB9A4E4A231A3BA511ABDABEA3C89B49696169FCF373030A0BE4984489B15916601220D7640A42D968AB4DA58A475ECDC39439B39D2669E3721D28C112244DAAC0A0B0BFBFAFA74AF85CB1169B003226DB1CC9156F0C037630596A9CC0A576C526CCD54A24D176AB1FA2C5AAB19ADA4545D2440A42D807CD4CA07AEEEB57039220D7640A42D968A346378C8824FA4CD7A3A4D7D7B64796E1E91365F449A058834D80191B6582AD2CED5D5AB41FC970F1C888E5134B5F90EE2370F95543764B1C6207E226DBE88340B5CBC78B1A8A848F75AC0EB88B4C5529116181C52975A9F2C284CBEA42C5D74A58BBAE425C862D5A5D675B5B50C0F992F22CD02ADADAD7BF6ECD1BD16F03A226DB1D4207E4917F5DB66DB1F5DA1BEF8E3F7A6BF1B23C70CCD6DE7238F059A9BE4D1E42F1091CEB1EF1F69326E6C8D74DBF085FB8E1D3BE6C241FC8347B7ACD9727450DD4856D9297D3A2B233D927456AAC767B07BF7EEF6F6F66CAC380C441AEC8048CB80502834363676E0E57021F5CC9F7EE6FA89C6846F681C3A79CAFC358FEA0B1E554BF89A47C933E99C30BB2C507D6DF1B6679E934873E9A5D6124DD1CC925B126347C3E9169762A9C36B0E91261FB5F2819BD1B57538E3DF10A9FE1511DD9CA9FF7991D8CB40A4C10E88B40CF8E0830FC6C7C7FB7B7BD58FCB947DFF87E16FE20F37F54DFCE12FD40FBCFBAEF1E332E35D5DE3D10E3EF575FBC68FCB84BF863FF2E5FDF250B44F5757D1F79E5027EA6AAAAA4E9D3AD5D1D1E1DE2FC48AC459DA4FCF48A596B24B8ACFD869445A2AD17F43487299B7DCF45DB995BA2E8EEB6520D26007445A06A8480B06837BD6BFF854E427407B6AEA32F513A0B2283530A4F0F11F4A89661E1BE2D248539F95C68D149F9EA9E7488F489BC14C551A9106A721D232C0389D3670EDDADABFFAB2C4CFEA7BBE98F2C73CE7DB6421CF7DFA6F6581F2B7AEB6564A3457FEB88CFA508D7C7EA6ADD2D403B1136EA6CF53226D7166ADD212322FC5FF8208220D7640A46580FA0950A999868787CF9D38A90E3FBE74FF8393DDDD8BC93399FDF9FBBEA6CECFEDDB59A40686B8F62740A3A33F66ACD2A6478898726C0E915617919DF57624D3BF2166AFD2CCF1956A5A1491063B20D23243D2657272522A27A99F8EEFAA5003FAF3BFF2F505D76A32A31A42298B2A7D69537D7D7D4B4B4B47478751A2B9EDC7D2A6232DFD5932F3A047E34395485B98D8C6541BD2B4694DB145A4C16988B4CC300AB5603038303070B878974AB5E73EFDB7578E34CC37CF641675BCD1C83375C8D1EFF7CBC28DB368EE29D1EECCB74A8B9B91485B88F8488B8E16E90C976C959D8383831C788423116919A3CEA88D8D8D0D0F0FF7F7F7D71495AA23903FF8E827B73FBA62A4AD7D2E6126DDA4B31A0FF2A38F7DCA9C676A54882C5C9EC23567D1A6A58AB4CACAE90F51531F638E59873A4611692924445AF83F47A787F6DFA14A8323116919A30A3575F83110085CBD7AB5E570FDEA7BBEA82E38937CDAFAC8632D3B4B26BABA92934C26CA43D2415D7FA6CABB7D3B8BCC79260B94C51A871C5D15699D09D995CAA0F904D0FC343434D4D4D42C62FDDC281669F1DB3EFE8235463CC26988B44C4A4EB50B9D9DE5B979AA5C33B26DFDE7FFFEA5FB1F946A4C9ADC90BB4692A9C120DB9E79AEAEB6560DD9777F9E257DBAA63C9B662A2AD2F649B77C3E6D13C5B6B46CB3E4748A6EEA795E6A4D290C3B20D2322C21D5FAFBFBBBBBBBCFB4B448B0497AA9238A299B3CF4FC7D5F7BF3676B6BAAAA24CCA4386B6B6BEBE8E890D965212ECE330B106909660F2D9575F3A9D28834D801919679E6541B1E1E1E1818E8E9E9914A4BEAADE6C6933545A5075E2E94E8325AE94B9BF6ED2C5265D9A9080933559CC98C32BB2C843C5B0C22CD02441AEC8048CB0A23D5C6C6C682C1E0D0D090545A2AD82E74769E8D90DC6A31698B90E9D2418599CC2233CAECB210F26C3188340B1069B003222D5B54AA4D4D4D8D8F8F4B8D6504DBD5AB5725AEBABBBBFD7EBFCF44EECA4479483AA83053C599CC2E0B21CF16A3A3A3A3ACAC4CF75AB81C91063B20D2B2E8764442B04950DDB87143126B20A23F42DD9689F29074906E0961469E2D063FB86C01220D7640A4659D39D826272755B629411363A274906E84590611691620D26007449A458C6013A15048C55B0299280FA93E84590611691620D26007449A1EB7D3D0BD5EEE44A4598048831D106970BFEBD7AF171414E85E0B9723D26007441ADC2F1008E4E7E7EB5E0B9723D26007441ADC6CC3860D095F8B515858A87BA5DCA9AAAAEAC48913BAD7025E47A4C1CD8A8B8BCD79B677EF5E2E50CB127E3A1C7640A4C1CDAE5DBB969393A3F26CFDFAF5DBB66DF3FBFDBA57CA9D8834D8019106972B28285091565E5ECE51C7EC21D26007441A5C4E3E67D7AE5DAB22ADA9A949F7EAB81691063B20D2E07EB9B9B91269F9F9F9535353BAD7C5B58834D8019106F7ABAEAE9648ABAAAAD2BD226E46A4C10E8834B89F1467393939C16050F78AB81991063B20D200640091063B20D200640091063B20D200640091063B20D20064C0EEDDBBDBDBDB75AF05BC8E480390013B76ECE09B59A01D910620038834D8019106BBB87DFBCE81B69E9FEF695E9AB75FDA1FAE78CDE6EDDEDC3DB29E4F969D286EF48D4E84746F3FCD8834D8019106FD866E4E3CBBFBD45D4FEFD09E528B69DFDE7ED8D73FA27B5B6A43A4C10E88346856D4E85BB2B248A5C23DEB2A5655361F6ABF2AEDC648E8D6D81D3B37B59E2F1E3A63D4941F7A629B5499526E7A1091063B20D2A08D7CF43F59764285C1FD9B0EB67607B4A7D4825B47EFC8C3AFD6AAD7F2C0AFAAA5EED4BD75AD46A4C10E883468A3F24C2A9BCD35E7B56752A6EA3675F854EA36AFD56A441AEC8048831E458D3E95671203DAA328834D6A4D751CF5D9DDA7746F634B1169B003220D1A5CB931AA3EF75F3B72417B0865BC1DE9EC97A8965777BA7B50F796B60E91063B20D2A0813AE4F8C02BD5DAE3274B6D5565B33AFCA87B4B5B8748831D1069B0DAE8444815318E1E0F3273BB3112526568CB25AF146A441AEC804883D52A4EFB5505A33D78B2DA96BDD9202F73F5DE66DDDBDB22050505D7AF5FD7BD16F03A220D565B5114FEAC5FB7BF557BEA64B5BDD3D2232FF373EB2B746F6F8BE4E7E7070201DD6B01AF23D260357561B2CB063A26B7BEC084BCCC252B8B746F6F8B1069B003220D56FBC44F4BE5B3BEA377447BEA64BBA95386BAB7B7458834D8019106ABA9AFD8B0FFF75D1169F342A4C10E8834584D45DA1C53C157BA62E9D2BCFA140FF5962C57D3E5C6D27829FACB729695F6CEF85CE1E5E436A47CA83177F95B3ED394FA8DE97AC635F54A756F6F8B1069B003220D569B7BA485F34CB2A4216F697CA22445DA8A92F74DF1138B3473F0C445DAFB6F2DDBD818BE214B9E516CF6C4480B2F2175D01269804E441AAC36B7488BD45EB12049A8D522776396E7E546222D165A719196562CD26628DD6481099116F7BCD32B901CB7441AA0079106ABCD1E69AA7852A9131F63A6C37D89555A72A4CDB7A53A38693EAA19AD052529A3DD664C44220DB01E9106ABCD1C69AAB45AB63C453D149D188DBA149116093C23D292CFB1A52AADD21F7B9C8E4FD3914F53EC251D8D24D28834E846A4C16AF31A1E3243EC19C5D3B2B49126378CE4331F4234A591A9D2325769A6A38EE90E60722E2D0E91063B20D260B539449AC4D2AC29628EAE70A4458247A624449A1ACAA18E191A0349E2226D962A4D3A6CCC8B2FC8A607A4CC3C90325DA4EDD8B1638DEB6CDCB8716C6CCCFAB7136046A4C16A738AB4998638465A38A8961AE7B7C277C3E344CC9967EEAF32D21818398F2AAD7E632426E306AA4CE759C2093F2F5769801D1069B05A46222D364643B24A0246954DA6B22C3CBBA97FA4505BB67C698AD360733997661CAE5C6A5AC2F46D220DB00B220D56CBC081C7B8CBC2C2C34022E9628AB470F114BD6BBA00C0E839BF7369F111AB469DA8049D69043F9106588F4883D5165FA5D56F9CBEB67A7A48BD691C47248D22FDC367C21AE31722F3A61EAC98FEC458B47F64F9E6CBBAE3064312698076441AACB6F8118F736B09631DE30F33CE780E2C538D48032C46A4C16A56459AFE46A4011623D260B5252B8B3CF2E332EA95EADEDE80871069B0DABDB97BE483FE4867BFF6C8C976939779D7D33B746F6FC043883458ED9BAFD5CA67FD6B472E688F9CACB6935D83F232EF5E5DAE7B7B031E42A4C16AAFD49D97CFFA875FADD59E3A596DAB2A9BE565AE286AD0BDBD010F21D260B5AE8111F9ACFFD013DBFC03A3DA83277BED9E7515F2320F9CE9D1BDBD010F21D2A0C103BFAA968FFBFF293DA13D78B2D4DE38EE9317B86465D1AD8990EE8D0D780891060D4E770FAA42ED64D7A0F6F8C978EB0B4CA8B18EAFD49DD7BDA5016F21D2A0C7B77F7D583EF43FF1D352971D7EBC31125A9AB75F5EDABDB97B6EDFD6BD95018F21D2A0C7E844488DE6BF7B75796B77407B1465A4497DA6F24CAAB4AE8111DDDB18F01C220DDAF8FA47EE595FA12EDEDA5C735E7B202DB29537F9D5F1467939A72F0DEADEBA80171169D069743CF470E4323555AEADAA6C76DCD9B58EDE91170F9D51E31BA54948539F01BA1069D0ECF6ED3BFBDB7A24CF5424A8A6CA1D9BB7E4757EE9B767387F066844A4C11624092A5AFC2B8A1A1C1166E676D7D33B1EDD7EB8B8D1C7787D403B220D00E012441A00C025883400804B106900009720D200002E41A401005C82488357ECD9B347F72A00C82E220D5EB166CD1ADDAB0020BB883478059106B81E9106AF20D200D723D2E015441AE07A441ABC8248035C8F488357106980EB1169B09FC1A35BD66C393AA86E24ABEC943E9D95911E493A2BD5E3C98834C0F58834D893445334B3E496C4D8D170BAC5A558EAF022D2000F23D2606791384B59A5A94725E3527631F78A21D200D723D2606746CD65DC183CBA254D1596304712220D703D220DB6A34EA0450E32A6ADD2D403B1136EA61023D2000F23D2604BD1D11F335669D323444C3946A4011E46A4C196A6232DFD5932F3A04723E98834C0C38834D8D2FCAAB4B8198934C0B38834D852AA48AB54259B9163F191661474E9468F106980EB1169B09FCE84EC4A65D03488646E8834C0F58834D84EACFA4A77C559B8108BF549FDFD225C970678139106AF20D200D723D2E015441AE07A441ABC8248035C8F488357106980EB1169F00A220D703D220D5E41A401AE47A4C12B8834C0F5883478059106B81E9106AF20D200D723D2E015441AE07A441A5C6EC3860D095F95555858A87BA50064059106972B2E2E36E7D9DEBD7BCBCACA74AF1480AC20D2E072D7AE5DCBC9C95179B67EFDFA6DDBB6F9FD7EDD2B05202B8834B85F4141818AB4F2F2728E3A022E46A4C1FD5A5B5BD7AE5DAB22ADA9A949F7EA00C816220D9E909B9B2B91969F9F3F3535A57B5D00640B91064FA8AEAE9648ABAAAAD2BD2200B2884883274871969393130C0675AF08802C22D200002E41A401005C82480300B8049106007009220D9E703B0DDDEB0520938834B8934AAC0F2242A1D0D4D4D4641299280FA93E241CE002441ADCC6083349ACD1E191AE53A7DB7F5B77F8F59D75AF6E574DEEBE77FC646070687474746C6C6C7C7C5CC51BC106381D9106F730C24C92ECD81BA55B1F79EC471FFBD4531FFEB3944D1E7AF59FFF5DA2AEBFB737180C4ABC49B6116C80A3116970091566124B5287ADBAFBF3E6E87AFE4B5FC9FFEA43458F3D2E4D6EC85D73D449E7AA4D5B0607AE27079BEED704607E8834B881CAB3DE739D1BBE709F0AAA67FEE4D3DB1F5DDEF646F1D8C58BA19E9E8426135B7696480723DBD67DFEEFCED51F1B1A1A92601B1B1B9B9C9C24D500C721D2E0782ACFDEDD57A5F2E9E98FFC79D9F77F18687D3739C9929B7493D24D6651F5DCE1E25D030303C3C3C352AE916A80E31069703623CF542C4995D67BA4612E61666E97EB8E4895A6E2B07667715F5F5F201020D500C721D2E0602ACFDA7F5BA7F2ECD57FFEF7948719E7D264C68207BEA9524D6A35520D7022220D4E659C3FFBF1C73F2B5194FFD58726BBBB179667AAC9EC2FDDFFA03A0FD772B89E54031C8748835349C68C8D8DA903866BEEF9E2CD73E75206D540E3A9BADC97A480DB7CFF83AA153DF6F8C982C2949D65216B3EFB05B5C00B9D9DFDFDFDC3C3C3F22C535353441A607F441A1C499568875EDA2CF1F3838F7E32E5F933C92749AF74D7A5496D2751973C972C4A16281DDE782EC7EFF70F0C0C0483C1F1F1710A35C0FE88343892BA9E5A1D727CE7473F4B4EA69E9A3AF5E8CC4DAAB7E4F2AEF2C967D4E1C7332D2DB2A4A1A1F0F78CA88BD574BF6E003321D2E03CAA443BFCFA4E153C236DED135D5DE6E6FF4DD55CF24CB517BE705FC2ECB240753DC05BBF78D1E7F3F5F5F50D0F0F53A801F647A4C1792457A466CAFFEA43923A458F3D2E6556427B2176C1F51C9BD479714B387B6EFBA3CBC397047CF9AB67CF9E35176A441A6067441A9C471D755403F7DB8A4A02CDCD81E6A6C8DFE64053D3A155EBE69567AA496127F34697D3D4DCF646B11AD0DFDC78520AB5FEFEFE6030A8863EEA7EF500D222D2E03C922BEF1D3FA9BEEF63E0C8918466FE82C7B937A9F61296A30689ECDB5974A1B3B3B7B7D738F6A8FBD503488B4883F38442A1E3BB2A246F9EFFD257AE541D0CB78355AA9D2C285C409EA92F2FBE7CE0407821B105AAAF8B2CCBCB371F7B94A7D6FDEA01A445A4C161D489B4BA57B7ABF18AEFBFFDB6B9BDF3A39F2D2CD2A4252C4A9DAB7BE3B99CB6B636BFDFCFE934C0FE8834388C24CAE4E464ED966D92375B1F79ECBD9212732BFAB7FF5C70A41DDB98675E94E4A58AB49696169FCF373030A0BE498448036C8B4883C324445AC7CE9DE6B6C848332F2A21D28C1122441A605B441A1CC61C69050F7C33A14A5357492FAC252CCA38F048A4014E41A4C16154A419C343124E802D667848C2A2D4B747BEF58B178934C0298834388C8AB473F5C79E8A0CE20F0F53546314636D8183F8FFED3FA3C32623C31D65B1C6207E220D700A220D0EA3222D3038A42EB596B22CE17AB2855D6A2D65997921AADA93A7A8ABAD657808E014441A1C460DE2977451BF6DB6FDD1E581A6F0F77DFCDEF47763E498E1DC5BE593CF44BE37A429F645244D5B1F79ECA9C86F641F3B768C41FC80531069709E502824E952B569CB5391AF2DBE7EA231E13B1E7D7BF6CDFD6B8B37FDC3D76E9E8D9B5D16A8BEB678DB33CF49A471A935E014441A9CE7830F3E181F1FEFEFED953C93E029FBFE0F13BE4A5F7D19BFFA31CF995BB8C86B7D37615EF52B6BB2F09AAAAA53A74E757474F0855880231069701E1569A3C3236FFDE2C5A7223F01DA535397F227406718D32F8197F2B7AD65516A6048E1E33F9412CD3C368448036C8E4883F318A7D306AE5D5343EDD7DCF3C59B67137FC9D308B6BADC97A4F0DA7CFF83AA49CEB5EC2C49DDF9EC3955DBADBAFBF375B5B552A2F1E33280831069701EF513A052330D0F0F9F3B71521D7E7CE9FE0727BBBB5306D51C9BCCFEFC7D5F53871CF7ED2C520343F80950C04188343892A4CBE4E4A4544E523F1DDF55A106F4E77FF521A9C916966732A31A42298B2ACBCB973C5367D18C128D1F4B03EC8F48832319855A30181C1818385CBC4BA5DA9ACF7EA1F748C37CF34C66511768AB3CABAFAF57871CFD7EBF2CDC388B468906D81C9106A75267D4C6C6C6868787FBFBFB25D5D411C81F7CF493DB1F5D9EEED45A421B696B97CE6A3C88CC6ECE33352A44162E4FC15934C011883438952AD4D4E1C74020D0D7D7D772B87ECD3D5F54031A7FF4B14F6D7DE4B1969D25135D5DC9492613E521E9A0AE3F53E5DDBE9D45E63C9305CA628D438E441A607F441A1C2C39D52E7476BEF58B17CDD7594B68ADFBFCDFBD74FF83528D49931B72D74832559C6D7BE6B9BADA5A35649F3C039C8B4883B325A45A7F7F7F7777F7999696B2BC7C492F7544316593879EBFEF6B6F3C97535355A50683B4B5B5757474C8ECB210F20C7022220D8E674EB5E1E1E18181819E9E1EA9B4A4DE6A3AD15853BCEBEDCD5B24BA8C2677F7ED2C526599745061A68A339951669785906780131169700323D5C6C6C682C1E0D0D090545A2AD82E74764A5CB545B498A829F29074506126B3C88C32BB2C843C039C8848834BA8549B9A9A0A7F57D6E8A8116CBDBDBD1257DDDDDD7EBFDF67227765A23C241D5498A9E24C669785906780131169708FDB1109C1264175E3C60D49AC8188FE08755B26CA43D241BA258419790638119106B73107DBE4E4A4CA362568624C940ED28D30035C8048833B19C12642A1908AB70432511E527D0833C005883478C2ED3474AF17804CFAFF5325762D31C42F160000000049454E44AE426082, '2000061', 'loan_apply.png');
INSERT INTO `jbpm4_lob` VALUES ('2000069', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D227072655F6C6F616E5F6170706C792220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232312C31342C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A093C2F73746172743E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C6F616E2F626F72726F7765722F626F72726F7765722E6A73662220673D223230302C3130302C39322C353222206E616D653D22E5AEA2E688B7E7BB8FE79086E5B297223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657230222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223132362C3132353A32392C2D313722206E616D653D22E692A4E994802220746F3D2263616E63656C222F3E0D0A09093C7472616E736974696F6E20673D222D33312C2D313422206E616D653D22E68F90E4BAA42220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C6F616E2F626F72726F7765722F617070726F76616C4C6F616E4170706C792E6A73662220673D223230302C3230302C39322C353222206E616D653D22E9A38EE68EA7E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657231222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336372C3232373B3336372C3132353A2D32382C2D3822206E616D653D22E98080E59B9E2220746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A09093C7472616E736974696F6E20673D222D33322C2D313222206E616D653D22E9809AE8BF872220746F3D22E59088E8A784E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6C6F616E2F626F72726F7765722F617070726F76616C4C6F616E4170706C792E6A73662220673D223230332C3239312C39322C353222206E616D653D22E59088E8A784E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657232222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336362C3331373B3336372C3232363A2D32382C2D313122206E616D653D22E98080E59B9E2220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A09093C7472616E736974696F6E20673D222D32392C2D313322206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232362C3337392C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223130332C3233332C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '2000068', 'pre_loan_apply.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('2000070', '0', 0x89504E470D0A1A0A0000000D4948445200000246000001AB0802000000AA8DCFFA00003A7E49444154789CEDDD7B7054F77DF7F1CEF4CFFCE74C6652D269D37432F3C4495AA79DA6CE4C92A1AD9F71324F9FB88EDB3875D3C6A913A08D5DDB49B07331010444D896F3082307D98600B66EC8C802034128520412178184642140C2ACBC42208484C4465A846E6B78BEBBBFDDA3B3375D77CFEF5CDEAFF98DBC7BF677CE9E3DDEB31FBEE7FCCEEE1FDC0100C015FE40F70A00009019441A00C025883400804B106900009720D200002E41A401005C82480300B8049106007009220D00E012441A00C025883400804B106900009720D200002E41A401005C82480300B8049106007009220D00E012441A00C0258834B8C4EDDBB73F880885425369C843AA8F74D6BDBE00328F4883E3A93093C49A9898181B1B1B1D1DBD79F36630894C9487A4837493CE041BE03E441A1CCC08B3F1F17149AC7D270A366CFFD7FFFAC55FFFEB8FFFE4EB3FF8C83F3DF561697243EECA4479E89DE305434343C3C3C3D2596621D8009721D2E048E6301B090E17EC7EFC7B397FF18D954BFE3BF76F5E78F33F2AEAF35AFC07AFDEEC902637E4AE4C9487A4837493CED7FAFB028100C106B80C9106E7517936393979EBD6ADA2436B96ADFBCBEFACBE7BD3AEE517FA8F07423D3334E920DDA4B3CCF2E6A13503030352B1C9426451A41AE002441A1C46E5D9C4C4C4E8E8E8FA5F7FE3919F7C3CBF6CD9CC4996DC6416995166EFEDEDBD71E3862C4A1648AA014E47A4C1498C3CEB1BF43FF3F2FF7EFCF97B1BCEEF9A6F9EA92633CAECB290F7FCED838383C1609054039C8E488363187926F12351F4E3CDF7F78FBDB7B03C534D669785C8A22E5DBA74FDFA75520D703A220D8EA1CE9F8D8E8EAEDBF62F52602D32CF8C549345C90225D5A4569385ABF36ABA5F2B808520D2E00C52394D4D4DDDBA756B67D5738FFCE4E30B3EDE98F208A42C70C7C1E77A7A7A6EDCB8214F214F44A106381191066790CA697C7C3CF0FBA1EFADFBCBB98E07999AC7681159ECF98EB3BDBDBDC3C3C3F244146A80131169700055A2DDBC7933BF7CF977567F6A70A26B70E2FDEB935DD206E5EFC4FBE1BB13E11BE1DB93AAC943EF47A6843BCB2CD7E5EEA4EA109E313C7D323671F27D59AC2CDCE7F30D0C0CC81351A8014E44A4C101A2255A20F0DDB59F79A9F4B1BE5B1D574D4DEEF68D46FEAABBA391E96ACA6867DFADCEBE58B7E9FEB7A27D8CBBB25859787B7BFBE5CB97E58928D4002722D260774689565EF7C2BFAC5CD2DCFD9BEEE1D6487B57FE5E52B747C237D4ED4B23ADD10E23EFAA3EDDE129EF5E0AB7E9CE46874B91599AFD0764E1A5B5B9172F5EA450031C8A4883DDA981FBC3C3C36B5E7F70F986CF5D183C7E61E8C47BAA0D1E57EDC2A0DC56534E5C08B7C8C4A1C8ED48CFC8DFE391E991BBC6A3EAAE3C34745C16BEFAF507CF9E3D7BE5CA15793A35A05FF7AB07300F441AEC4E72656C6C6C68283C304452ADFDDAEFDAFB22EDDAEFCEC45A6462AD4C3CD3F7BB68876BB5ED6ABABAD117E916E9109E2576A37D7AF6DF499EC9539C3E7DDAEFF7CBD3C993126980B31069B0BB5028343A3A7AFDFAF5879FFDE3C27D3F68BEFC9BE6CB07227FC3EDB4BAD1634C94BF074E47A69C96DB6A7A8FEA63CC159B629A289D65E1F214274F9EF4F97CF274F2A4F2D4BA5F3D807920D26077EA445A7F7FFF834F7FE4EDC65F1E7FFFEDE3FECAE3EF579EF04FB7F014FFDB27FC6FAB1BC7A313DF96CE910EEA217557B56837A3A74C9485CB531C3B76ECC2850BF274EA749AEE570F601E8834D89DE44A3018ECEBEBFBA7A73E5C737E67BD6F97B486C8DFE88D8BEA6E79E46E79C3C5F2F847657A788A9AD870D198BD3C7A37DC3FDCA1F6DC4E798A8686868E8E0E793A7952220D7016220D76678EB4DF9EFDF5E1F74A0FBF57126BA571772F86EF1E79AFE4C8C51275E3F0C592F05D3531DA3FF6E8C512F372A44FF5D9EDF214F5F5F5441AE050441AECCE88B4079FFE48F9B18DE128BA581ACDA78B2AA824A554B695C6C2AC543DAA6E47F32C966147626917ED139DB764D7D18DF2141269E7CF9F27D2002722D2607746A43DFCCC1F6FAEFCBE3A66D8E0330E27460F1BAAA38EF5BEE9A38E4687FAE96EAA83D176996EEC9285CB53106980731169B03B23D2BE9BF3D99F15FEA37954C889EEB84122A9A7CC3CDDD464E1F2141C78049C8B4883DD1991B6AAF0FF7E6FDD5F18C3F7D508FED3C6387EE3F695E9E9A713BB1D3C1D6EBF496C915964E1F2140C0F019C8B4883DD1983F8DFAC5EF32F3FFAA3239DA5EDD7EA62975147DB59D3DFD8A375678D0E7D75D3B3C42ED38E5D915DA7A6D47794CAC2771CFC3983F801E722D26077C6A5D63E9FEF3FD77C7AE39BDF8A7EF755F43BB1A26DFA5BB286E21F4DBA1BFD8A2CD3433245162B0B3F78F020975A03CE45A4C1EE8C2FC4F2FBFD7925DF79F4E7FFAB7B447DD7B0F1B5C5EF866F875BEC6EE4D1E844F5B5C5E1169E129D7124F22DC6EAD1F042DE95C5CAC26B6A6AF8422CC0B98834D89DF1B5C557AE5C696F6FFB6ECE67257B8C1F8BE98BFB9599CED8AFC6741ABF1A1399D219BB3DFD5B33D18991DFA09105CA62F7ED7FA7BEBE9EAF2D069C8B4883DD193F2E33303070F1E2C5D7F7AD7CE4271F3FD25E12F90DCFF7D5EF7F867FF033F63B9F91DB5D83A65F078DFC5EA8E9E74027D5A3D15F0A3D72B64416F8DA3B2B0F1D3A74EAD4297E5C06702E220D0E60FC04E8E5CB97DBDBDBD76E7DE8F1E7EFED1F7B2F10EA59649385C8A26481FBF6ED93128D9F00051C8D488303980B359FCFD7DCDCBC72D33FFC78F3FDA952EDD2BCF24C16228BAAACACACADAD95C5CAC229D100E722D2E00CAA501B1E1EEEEDEDEDE8E86838552351240556C3F95D0BA9CFA67A6446995D16B2F7E0AEEAEAEAC6C64659AC2C5C9E82120D7028220DCEA00AB55BB76EDDB871A3A7A7E7DCB973C78F1FCFD9FAD0233FF9787ED9B2F9469ACC2233CAEC6FBFFDF6A143876451B24059AC2C5C9E82120D7028220D8E2195D3E4E4E4E8E8E8E0E0E0A54B97CE9E3D2B51B46DFFB3DF5BF797DF597DF7A65DCB2FF41F9F39C9A4837493CE32CBD67DCF5656564A7D260B9145C90265B1B270790A4A34C0A188343886544E6A407F3018BC7EFDBA849094568D8D8DB5BFABC9DFB5FCBB399FFDC6CA25FF9DFB372FBCF91F15F5792DFE83576F7648931B725726CA43D241BA49E78AB777EFDBB7AFB6B656669785C8A26481B25835709F120D7028220D4E624E3529AA7A7A7A3A3A3A9A9B9BEBEBEB0F1D3A545AF38B75DBBEB162C35FFFEB8FFFE4EB3FF8C83F3DF561697243EECA4479483A5454544898496799456694D96521B228F20C7001220D0E63A4DAE8E8E88D1B377A7B7B7D3E5F7B7BFBA953A724A56A6A6A0E1E3CB87FFF7EC9AD77DE79676F84DC90BB32511E920ED24D3ACB2C32A3CC2E0B91459167800B1069701E956A939393B76EDD1A1E1E1E1818B87CF9F2C58B17CF9E3D7BFAF4E993274F1E3B76ACA1A1A1DE44EECA4479483A4837E92CB3C88C32BB2C449D3F23CF00A723D2E0482AD5A6A6A6C6C7C76FDEBC190804249FAE5CB9E2F7FBA5F6BA70E14247C4F908755B26CA43D241BA496799456694D96521E419E00E441A1C2C21D8A4E41A1A1ABA7EFD7A7F7F7F5F1299280F4907E9469801AE44A4C1F18C609B9898181B1B1B1D1D95C40A269189F29074906E8419E04A441A5C42059B0885425369C843AA0F6106B8129106D7DABF7F3F3F4B0D780A9106D7CACFCF0F0402BAD70280758834B8169106780D9106D722D200AF21D2E05A441AE035441A5CABB0B0B0AFAF4FF75A00B00E9106D7DAB16387DFEFD7BD1600AC43A4C1B58834C06B8834B8169106780D9106D722D200AF21D2E05ABB77EF6E6F6FD7BD1600AC43A4C1B5F6ECD9D3DADAAA7B2D00588748836B116980D71069702D220DF01A220DAE45A4015E43A4C1B5EA2274AF0500EB1069702D220DF01A220DAE45A4015E43A4C1B58834C06B8834B8564343434D4D8DEEB500601D220DAED5DADABA67CF1EDD6B01C03A441A5C8B4803BC8648836B116980D71069702D220DF01A220DAED5D1D1515656A67B2D00588748836BF9FDFE1D3B76E85E0B00D621D2E05A441AE035441A5C8B4803BC8648836B116980D7106970ADEBD7AF171414E85E0B00D621D2E05A8140203F3F5FF75A00B00E910617DAB061C39A78858585BA570A40D6116970A1E2E262739EEDDDBB970BD4002F20D2E042D7AE5DCBC9C95179B67EFDFA6DDBB6F9FD7EDD2B0520EB8834B8534141818AB4F2F2728E3A021E41A4C19D5A5B5BD7AE5DAB22ADA9A949F7EA00B0029106D7CACDCD9548CBCFCF9F9A9AD2BD2E00AC40A4C1B5AAABAB25D2AAAAAA74AF08008B1069702D29CE72727282C1A0EE15016011220D00E012441A00C025883400804B106900009720D200002E41A401005C82488366B76FDF39D0D6F3F33DCD4BF3F64BFBC315AFD9BCDD9BBB47D6F3C9B213C58DBED18990EEED07601A91066D866E4E3CBBFBD45D4FEFD09E528B69DFDE7ED8D73FA27B5B020823D2A04751A36FC9CA22950AF7ACAB5855D97CA8FDAAB41B23A15B6377ECDCD47ABE78E88C51537EE8896D52654AB909402F220D56938FFE27CB4EA830B87FD3C1D6EE80F6945A70EBE81D79F8D55AF55A1EF855B5D49DBAB72EE069441AACA6F24C2A9BCD35E7B56752A6EA3675F854EA366A35402322CD853A2BB71C1D346E5776A6987CE7CEE0D12DE6BB2926644551A34FE599C480F628CA60935A531D477D76F7A96C6F4300E910692E14C92E49A83526959D32C14837538025DFE8AC5C63EA9849576E8CAACFFDD78E5CD01E42196F473AFB25AAE5D59DEECEFABF0C00A444A4B94D2CC9C2A93478F468A7FCA98C2595116F77A6034FA55FEC6FA74CCF529EDD891D727CE0956AEDF193A5B6AAB2591D7ECCD61604302322CD855256699591C38ED152CD7C0C32A1A3918799363A1152458CA3C783CCDC6E8C845419DA7289420DD0804873A1F893664AF4B0A27A48FE6ED9122BD23AE30E48AAAED988B48AD37E55C1680F9EACB6656F36C8CB5CBDB739F35B10C06C8834178A1C62DC226599A9EAEAEC943ACD7C3ECD7C0ECD922A6D4551F8B37EDDFE56EDA993D5F64E4B8FBCCCCFADAFC8FC1604301B22CD6D2201153DC66864963AB1B6257AF4D1745A4D459F25559ABA30D965031D935B5F60425EE692954599DF82006643A4B95067ECB4597CD5159E10770ACDDA2AED133F2D95CFFA8EDE11EDA993EDA64E19667E0B02980D91E64246A4C5556991DA2C75A45952A5A9AFD8B0FFF75D1169807311692E94AA4A1B8C8CCE375D4E1DB979B4724DE5D1C404CBD275692AD2E6960ABD25CB97E636CCDA6745C9FBF37D28BA7043EEC6BCA58952CCEB2B5DB1ACB4778E91A65E69E6B72080D910696E1309B2E8B9B3E932ACD21804191B0E19399F163BC7D6197D68FA5AB5CCAFD82C91F6FE5BCB92B2C52C45C235E42D5DFE962F7951327D6363F446BCE95892A733FA446E4868459E623A0EEB374E3F695CA419F3126980CD1069AE152BC3B21551F3357BA4C5674C4291144D97A4949A168D37C9A4BCFAD491699A6E7EBA34559A445A5A9988B4AEAEAEAD5BB796959559B0F1018F20D26091B91C784C9D22E652AC212FCD01C0C6DC483753B1652AECC2B9159F7373A8D216DC668DB463C78EE5E5E51987852DFB5F00B81E91068BCC16698DB9E1F8CA2B295D315D0385A3283E606689B4E9F364D16EEA78E6C6B7D4741572A6E05C51529AAE4A8B3BE53653CACE39D282C1604545C5FAF5EB13C6975AFFFF02702B224D9BC2C2C2A4C1F32EB163C78EE4D73B8FE121C6C1C0E4E37BB31F788C155E2ACCE2B3271C666A99B35769EA0066C2614C159CD18A70BE91B661C306DDFF67B24BDED2D9DF6F80991069DAACF1D83FCF678CB4F89228AE4A8B4BACF4230F6331936ECC48424B1AE2317DBA6E7A952261168E4623E4D48D05465A2010A8A9A979E185175E7EF9E575EBD6194960FDFF8B2C71D36B81431169DA786DFF9F439596E6589F293F928227FD1264AEE492CE58542CD26481C94F182BD78CFA4C1D14350E812E30D294A9A9A9D6D6D6CD9B376FDAB449E2CD4D6F0337BD16381491A68DD7F6FFB9455AF2D00C737EA419CD385BABDF98B4D8E83503D3D3D35669B1426DD972E31A8045459AC1EFF7EFDEBD7BE3C68D166C7C6B78ED2D0D1B22D2B4F1DAFE9F812A2DD5F8FED40715E3E32A3ED27ACD4345663DF01829E354B685678CA45A6622CD7DBCF696860D1169DA786DFF5F7C9596A2D84A198AAA7F9A6BB7E34EC5A5BBBE3B3A7832AF3E3144D51A1269A979ED2D0D1B22D2B4F1DAFE3F9F2FC4B2434B75907386A198449AF7DED2B021224D1BAFEDFF4E8BB48537220DD08548D3C66BFBFF9295451EF97119F54A756F6F0DBCF696860D1169DA786DFFBF37778F7CD01FE9ECD71E39D96EF232EF7A3AC5C5E6AEE7B5B7346C8848D3C66BFBFF375FAB95CFFAD78E5CD01E39596D27BB06E565DEBDBA5CF7F6D6C06B6F69D81091A68DD7F6FF57EACECB67FDC3AFD66A4F9DACB65595CDF232571435E8DEDE1A78ED2D0D1B22D2B4F1DAFEDF3530229FF51F7A629B7F60547BF064AFDDB3AE425EE681333DBAB7B7065E7B4BC38688346D3CB8FF3FF0AB6AF9B8FF9FD213DA83274BED8DE33E79814B5616DD9A08E9DED81A78F02D0DBB21D2B4F1E0FE7FBA7B50156A27BB06B5C74FC65B5F60428D757CA5EEBCEE2DAD8707DFD2B01B224D1B6FEEFFDFFEF561F9D0FFC44F4B5D76F8F1C6486869DE7E7969F7E6EEB97D5BF756D6C49B6F69D80A91A68D37F7FFD189901ACD7FF7EAF2D6EE80F628CA4893FA4CE59954695D0323BAB7B136DE7C4BC35688346D3CBBFFFBFA47EE595FA12EDEDA5C735E7B202DB29537F9D5F1467939A72F0DEADEBA3A79F62D0DFB20D2B4F1F2FE3F3A1E7A3872999A2AD75655363BEEEC5A47EFC88B87CEA8F18DD224A4BD5C9F295E7E4BC32688346D3CBEFFDFBE7D677F5B8FE4998A04D554B963F396BCCE2FFDF68C67CF9F9979FC2D0D3B20D2B461FFBF1309B68A16FF8AA206478499B9DDF5F48E47B71F2E6EF47973BC7E4ABCA5A11D91A60DFB3F5C86B734B423D2B461FF87CBF0968676449A36ECFF7019DED2D08E48D386FD1F2EC35B1ADA1169DAB0FFC365784B433B224D1BF67FB80C6F696847A469C3FE6F8D3D7BF6E85E05AFE02D0DED88346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFB706DBD9326C6A6847A469C3FE6F0DB6B365D8D4D08E48D386FDDF1A6C67CBB0A9A11D91A60DFBBF35D8CE966153433B224D1BF67F6BB09D2DC3A68676449A36ECFFD6603B5B864D0DED88346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFB706DBD9326C6A6847A469C3FE1FA7B372CBD1C1F08DC1A35BD6C4ABEC4CEA1DEE9462722A6C67CBB0A9A11D91A60DFB7F1C73A499C32AE1AEA9FF9AE80CB3603B5B864D0DED88346DD8FF0D124FD315599A2ACDD4278D34551BDBD9326C6A6847A469C3FE1F67BE55DA9CB19D2DC3A68676449A36ECFF71C291D6198EAF59CEA5C59D459BCB2935B6B365D8D4D08E48D386FDDF44E5D86C27C7A26967EA163D1C39D38C6C67CBB0A9A11D91A60DFBBFE1E8962D478F460E3C2697686B6299154EAF48453618EE1E89B0D81091198B35B6B365D8D4D08E48D386FD3F8E712E2D668693682AC2E638E691ED9C5A7823CE76DD44BA7F61A41990C3A68676449A36ECFF71928687983F4E93B22D72C09141FC8B15FD5741DA1139D30571B214FFE46053433B224D1BF6FF38D1489B3E5D96BA4A339F4E53B7191EB268335569441A1C8548D386FDDFA0067984CFA7C53E4C133F64238719530F04895DB096EEB397ED3CAB59ABB484FF1DB169441A6C8748D386FDDF1A6CE794CC834767ADD2CCF1956A5A149B1ADA1169DAB0FF5B83ED9C56ECFCA54A27D3001D536C11697014224D1BF67F6BB09DD38A8FB4E86891CE70C956D9393838C88147380F91A60DFBBF35D8CE6925445AF83F47A787F6DFA14A83F31069DAB0FF5B83ED9C562CD2E287DEC45FB0C68847380A91A60DFBBF35D8CEA9C5468A4A2E25A753FC2515E91069B01D224D1BF67F6BB09D539A3DB454D651A5C15188346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFB706DBD9326C6A6847A469C3FE6F0DB6B365D8D4D08E48D386FDDF1A6C67CBB0A9A11D91A60DFBBF35D8CE966153433B224D1BF67F6BB09D2DC3A68676449A36ECFFD6603B5B864D0DED88346DD8FFADC176B60C9B1ADA1169DAB0FF5B83ED6C193635B423D2B461FFCFAA0D1B36247CC1536161A1EE957239DED2D08E48D386FD3FAB8A8B8BCD79B677EFDEB2B232DD2BE572BCA5A11D91A60DFB7F565DBB762D272747E5D9FAF5EBB76DDBE6F7FB75AF94CBF1968676449A36ECFFD9565050A022ADBCBC9CA38E16E02D0DED88346DD8FFB3ADB5B575EDDAB52AD29A9A9A74AF8EFBF1968676449A36ECFF16C8CDCD95ED9C9F9F3F3535A57B5DDC8FB734B423D2B461FFB7407575B56CE7AAAA2ADD2BE209BCA5A11D91A60DFBBF05A438CBC9C9090683BA57C413784B433B224D1BF67FB80C6F696847A469C3FE0F97E12D0DED88346DD8FFE132BCA5A11D91A60DFB3F5C86B734B423D2B461FF87CBF0968676449A36ECFF7019DED2D08E48D386FD5FB97DFBCE81B69E9FEF695E9AB75FDA1FAE78CDE6EDDEDC3DB29E4F969D286EF48D4E84746F3F1BE12D0DED88346DD8FF876E4E3CBBFBD45D4FEFD09E528B69DFDE7ED8D73FA27B5BDA026F696847A469E3F1FDBFA8D1B76465914A857BD655ACAA6C3ED47E55DA8D91D0ADB13B766E6A3D5F3C74C6A8293FF4C436A932A5DCF4388FBFA56107449A369EDDFFE5A3FFC9B2132A0CEEDF74B0B53BA03DA516DC3A7A471E7EB556BD96077E552D75A7EEADAB9367DFD2B00F224D1BCFEEFF2ACFA4B2D95C735E7B2665AA6E53874FA56EF372ADE6D9B734EC8348D3C69BFB7F51A34FE599C480F628CA60935A531D477D76F729DDDB581B6FBEA5612B449A361EDCFFAFDC18559FFBAF1DB9A03D8432DE8E74F64B54CBAB3BDD3DA87B4BEBE1C1B734EC8648D3C683FBBF3AE4F8C02BD5DAE3274B6D5565B33AFCA87B4BEBE1C1B734EC8648D3C66BFBFFE8444815318E1E0F3273BB3112526568CB252F166A5E7B4BC38688346DBCB6FF579CF6AB0A467BF064B52D7BB3415EE6EABDCDBAB7B7065E7B4BC38688346DBCB6FFAF280A7FD6AFDBDFAA3D75B2DADE69E99197F9B9F515BAB7B7065E7B4BC38688346DBCB6FFAB0B935D36D031B9F50526E4652E5959A47B7B6BE0B5B7346C8848D3C66BFBFF277E5A2A9FF51DBD23DA5327DB4D9D32D4BDBD35F0DA5B1A3644A469E3B5FD5F7DC586FDBFEF8A485B30AFBDA56143449A365EDBFF55A4CD9004F51B97A6B6FC2D9FD1EDFDB7966D6CBC65BE6B7E34A9F94A572C2BED9D31817A4B962FCD6D48F950636EFCC2650DD3F48C6BEA95EADEDE1A78ED2D0D1B22D2B4F1DAFE3F87485B51F2FE6CB9921069919849082D73F0C4459A316F435E9AF08C8ACD9E1869E1252CCDAB27D2D2F0DA5B1A3644A469E3B5FD7F6E91664E91C6DC707E1853C2E5544C5E6EAA924E4551DA6A4FC4226D86D24D523021D264CA2CB5239116E1B5B7346C8848D3C66BFBFF1CABB4707E4482275660A5AED2928F019AA2687E2DD5C149737C466BC7E97270C6449C7BA47575756DDDBAB5ACACCC828D6F0DAFBDA56143449A365EDBFFE77CE0317272ABD438C437C3814729E36229387D3CD09C46E94BABF4C71EA77351FAC4FA9B622FE968E4FC23EDD8B1637979796B622CFB5F906D6E7A2D702822CD6A1B366C5813AFB0B050F74A59611EE7D2C2A7ACD29CD08A3C249553EE46738CA97853B348A4C974F5D7F4687821A645992A2D7395662EF5D21CC05CF8B9B46030585151B17EFDFA843780F5FF2FB2C44DAF050E45A459ADB8B8D8FC71B677EF5E371D7A9AC16C912621148B34554245ABB1A47369698778A8B089855938FC8CB24FDD888BB459AA34E9B0312FBE209B5EC3990752A68BB49C9C9C356E67FDFB0A3023D2AC76EDDA35E3A34DFEC1BE6DDB36BFDFAF7BA5AC3087488B1D695CAACA2C952EB38F788C3F8566AECFC2A59B7132ECD67CAAB4FA8DE69129EAD8E6749E2D8D5F873946DAA54B97A44ADBB871E32F7FF94B73BCF96773E2C489BA05D9B120858585441A1C8A48D3A0A0A040EDFFE5E5E51E39EA7867D6488B5E6166BE4A2C36E251FE1AD79FCD2BD22285DAB2E54B539C069BCBB934E370E552D31296265E3330DF7369535353ADADAD9B376FDEB469D30B2FBCE0A61870D36B814311691AC827DADAB56B55A4353535E95E1D8BCC1C69D1D227613061F86E63F8705F432CC9E61C69A63123E1984C1C3C39877369F105A23AEC29855AE4C68C2344E638E251CAAFDDBB774BD166C1C6B7069106ED88343D72737365FFCFCFCF977FB3EB5E178BCC1C6969AEB39EAEA82469D4788D70FCA4ABB1C2691789B4F0993073F2A9D360A9072BA63F3116ED1F79DEF8D5330D865C70A4B90F9106ED88343DAAABAB65FFAFAAAAD2BD22D69975C463865AC258C7F8C38C339E03CB5423D2005D88343DA438CBC9C9090683BA57C43A56459AFE46A401BA1069B0C89295451EF97119F54A756F6F0D88346847A4C122F7E6EE910FFA239DFDDA2327DB4D5EE65D4FEFD0BDBD3520D2A01D91068B7CF3B55AF9AC7FEDC805ED9193D576B26B505EE6DDABCB756F6F0D88346847A4C122AFD49D97CFFA875FADD59E3A596DAB2A9BE565AE286AD0BDBD3520D2A01D91A6C7ED3474AF5716750D8CC867FD879ED8E61F18D51E3CD96BF7ACAB909779E04C8FEEEDAD019106ED88348BA8C4FA2022140A4D4D4D4D269189F290EAE3CA847BE057D5F271FF3FA527B4074F96DA1BC77DF20297AC2CBA3511D2BDB1AD160804F2F3F375AF05BC8E48CB3A23CC24B1468747BA4E9D3E57577FF8F59D75AF6E57EDDD03D5EF1D3F19181C1A1D1D1D1B1B1B1F1F57F1E6BE603BDD3DA80AB5935D83DAE327E3AD2F30A1C63ABE52775EF796D68048831D10695964849924D9B1374AB73EF2D88F3EF6A9A73EFC67299B3CF4FA43DF92A81BB8762D180C4ABC49B6B92FD8BEFDEBC3F2A1FF899F96BAECF0E38D91D0D2BCFDF2D2EECDDDE396FF57F343A4C10E88B46C516126B12475D8739FFE5B73743DFFA5AFE47FE5EB45DF7B429ADC90BBE6A893CE075E2E1C1CB89E1C6CBA5F53068C4E84D468FEBB5797B77607B44751469AD4672ACFA44AEB1A18D1BD8DF520D26007445A56A83CEB693BBBE10BF7A9A07AE64F3FB3FDD1156D6F148F5DBC18EAE9496832B16567897430B26DFDE7FFFE5C5DFDD0D09004DBD8D8D8E4E4A46B52CDD73F72CFFA0A75F1D6E69AF3DA036991ADBCC9AF8E37CACB397D6950F7D6D58648831D106999A7F2ECDD03D52A9F9EFEC89F977DFF8781D67793932CB9493729DD641655CF1D2EDE353030303C3C2CE59A9B526D743CF470E4323555AEADAA6C76DCD9B58EDE91170F9D51E31BA549487BB63E538834D801919661469EA958922AEDCA9186B98499B9C92C6BFFEACB2A0E6B8A4AAF5EBD2A9F172E4B357911FBDB7A24CF5424A8A6CA1D9BB7E4757EE9B7675CF1FF64518834D8019196492ACFCED5D5AB3C7BFDA16FA53CCC38972633163CF04D956A52ABB932D5EE4482ADA2C5BFA2A8C11161666E773DBDE3D1ED878B1B7D1E1CAF9F1291063B20D23246E559DF858BCFFCE967248A5EFEC76F4C76772F2CCF5493D95FBAFF41751EAEE570BD5B530DEE40A4C10E88B48C918C191B1B5BFFF9BF97105AFB575FBE79BE633179A69A2C448D965C7DCF172F7476F6F7F70F0F0FCBB34C4D4D1169B015220D7640A465862AD1F6FDBF02899F1F7CF4930B387F36C3793559A02CF6CD9FADF5FBFD030303C160707C7C9C420DB642A4C10E88B4CC50D753AB438E923DC9C9143C77FE85C880FEA247FF2BF95199280F4907E996FC68D9F77FA80E3F9E6969E9E9E9191A0A7FCF88BA584DF7EB06A22E5FBEBC75EB56DD6B01AF23D232409568875FDFA98227D0FAEE84CF37D1D5156972C327535E885DA0A6524D268EC73AA83C534DBA05DE95D9BBC28FFA22ADCB37D2D6AEAE0728CFCDF3F97C57AF5E1D1E1EA65083ADF8FDFE1D3BBCF82B71B015222D032457A466CAFFCAD7C371F5BD2746CF9D4B68E63C536DE7238FC974A9C9E446C243D2397909DB1F5D11BE24E0CB5F3D7BF6ACB95023D26013441AEC8048CB0075D4510DDC6F2B2A093437079A9B227F9B034DE196F24B1D25CC92F34CB5DF3745678C2EA7A9B9ED8D6235A0BFB9F1A4146AFDFDFDC160500D7DD4FDEA1D60FFFEFD12FFBAD7C2E58834D801919601922BEF1D3FA9BEEFA3FFC891E4F6FA43DF4AF76DC5C94D3AA75C881A24B26F67D185CE4EF3B147DDAFDE01F2F3F3038180EEB57039220D7640A4654028143ABEAB42F2E6F92F7DE54AD5C1703B58156DB1DB734C35E996620991BBEAEB22CB73F3CCC71EE5A975BF7A0720D22C40A4C10E88B4C55227D27EB7659B0AA4F7DF7E3B5D2BFC3FFF3C739E498719667FF91FBFA18653B6B5B5C9C707A7D3E68E48B30091063B20D2164B126572725245DAD6471E7BAFA474BA9596BC5752F25EA9BA2D7F4B6648357928DCB9A4E4A231A3BA511ABDABEA3C89B49696169FCF373030A0BE4984489B15916601220D7640A42D968AB4DA58A475ECDC39439B39D2669E3721D28C112244DAAC0A0B0BFBFAFA74AF85CB1169B003226DB1CC9156F0C037630596A9CC0A576C526CCD54A24D176AB1FA2C5AAB19ADA4545D2440A42D807CD4CA07AEEEB57039220D7640A42D968A346378C8824FA4CD7A3A4D7D7B64796E1E91365F449A058834D80191B6582AD2CED5D5AB41FC970F1C888E5134B5F90EE2370F95543764B1C6207E226DBE88340B5CBC78B1A8A848F75AC0EB88B4C5529116181C52975A9F2C284CBEA42C5D74A58BBAE425C862D5A5D675B5B50C0F992F22CD02ADADAD7BF6ECD1BD16F03A226DB1D4207E4917F5DB66DB1F5DA1BEF8E3F7A6BF1B23C70CCD6DE7238F059A9BE4D1E42F1091CEB1EF1F69326E6C8D74DBF085FB8E1D3BE6C241FC8347B7ACD9727450DD4856D9297D3A2B233D927456AAC767B07BF7EEF6F6F66CAC380C441AEC8048CB80502834363676E0E57021F5CC9F7EE6FA89C6846F681C3A79CAFC358FEA0B1E554BF89A47C933E99C30BB2C507D6DF1B6679E934873E9A5D6124DD1CC925B126347C3E9169762A9C36B0E91261FB5F2819BD1B57538E3DF10A9FE1511DD9CA9FF7991D8CB40A4C10E88B40CF8E0830FC6C7C7FB7B7BD58FCB947DFF87E16FE20F37F54DFCE12FD40FBCFBAEF1E332E35D5DE3D10E3EF575FBC68FCB84BF863FF2E5FDF250B44F5757D1F79E5027EA6AAAAA4E9D3AD5D1D1E1DE2FC48AC459DA4FCF48A596B24B8ACFD869445A2AD17F43487299B7DCF45DB995BA2E8EEB6520D26007445A06A8480B06837BD6BFF854E427407B6AEA32F513A0B2283530A4F0F11F4A89661E1BE2D248539F95C68D149F9EA9E7488F489BC14C551A9106A721D232C0389D3670EDDADABFFAB2C4CFEA7BBE98F2C73CE7DB6421CF7DFA6F6581F2B7AEB6564A3457FEB88CFA508D7C7EA6ADD2D403B1136EA6CF53226D7166ADD212322FC5FF8208220D7640A46580FA0950A999868787CF9D38A90E3FBE74FF8393DDDD8BC93399FDF9FBBEA6CECFEDDB59A40686B8F62740A3A33F66ACD2A6478898726C0E915617919DF57624D3BF2166AFD2CCF1956A5A1491063B20D23243D2657272522A27A99F8EEFAA5003FAF3BFF2F505D76A32A31A42298B2A7D69537D7D7D4B4B4B47478751A2B9EDC7D2A6232DFD5932F3A047E34395485B98D8C6541BD2B4694DB145A4C16988B4CC300AB5603038303070B878974AB5E73EFDB7578E34CC37CF641675BCD1C83375C8D1EFF7CBC28DB368EE29D1EECCB74A8B9B91485B88F8488B8E16E90C976C959D8383831C788423116919A3CEA88D8D8D0D0F0FF7F7F7D71495AA23903FF8E827B73FBA62A4AD7D2E6126DDA4B31A0FF2A38F7DCA9C676A54882C5C9EC23567D1A6A58AB4CACAE90F51531F638E59873A4611692924445AF83F47A787F6DFA14A8323116919A30A3575F83110085CBD7AB5E570FDEA7BBEA82E38937CDAFAC8632D3B4B26BABA92934C26CA43D2415D7FA6CABB7D3B8BCC79260B94C51A871C5D15699D09D995CAA0F904D0FC343434D4D4D42C62FDDC281669F1DB3EFE8235463CC26988B44C4A4EB50B9D9DE5B979AA5C33B26DFDE7FFFEA5FB1F946A4C9ADC90BB4692A9C120DB9E79AEAEB6560DD9777F9E257DBAA63C9B662A2AD2F649B77C3E6D13C5B6B46CB3E4748A6EEA795E6A4D290C3B20D2322C21D5FAFBFBBBBBBBCFB4B448B0497AA9238A299B3CF4FC7D5F7BF3676B6BAAAA24CCA4386B6B6BEBE8E890D965212ECE330B106909660F2D9575F3A9D28834D801919679E6541B1E1E1E1818E8E9E9914A4BEAADE6C6933545A5075E2E94E8325AE94B9BF6ED2C5265D9A9080933559CC98C32BB2C843C5B0C22CD02441AEC8048CB0A23D5C6C6C682C1E0D0D090545A2AD82E74769E8D90DC6A31698B90E9D2418599CC2233CAECB210F26C3188340B1069B003222D5B54AA4D4D4D8D8F8F4B8D6504DBD5AB5725AEBABBBBFD7EBFCF44EECA4479483AA83053C599CC2E0B21CF16A3A3A3A3ACAC4CF75AB81C91063B20D2B2E8764442B04950DDB87143126B20A23F42DD9689F29074906E0961469E2D063FB86C01220D7640A4659D39D826272755B629411363A274906E84590611691620D26007449A458C6013A15048C55B0299280FA93E84590611691620D26007449A1EB7D3D0BD5EEE44A4598048831D106970BFEBD7AF171414E85E0B9723D26007441ADC2F1008E4E7E7EB5E0B9723D26007441ADC6CC3860D095F8B515858A87BA5DCA9AAAAEAC48913BAD7025E47A4C1CD8A8B8BCD79B677EF5E2E50CB127E3A1C7640A4C1CDAE5DBB969393A3F26CFDFAF5DBB66DF3FBFDBA57CA9D8834D8019106972B28285091565E5ECE51C7EC21D26007441A5C4E3E67D7AE5DAB22ADA9A949F7EAB81691063B20D2E07EB9B9B91269F9F9F9535353BAD7C5B58834D8019106F7ABAEAE9648ABAAAAD2BD226E46A4C10E8834B89F1467393939C16050F78AB81991063B20D200640091063B20D200640091063B20D200640091063B20D20064C0EEDDBBDBDBDB75AF05BC8E480390013B76ECE09B59A01D910620038834D8019106BBB87DFBCE81B69E9FEF695E9AB75FDA1FAE78CDE6EDDEDC3DB29E4F969D286EF48D4E84746F3FCD8834D8019106FD866E4E3CBBFBD45D4FEFD09E528B69DFDE7ED8D73FA27B5B6A43A4C10E88346856D4E85BB2B248A5C23DEB2A5655361F6ABF2AEDC648E8D6D81D3B37B59E2F1E3A63D4941F7A629B5499526E7A1091063B20D2A08D7CF43F59764285C1FD9B0EB67607B4A7D4825B47EFC8C3AFD6AAD7F2C0AFAAA5EED4BD75AD46A4C10E883468A3F24C2A9BCD35E7B56752A6EA3675F854EA36AFD56A441AEC8048831E458D3E95671203DAA328834D6A4D751CF5D9DDA7746F634B1169B003220D1A5CB931AA3EF75F3B72417B0865BC1DE9EC97A8965777BA7B50F796B60E91063B20D2A0813AE4F8C02BD5DAE3274B6D5565B33AFCA87B4B5B8748831D1069B0DAE8444815318E1E0F3273BB3112526568CB25AF146A441AEC804883D52A4EFB5505A33D78B2DA96BDD9202F73F5DE66DDDBDB22050505D7AF5FD7BD16F03A220D565B5114FEAC5FB7BF557BEA64B5BDD3D2232FF373EB2B746F6F8BE4E7E7070201DD6B01AF23D260357561B2CB063A26B7BEC084BCCC252B8B746F6F8B1069B003220D56FBC44F4BE5B3BEA377447BEA64BBA95386BAB7B7458834D8019106ABA9AFD8B0FFF75D1169F342A4C10E8834584D45DA1C53C157BA62E9D2BCFA140FF5962C57D3E5C6D27829FACB729695F6CEF85CE1E5E436A47CA83177F95B3ED394FA8DE97AC635F54A756F6F8B1069B003220D569B7BA485F34CB2A4216F697CA22445DA8A92F74DF1138B3473F0C445DAFB6F2DDBD818BE214B9E516CF6C4480B2F2175D01269804E441AAC36B7488BD45EB12049A8D522776396E7E546222D165A719196562CD26628DD6481099116F7BCD32B901CB7441AA0079106ABCD1E69AA7852A9131F63A6C37D89555A72A4CDB7A53A38693EAA19AD052529A3DD664C44220DB01E9106ABCD1C69AAB45AB63C453D149D188DBA149116093C23D292CFB1A52AADD21F7B9C8E4FD3914F53EC251D8D24D28834E846A4C16AF31A1E3243EC19C5D3B2B49126378CE4331F4234A591A9D2325769A6A38EE90E60722E2D0E91063B20D260B539449AC4D2AC29628EAE70A4458247A624449A1ACAA18E191A0349E2226D962A4D3A6CCC8B2FC8A607A4CC3C90325DA4EDD8B1638DEB6CDCB8716C6CCCFAB7136046A4C16A738AB4998638465A38A8961AE7B7C277C3E344CC9967EEAF32D21818398F2AAD7E632426E306AA4CE759C2093F2F5769801D1069B05A46222D364643B24A0246954DA6B22C3CBBA97FA4505BB67C698AD360733997661CAE5C6A5AC2F46D220DB00B220D56CBC081C7B8CBC2C2C34022E9628AB470F114BD6BBA00C0E839BF7369F111AB469DA8049D69043F9106588F4883D5165FA5D56F9CBEB67A7A48BD691C47248D22FDC367C21AE31722F3A61EAC98FEC458B47F64F9E6CBBAE3064312698076441AACB6F8118F736B09631DE30F33CE780E2C538D48032C46A4C16A56459AFE46A4011623D260B5252B8B3CF2E332EA95EADEDE80871069B0DABDB97BE483FE4867BFF6C8C976939779D7D33B746F6FC043883458ED9BAFD5CA67FD6B472E688F9CACB6935D83F232EF5E5DAE7B7B031E42A4C16AAFD49D97CFFA875FADD59E3A596DAB2A9BE565AE286AD0BDBD010F21D260B5AE8111F9ACFFD013DBFC03A3DA83277BED9E7515F2320F9CE9D1BDBD010F21D2A0C103BFAA968FFBFF293DA13D78B2D4DE38EE9317B86465D1AD8990EE8D0D780891060D4E770FAA42ED64D7A0F6F8C978EB0B4CA8B18EAFD49DD7BDA5016F21D2A0C7B77F7D583EF43FF1D352971D7EBC31125A9AB75F5EDABDB97B6EDFD6BD95018F21D2A0C7E844488DE6BF7B75796B77407B1465A4497DA6F24CAAB4AE8111DDDB18F01C220DDAF8FA47EE595FA12EDEDA5C735E7B202DB29537F9D5F1467939A72F0DEADEBA80171169D069743CF470E4323555AEADAA6C76DCD9B58EDE91170F9D51E31BA54948539F01BA1069D0ECF6ED3BFBDB7A24CF5424A8A6CA1D9BB7E4757EE9B767387F066844A4C11624092A5AFC2B8A1A1C1166E676D7D33B1EDD7EB8B8D1C7787D403B220D00E012441A00C025883400804B106900009720D200002E41A401005C82488357ECD9B347F72A00C82E220D5EB166CD1ADDAB0020BB883478059106B81E9106AF20D200D723D2E015441AE07A441ABC8248035C8F488357106980EB1169B09FC1A35BD66C393AA86E24ABEC943E9D95911E493A2BD5E3C98834C0F58834D893445334B3E496C4D8D170BAC5A558EAF022D2000F23D2606791384B59A5A94725E3527631F78A21D200D723D2606746CD65DC183CBA254D1596304712220D703D220DB6A34EA0450E32A6ADD2D403B1136EA61023D2000F23D2604BD1D11F335669D323444C3946A4011E46A4C196A6232DFD5932F3A04723E98834C0C38834D8D2FCAAB4B8198934C0B38834D852AA48AB54259B9163F191661474E9468F106980EB1169B09FCE84EC4A65D03488646E8834C0F58834D84EACFA4A77C559B8108BF549FDFD225C970678139106AF20D200D723D2E015441AE07A441ABC8248035C8F488357106980EB1169F00A220D703D220D5E41A401AE47A4C12B8834C0F5883478059106B81E9106AF20D200D723D2E015441AE07A441A5C6EC3860D095F95555858A87BA50064059106972B2E2E36E7D9DEBD7BCBCACA74AF1480AC20D2E072D7AE5DCBC9C95179B67EFDFA6DDBB6F9FD7EDD2B05202B8834B85F4141818AB4F2F2728E3A022E46A4C1FD5A5B5BD7AE5DAB22ADA9A949F7EA00C816220D9E909B9B2B91969F9F3F3535A57B5D00640B91064FA8AEAE9648ABAAAAD2BD2200B2884883274871969393130C0675AF08802C22D200002E41A401005C82480300B8049106007009220D9E703B0DDDEB0520938834B8934AAC0F2242A1D0D4D4D4641299280FA93E241CE002441ADCC6083349ACD1E191AE53A7DB7F5B77F8F59D75AF6E574DEEBE77FC646070687474746C6C6C7C7C5CC51BC106381D9106F730C24C92ECD81BA55B1F79EC471FFBD4531FFEB3944D1E7AF59FFF5DA2AEBFB737180C4ABC49B6116C80A3116970091566124B5287ADBAFBF3E6E87AFE4B5FC9FFEA43458F3D2E4D6EC85D73D449E7AA4D5B0607AE27079BEED704607E8834B881CAB3DE739D1BBE709F0AAA67FEE4D3DB1F5DDEF646F1D8C58BA19E9E8426135B7696480723DBD67DFEEFCED51F1B1A1A92601B1B1B9B9C9C24D500C721D2E0782ACFDEDD57A5F2E9E98FFC79D9F77F18687D3739C9929B7493D24D6651F5DCE1E25D030303C3C3C352AE916A80E31069703623CF542C4995D67BA4612E61666E97EB8E4895A6E2B07667715F5F5F201020D500C721D2E0602ACFDA7F5BA7F2ECD57FFEF7948719E7D264C68207BEA9524D6A35520D7022220D4E659C3FFBF1C73F2B5194FFD58726BBBB179667AAC9EC2FDDFFA03A0FD772B89E54031C8748835349C68C8D8DA903866BEEF9E2CD73E75206D540E3A9BADC97A480DB7CFF83AA153DF6F8C982C2949D65216B3EFB05B5C00B9D9DFDFDFDC3C3C3F22C535353441A607F441A1C499568875EDA2CF1F3838F7E32E5F933C92749AF74D7A5496D2751973C972C4A16281DDE782EC7EFF70F0C0C0483C1F1F1710A35C0FE88343892BA9E5A1D727CE7473F4B4EA69E9A3AF5E8CC4DAAB7E4F2AEF2C967D4E1C7332D2DB2A4A1A1F0F78CA88BD574BF6E003321D2E03CAA443BFCFA4E153C236DED135D5DE6E6FF4DD55CF24CB517BE705FC2ECB240753DC05BBF78D1E7F3F5F5F50D0F0F53A801F647A4C1792457A466CAFFEA43923A458F3D2E6556427B2176C1F51C9BD479714B387B6EFBA3CBC397047CF9AB67CF9E35176A441A6067441A9C471D755403F7DB8A4A02CDCD81E6A6C8DFE64053D3A155EBE69567AA496127F34697D3D4DCF646B11AD0DFDC78520AB5FEFEFE6030A8863EEA7EF500D222D2E03C922BEF1D3FA9BEEF63E0C8918466FE82C7B937A9F61296A30689ECDB5974A1B3B3B7B7D738F6A8FBD503488B4883F38442A1E3BB2A246F9EFFD257AE541D0CB78355AA9D2C285C409EA92F2FBE7CE0407821B105AAAF8B2CCBCB371F7B94A7D6FDEA01A445A4C161D489B4BA57B7ABF18AEFBFFDB6B9BDF3A39F2D2CD2A4252C4A9DAB7BE3B99CB6B636BFDFCFE934C0FE8834388C24CAE4E464ED966D92375B1F79ECBD9212732BFAB7FF5C70A41DDB98675E94E4A58AB49696169FCF373030A0BE498448036C8B4883C324445AC7CE9DE6B6C848332F2A21D28C1122441A605B441A1CC61C69050F7C33A14A5357492FAC252CCA38F048A4014E41A4C16154A419C343124E802D667848C2A2D4B747BEF58B178934C0298834388C8AB473F5C79E8A0CE20F0F53546314636D8183F8FFED3FA3C32623C31D65B1C6207E220D700A220D0EA3222D3038A42EB596B22CE17AB2855D6A2D65997921AADA93A7A8ABAD657808E014441A1C460DE2977451BF6DB6FDD1E581A6F0F77DFCDEF47763E498E1DC5BE593CF44BE37A429F645244D5B1F79ECA9C86F641F3B768C41FC80531069709E502824E952B569CB5391AF2DBE7EA231E13B1E7D7BF6CDFD6B8B37FDC3D76E9E8D9B5D16A8BEB678DB33CF49A471A935E014441A9CE7830F3E181F1FEFEFED953C93E029FBFE0F13BE4A5F7D19BFFA31CF995BB8C86B7D37615EF52B6BB2F09AAAAA53A74E757474F0855880231069701E1569A3C3236FFDE2C5A7223F01DA535397F227406718D32F8197F2B7AD65516A6048E1E33F9412CD3C368448036C8E4883F318A7D306AE5D5343EDD7DCF3C59B67137FC9D308B6BADC97A4F0DA7CFF83AA49CEB5EC2C49DDF9EC3955DBADBAFBF375B5B552A2F1E33280831069701EF513A052330D0F0F9F3B71521D7E7CE9FE0727BBBB5306D51C9BCCFEFC7D5F53871CF7ED2C520343F80950C04188343892A4CBE4E4A4544E523F1DDF55A106F4E77FF521A9C916966732A31A42298B2ACBCB973C5367D18C128D1F4B03EC8F48832319855A30181C1818385CBC4BA5DA9ACF7EA1F748C37CF34C66511768AB3CABAFAF57871CFD7EBF2CDC388B468906D81C9106A75267D4C6C6C6868787FBFBFB25D5D411C81F7CF493DB1F5D9EEED45A421B696B97CE6A3C88CC6ECE33352A44162E4FC15934C011883438952AD4D4E1C74020D0D7D7D772B87ECD3D5F54031A7FF4B14F6D7DE4B1969D25135D5DC9492613E521E9A0AE3F53E5DDBE9D45E63C9305CA628D438E441A607F441A1C2C39D52E7476BEF58B17CDD7594B68ADFBFCDFBD74FF83528D49931B72D74832559C6D7BE6B9BADA5A35649F3C039C8B4883B325A45A7F7F7F7777F7999696B2BC7C492F7544316593879EBFEF6B6F3C97535355A50683B4B5B5757474C8ECB210F20C7022220D8E674EB5E1E1E18181819E9E1EA9B4A4DE6A3AD15853BCEBEDCD5B24BA8C2677F7ED2C526599745061A68A339951669785906780131169700323D5C6C6C682C1E0D0D090545A2AD82E74764A5CB545B498A829F29074506126B3C88C32BB2C843C039C8848834BA8549B9A9A0A7F57D6E8A8116CBDBDBD1257DDDDDD7EBFDF67227765A23C241D5498A9E24C669785906780131169708FDB1109C1264175E3C60D49AC8188FE08755B26CA43D241BA258419790638119106B73107DBE4E4A4CA362568624C940ED28D30035C8048833B19C12642A1908AB70432511E527D0833C005883478C2ED3474AF17804CFAFF5325762D31C42F160000000049454E44AE426082, '2000068', 'pre_loan_apply.png');
INSERT INTO `jbpm4_lob` VALUES ('2070002', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D227072655F6C696D6974735F6C6F616E5F6170706C792220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232342C31372C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A093C2F73746172743E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6D657267652F6D657267654170706C792E6A73662220673D223230302C3130302C39322C353222206E616D653D22E5AEA2E688B7E7BB8FE79086E5B297223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657230222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223132362C3132353A32392C2D313722206E616D653D22E692A4E994802220746F3D2263616E63656C222F3E0D0A09093C7472616E736974696F6E20673D222D33312C2D313422206E616D653D22E68F90E4BAA42220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6D657267652F617070726F76654D657267652E6A73662220673D223230302C3230302C39322C353222206E616D653D22E9A38EE68EA7E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657231222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336372C3232373B3336372C3132353A2D32382C2D3822206E616D653D22E98080E59B9E2220746F3D22E5AEA2E688B7E7BB8FE79086E5B297222F3E0D0A09093C7472616E736974696F6E20673D222D33322C2D313222206E616D653D22E9809AE8BF872220746F3D22E59088E8A784E5B297E5AEA1E6A0B8222F3E0D0A093C2F7461736B3E0D0A093C7461736B20666F726D3D222F70616765732F6170702F6D657267652F617070726F76654D657267652E6A73662220673D223230332C3239312C39322C353222206E616D653D22E59088E8A784E5B297E5AEA1E6A0B8223E0D0A09093C61737369676E6D656E742D68616E646C657220636C6173733D22636F6D2E7166772E6A62706D2E68616E646C65722E5573657241737369676E6D656E7448616E646C6572223E0D0A0909093C6669656C64206E616D653D22766172223E0D0A090909093C737472696E672076616C75653D2261756469745573657232222F3E0D0A0909093C2F6669656C643E0D0A09093C2F61737369676E6D656E742D68616E646C65723E0D0A09093C7472616E736974696F6E20673D223336362C3331373B3336372C3232363A2D32382C2D313122206E616D653D22E98080E59B9E2220746F3D22E9A38EE68EA7E5B297E5AEA1E6A0B8222F3E0D0A09093C7472616E736974696F6E20673D222D32392C2D3922206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232362C3337392C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223130332C3234372C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '2070001', 'pre_limits_loan_apply.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('2070003', '0', 0x89504E470D0A1A0A0000000D494844520000020C000001AB08020000002315589300003A2549444154789CED9D7D505CD77DF73BD33FF39F3399499D4E9BA69399274ED23AEDD47566928CDAFA193BF3F489EBB88D5D376D9C3A96D4C6AE5F65E7C58A10A0806DE4075938C2B688C05E5E8485409614210241802490402004128B58B4080921560B9B65B5E26D0DCF6FEF6FF772F7E52EB02FF770CFFD7EE60CDABDF7DCB3F71EDD7B3EFB3BE7DCBB7FB004000000E8F007A277000000C0FA0592000000A00B24010000401748020000802E90040000005D2009000000BA4012000000748124000000E80249000000D00592000000A00B24010000401748020000802E90040000005D2009000000BA4012000000748124000000E80249000000D00592000000A00B24010000401748020000802E90040000005D2009201B8B8B8B9F28040281051D6815E7A1CCA2F71780750D2401E481F5400E989B9B9B9999F1FBFDB76FDFF6C5400B691565A06C9419AA00200190049001550FB3B3B3E480C3ED453BF6FDEB7FFDF2AFFFF5277FF2DD173FF34FCF7F9A12BDA0B7B490567D7CBA687272D2EBF55266DA04AA00400F4802981BAD1EA67DDEA203CF3C9DFD17DFDB72F77FE7FDCD1B1FFE474D6B41B7F3D88DDB0394E805BDA585B48A325036CA7C7362DCE3F1401500E801490013C386989F9FBF73E78EED78D6C69CBFFCE1B67B76EDDF343871DA13184D90280365A3CCB4C987C7B35C2E174515540815054F00A005920066850D313737E7F7FB737FFDBD277EFAF9C2AA8D89DD109B6813DA90361F1B1B9B9A9AA2A2A8407802001548029812D510E36EE72B6FFFEF675EBFBFEDD2FEB51A82136D489B5321979D7D6EB7DBE7F3C11300A84012C07CA886A0069D1AF79FEC7E7062E6727286E0449B532154D4D5AB576FDDBA054F00A0024900F3C1E3107EBF3FA7E45F280848D110AA27A8282A903C41F10415CEE313A28F1500C14012C064D0B7FB8585853B77EE94D5BFF6C44F3F9F742F53DC7E272AB0F4D86BA3A3A3535353F411F441082680C5812480C9A06FF7B3B3B39EDF4F3E9DF397AB1DA95E58C33836157B69A07F6C6CCCEBF5D207219800160792006682C388DBB76F17566FFAE1B62FB9E786DD73576ECD0F5372D3DFB92BC1B773C117C1D7F39C68D515654930336D728BDECE7386E086C1E5F3E185F357A8582ADCE170B85C2EFA200413C0E24012C04C84C2088FE747DBBFB2B3F2A9F13B03373489DE8EFB95BFFCD6AF2CE7257EFBF81DFB7838DB72FE3BA13CEA5B2A960AEFEBEBBB76ED1A7D10820960712009601AD430A2BAF98D7FD97277D7C86F46BC3D4A3A4F7FAFF2EBE9E00B7E7D75BA279461FA3CE719092E397F35989633AB19AE2A9B74398F52E1954D7943434308260080248069E069AF5EAF37EBFD4736EDF8DAA0FBF4E064FB654EEED39C06DDF49A97B40F0693B2705279ADE454FE9E56962B6FD5B5FC96564D9EA6C2B7BDFF487F7FFFF5EBD7E9E3783AACE8A307400C9004300DD452CFCCCC4C4E0687ACC9137D377FD737AEA49BBFBB104ECAC2265A7861FC77A10C379BFA7839BF1857B22919829B845FF42D6FFE3B32047DC4B973E79C4E277D1C7D2824012C0B24014C432010F0FBFDB76EDD7AECD53F2E3EFC62D7B5DF745D3BAAFC0DA673FC62545D487F8F9E53969CA3D7BC7C94F3A85B8597681652662A9C3EE2CC99330E87833E8E3E943E5AF4D1032006480298061E9098989878E485CF1CEC78EBF49583A79DB5A7AFD4B63B97537089F360BBF320BF381D5A7890322B197815BFE514CAA6E6A48554387DC4A953A7060707E9E3785842F4D1032006480298066AA97D3EDFF8F8F83F3DFFE9C64B65AD8EFD94DA94BFA11743FCB65A795BDD36541DB996960797F0C2B62175F3EAD0DB60FE6086A68B65F4116D6D6D030303F471F4A19004B02C9004300D5A49FCB6FFD7272E579EB85C114E95116F87826F5B2E57B40C55F08B134315C1B7BC30943FBC76A8425B0EE569E8DF471FD1DADA0A4900004900D3A04AE291173E537D2A3FD8B80F55865AFC216EFAA9DD675B5486F550C96BF975C810612BB484FD11CA13DAB662FFC97CFA0892C4A54B97200960712009601A54493CF6CA1FEFAEFD31F714B539D44EA4506711F735B53A96FB9AD40CADCBD938839AF66B5EECA7C2E92320090096200960225449FC28FBAB3F2FFE47ED7875FB48C4F075FC2589976B12154E1F81EE2600962009602254496C2DFEBF4FE7FC853AF995E7BF9E5367C1AAAFAF2F2F3F179DEDD8B960FA4D745236A1C2E92330700DC01224014C843A05F6C386AC7F79F98F5AEC957D379BC337CA8552BFE66F786D73BF9A61BC797993F08D78E17BEE9A7949EB4025155E7AEC1798020BC01224014C847A339DC3E1F8CFAC2FE77FF8FDD01338424FE608A5E567754C46AE8D791B7A508766152DA162A9F063C78EE1663A009620096022D4C772389DCE828A1F3EF98BFF3532CD4FE5531FF0773EF83A98C26F95B5A185FC80BF600A2E096D38AD3CEF8FD7060B394FC552E18D8D8D782C07004B90043011EA03FEAE5FBFDED7D7FBA3ECAF526BAE3EFA7B3CE299E1F6F033C0EDEA33C09525F6F0EBE5278787162A4F14A702A9D8C3473E6E6D6DC503FE005882248089501F15EE72B9868686DE3FBCE5899F7EBEA5AF42F9D5A02BFC8B43C19F180AFFB290F27AD8ADF93D22E5178A343F4034CF6B43BF4DD4D25F4105BEF7F196E3C78F9F3D7B168F0A0760099200E642FDD1A16BD7AEF5F5F56DDFFBE833AFDF3F317339F51FB8A642A8282AF0F0E1C31446E04787006020096026B4C184C3E1E8EAEADAB2EB1F7EB2FBC1789EB8BA2643502154546D6D6D535313158B9F2F0580812480C9E060C2EBF58E8D8D0D0C0CB49D6DA4C69D8280B64BFB93892116466943DA9C0A39746C7F434343474707154B85D347208C00009200268383893B77EE4C4D4D8D8E8E5EBC78F1F4E9D3D97B1F7DE2A79F2FACDAB85649D026B4216D7EF0E0C1E3C78F53515420154B85D347208C00009200E683BEDDCFCFCFFBFD7EB7DB7DF5EAD5FEFE7E6ADC4B8EBCFA74CE5FFE70DB3DBBF66F1A9C389DD80D9481B25166DA64EFE1576B6B6B2986A042A8282A908AA5C2E923104600004900F341DFEE793AACCFE7BB75EB1635EBF4F5BFA3A3A3E9778D85FB37FD28FBABDFDB72F77FE7FDCD1B1FFE474D6B41B7F3D88DDB0394E805BDA585B48A325036CA5C73F0C0E1C3879B9A9A68732A848AA202A9589EF68A30020048029812AD27E88BFFE8E8E8C0C0405757576B6BEBF1E3C72B1B7F9953F2BDCD3BFEFA5F7FF227DF7DF133FFF4FCA729D10B7A4B0B691565A8A9A9213D5066DA8436A4CDA9102A0A8600400B2401CC8AEA09BFDF3F3535353636E67038FAFAFACE9E3D4BED7E6363E3B163C78E1C394226F8F8E38F0F29D00B7A4B0B691565A06C949936A10D69732A848A822100D002490013C39E989F9FBF73E78ED7EB75B95CD7AE5D1B1A1AEAEFEF3F77EEDC9933674E9D3AD5D6D6D6AA81DED2425A4519281B65A64D6843DA9C0AE17108180200154802981BF6C4C2C2C2ECECECEDDBB73D1E0FB5F8D7AF5F773A9D141F0C0E0E0E285C52E0D7B490565106CA46996913DA9036A742600800A28024800C44A982C282C9C9C95BB76E4D4C4C8CC7400B691565A06CD00300898124803CA8AA989B9B9B9999F1FBFDE4005F0CB490565106CA063D0090184802C806AB820804020B3AD02ACE033D0090184802C84F5D5D9DE85D00C0AC4012407EB2B2B244EF020066059200F203490090349004901F480280A4812480FC401200240D240124C7E3F11416168ADE0B00CC0A240124079200201520092039900400A9004900C98124004805480248CEB56BD7F6EEDD2B7A2F00302B9004901CA7D3595A5A2A7A2F00302B9004901C48028054802480E4401200A402240124676868C866B389DE0B00CC0A240124A7A7A7074F8105206920092039900400A9004900C981240048054802480E2401402A401240729A1544EF05006605920092034900900A9004901C48028054802480E4401200A402240124A7BEBEBEBDBD5DF45E006056200920397575753D3D3DA2F70200B3024900C981240048054802480E2401402A401240720E1C38D0D7D7277A2F00302B9004909CD2D252A7D3297A2F00302B900490931D3B766445525C5C2C7AA700301F90049093F2F272AD210E1D3A545555257AA700301F900490939B376F666767B3217272724A4A4AD0E90440124012405A8A8A8A5812369B0D7D4D0024072401A4A5A7A767FBF6ED2489F2F2F2CECE4ED1BB038029812480CCE4E5E5E5E4E4BCF5D65B0B0B0BA2F705005302490099696868A060E2D0A143A2770400B302490099A100822209B7DB2D7A4700302B90040000005D2009000000BA4012000000748124000000E80249000000D00592000000A00B240104B3B8B874B477F417755D1B0A8E50FAC3CDEFADF3747F5E1DEDE77355EDE51D0EFF5C4074FD0190592009208CC9DB73AF1E387BD70BA5C2DBFD54D20FF69D704C4C8BAE4B0032052401C460EB70DCBDC5C6EDECBD39355B6BBB8EF7DDA034351DB833B3B49E13EFE79BC72FA871CFA79E2DA14888422200E403920046438DE97355EDDCBC3EB8EB58CF884778BB9F741A189B7EECDD263E96877FD540B191E8DA0520CD4012C068D810F4ED7B77E325E1AD7CBA620BEE34A3D802F104900C484242ECB57B4EBAD5D7B5F6388B9796DC27F768DFC65990116C1D0E360435ACC21BF734268A87B8F7ECD50367335D870018092421218A0DA8CDD7FE7C67AD9D16A8BED02821F685BD364B93319D5C9FF2734BFA5ECBA0F0663DEDA9C53E41F2A3A33B3782E709027980246423EC86603BEF3E79D24E7F6AC36DBF2A8CA56585B04FC27FEDB43C4386580A77343DFC4E83F0063D43696B6D17773A65AA0601301C484242E24612B54A6753289CD0F63C4565540D936EFC7301FEA26DEA91EAC4696A3AC0A152F75504134012200909891C7C60429D49BC8AFEEED9130E24EC11DD509C351392A839E7E46FD9C29BF28CA68D1FB6D1616E3BD495FE1A044004908484281D4B7B2874D04406763BC512DA7109ED58842191C4665BB0F5CC39D223BC1DCF68FAB87B940EF36BB935E9AF4100440049C886D2E4877A96540BF000C59E509F9366788265624824C1B79E4936A929368D7BE6E830EFDE624B7F0D022002484242ECE1E187C8C820B8206228C2D848E20B3FABA4D673606C5A783B9EE9C4432FE9AF410044004948882A89884842891FE24BC29048826F4B5EFF4FDD802400D002494848BC48C2ADCC6DD5DC30A7BC3C599B557B32DA0919BA4F8225B1BA7676AC62D386BCB615F36CAEB8B2D655A1C255F2F20B364413675B47E5E68D9563AB94041F69FA6B1000114012B2A1A8213406B11C2AD4AA139EC2539F947189F058853DB46AF9DE89F4EFD80A92B8F2D1C698D65A4B1C67B4156CD8F49123B6285A9EDF117A11C972434F1FA7E6515E9006948F58164C6BFEF287464842DD169200160092909670A890A9467FADAC2C89C8563BEA8B7CA8BD8E69F7970909835AF982D6F812D22CD77E9C4E244192D0251D92181E1EDEBB776F55559501950F40D24012C02056D3DD14BF5DD6860B6D053ADD3E1D794A364D40A0093E82268834C72A2289A4D38A923875EA54414181DA1968D87F010049004900835849121D7941211454546E5EFE9E1E6CDC239BEC1524B13CDE10CAC6BD58F91FF172D68646459B2B2AF5228988A18B44DE5AB5247C3E5F4D4D4D6E6E6ED45C32E3FF2F00583D9084308A8B8B63A69E4A42696969ECF1AE61E05AED028AEDD559B9BB291C1CB01E225BF3A01EB8CC952309EEB68AEABC621585A296B54A62C78E1DA2FF67320B9DD299BF6E80D14012C2C8B2D857C8849288FCDA1E11494438407F9651B8E1D61BCD8E4A3183CFCBC31ECBBBA4E821281B551BFC224949783C9EC6C6C637DE78E3EDB7DFCEC9C951DB56E3FF2F32844CC7025420096158ED8A5A4524A1D3C3A36991639A72FD1268ABD8B0432D2A2C092A30F603C321851A43705798DAF195A424988585859E9E9EDDBB77EFDAB58B8421D36920D3B1001548421856BBA2562789D841636D8BAC337369A5D49A1F536C68C6EDF272DD48221C4C6CDCA4CEA04D49122A4EA7F3C08103F9F9F90654BE3158ED94B608908430AC7645A5219288373B367E5752A400222531A61DC45EB1BB490935D816C10D154FA44712F261B553DA224012C2B0DA15957A2411272088AB19CEAF73775EC49086DE1D7CA1895205ADD15AE23D8424E263B553DA224012C2B0DA15B596C772AC8714AF6B2BC1B42B48C27AA7B44580248461B52BCA6C92483E4112402620096158ED8AE2DFF5B4C2A3C2F94845D7B700AC764A5B0448421856BBA2EECFABA3A6B3C53E21BC11CF74A2C3BCEB8538B7134A8FD54E698B004908C36A57D4E3EF3551EBF95ECBA0F0463CA3E9CCB09B0EF39E6DD5A2EB5B00563BA52D0224210CAB5D51EF345FA2D6F3B1779B84B7E3194D5B6BBBE83037DBDA44D7B700AC764A5B0448421856BBA2865DD3D47A7EEAD912A7CB2FBC29CF5CBA37A7860EF3E88551D1F52D00AB9DD2160192108605AFA8877FD5400DE8FF54B60B6FCA33943E38EDA003BC7B8BEDCE5C4074650BC082A7B41580248461C12BEADC889B838933C36EE10D7ADAD3B8678EE735BDD37C49744D8BC182A7B41580248461CD2BEA07BF3E41CDE8177E562959A7D3D4746043C1113AB4FBF3EA161745D7B220AC794A4B0F24210C6B5E51FEB900CF85BD675B75CF884778E39E964431041B82228961D7B4E83A1686354F69E981248461D92BCA31317D6F6E0DDF4CB0BBF192F0263EC554DDE9E45E263A9C7357D7C18F898BC3B2A7B4DC4012C2B0F215E59F0D3CA6DC36C121C5D6DA2ED38D520C8C4DBF79FC02CF65A244DAB3720CC158F994961848421816BFA21617978EF48E9221B891E5C45FC9D7798ADDE79DBFBD60D971082D163FA56505921006AEA825451535DDCECDB63653E8419BEE7AA1F4C97D27CA3B1CD69CED1A179CD252024908035714900C9CD252024908035714900C9CD252024908035714900C9CD252024908035714900C9CD252024908035714900C9CD252024908035714900C9CD25202490803579431D4D5D589DE05AB80535A4A200961E08A3206D4B361A0AAA504921006AE2863403D1B06AA5A4A200961E08A3206D4B361A0AAA504921006AE2863403D1B06AA5A4A200961E08A3206D4B361A0AAA504921006AE2863403D1B06AA5A4A200961E08A3206D4B361A0AAA504921006AE2863403D1B06AA5A4A200961E08A3206D4B361A0AAA504921006AE2863403D1B06AA5A4A200961E08A3206D4B361A0AAA504921006AEA808ECB57B4EBA832FDC27F76445526B8FC91DCC1467713C50CF8681AA9612484218B8A222D04A42DBFC47BDD5E4CF0A6DB002A867C340554B0924210C5C512AD4E02F470D3A9184268F0E3A9105EAD93050D552024908035754046B8D24560DEAD93050D552024908035754044149D8834258614C22623462354313A867C340554B0924210C5C511AD80C2B0D3284FCA1C916EA844AB421EAD93050D552024908035794CAC93D7B4E9E54BA9B62C388ACB005823E50A2067730BB2285F0E075C28002F56C18A86A29812484812B2A02754C224C82C10896C22AE737A19EE313ACC495661DEB395B67AA00AA5A4A200961E08A8A2066E05ADB40C5D842E966C214D85409795677AEC072D0164B1C89A3AAA504921006AEA8084292581E76881F49688725F83506AE532651240149581E484218B8A25478F839382E116E9EA29B2DA57329FE1075F8060ABDD60CF5BC222B461251FF1DE165908425802484812BCA1850CF71D14E145B3192D00A21DEB210A86A29812484812BCA1850CFBA84C781B8BDD74C1DD0880092B03C90843070451903EA5997484984C6B1EDC1B0A2D6EE76BBD1DD04824012C2C015650CA8675DA22411FCE7E4F2C4D8254412200824210C5C51C6807AD6252C89C84901913750607693E5812484812BCA1850CFF109CF0AA3963EB6BD8F9C90AC07246109200961E08A3206D4735C56D600DB039184E5812484812BCA1850CF8681AA9612484218B8A28C01F56C18A86A29812484812BCA1850CF8681AA9612484218B8A28C01F56C18A86A29812484812BCA1850CF8681AA9612484218B8A28C01F56C18A86A29812484812BCA1850CF8681AA9612484218B8A28C01F56C18A86A29812484812BCA1850CF8681AA9612484218B8A28C01F56C18A86A29812484812B2AA3ECD8B123EA3113C5C5C5A2774A72704A4B0924210C5C5119A5BCBC5C6B8843870E55555589DE29C9C1292D25908430704565949B376F666767B3217273734B4A4A9C4EA7E89D921C9CD252024908035754A6292A2A6249545757A3AFC900704A4B0924210C5C5199A6A7A767FBF6ED2C89CECE4ED1BB233F38A5A504921006AE2803C8CBCBA37A2E2C2C5C585810BD2FF283535A4A200961E08A3280868606AAE7FAFA7AD13B6209704A4B0924210C5C51064001447676B6CFE713BD239600A7B4944012C2C015052403A7B4944012C2C015052403A7B4944012C2C015052403A7B4944012C2C015052403A7B4944012C2C015052403A7B4944012C2C015052403A7B4944012C2C015C52C2E2E1DED1DFD455DD786822394FE70F37BEB3CDD9F5747FBF95C557B7987C33F17105D7FEB089CD2520249080357D4E4EDB9570F9CBDEB8552E1ED7E2AE907FB4E3826A645D7E5BA00A7B4944012C2B0F81565EB70DCBDC5C6EDECBD39355B6BBB8EF7DDA034351DB833B3B49E13EFE79BC72FA871CFA79E2DA1488842228B63F1535A5620096158F68AA2C6F4B9AA766E5E1FDC75AC67C423BCDD4F3A0D8C4D3FF66E131FCBC3BF6AA0D84874ED8AC4B2A7B4DC4012C2B0EC15C586A06FDFBB1B2F096FE5D3155B70A719C516568E272C7B4ACB0D24210C6B5E51B60E071B821A56E18D7B1A13C543DC7BF6EA81B3A2EB5818D63CA5A50792108605AFA8EB537E6E49DF6B1914DEACA73DB5D827487E7474E746DCA26B5A0C163CA5AD0024210C0B5E51DCD1F4F03B0DC21BF40CA5ADB55DDCE924BAA6C560C153DA0A4012C2B0DA15E59F0BF0176D538F54274E53D3010E95BAAF5A3198B0DA296D1120096158ED8AAA39E7E46FD9C29BF28CA68D1FB6D1616E3BD425BABE0560B553DA224012C2B0DA15B5D9166C3D738EF4086FC7339A3EEE1EA5C3FC5A6E8DE8FA1680D54E698B004908C36A5714DF7A26D9A4A6D834EE99A3C3BC7B8B4D747D0BC06AA7B44580248461B52BEA0B3FABA4D673606C5A783B9EE9C4432FA2EB5B00563BA52D0224210CAB5D517C5BF2FA7FEA06249134563BA52D0224210CAB5D512C89046D6B6BFE86F86CFAC8A166BBF2D1C6FC8E3BDAB7DAB531C951B97963E558C2367DAC62D386BCB6B8AB3AF2220BA73DD4C91991F84845D7B700AC764A5B0448421856BBA2562189CD1557566AA9A324A134DC511AD036E5119250B76D2BD0D15188F0E6D1920896B0A1A01592D0C16AA7B44580248461B52B6A7592D0B6CB1D79C116595D12FCCA1FA6202F5ED8C18DBB6E444284259120BC20AF44498296AC10DF40120A563BA52D0224210CAB5D51AB8C24822DB2D294878380F891446CCF8FA6715F5B8AD725A5155228BE590E59123A66F592181E1EDEBB776F55559501956F0C563BA52D0224210CAB5D51ABEE6E5206092AD58E9D04DD4D146A84BDB2DC0BA46DDFF5BFFEEBF7382D9B86F284F36B4412D307B576499C3A75AAA0A0202B8C61FF059946A663012A908430AC7645AD614C22D8F5AF3330A0ACA26FF779F95A31B030781392042DE7BF9AB5C142344569A2016D24A10D4774BAAD921F93F0F97C353535B9B9B9599118FF7F9121643A16A0024908C36A57D44A92A0663D2C09FE9A1F8A1862C62474079FB9F90EEB21A8133534E1171192582192A00CF9059141C3F21E269E34A52789ECECEC2CD931FEBC029906921086D5AEA8554822DCBFB48143016EAF579EDD143914A18D2182E1853AA870672D91446BBE76CC9C7BB4960DB121721F562989AB57AF5224919F9FFFD65B6F6985E15C89F6F6F6E6A4284D8AE2E2624802A84012C2B0DA15B5822442773C68EF5A08CF6EA2BFEAFD106B9284124C6CDCB421CE70C26AC624D44EAA0D9A123644CFB85DEB98C4C2C2424F4FCFEEDDBB77EDDAF5C61B6FC8741AC8742C4005921086D5AEA8C492087D3D8F9A38147CDB11ECE4690BBB61D592D08C6607C5133D516A15631291410C77765130A1BC483876BDCAD94D14221C387080020B032ADF18AC764A5B0448421856BBA2124B42E74EBAE56FFDD476F34872B041D78B0382FE5024111C51D0BA848713E24F4CD21F6008E5573E3772F734139F9296847C58ED94B608908430AC7645AD38BB294D296A5E5364E752C2B18474254802C80424210CAB5D514649427C8224804C4012C2B0DA15C5BFEB69854785F3918AAE6F0158ED94B608908430AC7645DD9F57474D678B7D4278239EE9448779D70BA5A2EB5B00563BA52D0224210CAB5D518FBFD744ADE77B2D83C21BF18CA633C36E3ACC7BB6558BAE6F0158ED94B608908430AC7645BDD37C895ACFC7DE6D12DE8E67346DADEDA2C3DC6C6B135DDF02B0DA296D1120096158ED8A1A764D53EBF9A9674B9C2EBFF0A63C73E9DE9C1A3ACCA3174645D7B700AC764A5B0448421816BCA21EFE550335A0FF53D92EBC29CF50FAE0B4830EF0EE2DB63B7301D1956D341E8FA7B0B050F45E80F4034918CD8E1D3BA21E77535C5C2C7AA70CE2DC889B838933C36EE10D7ADAD3B8678EE735BDD37C49744D0B0092901548C268CACBCBB5863874E8904C3F3BB3223FF8F5096A46BFF0B34AC93A9DA6A6031B0A8ED0A1DD9F57B7B828BA96450049C80A246134376FDE549F009A9B9B5B5252E2743A45EF9471F8E7023C17F69E6DD53D231EE18D7B5A12C5106C088A24865DD3A2EB580C9084AC401202282A2A62495457575BA7AF49C531317D6F6E0DDF4CB0BBF192F0263EC554DDE9E45E263A9C7357DDA26B57189084AC401202E8E9E9D9BE7D3B4BA2B3B353F4EE08C03F1B784CB96D82438AADB55DA61BA518189B7EF3F8059ECB4489B467D91882812464059210435E5E1E49822EAA858505D1FB2286C5C5A523BDA364086E6439F157F2759E62F779E76F2F58731C420B24212B9084181A1A1A4812F5F5F5A2774430D4B6D6743B37DBDA4CA1076DBAEB85D227F79D28EF705870B66B5C2009598124C44001447676B6CFE713BD2300A407484256200900401A80246405920000A401484256200900401AB876EDDADEBD7B45EF05483F900400200D389DCED2522BFE8A86F440126258D441F47E0190249084AC401206C10EF8442110082C2C2CCCC7400B6915E78133D2C89123472C7B3F8A614012B20249641C550FD44EF9BDD3C367CF5D6C6E3DF17E59F3BBFB389D3FDA70F9F4198F7BD2EFF7CFCCCCCCCECEB230A08A74515858E8F17844EF85E44012B202496410550FE486531F54EE7DE2A9973FF7A5E73FFD677113AD7AFFD1EF933C5C376FFA7C3E1206D902AA480B9084014012B20249640AD60335F4142BBCF6E5BFD5CAE0F56F3E54F8D0776D4F3F4B895ED05BAD3C28F3D1B78BDDAE5BB1AA107D4C660592300048425620898CC08618EDEDDFF1F507B8E97FE54FBFB2EFC9CDBD1F94CF0C0D054647A3122DEC2EABA00CAA2D72EFFBFB8BCDAD939393A48A999999F9F9797822692009038024640592483F6C88F3471BB8C57FE1337F5EF5E3973C3DE763DD109B281B8517B409C71C27CAF7BB5C2EAFD74B21053C9134C5C5C5E3E3E3A2F742722009598124D28C6A086EE82992B8DED2B61A3D68136DB2FDAFBEC58269B455DEB87183BE08C31349438D97A57ED949089084AC4012E9840D71B1B9950DF1FEA3DF8FDBB9B49A441B163DFC387B82E2097822152009038024640592481B6C88F1C1A157FEF42BD4B8BFFD8FDF9B1F1949CE109C68F39D0F3EC2E319DD275AE189A481240C606868C866B389DE0B907E2089B441ADF6CCCC4CEE7D7F4FCDFAF6BFFAD6ED4B03A918821315C233A3B6DDFB8D41BB7D6262C2EBF5D2A72C2C2C4012AB079230809E9E9EBABA3AD17B01D20F24911E388C38FCFF8AA8417FF1B35F4C621C22C1F8041548C57EF8F3EDD4D2B95C2E9FCF373B3B2B5530E13EB9276BCF4937BF88A5D64E79ECB54A8E18ECB5BC3E01070E1CE8EBEBCBC48E03154842562089F4C077CC714713B5E6B16DBDEFE2A53794E9B0B627FF2B762D2DA4559481B2C5AEADFAF14BDCE974A1BB7B7474747232786F36DF3C21FAB8D30835F6210BD02B12C3C9A02F22BC105F07AB9004355ED484A5756F4D8E6AE5785E0E55677C6147E752812464059248031C469C78BF8C9B724FCFF93987636E785849F4C2414BDE08DF30C19EA085B3E10C6C084E94CD739E361F0EAE752869D831DDDBC7B369ABF30A1C0EC78D1B37BC5EAF6CC144084510BAED91124DC4CD12A7D55A06928847C8CAE4026DCD2DBFA557F163B7885C2A9084AC401269805A6AFA5E5FF8D077830278FA59FFC58B51496B084E654F3C45CB296EA01751AB28736C09FB9EDC1C9C50FBAD6FF7F7F76B83091925C1AD8FFA224E7B147F0B7D208904248A2420090049A405EE6BE269AFBDB60A4F5797A7AB53F9DBE5E90CA6B80F6B223DC41A82D3EF3B431B86CAE9ECEAFDA09CA7C376759CA160626262C2E7F3F13427D1479F06B899525A24DD48825784072E342D1424911A2B4612511689F35FA00049C80A249106A8A5BE7CFA0CDF233DD1D2129BDE7FF4FB7ACFF58B4D94396E213C7C7DB8CC3668B76B7B9C441F7D9A088D4B278C2496C7AE35665885249A1532B3DFA64463E5952309AD10E22D0B0149C80A2491060281C0E9FD35D482BFFECD87AED71F0BA663F5A1147EBD4A4F50B63825286FF93150D57905DA1E27FA68D1479F269625A13FDAA09DE0A43653904472842B932B5253B51A1140120092481D1E90F8DD9E126EE2AF1C3CA8978AFFCF3F2736046548B0F9DBFFF83D9E3AD5DBDBEB743A651B96585B2411B12124910C9192088D63DB836145ADDDED76A3BB098480245285DAE8F9F97996C4DE279EBA5C51B99C2A2B2E57545CAEE4D7F4B72281276855307345C590BA21BFA80CBDE5588424D1DDDDED70385C2E17DF7D2DB1246A6B979B254D1E758B15A735858024E2102589E03F279727C62E2192002120895461493485253150569620259644E26DA324A18E5DCB20097B940DE2E1D676A4AF8DB6B6B6C6C6C614F64F46C29288ACFBC81B2830BB094012A9A39544D1C38F8783004D28108C2A28204814462C0713E11822144FA8A9A292A7D84A2989A8F62AEEA884E68BAF6E1EBDF2D17E4513AE69AAB3D8F63E54D56BBC990EE19AAC4012A9C2925007AE931E90587158829F0A559D57209F24320D2411C5CA1A607BAC25928024640592481596C4C5E6569E027BEDE8D1D07C244D5AEB1458EDB4287E41C5AA53602189B50249180024212B9044AAB0243CEE49BE99EE4C5171EC2D0E7A32D093476C09542CDF4CD7DCD424E7C0752681240C00929015482255780A2CB5D7FCDB0FFB9EDCCC374BFF5EF3375FE929D2A6B2279EF27475D2DAD89BAE2973F89EED4EF5C55E25DB8EAF3F70EAD42939A7C06692818181AAAA2AD17B21399084AC401269201008CCCCCC1C7D3BF865FF953FFDCAADF68EA8272F4D9E39AB7D7C133FB88953D4E39BC81094396A732A901FF057F2CA6B2409396FA6CB24F8D13403802464059248039F7CF2C9ECECECC4D8183F2ABCEAC72F059F021B4CFC14D8E0C35C3DE7CFAB8F0A9F1D1E9E0D6570F0A35ED54785071F01AB3C38965685F20C0FDB9E7E96073C1AEBEBCF9E3D4BDF8B257C2C472681240C0092901548220DB0247C3E5F5DEE9BCF2B3F3A34DAD89CAE1F1DA2A278C8BAF89997288CD08E5A4312AB04923000484256208934A00E4BB86EDEDCFE57DF7A5EF9B5D1B83F1FB4D64485F0CF97D2DFE6A6260A23647F54784680240C0092901548220DF08F0ED1F77AAFD77BB1FD0C773AED7CF091F99191540C419BBFFEC077789CE370998D87AC65FFD1A18C70EBD6ADA2A222D17B21399084AC4012E981DAEBF9F979FA764FDFF14FEFAFE1E9B0850F7D37E9788236E4E9525454E5CE5DADADADDDDDDD0303036A1821CD8F491880C7E3292C2C14BD17920349C80A24911ED460C2E7F3B95CAE13E5FBD913AF7DF96FAFB7B4ADD510B409F732A986E08E26A7D34985ABA31108235664C78E1D51B7121717178BDE2939A9AFAF6F6F6F17BD1720FD401269834726666666BC5EEFC4C444A3AD92FB9D5EFCEC17F73DB979BAB76F357AA06C949947AA5FFEDC97B486E0F16A2A9C3E02A311ABA4BCBC5C6B8843870EE186890C819FFF931548226D7030C19D4E1E8FE7C68D1BDD275AB7DDFB0DBE01825AFCBD4F3CD55D5631373C1CEB065A48AB2803DF0FC121C8E1329BD610542015AB76344112ABE1E6CD9BD9D9D96C88DCDCDC9292128AC644EF949C4012B20249A493584F0CDAEDD579051C52A8B6C8BDEFEF773EF808450C94E805BD55DDC0C3D425AFBCD6DCD4C4135E618814292A2A6249545757A3AF29734012B20249A499284F4C4C4C8C8C8C5CE8EE2655900FB81F296EA255AF3FF09D0F7FBEBDB1BE9EF44001446F6FEFC0C0006D4E85C01049432DD7F6EDDB59129D9D9DA277475A2009598124D28FD6135EAFD7E5728D8E8E523440314157C799465BE5D1B78B49066AAADCB9EB70998D4387B30AA4070E206843DA9C0A812152212F2F8F24515858B8B0B0207A5FA405929015482223A89E989999F1F97C939393140DB02A06EDF67E053241B7865E055A4E19580FB4096D489B532130442A3434349024EAEBEB45EF88CC4012B20249640AF6047D759D9D9DA5384055C58D1B3748002323234EA7D3A181DED2425A4519580F1C40D0E654080C910A5481D9D9D9F45F207A4764069290154822832C2A44A9829AFEA9A92972804B6142815FD3425A4519285B941E6008B0CE8124640592C8385A55CCCFCFB32D189F06752165A06CD00330179084AC401206A1AA820804022C8C286821ADE23CD00330179084AC40126258D441F47E019024070E1CE8EBEB13BD1720FD4012008034505A5A8ABBD9A504920000A4014842562009B05E585C5C3ADA3BFA8BBAAE0D054728FDE1E6F7D679BA3FAF8EF6F3B9AAF6F20E877FCEEA3F360E49C80A2401C433797BEED50367EF7AA15478BB9F4AFAC1BE138E8969D175290C484256200920185B87E3EE2D366E67EFCDA9D95ADB75BCEF06A5A9E9C09D99A5F59C783FDF3C7E418D7B3EF56C094542D69C7F0049C80A240184418DE97355EDDCBC3EB8EB58CF884778BB9F741A189B7EECDD263E96877FD540B191E8DA351A4842562009200C36047DFBDEDD7849782B9FAED8823BCD28B6B05A3C0149C80A2401C460EB70B021A86115DEB8A731513CC4BD67AF1E382BBA8E0D05929015480208E0FA949F5BD2F75A068537EB694F2DF609921F1DDDB911B7E89A360E48425620092000EE687AF89D06E10D7A86D2D6DA2EEE74125DD3C60149C80A24018CC63F17E02FDAA61EA94E9CA6A6031C2A755FB54A300149C80A24018CA6E69C93BF650B6FCA339A367ED84687B9ED5097E8FA3688A2A2A25BB76E89DE0B907E200960349B6DC1D633E7488FF0763CA3E9E3EE513ACCAFE5D688AE6F83282C2CF4783CA2F702A41F4802180DDF7A26D9A4A6D834EE99A3C3BC7B8B4D747D1B0424212B9004309A2FFCAC925ACF81B169E1ED78A6130FBD88AE6F8380246405920046C3B725AFFFA76E40126B029290154802180D4B6295EDACA372F3860D05AD71568D556CE2E5F462432471F253391B2BC7127E56B09CBCB6B8AB3AF2367DE4D02C69CDD7CB1991F84845D7B7414012B2024900A359BD248286A0D6B9AD6043641B1D2389CD1557340D7A5812DAA63C4212573EDA98DF117C41252724BC79B4248225C4571724016403920046B33A4928F141B8698E8A2794B7613615E42992086B204212BA84259120BCA002A32411F1B9CB3B102B304802C80324018C666549F0177C6EC723C5A0E9E4898E246225B1D614AF4B4ADB97158A57C83DA16C091D03490039802480D12496047FFDDFB829CE77F6D0C2903CE2484251882A89D8B18A785FFFF57B9C9685A4E9EFD28824A60F0A9280246404920046B3A681EB042251BFE06FD49504BD505DA2ED38D2B4EF9A68401B4968FA9AF4BAAD3026110124212B9004309A5548821AFA15DB65AD0C8292509A725A1225091E64E69E2275883B42122B44129421BF203268581E2A4F3C694A4F12A5A5A559D2919F9F3F333363FCE904320D24018C66559248349D4949C1A67F833A4E107C1B1CC1D65A449B9FADA34E825A4324D19AAF882762087DD910510327568E2480AC4012C068D22289F0E831B5FED464F3577B4DE810DC5C935F0926366EDA106738613563126A27D5064D09CBAF210920339004309A34743745DCA6101CA056DA6B8D24825FF0436F35D367D59C6B1B938894168F87B39312CD7F8524801C4012C068528F245AF397EF9E5B9E90AA196156DA77257F7044A123B210DA36FEC424FD0186507EA57CED8D7B11139F200920259004309AD46737AD2E45CD6B8AEC5C4A389690AE04490009802480D1182509F109920012004900A3E1DFF5B4C2A3C2F94845D7370029014900A3B93FAF8E9ACE16FB84F0463CD3890EF3AE174A45D7370029014900A379FCBD266A3DDF6B1914DE8867349D1976D361DEB3AD5A747D0390129004309A779A2F51EBF9D8BB4DC2DBF18CA6ADB55D74989B6D6DA2EB1B8094802480D10CBBA6A9F5FCD4B3254E975F78539EB9746F4E0D1DE6D10BA3A2EB1B8094802480001EFE550335A0FF53D92EBC29CF50FAE0B4830EF0EE2DB63B7301D1950D404A40124000E746DC1C4C9C19760B6FD0D39EC63D733CAFE99DE64BA26B1A8054812480187EF0EB13D48C7EE1679592753A4D4D0736141CA143BB3FAF6E7151742D039032900410837F2EC07361EFD956DD33E211DEB8A725510CC186A04862D8352DBA8E014803900410866362FADEDC1ABE996077E325E14D7C8AA9BAD3C9BD4C7438E7AEBA45D72E00E901920022F1CF061E536E9BE090626B6D97E9462906C6A6DF3C7E81E7325122ED21860032014900C12C2E2E1DE91D25437023CB89BF92AFF314BBCF3B7F7B01E31040322009B02EA0B6B5A6DBB9D9D6660A3D68D35D2F943EB9EF44798703B35D81944012000000748124000000E80249000000D00592000000A00B24010000401748020000802E9004B00A757575A2770100F3014900AB909595257A1700301F9004B00A90040049004900AB00490090049004B00A90040049004900AB00490090049004B00A90040049004900AB00490090049004B00A90040049004900AB00490090049004B00A90040049004980F587FBE49EAC3D27DDFC22965A3BE5B1D72A3962B0D7F2FA5820090092009200EB136AEC4316A057248693415F447821BE0E200900D20A2401D6338A20E24612BC96AC11378B365718480280248024C07A468D0BD417EE937B742285A82D6280240048024802AC3B782042E95AD28D24784578E042A305480280B40249807549685C3A6124B13C76AD31032401405A8124C0BA645912FAA30DDA094EAA3B200900D20A2401D6256B8B242236842400482390045897C493442D8715AA192225A1061D7AE3DA90040049004980F5873DCA06F1706B86B7570724014012401260DD118E10F4EE8008060BE13CF1EFC9C67D1200A40B480258054802802480248055802400480248025805480280248024805580240048024802580548028024802480558024004802480248CE8E1D3BA226C71617178BDE29004C03240124A7BCBC5C6B8843870E55555589DE29004C03240124E7E6CD9BD9D9D96C88DCDCDC929212A7D3297AA700300D9004909FA2A2229644757535FA9A0058139004909F9E9E9EEDDBB7B3243A3B3B45EF0E006602920096202F2F8F24515858B8B0B0207A5F0030139004B0040D0D0D2489FAFA7AD13B0280C980248025A000223B3BDBE7F389DE11004C0624010000401748020000802E90040000005D2009000000BA4012C0122CEA207ABF0058EF4012404ED8019F28040281858585F9186821ADE23C700600718124806CA87A2007F8BDD3C367CFF5FDB6F9C4FB65CDEFEEE3446F2F9F3EE3714FFAFDFE999999D9D95916065401402C90049007550FE486531F54EE7DE2A9973FF7A5E73FFD677113AD7AF79FFF9DE4313136E6F3F94818640BA802802820092009AC076AE82956D87ACF7D5A19BCFECD870ABFFDA8EDA96728D10B7AAB950765AEDFB5C7EDBA15AB0AD1C7048078200920036C88B18BF61D5F7F809BFE57FEE4CBFB9EDCD4FB41F9CCD0506074342AD1C2EEB20ACAA0DA22E7BEBFBBD87A6A72729254313333333F3F0F4F00B00449000960439C3F5CCF2DFE0B9FF9F3AA1FBFE4E9391FEB86D844D928BCA04D38E63851BEDFE57279BD5E0A29E009009620096076544370434F91C4584BDB6AF4A04DD79A5B289260C13495958F8F8F7B3C1E780280254802981A3644DF6F9BD910EFFEF3BFC7ED5C5A4DA20D8B1E7E9C3D41F1043C0100034900B3A28E43FCE4F35FA5C6BDF0DB8FCE8F8C2467084EB4F9CE071FE1F18CEE13ADF004004B9004302FD46ACFCCCC703751D6BDDFB87DF162DCA6DFD571B6396F270519BB1F7C8493EDA967CE1415C7CD4C85647DF5EB5CE0A0DD3E3131E1F57AE9531616162009604D2009604A388C38BE733735E82F7EF68B71C721A8C5271FE8DD2741F107C923762B2A8A0AA40C1FBC96ED743A5D2E97CFE79B9D9D453001AC0924014C09DF31C71D4D1FBFFCF3D8B67EB4B199D7264E1461C48620B5CFBDC29D4E17BABBA9A4C9C9E0BDD97CF384E8E306C0682009603E388C38F17E1937E5D3BD7D73C3C3DAE4FC4DFD6A0CC1E98DAF3F10B53915C8B3693FFAE59B0E87637C7CDCEBF5229800D6049200E6835A6AFA5E5FF8ED47A91DB73DF50C850251E98DF02D75AB4C148B4494D07F71DF939B82136ABFF5EDFEFE7E6D30014900AB014900F3C17D4D3CEDB5D756E1E9EAF274752A7FBB3C9D9DC7B7E6ACC9109C28F8A06D43E57476F57E50CED361BB3ACE5030313131E1F3F9789A93E8A307C0502009603EA8A5BE7CFA0CDF23ED6A69894ADA0737AD3E514412550E0F5F1F2EB30DDAED6363636A8F93E8A307C0502009603E0281C0E9FD35D482BFFECD87AED71F0BA663F59CCE14152761087ECCDFB5A3478385840BE4C7405515146A7B9CE8A3451F3D008602490093C10312CDEFEEE3B949570E1ED4A68F5FFE797292A01455148F797CF05A766F6FAFD3E9C4B004B02690043019D446CFCFCF37ED29A1167CEF134F5DAEA8D026DBBFFD67D29238955FA02D8A0CC492E8EEEE76381C2E978BEFBE862480A5802480C98892C440599936A528096D51519250C7AE2109602920096032B492287AF8F1A84882EF834B2E4515A576374112C0CA4012C064B024D481EBA881845406AEA38AE2A7427DF4CB3721096065200960325812175B4F3DAF4C810D4E49E2F948E194E414D87FFBCFD01429656A1315AB4E8185248095812480C9604978DC937C331D850E51F7372477331D850EDA423822A18F686E6AC2C035B032900430193C0596DA6BFEED877D4F6EF27406EF91FEBDE66FBED253B4FA54FBDC2BCABDD69DE19BB73BF73EF1D4F3CAEFDC9D3A750A53608195812480F9080402D45ED7EFDAF3BCF280BF5BED1D51CF6E72D41D5EFD03FE76FDC3776EF7476C4E05F203FE4A5E798D24819BE98095812480F9F8E4934F66676727C6C6C810D49457FDF8A5A8C7B8F28360F9E78312A76020D2733E6A5BFE150A2ABCB1BEFEECD9B3030303782C07B02C9004301F2C09BF77FAA35FBEF9BCF2A343A38DCD717F7428C18C585248DCDFA7A3A278C8BAF89997288CD08E5A4312C0824012C07CA8C312AE9B37977FBEB43FFECF97922A9AF3765270A0FE7C2999A3BBAC227EE6FED0CF976EBDE7BEE6A6260A23F0A87060712009603EF84787E87BBDD7EBBDD87E863B9D763EF8C8FCC848DCA67F9589367FFD81EF7047D3E1321B0F59E3478780C581248029A1F67A7E7E9EBEDDD377FCD3FB6B783A6CE1B71F8DFD2DD25526DA90A74B515155058564081E8D50C308FC9804B026900430256A30E1F3F95C2ED789F2FDEC89ACAF7E7DACA56DAD86A04DF8163C36446B6B2B7734399D4E2A5C1D8D4018012C082401CC0A8F4CCCCCCC78BDDE898909F204F73BBDF8D92FEE7B7293DE1045549AEEEDA3CC3C524D9B6B0DC1E3D554387D044623806581248059E160823B9D3C1ECFF8F878F789D6AC7BBFC193975EFEDC97F63EF1547759C5DCF070AC1B6821ADA20C7C3F04872087CB6C5A43508154ACDAD10449006B0249001313EB8941BBFDA35FBEA9BD938E349073DFDFED7CF0118A1828D10B7AABBA81038892575E6B6E6AE209AF3004005A2009606EA23C31313131323272A1BBBBAAA0907CC0FD487113AD7AFD81EF7CF05A76637D3D0F53F7F6F60E0C0CD0E654080C0100034900D3A3F584D7EB75B95CA3A3A3140D504CD0D9DED158BEFFE0EE3D240335D1DBC365360E1D2803EB810308DA9036A742600800184802C880EA899999199FCF37393949D100AB62D06E2701F42A746BE025B48A32B01E6813DA9036A74260080018480248027B62616121F8C40EBF5F55C5D8D81809606464C4E9743A34D05B5A48AB2803EB810308DA9C0A812100602009200F8B0A51AAA0A67F6A6A8A1CE0529850E0D7B490565106CA16A507180200069200B2A155C5FCFC3CDB82F16950175206CA063D0010174802C889AA0A221008B030A2A085B48AF3400F00C405920096605107D1FB05C07AE7FF0377BA3CD4469A324F0000000049454E44AE426082, '2070001', 'pre_limits_loan_apply.png');
INSERT INTO `jbpm4_lob` VALUES ('2160009', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206E616D653D226C6F616E2220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E0D0A093C737461727420673D223232332C32312C34382C343822206E616D653D227374617274223E0D0A09093C7472616E736974696F6E20746F3D22E8B4A2E58AA1E7AEA1E79086E5AEA1E6A0B8222F3E0D0A093C2F73746172743E0D0A093C7461736B2063616E6469646174652D67726F7570733D22237B6175646974526F6C657D2220666F726D3D222F70616765732F6170702F6C6F616E2F6C6F616E417070726F76616C2E6A73662220673D223230302C3132332C39322C353222206E616D653D22E8B4A2E58AA1E7AEA1E79086E5AEA1E6A0B8223E0D0A2020202020203C7472616E736974696F6E20673D222D33302C2D3922206E616D653D22E9809AE8BF872220746F3D22656E64222F3E0D0A2020202020203C7472616E736974696F6E20673D223335362C3134393A2D35372C2D323222206E616D653D22E4B88DE9809AE8BF872220746F3D2263616E63656C222F3E0D0A093C2F7461736B3E0D0A093C656E6420673D223232332C3235312C34382C343822206E616D653D22656E64222F3E0D0A093C656E642D63616E63656C20673D223333332C3235322C34382C343822206E616D653D2263616E63656C222F3E0D0A3C2F70726F636573733E, '2160008', 'loan.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('2160010', '0', 0x89504E470D0A1A0A0000000D494844520000028100000159080200000068B462300000251249444154789CEDDD7B705CD59DE0F1A9DA3FE7BFA4A89A65A6023B5B53B5E13161323504AA322926C316509B0D01124898CC0C09017B26B0310403194C2CCB363220EF1A70C6E2E118832CD922B60CC6F12312B2252CCBB62CDB48B264ABE5B665CBB2DE91E4B69E98FDF53DDD57B71F92DBD2E93E7D8FBE9FBA4575DFBEF776EB16E5EF39FDFC932F000080097F62FA0100003047D1600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D06058E5F2E5CB9F3B262626C6A72037A96D6463D38F17C09C46836109555F49ECE8E8E8F0F0702814BA78F1E25002592937C906B2996C4C8901184483E17B6E7D47464624B1DBF6AF5EBEEE47FFF6D2DFFEE8F9AFDCFFF435DF5BF06559E4825C959572D347D5AB7B7B7B0706066463D9851203308506C3C7BCF51D1C1A58FDBB271ECBFDEB07175EFBEF797FF7CAFBFFB2B932BF2EB8E3FCC52659E4825C959572936C209BC9C6173A3BFAFBFB293100536830FC4A05786C6CECD2A54B85BB721E5FFAB59F2CBEE1B54DF34E7456F74FB44DB3C806B2996C2CBBBCBF2BA7ABAB4BE6C472103914190690493418BEA4023C3A3A1A0A8596FDF6C1877F75FDAA8D8F4F9FDEC44576911D65F7F6F6F6BEBE3E39941C900C03C8181A0CFF7103DCD1137CF6F5FFF9C4CBB7551DDF74B501568BEC28BBCB414E06EB7B7A7A868686C830808CA1C1F01937C0D24B69E7F36FDCD5397C726601568BEC2E0791439D3973A6BBBB9B0C03C8181A0C9F51AF018742A1A56B7F2053D85906D8CDB01C4A0E281996D9B01C5CBD366CFA6F0560391A0C3F91B9E9F8F8F8A54B97D6EF5CF4F0AFAE9FF153D0499F949603BEBB63515B5B5B5F5F9FDC85DC11536100694583E12732371D1919E9FF63EF634BBF96EA9BB0C6AFE22D5A72D8E34D0DEDEDED03030372474C8501A4150D866FA849F0C58B175795CCFBC9E2AFF68CB6F68C9EEA1E6B95A547FE3B7A2A7C75347C217C794C2D72D329674D7863D9A55BAE8EA90DC23B86D78F45578E9D92C3CAC1038140575797DC11536100694583E11B9149707FFFCF96DCB4B2F8D18E4B4DE73D8B5CED0839FF555743CE7AB526D4DC71A9B923BAD9E4F69722DBB857E5B072F0FAFAFAB367CFCA1D31150690563418FEE04E824B2A5EF9C1C26B6B4FFFFEF4C01167392AFF3DA32E0F862FA8CB67068F4436183CAAB6391D5E73F44C7899DCD8DDE08CB34B6D70BB1CBCB83CAFA5A585A9308074A3C1F007F579A48181819CB7EF9BB7FC6F4EF4549FE8DD7F522D3DD56A39D12397D59AFD27C28BB3B2D7B9EC6CE9FCB7DA59EF5C756F5557E5A6DE6A39F8E2B7EF6B68683877EE9CDC9DFA9C92E9BF1E809D6830FC4142383C3CDCDB1B7E379664B8FEC227F51DCE72E193CFA28BB3B25C567ED6F14964830BE5F56ABDBAD0E16CE66C10DE257AA17E72F74F24C07217870F1F0E0683727772A73418409AD060F8C3C4C4442814EAEEEE7EE8B9BF28D8F674EDD9DFD79EDDEEFC37BC1C5617DADC95F2DFED879D3587E5B25ADFA6B671F78AAEF1AC948DE5E07217070E1C080402727772A772D7A6FF7A0076A2C1F007F562706767E77D4F5DB3A5E6FF569FDA521D2CAD3E55BA3F38B984D704B7EC0F6E5117AA232BB7C8C6CE06EA2675552D91CDDC2D65A51C5CEE62DFBE7D274E9C90BB532F099BFEEB01D88906C31F24844343431D1D1DDF5BF0E5B2E3EB2B039B64A972FE1BB9D0A2AE9638574BAA5A4A626F95F5E1356A65558BBB7B49E46A78FBF006E58DEBE52EAAAAAA9A9A9AE4EEE44E69308034A1C1F0076F83FFD0F0DB3D278BF79C2C8A2EC531575BC257F79E2CDADB52A42EEC69290A5F552B23DB476F6D29F21E47B6D9DDB04EEEA2B2B292060348371A0C7F701B7CDF53D794EC5B116E674B7124A82DAAAC925515E3E2687D8BD5ADEA7224C0D1E8EE8DE639B24D64DFA24D9FAE90BB90061F3F7E9C0603482B1A0C7F701BFCD0B37FF146E9CFD5D3C85501F719E6C833C9EA89E8CAC0E413D1EE0695939BA90DDC6593E7C22639B8DC050D0690013418FEE036F867B937BF50F01DEF5BB1F69F8E796756F235D3AFF72C7270B90B9E8B0690013418FEE036F8C582FFFDD8D2BF763F95A43E9874D8FD78927BF9DCE4FAC3F19BED381C5E7E1FBF38BBC8C1E52E784F16800CA0C1F007F7B349EFEFCEF9C133FF756F7371FD858AE8F76F449606CF7FA3B75634B81B74544CEE12FD7E8FE8577954A835954DC572F07777FC9ACF2601C8001A0C7F70BFA3231008FC34E7C615EFFF38F2B59491AFAB8C2C935F60D91B7B6BC2D5C8B7577A6E9235725839F88E1D3BF88E0E00194083E10FEE77550683C1FCA29F3CF2EBFF717A50FDD082FB9B0D47C397C34BF4AA736B64A5FACD86F0125E13D971D0F90907756BF82047E5B072F0B2B232BEAB124006D060F883FB9B0DE7CE9DABAF3FF6B3DC9B2596EE6F1176C4FC886173F447099BDD1F2574D634472F4FFE946164A5F31387724039ECB68F3FAAACACE4371B0064000D863FB8BF5DD8D5D5D5D2D2F2F6B6850FFFEAFABDF545DDA3AD3D63A7BA474FF5C832D61AFEEF686BF798BADC1AFEEF586BE4D6D153DDCE96E15DD4C6E1E594B3B4EE6D289203BEF5D1C25DBB761D3C7890DF2E0490013418BE21F3D1919191FEFEFEB367CFD6D7D72F79E781275EBEAD73F864FF44DB2C1739881C4A0EB86DDB369904CBC1E52EE48EE4EE980403481F1A0CDFF04E850381406D6DEDC2D7FEF1F937EE4A96E13357156039881CAAB4B4B4BCBC5C0E2B0767120C20036830FC444D85070606DADBDB9B9A9AAA0E96493B650A5B757CD34C66C0E36DB2A3EC2E07F970C7A6DDBB77D7D4D4C861E5E072174C8201A41B0D869FA8A9F0A54B97FAFAFADADADA1A1B1BABABAB73DF79E0E15F5DBF6AE3E357DB60D9457694DDB76CD9B26BD72E39941C500E2B0797BB60120C20DD68307C46E6A6636363A150A8A7A7E7CC99330D0D0DD2CEB51F3FF7D8D2AFFD64F10DAF6D9A77A2B37AFAF4CA06B2996C2CBBBCB3EDB9D2D2529901CB41E450724039AC1C5CEE8249308074A3C1F019999BAACF290D0D0D7577774B3565F25A535353FE49D9AA4DF37E967BF3830BAFFDF7BCBF7BE5FD7FD95C995F17DC71FE62932C7241AECA4AB9493690CD64E3CD5B7EB76DDBB6F2F272D95D0E22879203CA61D5E79198040348371A0CFFF16658A6AD6D6D6D4D4D4DB5B5B5959595BB76ED2A2E7B69E9DA07E72FFFDB1F3DFF95FB9FBEE67B0BBE2C8B5C90ABB2526E920D366FDE2CF5958D6517D951769783C8A10830804CA2C1F02537C3A150A8AFAFAFBDBD3D1008D4D7D71F3C7850B25A5656B663C78E8F3FFE5842FBD1471F7DE8900B725556CA4DB2816C261BCB2EB2A3EC2E079143116000994483E1572AC3636363972E5D1A1818E8EAEA3A7BF66C4B4B4B4343C3E1C3870F1C38B06FDFBEAAAAAA4A0FB92A2BE526D94036938D6517D951769783A8D7800930808CA1C1F03195E1F1F1F19191918B172FF6F7F74B50CF9D3B170C0665767BE2C48926C77187BA2C2BE526D94036938D6517D951769783106000194683E17B712596496D6F6F6F7777776767674702592937C906B219F50560160D8625DC128F8E8E0E0F0F87422149EC5002592937C906B219F50560160D86555489C5C4C4C4F814E426B50DF50560160D0600C00C1A0CCB6DDDBAD5F4430080E468302C97939363FA21004072341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A341896A3C100B2160D86E5683080AC458361391A0C206BD160588E0603C85A3418765ABE7C794EAC828202D30F0A0062D060D869C3860DDE007FF8E1871B376E34FDA00020060D869D2E5CB8909B9BAB02BC6CD9B2B56BD7068341D30F0A0062D060586BF5EAD5AAC12525253C110D200BD16058EBC891234B962C510D3E74E890E9870300F168306C969797270D5EB56AD5F8F8B8E9C70200F168306CB67BF76E69F0CE9D3B4D3F1000488206C36632FDCDCDCD1D1A1A32FD400020091A0C00801934180000336830000066D0600000CCA0C100009841830100308306C3B0CB97BFD87EACEDD75B6BEFC8FF5896FF32FFAD2C5F6ECBDB2A8FF3171BF76FA8098446274C9F3F003E4683614CEFC5D1E77E77F04B4FBD6B3CABB359FE75DD9E40E7E08C4F42CFA76B72A657DAEC6CB4E6D39EA9B6962DBEF8A2B9D4D9224173A9BA1D4016A2C130A3B02670EDC24295B15B966E7EB1B47657FD7959FA06272E0D7F91CD8B7A9CAFEEFACC9DB5FFE9936B651E2F137A0DDCDCC6939646D6CB25E9EEA7E11CC76C99BCB63418C86234189926ADFAC5C6FDAA5E77BDB6E3C8E97EE3599DF1D2D43EF8D09BE5EA6FB9F73F77CBCC7E962727DCD7E992E9F437E93C58DD2A514EBA49CEF4870560060D46A6A900CBDCF18DB2E3C623AA6B66AC9E519799F1AC66C3572AB06756EB5E9089F3B4BB300F06B2180D464615D6045480A55BC6DBA97191D9BC7A6AFDB9DF1D9CE1A9715EEB5DB3468A2A97BC4F32475E0476564D390F5637445F34F654970603598C062373CEF58554A8DEDA7BC27835B52F7B9B3B656C217FDDE1D3C9DE1B7505E1864A41A3FD54AFF9367B6F8F3678EA79F0E4DBB23CE1A5C14016A3C1C81CF52CF4BDBFD96DBC97695A5E2CAD55CF485FE5897166BA4E29BD73D8980E4F3678EA577ABD6F8D760F4483812C46839121A1D109354DF4F59BB0A65FFA0627D444BFEE4CEA53E198D4C6BFBAEBBE1BFAEAE6C1B147A0C140B6A2C1C890CD87836A8E68BC94695D1E7FBF4AFECCC51FD6A6785A6406EC4DE494EFB04AD6E052352976C31BDB6077CA4C8281AC45839121F30BC3715AFAF111E3994CEBF2515D9BFC997FB36CF3CCCE52F20637C7C5768A3DAFB80D802C43839121EA1B2D2C7B3B74E2D2D13F2A7FE6B50B0B6776969236383ABF9DEA93BFE1A96E749BA9BF778BE930907D683032E42FFFA358E2D4D43E683C93E95ED4CBDEA6CF37001FA0C1C810F56552D9FF5594341840C6D06064886A702454A73E78FC8E49795593010B14CFF75EBD345C9377C7FCA2535337AF2AFF8E3BF22B27D7B417CDF31E307C75F28E56E4DF112FF1E07147887D30F33E0878D654AE48B2A5FA4B4D9F6F003E40839121F10D5E519334BA71572572C9B8E19442C79A37FFF198AB4E32DDBB93603B17A2F722B9750E5595D8E618D18714DF606730E11D01D0600057810623439234B82AFFF1E276278789290DA72E1CE015F979B1917356D6C45C96823ADBCBA19C3971F86831D3536F8393E6DC7924534DB53DC38248839D3B4A10CD330D0690221A8C0C99B6C1DE6965249FB23EDAC568533DB77A9E884E61FE7AC5797042741392EC7D4E3BB28B8C00229BC5269C060348110D4686A4D2E0CA15F3F356CC8F7F8575EA178F5399BF7A9ECD9E5F543CF5EBC153E77CF21EA313EEF82142EC13D43418408A683032E4CA0D7626A99E196AFC73BCF1AF10479E914E781E3B31D5A9CC833D39F7CE83638708491BCDEBC1006688062343121BAC5217895CF4CD4D09EF8BBEE27C37E17D52896F57F6BC052CB1AC577C5ADB3344C88FBDAFC9847BB33D5583DF7DF7DDA9BE63C3170A0A0A32FFBF0D60371A8C0C496CB02A65F43D5993318BD631E66345C99F409E7A1E1CB34DB4C149DF4BE52676FA7970E50AE7DD5E9EE7A2EFF03CE63B3C8DB7751E2C1936FD1000DBD06064484C8323EDCCCF5B11CE9877DA9A6C1E1CF7CE29B9EA7DFA37C93C58BDB41CD3E0D82ACF641E3C795FE1EA7BDF2F163747A7C1005244839121B10D0ECF719D74C5BF3339C9D3C8712FEE3AF14EB9C191C9745C719336F88AAF07C7DE973AB2DC8B73C1F31868308014D1606488B7C1939FEA51610B3F91EB3EF31CEDAB9A98BA6DF3BC3B3A76DE99C273D10947889190F0649F4D8A69B0F3E6ACD8E37BDE324D8301A488062343129E8BB676A1C100524483912134D8EF6830A01D0D46865CBBB0708EFC76A1FA4B4D9F6FFD6830A01D0D4686DC96B755CAB4B7B9D37823D3BDC89FF9A5A7DE357DBEF5A3C18076341819F2C3B7CA254E6FED3D61BC91695D0EB4F6C89F79C3E212D3E75B3F1A0C6847839121BFA9382E717AE8CD72E3994CEBF26269ADFC99F30BAB4C9F6FFD6830A01D0D4686B4760D4A9CFEF4C9B5C1AE90F152A66FB965E966F933B77FD666FA7CEB478301ED683032E7DEFFDC2D7DFA3FC5FB8D97324DCB7BD501F903AF5D58786974C2F4C9D68F0603DAD16064CEE1D33D6A2A7CA0B5C7782FB52F1DFDA3EA1DD1BFA9386EFA4CA7050D06B4A3C1C8A87FFDED1EA9D45FFE47B165CF48F70D4EDC91FFB1FC69B7E56DBD7CD9F4594E0F1A0C6847839151A1D109F521A51B16971C39DD6FBC9D5A169901AB00CB3CB8B56BD0F4394E171A0C684783916981CEC15B966D561FA27DA3ECB8F182CE72293914544F41CB9F73F84C8FE9B39B463418D08E06C380D0C8C443CEC785D584F8C5D25ADFBD42DCD43EF8EAAECFD4BBA065915185C53360850603DAD1609871F9F2171F1F6B9300AB86A9454D28B37C497CCC2BFFF099ADAF017BD160403B1A0C93245D9BEB82F30BAB7C515FEFF2A5A7DE7D64DD9E0D35012B3F8694140D06B4A3C10052428301ED68308094D060403B1A0C20253418D08E060348090D06B4A3C10052428301ED68308094D060403B1A0CCB6DDDBAD5F443B0040D06B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED68302C473974E14C02DAD160588E72E8C29904B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED68302C473974E14C02DAD160588E72E8C29904B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED68302C473974E14C02DAD160588E72E8C29904B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED6830B243CFA76B72D67CDAA32E242A6D966D9A4B9D2D123497AADB93A21CBA702601ED6830B287B4341259B924DDFD349CE398EC26AF2D0DCE08CE24A01D0D46B671FA9B741EAC6E952827DDC4BB9507E5D0853309684783916DDC59AD7BA1E7D33553CF73BF601E9C219C49403B1A8CACA05E04769E779E721EAC6E88BE68ECA92E0DCE08CE24A01D0D46D688BCE56ADA79F0E4DBB23CE1A5C119C19904B4A3C1C81A930D9EFA955EEF5BA3DD34D3E08CE04C02DAD160648DAB9B07C7EC48833380330968478391359235B8544D8ADDF0C636D89D324FF3962DCAA10B6712D08E06233B34C7C536991ECF3BB752463974E14C02DAD1606485E8FC76AA4FFE86A7BAD16D927F93169F0F4E37CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED68302C473974E14C02DAD160588E72E8C29904B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED68302C473974E14C02DAD160588E72E8C29904B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D38938076341896A31CBA702601ED68302C473974E14C02DAD160588E72E8C29904B4A3C1B01CE5D08533096847836139CAA10B6712D08E06C372944317CE24A01D0D86E528872E9C49403B1A0CCB510E5D389380763418765ABE7C794EAC828202D30FCADF6830A01D0D869D366CD8E00DF0871F7EB871E346D30FCA9718CD00E9438361A70B172EE4E6E6AA662C5BB66CEDDAB5C160D0F483F225463340FAD060586BF5EAD52A1B2525254CDD668CD10C903E3418D63A72E4C892254B54830F1D3A64FAE1F818A319204D68306C96979727E558B56AD5F8F8B8E9C7E2638C668034A1C1B0D9EEDDBBA51C3B77EE34FD407C8FD10C900E3418369360E4E6E60E0D0D997E20BEC7680648071A0CE0CA18CD00E940830100308306030060060D0600C00C1A0C9B5D9E82E9C70500613418565189FDDC313131313E3E3E964056CA4D6A1B929C224633403AD06058C2ADAF24363430D87AF070FD1F2AF6BCBDBEE2CD756A91AB27AB0FF4F7F48642A1E1E1E1919111D5634A9C14A319200368307CCFAD85A477DF7BC5EF3CFCE8337FFED5055FFE6F4917B9E9CDEFFFB3B4B9B3BD7D6868487A2C31A6C45E89A399C68A4AEF68E6E8F6DD8C66002D6830FC4DD54232206D78F1865BBDAD7DF9EFEF5E75CF03858F3E218B5C90ABDE36CBC63B5F5BD3D3D59D5862D37F9331573B9A79FB811F4B9BBB2E5C603403CC0C0D868FA960B437362FBFFD4E158667BF72E3BA47E61D7B6FC3704BCB445B5BDC222BEBD617C9066E5A96DEFA0F8D95FB7A7B7BA52232A593F9DC9CCDB07734B3E8C66FC48F66EEBEBFF0B12765910B71A319D978FBEB058C668019A0C1F02BD58CA3DB76AA1E3C75CD7FDFF8F35FF61F399A98DEC4453693C9B1ECA21AB367C3A6AEAEAE81810149C8DCCCB03A996DC71A264733D7DDB4EE91F9571ACDCC7763BCECD66F375654329A01AE0A0D862FB901561D9572B4EFAD4AA5BEDEE56CC55E9907AB7E97AFDFD0D1D1D1DFDF3F07331C3999DB77CF7034F3D8938C668099A1C1F01FD58CFA3F54A87FFADFFCFE3F279DABA5B2C88EABEFFDA10A8FF4630E66D80DB03B9A3977F5A319D965C9D7BFA54E635961F1F9F3E7E7DA6904668606C367DCD7809FBFFE66F9477FD53D0F8C9D3E3DB300AB45765F79D77DEAB5E4BA3D95732AC3EA64365654AA00BFFDC08F758D66C830900A1A0C9F917FCD878787D573C839B77CF3626363D22474D51CACC85B2953E437EEBA4F2D858F3E71607541D28DE5203937DFAE0E78A2B9B9B3B373606040EE657C7CDCE278A800779C6879F6BA9BE46F7FFD3B0F6A1BCD5C77938C66C830704534187EA2B2B16BE51BF20FFDD37FF657495F0396A04A6EA7FA448DCC9EA5CD897BC9A1E480B2C17B8B7283C1605757D7D0D0D0C8C888C5F150A39965B77E5BFEEA255FFFD6C5E34DB30970E4E41F6F52EFA95E3C974633C08CD160F889FAE8AA7A16FAA3675E486C405B5985BA75FA45E6C78913E8D25F3CAB9E91FEACAE4E8ED4DB1BFE0E0AF5311BD37FB77E6A34B3EDFFAD56A39919BC063CD5722E3A9A79FF852573643403CC180D866FA86CEC797BBD2AE5E0B1FAD1D656EF12FCFDCE5402AC96576EBF336E7739A07A63F0072FBD1A08043A3A3A640E676B3CD468463D0B2DB14C4CE950E3F1579CCF29153EF26F89B7CA4A750E65B3C45B37FEFC97EA19E9B9309A01668306C3372484F2EFF8AA7B1E0887E1D12764221BB7BC12FD6C6B8A8BCCA4638ED0D0B8EE9179E1F7067FEB9E8686066F3C2C6B70CC68E6BA9BFA8F1C1D0D04A26311B9109035DE9329C5959523D10D5480DDA14CFF51D9BD357C6BC0595A03EE68A6242F5F4633E7CF9FB7783403CC060D866FA8A99B7A07EFB1C2A2FEDADAFEDA43CE7F6BFB0F1DDAF5E2D2AB0AB05A64EA2CFB468E73A8F6D87B1BD43B7B6B6B0E483C3A3B3B878686D45B8A4CFFF53A45463377DF1FEEEB634F861A1BE396C4D1CCFA871F95F532EB950B89CF28241E61DD23F3E7C2680698251A0CDF90109EAC3EA0BE0BA26BEFDEB8C5FB65D1A92F329F8E3B8E7A2D73DBFAC213CDCDEDEDEDEE04CEF45FAFD3B4A399F092F45C497D1303AC963F1E8AEC38D74633C02CD160F8C6C4C444F5A6CDF22FFBCB7F7FF7B99D3BC2CB8E9D6A39B0BA6006015EE0FC72C3D9EDDBC307891E507D59E3C6FC55DE099CDCB5E9BF5E27EF68A673EFDEC4E5ED077E9CFA39948D931EC43B9AF13E1D6DFAAF07B2080D863FA8A74F2BDE5CB7C07957F3A92D5BBCCB47CFBC30B306CB127728F57AF37B8B728F1D3B160C06AD7C12759AD18C7B39C50CCB66498EE019CD94E4E55B3C9A01668906C31F2481636363E56BD6CA3FEBEF3CFCE8C9A222EF52F84F3F9D7183F7ADC8F71E4A02AF1A5C5757170804BABABAD4B74C58D360359AF9C4399352D0B821887729F85FDF9FFED4C906D3ECFEFA771E5CE0BCE9DAE2D10C304B3418FE10D7E0A6F5EBBDCB2C1BEC3D545C83DD1732AD29873A939F4C8E668A279762672052AC2ECB7F8BA6C9B0DCA4462D2DEE8EEA4271E4AA9A494B836D1DCD00B34783E10FDE06AFBEF78771F360F5F51A335BE20EE53E176D7783A71ACDC42DD33778FA7DE31A6CDF9904668F06C31F5439DC5731E39EF69CCD7BB2E20EA5BE89FA83975EB5B51CF1A39962EF10444D618B9DD9F07493E0C9A97074061C990DBB4B51B1FAEC130D06A64183E10FAA1C8D95FB1638EFE60DBF9959BDF727BACCF0B349FFF453EF7B91E4B0EEBB796D2DC7F4A399D45F0CBEE24BC2EA9BA84BF2F26D3D93C0ECD160F8832A477F4FAFFA54AB4C7CE33ED73BB3EFE89054780FA2E6D3721715E5E5B6BE8A1919CD54544E359A91E56A3F9BE47D43F5DC19CD00B34783E10FEADDBC9243F5EB78EB1E99A7BE14E28F9EFFAE709E464E7D29FDC5B3CE774A1C8A7E49C5A1779CEFA0587EFB9DFBF6EDB3F5DDBC89A399C48FF64ED5DAA9DA9C7884B9309A01668F06C337262626E41FF19DAFAD59E0FC6643F7FE9AB8EF8B0E6CDD96FA6F36BCF68FDFBDD810B3BB1C507DCBF1DA671749836DFD546BC268667EB2D1CCB7E34ED7FA871F95318ADC9AF85559B2B13B889953A31960F668307CE3F3CF3F1F1919E96C6F9700CBBFEF1B7FFECBB81F3E523F9D9473F3ED570C70781A7DE468DCBEEA5787E5E0653B771E3C78B0A9A9C9D6EFAA9421C5F0F0F0F6D7C353D567AFBB49061F71DFF6DC7BE0A0F72BA3D59745AB25EE2BA325C0B271DCEE73643403CC1E0D866FA8068706063F78E9D505CEAFDEB6955524F919F9C6C6693EAA24853EB0BA20E90F0FABD72F0B9EF8A564C3FB12A67D0D9E1CCD38BF5D181ECD0402CEA27E3729FCF347FD478FBABF5D38D2DA3A12D920A07E1CC9FDEDC2F08F26393FB5243745B691D1CC634FAA179BDDD10CDF5509244583E11BEE93A85D172EA84F10E5DCF2CD8B0D8D497F495E4A5C91B752A6B66FDC759F5A24CC75EB8B926FDCD0A866CF2FDE706B4579B964C3EE5FFB510D96E1C5D665D38D6666B6CCA9D10C304B3418BEA17EF556FE1D971955E3FE03EA19E99577DD3776FAF46C9A21BBBF7CE777D5B3D0DBD617AAD72F251B1D1D1DB6FEEAAD7734B3E4EBDF92BF7DF12DDF1C6A3C3EFB00CB4116DDF80D39A0FC772E8C668059A2C1F013C9E1D8D898FC6B2EFFA6576FDAACDED9BBEA9E0764D63BB366C88EEAAD4972A88DF9AB24C0EAB953371B56FEDC5EFC68C679465AE768E6BA9BBCA319EF13D13418F0A2C1F013371E4343435D5D5D7B366C5219CEB9F9F6F6BD5557DB0CD9457DB3870A706565A59AB705834139B8FBDCA995D9483E9AB9FBFE19CF866547773453BCF2353999757575D68F668059A2C1F019F53CEAF0F0B04CAD3A3B3B25C3EA49E9A7FFECAFD63D326FAA9787E396C163F5B2B17AD95276F70658BD78290797BBB0F8B9D3A946338B6EFCC6B9AB1FCDC82EEA296837C073673403CC060D86CFA878A8395C7F7F7F474747DD9ECA9C5BBEA9DEF6FCCC9F7FF59D871FAD5B5F34DADA9A980A592937C906EA93336A02BD6D7DA137C0724039AC3B6FB3381B71A399B2C262F5A4B4339A992FC394944733F3D56846CEAA37C073643403CC060D86FF2466F84473F3072FBDEAFD820EE9C1D25BFF61E55DF7C97C5716B92057DDF4AAE9EFDA6717559497ABF7EECEB5007F91701ACF9F3F2FA399C5331DCDC83C386E3423079C3B271398191A0C5F8AEB87CCB74E9F3EFD595DDDC6FC55925B352D4BBAC84D2FDFF9DDF716E596EDDCA9DE8175ECD8B1A6A626D95D0E32D79A91986119CD94E4E5AB09B11BE365B77EDB19CDCC97452EC8D598D1CC7537258E660830900A1A0CBFF2F6636060A0ABABABADAD4DFEF597061CDA5F53B661D39637D6486BDD45AECA444DA5423650F555C1901D657739C81C6CC654A31929712AA399F75F58C2680698311A0C1F73FB313C3C3C3434D4DBDB2BFFFAAB12CB7C4EFA7ACC51E7A1D6C84DB281AAAFEC223BCAEE7290B9D98C694633B53507CA0A8BB7BF5E20AD7597E295AFB9A399830E4633C0CCD060F89BEAC7F8F878F86B2C4321B7C4EDEDEDD20399930583C180875C959572936CA0EAAB8221BBCB41E66C33AE389A51031A4633805E3418BE77D9115762296B5F5F9F24A1CBD1E9509765A5DC241BC86671F59DCBCD986A3473FEFCF9E94733B201A319606668302CE12DB14CC2544894210F77A56C209B515F2F46334086D16058C5AD88989898503D8E232BE526B50DB548C46806C8181A0C9B5D9E82E9C7E5038C66800CA0C100AE8CD10C900E34180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C100009841830100308306030060060D0600C00C1A0C00801934180000336830000066D0600000CCA0C10000984183010030E3FF03B8BDFA269B8FD3380000000049454E44AE426082, '2160008', 'loan.png');

-- ----------------------------
-- Table structure for `jbpm4_participation`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`) ,
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`) ,
  KEY `FK_PART_TASK` (`TASK_`) ,
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_participation
-- ----------------------------
INSERT INTO `jbpm4_participation` VALUES ('2260020', '0', '10013', null, 'candidate', '2260019', null);
INSERT INTO `jbpm4_participation` VALUES ('2540006', '0', '10013', null, 'candidate', '2540005', null);

-- ----------------------------
-- Table structure for `jbpm4_property`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_property`;
CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_property
-- ----------------------------
INSERT INTO `jbpm4_property` VALUES ('next.dbid', '258', '2580001');

-- ----------------------------
-- Table structure for `jbpm4_swimlane`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`) ,
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`) ,
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_swimlane
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_task`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`) ,
  KEY `FK_TASK_SWIML` (`SWIMLANE_`) ,
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`) ,
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_variable`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`) ,
  KEY `IDX_VAR_TASK` (`TASK_`) ,
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`) ,
  KEY `IDX_VAR_LOB` (`LOB_`) ,
  KEY `FK_VAR_LOB` (`LOB_`) ,
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`) ,
  KEY `FK_VAR_EXESYS` (`EXESYS_`) ,
  KEY `FK_VAR_TASK` (`TASK_`) ,
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of jbpm4_variable
-- ----------------------------

-- ----------------------------
-- Table structure for `log4j`
-- ----------------------------
DROP TABLE IF EXISTS `log4j`;
CREATE TABLE `log4j` (
  `createdate` varchar(32) DEFAULT NULL,
  `thread` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `class` varchar(32) DEFAULT NULL,
  `message` varchar(320) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of log4j
-- ----------------------------

-- ----------------------------
-- Table structure for `postloan_check_log`
-- ----------------------------
DROP TABLE IF EXISTS `postloan_check_log`;
CREATE TABLE `postloan_check_log` (
  `LOG_ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TASK_ID` bigint(22) NOT NULL COMMENT '任务ID',
  `CHECK_DATE` date NOT NULL COMMENT '检查时间',
  `CHECK_MODE` int(1) NOT NULL COMMENT '检查方式',
  `CHECK_TARGET` bigint(22) NOT NULL COMMENT '检查对象',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷后任务检查记录';

-- ----------------------------
-- Records of postloan_check_log
-- ----------------------------

-- ----------------------------
-- Table structure for `postloan_task_info`
-- ----------------------------
DROP TABLE IF EXISTS `postloan_task_info`;
CREATE TABLE `postloan_task_info` (
  `TASK_ID` bigint(22) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CUST_ID` bigint(22) NOT NULL COMMENT '客户ID',
  `POSTLOAN_GENERATE_TYPE` int(1) DEFAULT NULL COMMENT '贷后产生方式(1-手动产生，2-自动产生)',
  `START_DATE` date NOT NULL COMMENT '开始日期',
  `FINISH_DATE` date NOT NULL COMMENT '结束日期',
  `MANAGER_USER_ID` bigint(22) DEFAULT NULL COMMENT '客户经理ID',
  `POSTLOAN_STATUS` int(1) DEFAULT NULL COMMENT '贷后状态',
  `CREATOR_ID` bigint(22) NOT NULL COMMENT '创建人ID',
  `CREATE_DATE` date NOT NULL COMMENT '创建日期',
  `CHECK_RESULT` int(1) DEFAULT NULL COMMENT '检查结论',
  `RESULT_REMARK` varchar(255) DEFAULT NULL COMMENT '结论描述',
  `FROZEN_LIMIT` int(1) NOT NULL DEFAULT '0' COMMENT '冻结额度',
  `FROZEN_BALANCE` int(1) NOT NULL DEFAULT '0' COMMENT '冻结额度',
  `legal_measure` int(1) NOT NULL DEFAULT '0' COMMENT '建议采取法律追索',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='贷后任务信息表';

-- ----------------------------
-- Records of postloan_task_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `areaid` int(6) NOT NULL,
  `area` varchar(50) NOT NULL,
  `cityid` int(6) NOT NULL,
  PRIMARY KEY (`areaid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_city`
-- ----------------------------
DROP TABLE IF EXISTS `sys_city`;
CREATE TABLE `sys_city` (
  `cityid` int(6) NOT NULL,
  `city` varchar(50) NOT NULL,
  `provinceid` int(6) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`cityid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行政区域地州市信息表';

-- ----------------------------
-- Records of sys_city
-- ----------------------------
INSERT INTO `sys_city` VALUES ('110100', '市辖区', '110000', null);
INSERT INTO `sys_city` VALUES ('110200', '县', '110000', null);
INSERT INTO `sys_city` VALUES ('120100', '市辖区', '120000', null);
INSERT INTO `sys_city` VALUES ('120200', '县', '120000', null);
INSERT INTO `sys_city` VALUES ('130100', '石家庄市', '130000', null);
INSERT INTO `sys_city` VALUES ('130200', '唐山市', '130000', null);
INSERT INTO `sys_city` VALUES ('130300', '秦皇岛市', '130000', null);
INSERT INTO `sys_city` VALUES ('130400', '邯郸市', '130000', null);
INSERT INTO `sys_city` VALUES ('130500', '邢台市', '130000', null);
INSERT INTO `sys_city` VALUES ('130600', '保定市', '130000', null);
INSERT INTO `sys_city` VALUES ('130700', '张家口市', '130000', null);
INSERT INTO `sys_city` VALUES ('130800', '承德市', '130000', null);
INSERT INTO `sys_city` VALUES ('130900', '沧州市', '130000', null);
INSERT INTO `sys_city` VALUES ('131000', '廊坊市', '130000', null);
INSERT INTO `sys_city` VALUES ('131100', '衡水市', '130000', null);
INSERT INTO `sys_city` VALUES ('140100', '太原市', '140000', null);
INSERT INTO `sys_city` VALUES ('140200', '大同市', '140000', null);
INSERT INTO `sys_city` VALUES ('140300', '阳泉市', '140000', null);
INSERT INTO `sys_city` VALUES ('140400', '长治市', '140000', null);
INSERT INTO `sys_city` VALUES ('140500', '晋城市', '140000', null);
INSERT INTO `sys_city` VALUES ('140600', '朔州市', '140000', null);
INSERT INTO `sys_city` VALUES ('140700', '晋中市', '140000', null);
INSERT INTO `sys_city` VALUES ('140800', '运城市', '140000', null);
INSERT INTO `sys_city` VALUES ('140900', '忻州市', '140000', null);
INSERT INTO `sys_city` VALUES ('141000', '临汾市', '140000', null);
INSERT INTO `sys_city` VALUES ('141100', '吕梁市', '140000', null);
INSERT INTO `sys_city` VALUES ('150100', '呼和浩特市', '150000', null);
INSERT INTO `sys_city` VALUES ('150200', '包头市', '150000', null);
INSERT INTO `sys_city` VALUES ('150300', '乌海市', '150000', null);
INSERT INTO `sys_city` VALUES ('150400', '赤峰市', '150000', null);
INSERT INTO `sys_city` VALUES ('150500', '通辽市', '150000', null);
INSERT INTO `sys_city` VALUES ('150600', '鄂尔多斯市', '150000', null);
INSERT INTO `sys_city` VALUES ('150700', '呼伦贝尔市', '150000', null);
INSERT INTO `sys_city` VALUES ('150800', '巴彦淖尔市', '150000', null);
INSERT INTO `sys_city` VALUES ('150900', '乌兰察布市', '150000', null);
INSERT INTO `sys_city` VALUES ('152200', '兴安盟', '150000', null);
INSERT INTO `sys_city` VALUES ('152500', '锡林郭勒盟', '150000', null);
INSERT INTO `sys_city` VALUES ('152900', '阿拉善盟', '150000', null);
INSERT INTO `sys_city` VALUES ('210100', '沈阳市', '210000', null);
INSERT INTO `sys_city` VALUES ('210200', '大连市', '210000', null);
INSERT INTO `sys_city` VALUES ('210300', '鞍山市', '210000', null);
INSERT INTO `sys_city` VALUES ('210400', '抚顺市', '210000', null);
INSERT INTO `sys_city` VALUES ('210500', '本溪市', '210000', null);
INSERT INTO `sys_city` VALUES ('210600', '丹东市', '210000', null);
INSERT INTO `sys_city` VALUES ('210700', '锦州市', '210000', null);
INSERT INTO `sys_city` VALUES ('210800', '营口市', '210000', null);
INSERT INTO `sys_city` VALUES ('210900', '阜新市', '210000', null);
INSERT INTO `sys_city` VALUES ('211000', '辽阳市', '210000', null);
INSERT INTO `sys_city` VALUES ('211100', '盘锦市', '210000', null);
INSERT INTO `sys_city` VALUES ('211200', '铁岭市', '210000', null);
INSERT INTO `sys_city` VALUES ('211300', '朝阳市', '210000', null);
INSERT INTO `sys_city` VALUES ('211400', '葫芦岛市', '210000', null);
INSERT INTO `sys_city` VALUES ('220100', '长春市', '220000', null);
INSERT INTO `sys_city` VALUES ('220200', '吉林市', '220000', null);
INSERT INTO `sys_city` VALUES ('220300', '四平市', '220000', null);
INSERT INTO `sys_city` VALUES ('220400', '辽源市', '220000', null);
INSERT INTO `sys_city` VALUES ('220500', '通化市', '220000', null);
INSERT INTO `sys_city` VALUES ('220600', '白山市', '220000', null);
INSERT INTO `sys_city` VALUES ('220700', '松原市', '220000', null);
INSERT INTO `sys_city` VALUES ('220800', '白城市', '220000', null);
INSERT INTO `sys_city` VALUES ('222400', '延边朝鲜族自治州', '220000', null);
INSERT INTO `sys_city` VALUES ('230100', '哈尔滨市', '230000', null);
INSERT INTO `sys_city` VALUES ('230200', '齐齐哈尔市', '230000', null);
INSERT INTO `sys_city` VALUES ('230300', '鸡西市', '230000', null);
INSERT INTO `sys_city` VALUES ('230400', '鹤岗市', '230000', null);
INSERT INTO `sys_city` VALUES ('230500', '双鸭山市', '230000', null);
INSERT INTO `sys_city` VALUES ('230600', '大庆市', '230000', null);
INSERT INTO `sys_city` VALUES ('230700', '伊春市', '230000', null);
INSERT INTO `sys_city` VALUES ('230800', '佳木斯市', '230000', null);
INSERT INTO `sys_city` VALUES ('230900', '七台河市', '230000', null);
INSERT INTO `sys_city` VALUES ('231000', '牡丹江市', '230000', null);
INSERT INTO `sys_city` VALUES ('231100', '黑河市', '230000', null);
INSERT INTO `sys_city` VALUES ('231200', '绥化市', '230000', null);
INSERT INTO `sys_city` VALUES ('232700', '大兴安岭地区', '230000', null);
INSERT INTO `sys_city` VALUES ('310100', '市辖区', '310000', null);
INSERT INTO `sys_city` VALUES ('310200', '县', '310000', null);
INSERT INTO `sys_city` VALUES ('320100', '南京市', '320000', null);
INSERT INTO `sys_city` VALUES ('320200', '无锡市', '320000', null);
INSERT INTO `sys_city` VALUES ('320300', '徐州市', '320000', null);
INSERT INTO `sys_city` VALUES ('320400', '常州市', '320000', null);
INSERT INTO `sys_city` VALUES ('320500', '苏州市', '320000', null);
INSERT INTO `sys_city` VALUES ('320600', '南通市', '320000', null);
INSERT INTO `sys_city` VALUES ('320700', '连云港市', '320000', null);
INSERT INTO `sys_city` VALUES ('320800', '淮安市', '320000', null);
INSERT INTO `sys_city` VALUES ('320900', '盐城市', '320000', null);
INSERT INTO `sys_city` VALUES ('321000', '扬州市', '320000', null);
INSERT INTO `sys_city` VALUES ('321100', '镇江市', '320000', null);
INSERT INTO `sys_city` VALUES ('321200', '泰州市', '320000', null);
INSERT INTO `sys_city` VALUES ('321300', '宿迁市', '320000', null);
INSERT INTO `sys_city` VALUES ('330100', '杭州市', '330000', null);
INSERT INTO `sys_city` VALUES ('330200', '宁波市', '330000', null);
INSERT INTO `sys_city` VALUES ('330300', '温州市', '330000', null);
INSERT INTO `sys_city` VALUES ('330400', '嘉兴市', '330000', null);
INSERT INTO `sys_city` VALUES ('330500', '湖州市', '330000', null);
INSERT INTO `sys_city` VALUES ('330600', '绍兴市', '330000', null);
INSERT INTO `sys_city` VALUES ('330700', '金华市', '330000', null);
INSERT INTO `sys_city` VALUES ('330800', '衢州市', '330000', null);
INSERT INTO `sys_city` VALUES ('330900', '舟山市', '330000', null);
INSERT INTO `sys_city` VALUES ('331000', '台州市', '330000', null);
INSERT INTO `sys_city` VALUES ('331100', '丽水市', '330000', null);
INSERT INTO `sys_city` VALUES ('340100', '合肥市', '340000', null);
INSERT INTO `sys_city` VALUES ('340200', '芜湖市', '340000', null);
INSERT INTO `sys_city` VALUES ('340300', '蚌埠市', '340000', null);
INSERT INTO `sys_city` VALUES ('340400', '淮南市', '340000', null);
INSERT INTO `sys_city` VALUES ('340500', '马鞍山市', '340000', null);
INSERT INTO `sys_city` VALUES ('340600', '淮北市', '340000', null);
INSERT INTO `sys_city` VALUES ('340700', '铜陵市', '340000', null);
INSERT INTO `sys_city` VALUES ('340800', '安庆市', '340000', null);
INSERT INTO `sys_city` VALUES ('341000', '黄山市', '340000', null);
INSERT INTO `sys_city` VALUES ('341100', '滁州市', '340000', null);
INSERT INTO `sys_city` VALUES ('341200', '阜阳市', '340000', null);
INSERT INTO `sys_city` VALUES ('341300', '宿州市', '340000', null);
INSERT INTO `sys_city` VALUES ('341400', '巢湖市', '340000', null);
INSERT INTO `sys_city` VALUES ('341500', '六安市', '340000', null);
INSERT INTO `sys_city` VALUES ('341600', '亳州市', '340000', null);
INSERT INTO `sys_city` VALUES ('341700', '池州市', '340000', null);
INSERT INTO `sys_city` VALUES ('341800', '宣城市', '340000', null);
INSERT INTO `sys_city` VALUES ('350100', '福州市', '350000', null);
INSERT INTO `sys_city` VALUES ('350200', '厦门市', '350000', null);
INSERT INTO `sys_city` VALUES ('350300', '莆田市', '350000', null);
INSERT INTO `sys_city` VALUES ('350400', '三明市', '350000', null);
INSERT INTO `sys_city` VALUES ('350500', '泉州市', '350000', null);
INSERT INTO `sys_city` VALUES ('350600', '漳州市', '350000', null);
INSERT INTO `sys_city` VALUES ('350700', '南平市', '350000', null);
INSERT INTO `sys_city` VALUES ('350800', '龙岩市', '350000', null);
INSERT INTO `sys_city` VALUES ('350900', '宁德市', '350000', null);
INSERT INTO `sys_city` VALUES ('360100', '南昌市', '360000', null);
INSERT INTO `sys_city` VALUES ('360200', '景德镇市', '360000', null);
INSERT INTO `sys_city` VALUES ('360300', '萍乡市', '360000', null);
INSERT INTO `sys_city` VALUES ('360400', '九江市', '360000', null);
INSERT INTO `sys_city` VALUES ('360500', '新余市', '360000', null);
INSERT INTO `sys_city` VALUES ('360600', '鹰潭市', '360000', null);
INSERT INTO `sys_city` VALUES ('360700', '赣州市', '360000', null);
INSERT INTO `sys_city` VALUES ('360800', '吉安市', '360000', null);
INSERT INTO `sys_city` VALUES ('360900', '宜春市', '360000', null);
INSERT INTO `sys_city` VALUES ('361000', '抚州市', '360000', null);
INSERT INTO `sys_city` VALUES ('361100', '上饶市', '360000', null);
INSERT INTO `sys_city` VALUES ('370100', '济南市', '370000', null);
INSERT INTO `sys_city` VALUES ('370200', '青岛市', '370000', null);
INSERT INTO `sys_city` VALUES ('370300', '淄博市', '370000', null);
INSERT INTO `sys_city` VALUES ('370400', '枣庄市', '370000', null);
INSERT INTO `sys_city` VALUES ('370500', '东营市', '370000', null);
INSERT INTO `sys_city` VALUES ('370600', '烟台市', '370000', null);
INSERT INTO `sys_city` VALUES ('370700', '潍坊市', '370000', null);
INSERT INTO `sys_city` VALUES ('370800', '济宁市', '370000', null);
INSERT INTO `sys_city` VALUES ('370900', '泰安市', '370000', null);
INSERT INTO `sys_city` VALUES ('371000', '威海市', '370000', null);
INSERT INTO `sys_city` VALUES ('371100', '日照市', '370000', null);
INSERT INTO `sys_city` VALUES ('371200', '莱芜市', '370000', null);
INSERT INTO `sys_city` VALUES ('371300', '临沂市', '370000', null);
INSERT INTO `sys_city` VALUES ('371400', '德州市', '370000', null);
INSERT INTO `sys_city` VALUES ('371500', '聊城市', '370000', null);
INSERT INTO `sys_city` VALUES ('371600', '滨州市', '370000', null);
INSERT INTO `sys_city` VALUES ('371700', '荷泽市', '370000', null);
INSERT INTO `sys_city` VALUES ('410100', '郑州市', '410000', null);
INSERT INTO `sys_city` VALUES ('410200', '开封市', '410000', null);
INSERT INTO `sys_city` VALUES ('410300', '洛阳市', '410000', null);
INSERT INTO `sys_city` VALUES ('410400', '平顶山市', '410000', null);
INSERT INTO `sys_city` VALUES ('410500', '安阳市', '410000', null);
INSERT INTO `sys_city` VALUES ('410600', '鹤壁市', '410000', null);
INSERT INTO `sys_city` VALUES ('410700', '新乡市', '410000', null);
INSERT INTO `sys_city` VALUES ('410800', '焦作市', '410000', null);
INSERT INTO `sys_city` VALUES ('410900', '濮阳市', '410000', null);
INSERT INTO `sys_city` VALUES ('411000', '许昌市', '410000', null);
INSERT INTO `sys_city` VALUES ('411100', '漯河市', '410000', null);
INSERT INTO `sys_city` VALUES ('411200', '三门峡市', '410000', null);
INSERT INTO `sys_city` VALUES ('411300', '南阳市', '410000', null);
INSERT INTO `sys_city` VALUES ('411400', '商丘市', '410000', null);
INSERT INTO `sys_city` VALUES ('411500', '信阳市', '410000', null);
INSERT INTO `sys_city` VALUES ('411600', '周口市', '410000', null);
INSERT INTO `sys_city` VALUES ('411700', '驻马店市', '410000', null);
INSERT INTO `sys_city` VALUES ('420100', '武汉市', '420000', null);
INSERT INTO `sys_city` VALUES ('420200', '黄石市', '420000', null);
INSERT INTO `sys_city` VALUES ('420300', '十堰市', '420000', null);
INSERT INTO `sys_city` VALUES ('420500', '宜昌市', '420000', null);
INSERT INTO `sys_city` VALUES ('420600', '襄樊市', '420000', null);
INSERT INTO `sys_city` VALUES ('420700', '鄂州市', '420000', null);
INSERT INTO `sys_city` VALUES ('420800', '荆门市', '420000', null);
INSERT INTO `sys_city` VALUES ('420900', '孝感市', '420000', null);
INSERT INTO `sys_city` VALUES ('421000', '荆州市', '420000', null);
INSERT INTO `sys_city` VALUES ('421100', '黄冈市', '420000', null);
INSERT INTO `sys_city` VALUES ('421200', '咸宁市', '420000', null);
INSERT INTO `sys_city` VALUES ('421300', '随州市', '420000', null);
INSERT INTO `sys_city` VALUES ('422800', '恩施土家族苗族自治州', '420000', null);
INSERT INTO `sys_city` VALUES ('429000', '省直辖行政单位', '420000', null);
INSERT INTO `sys_city` VALUES ('430100', '长沙市', '430000', null);
INSERT INTO `sys_city` VALUES ('430200', '株洲市', '430000', null);
INSERT INTO `sys_city` VALUES ('430300', '湘潭市', '430000', null);
INSERT INTO `sys_city` VALUES ('430400', '衡阳市', '430000', null);
INSERT INTO `sys_city` VALUES ('430500', '邵阳市', '430000', null);
INSERT INTO `sys_city` VALUES ('430600', '岳阳市', '430000', null);
INSERT INTO `sys_city` VALUES ('430700', '常德市', '430000', null);
INSERT INTO `sys_city` VALUES ('430800', '张家界市', '430000', null);
INSERT INTO `sys_city` VALUES ('430900', '益阳市', '430000', null);
INSERT INTO `sys_city` VALUES ('431000', '郴州市', '430000', null);
INSERT INTO `sys_city` VALUES ('431100', '永州市', '430000', null);
INSERT INTO `sys_city` VALUES ('431200', '怀化市', '430000', null);
INSERT INTO `sys_city` VALUES ('431300', '娄底市', '430000', null);
INSERT INTO `sys_city` VALUES ('433100', '湘西土家族苗族自治州', '430000', null);
INSERT INTO `sys_city` VALUES ('440100', '广州市', '440000', null);
INSERT INTO `sys_city` VALUES ('440200', '韶关市', '440000', null);
INSERT INTO `sys_city` VALUES ('440300', '深圳市', '440000', null);
INSERT INTO `sys_city` VALUES ('440400', '珠海市', '440000', null);
INSERT INTO `sys_city` VALUES ('440500', '汕头市', '440000', null);
INSERT INTO `sys_city` VALUES ('440600', '佛山市', '440000', null);
INSERT INTO `sys_city` VALUES ('440700', '江门市', '440000', null);
INSERT INTO `sys_city` VALUES ('440800', '湛江市', '440000', null);
INSERT INTO `sys_city` VALUES ('440900', '茂名市', '440000', null);
INSERT INTO `sys_city` VALUES ('441200', '肇庆市', '440000', null);
INSERT INTO `sys_city` VALUES ('441300', '惠州市', '440000', null);
INSERT INTO `sys_city` VALUES ('441400', '梅州市', '440000', null);
INSERT INTO `sys_city` VALUES ('441500', '汕尾市', '440000', null);
INSERT INTO `sys_city` VALUES ('441600', '河源市', '440000', null);
INSERT INTO `sys_city` VALUES ('441700', '阳江市', '440000', null);
INSERT INTO `sys_city` VALUES ('441800', '清远市', '440000', null);
INSERT INTO `sys_city` VALUES ('441900', '东莞市', '440000', null);
INSERT INTO `sys_city` VALUES ('442000', '中山市', '440000', null);
INSERT INTO `sys_city` VALUES ('445100', '潮州市', '440000', null);
INSERT INTO `sys_city` VALUES ('445200', '揭阳市', '440000', null);
INSERT INTO `sys_city` VALUES ('445300', '云浮市', '440000', null);
INSERT INTO `sys_city` VALUES ('450100', '南宁市', '450000', null);
INSERT INTO `sys_city` VALUES ('450200', '柳州市', '450000', null);
INSERT INTO `sys_city` VALUES ('450300', '桂林市', '450000', null);
INSERT INTO `sys_city` VALUES ('450400', '梧州市', '450000', null);
INSERT INTO `sys_city` VALUES ('450500', '北海市', '450000', null);
INSERT INTO `sys_city` VALUES ('450600', '防城港市', '450000', null);
INSERT INTO `sys_city` VALUES ('450700', '钦州市', '450000', null);
INSERT INTO `sys_city` VALUES ('450800', '贵港市', '450000', null);
INSERT INTO `sys_city` VALUES ('450900', '玉林市', '450000', null);
INSERT INTO `sys_city` VALUES ('451000', '百色市', '450000', null);
INSERT INTO `sys_city` VALUES ('451100', '贺州市', '450000', null);
INSERT INTO `sys_city` VALUES ('451200', '河池市', '450000', null);
INSERT INTO `sys_city` VALUES ('451300', '来宾市', '450000', null);
INSERT INTO `sys_city` VALUES ('451400', '崇左市', '450000', null);
INSERT INTO `sys_city` VALUES ('460100', '海口市', '460000', null);
INSERT INTO `sys_city` VALUES ('460200', '三亚市', '460000', null);
INSERT INTO `sys_city` VALUES ('469000', '省直辖县级行政单位', '460000', null);
INSERT INTO `sys_city` VALUES ('500100', '市辖区', '500000', null);
INSERT INTO `sys_city` VALUES ('500200', '县', '500000', null);
INSERT INTO `sys_city` VALUES ('500300', '市', '500000', null);
INSERT INTO `sys_city` VALUES ('510100', '成都市', '510000', null);
INSERT INTO `sys_city` VALUES ('510300', '自贡市', '510000', null);
INSERT INTO `sys_city` VALUES ('510400', '攀枝花市', '510000', null);
INSERT INTO `sys_city` VALUES ('510500', '泸州市', '510000', null);
INSERT INTO `sys_city` VALUES ('510600', '德阳市', '510000', null);
INSERT INTO `sys_city` VALUES ('510700', '绵阳市', '510000', null);
INSERT INTO `sys_city` VALUES ('510800', '广元市', '510000', null);
INSERT INTO `sys_city` VALUES ('510900', '遂宁市', '510000', null);
INSERT INTO `sys_city` VALUES ('511000', '内江市', '510000', null);
INSERT INTO `sys_city` VALUES ('511100', '乐山市', '510000', null);
INSERT INTO `sys_city` VALUES ('511300', '南充市', '510000', null);
INSERT INTO `sys_city` VALUES ('511400', '眉山市', '510000', null);
INSERT INTO `sys_city` VALUES ('511500', '宜宾市', '510000', null);
INSERT INTO `sys_city` VALUES ('511600', '广安市', '510000', null);
INSERT INTO `sys_city` VALUES ('511700', '达州市', '510000', null);
INSERT INTO `sys_city` VALUES ('511800', '雅安市', '510000', null);
INSERT INTO `sys_city` VALUES ('511900', '巴中市', '510000', null);
INSERT INTO `sys_city` VALUES ('512000', '资阳市', '510000', null);
INSERT INTO `sys_city` VALUES ('513200', '阿坝藏族羌族自治州', '510000', null);
INSERT INTO `sys_city` VALUES ('513300', '甘孜藏族自治州', '510000', null);
INSERT INTO `sys_city` VALUES ('513400', '凉山彝族自治州', '510000', null);
INSERT INTO `sys_city` VALUES ('520100', '贵阳市', '520000', null);
INSERT INTO `sys_city` VALUES ('520200', '六盘水市', '520000', null);
INSERT INTO `sys_city` VALUES ('520300', '遵义市', '520000', null);
INSERT INTO `sys_city` VALUES ('520400', '安顺市', '520000', null);
INSERT INTO `sys_city` VALUES ('522200', '铜仁地区', '520000', null);
INSERT INTO `sys_city` VALUES ('522300', '黔西南布依族苗族自治州', '520000', null);
INSERT INTO `sys_city` VALUES ('522400', '毕节地区', '520000', null);
INSERT INTO `sys_city` VALUES ('522600', '黔东南苗族侗族自治州', '520000', null);
INSERT INTO `sys_city` VALUES ('522700', '黔南布依族苗族自治州', '520000', null);
INSERT INTO `sys_city` VALUES ('530100', '昆明市', '530000', null);
INSERT INTO `sys_city` VALUES ('530300', '曲靖市', '530000', null);
INSERT INTO `sys_city` VALUES ('530400', '玉溪市', '530000', null);
INSERT INTO `sys_city` VALUES ('530500', '保山市', '530000', null);
INSERT INTO `sys_city` VALUES ('530600', '昭通市', '530000', null);
INSERT INTO `sys_city` VALUES ('530700', '丽江市', '530000', null);
INSERT INTO `sys_city` VALUES ('530800', '思茅市', '530000', null);
INSERT INTO `sys_city` VALUES ('530900', '临沧市', '530000', null);
INSERT INTO `sys_city` VALUES ('532300', '楚雄彝族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('532500', '红河哈尼族彝族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('532600', '文山壮族苗族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('532800', '西双版纳傣族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('532900', '大理白族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('533100', '德宏傣族景颇族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('533300', '怒江傈僳族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('533400', '迪庆藏族自治州', '530000', null);
INSERT INTO `sys_city` VALUES ('540100', '拉萨市', '540000', null);
INSERT INTO `sys_city` VALUES ('542100', '昌都地区', '540000', null);
INSERT INTO `sys_city` VALUES ('542200', '山南地区', '540000', null);
INSERT INTO `sys_city` VALUES ('542300', '日喀则地区', '540000', null);
INSERT INTO `sys_city` VALUES ('542400', '那曲地区', '540000', null);
INSERT INTO `sys_city` VALUES ('542500', '阿里地区', '540000', null);
INSERT INTO `sys_city` VALUES ('542600', '林芝地区', '540000', null);
INSERT INTO `sys_city` VALUES ('610100', '西安市', '610000', null);
INSERT INTO `sys_city` VALUES ('610200', '铜川市', '610000', null);
INSERT INTO `sys_city` VALUES ('610300', '宝鸡市', '610000', null);
INSERT INTO `sys_city` VALUES ('610400', '咸阳市', '610000', null);
INSERT INTO `sys_city` VALUES ('610500', '渭南市', '610000', null);
INSERT INTO `sys_city` VALUES ('610600', '延安市', '610000', null);
INSERT INTO `sys_city` VALUES ('610700', '汉中市', '610000', null);
INSERT INTO `sys_city` VALUES ('610800', '榆林市', '610000', null);
INSERT INTO `sys_city` VALUES ('610900', '安康市', '610000', null);
INSERT INTO `sys_city` VALUES ('611000', '商洛市', '610000', null);
INSERT INTO `sys_city` VALUES ('620100', '兰州市', '620000', null);
INSERT INTO `sys_city` VALUES ('620200', '嘉峪关市', '620000', null);
INSERT INTO `sys_city` VALUES ('620300', '金昌市', '620000', null);
INSERT INTO `sys_city` VALUES ('620400', '白银市', '620000', null);
INSERT INTO `sys_city` VALUES ('620500', '天水市', '620000', null);
INSERT INTO `sys_city` VALUES ('620600', '武威市', '620000', null);
INSERT INTO `sys_city` VALUES ('620700', '张掖市', '620000', null);
INSERT INTO `sys_city` VALUES ('620800', '平凉市', '620000', null);
INSERT INTO `sys_city` VALUES ('620900', '酒泉市', '620000', null);
INSERT INTO `sys_city` VALUES ('621000', '庆阳市', '620000', null);
INSERT INTO `sys_city` VALUES ('621100', '定西市', '620000', null);
INSERT INTO `sys_city` VALUES ('621200', '陇南市', '620000', null);
INSERT INTO `sys_city` VALUES ('622900', '临夏回族自治州', '620000', null);
INSERT INTO `sys_city` VALUES ('623000', '甘南藏族自治州', '620000', null);
INSERT INTO `sys_city` VALUES ('630100', '西宁市', '630000', null);
INSERT INTO `sys_city` VALUES ('632100', '海东地区', '630000', null);
INSERT INTO `sys_city` VALUES ('632200', '海北藏族自治州', '630000', null);
INSERT INTO `sys_city` VALUES ('632300', '黄南藏族自治州', '630000', null);
INSERT INTO `sys_city` VALUES ('632500', '海南藏族自治州', '630000', null);
INSERT INTO `sys_city` VALUES ('632600', '果洛藏族自治州', '630000', null);
INSERT INTO `sys_city` VALUES ('632700', '玉树藏族自治州', '630000', null);
INSERT INTO `sys_city` VALUES ('632800', '海西蒙古族藏族自治州', '630000', null);
INSERT INTO `sys_city` VALUES ('640100', '银川市', '640000', null);
INSERT INTO `sys_city` VALUES ('640200', '石嘴山市', '640000', null);
INSERT INTO `sys_city` VALUES ('640300', '吴忠市', '640000', null);
INSERT INTO `sys_city` VALUES ('640400', '固原市', '640000', null);
INSERT INTO `sys_city` VALUES ('640500', '中卫市', '640000', null);
INSERT INTO `sys_city` VALUES ('650100', '乌鲁木齐市', '650000', null);
INSERT INTO `sys_city` VALUES ('650200', '克拉玛依市', '650000', null);
INSERT INTO `sys_city` VALUES ('652100', '吐鲁番地区', '650000', null);
INSERT INTO `sys_city` VALUES ('652200', '哈密地区', '650000', null);
INSERT INTO `sys_city` VALUES ('652300', '昌吉回族自治州', '650000', null);
INSERT INTO `sys_city` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', null);
INSERT INTO `sys_city` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', null);
INSERT INTO `sys_city` VALUES ('652900', '阿克苏地区', '650000', null);
INSERT INTO `sys_city` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', null);
INSERT INTO `sys_city` VALUES ('653100', '喀什地区', '650000', null);
INSERT INTO `sys_city` VALUES ('653200', '和田地区', '650000', null);
INSERT INTO `sys_city` VALUES ('654000', '伊犁哈萨克自治州', '650000', null);
INSERT INTO `sys_city` VALUES ('654200', '塔城地区', '650000', null);
INSERT INTO `sys_city` VALUES ('654300', '阿勒泰地区', '650000', null);
INSERT INTO `sys_city` VALUES ('659000', '省直辖行政单位', '650000', null);
INSERT INTO `sys_city` VALUES ('419000', '省直辖县级行政区划', '410000', null);
INSERT INTO `sys_city` VALUES ('520500', '毕节市', '520000', null);
INSERT INTO `sys_city` VALUES ('520600', '铜仁市', '520000', null);

-- ----------------------------
-- Table structure for `sys_code_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_dict`;
CREATE TABLE `sys_code_dict` (
  `CODE_ID` bigint(22) NOT NULL AUTO_INCREMENT,
  `CODE_TYPE` varchar(32) DEFAULT NULL,
  `CODE_TYPE_NAME` varchar(100) DEFAULT NULL,
  `CODE_VALUE` varchar(100) DEFAULT NULL,
  `DISPLAY_VALUE` varchar(20) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `CODE_SORT` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `PRIMARYSYS_CODE_DICT1` (`CODE_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_code_dict
-- ----------------------------
INSERT INTO `sys_code_dict` VALUES ('1', 'sex', '性别', '1', '男', null, '2014-05-14 00:56:52', '1', '', '0.000');
INSERT INTO `sys_code_dict` VALUES ('2', 'sex', '性别', '0', '女', null, '2014-05-13 00:05:52', '1', '', '0.000');
INSERT INTO `sys_code_dict` VALUES ('3', 'whether', '判断指示器', '1', '是', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('4', 'whether', '判断指示器', '0', '否', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('5', 'AUDITSTATUS', '审批状态', '0', '待审核', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('6', 'AUDITSTATUS', '审批状态', '1', '审核通过', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('7', 'AUDITSTATUS', '审批状态', '2', '审核不通过', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('20', 'IsAllowFriend', '是否允许好友？', '0', '不允许', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('21', 'IsAllowFriend', '是否允许好友？', '1', '允许', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('22', 'IsAllowFriend', '是否允许好友？', '2', '需要身份验证', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('23', 'FRIENDSTATUS', '好友状态', '0', '请求添加好友', null, '2014-05-13 00:25:20', '1', '', '0.000');
INSERT INTO `sys_code_dict` VALUES ('24', 'FRIENDSTATUS', '好友状态', '1', '好友', null, '2014-05-13 00:25:27', '1', '', '0.000');
INSERT INTO `sys_code_dict` VALUES ('30', 'BILLPAYWAY', '付款方式', '0', '线上付款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('31', 'BILLPAYWAY', '付款方式', '1', '货到付款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('32', 'BILLPAYWAY', '付款方式', '2', '找人代付', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('40', 'BILLSTATUS', '订单状态', '0', '待确定', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('41', 'BILLSTATUS', '订单状态', '1', '已确认', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('42', 'BILLSTATUS', '订单状态', '2', '待付款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('43', 'BILLSTATUS', '订单状态', '3', '已付款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('50', 'HOURS', '小时', '01', '01', null, '2014-05-13 00:05:08', null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('51', 'HOURS', '小时', '02', '02', null, '2014-05-13 00:05:08', null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('52', 'HOURS', '小时', '03', '03', null, '2014-05-13 00:05:08', null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('53', 'HOURS', '小时', '04', '04', null, '2014-05-13 00:05:08', null, null, '4.000');
INSERT INTO `sys_code_dict` VALUES ('54', 'HOURS', '小时', '05', '05', null, '2014-05-13 00:05:08', null, null, '5.000');
INSERT INTO `sys_code_dict` VALUES ('55', 'HOURS', '小时', '06', '06', null, '2014-05-13 00:05:08', null, null, '6.000');
INSERT INTO `sys_code_dict` VALUES ('56', 'HOURS', '小时', '07', '07', null, '2014-05-13 00:05:08', null, null, '7.000');
INSERT INTO `sys_code_dict` VALUES ('57', 'HOURS', '小时', '08', '08', null, '2014-05-13 00:05:08', null, null, '8.000');
INSERT INTO `sys_code_dict` VALUES ('58', 'HOURS', '小时', '09', '09', null, '2014-05-13 00:05:08', null, null, '9.000');
INSERT INTO `sys_code_dict` VALUES ('59', 'HOURS', '小时', '10', '10', null, '2014-05-13 00:05:08', null, null, '10.000');
INSERT INTO `sys_code_dict` VALUES ('60', 'HOURS', '小时', '11', '11', null, '2014-05-13 00:05:08', null, null, '11.000');
INSERT INTO `sys_code_dict` VALUES ('61', 'HOURS', '小时', '12', '12', null, '2014-05-13 00:05:08', null, null, '12.000');
INSERT INTO `sys_code_dict` VALUES ('62', 'HOURS', '小时', '13', '13', null, '2014-05-13 00:05:08', null, null, '13.000');
INSERT INTO `sys_code_dict` VALUES ('63', 'HOURS', '小时', '14', '14', null, '2014-05-13 00:05:08', null, null, '14.000');
INSERT INTO `sys_code_dict` VALUES ('64', 'HOURS', '小时', '15', '15', null, '2014-05-13 00:05:08', null, null, '15.000');
INSERT INTO `sys_code_dict` VALUES ('65', 'HOURS', '小时', '16', '16', null, '2014-05-13 00:05:08', null, null, '16.000');
INSERT INTO `sys_code_dict` VALUES ('66', 'HOURS', '小时', '17', '17', null, '2014-05-13 00:05:08', null, null, '17.000');
INSERT INTO `sys_code_dict` VALUES ('67', 'HOURS', '小时', '18', '18', null, '2014-05-13 00:05:08', null, null, '18.000');
INSERT INTO `sys_code_dict` VALUES ('68', 'HOURS', '小时', '19', '19', null, '2014-05-13 00:05:08', null, null, '19.000');
INSERT INTO `sys_code_dict` VALUES ('69', 'HOURS', '小时', '20', '20', null, '2014-05-13 00:05:08', null, null, '20.000');
INSERT INTO `sys_code_dict` VALUES ('70', 'HOURS', '小时', '21', '21', null, '2014-05-13 00:05:08', null, null, '21.000');
INSERT INTO `sys_code_dict` VALUES ('71', 'HOURS', '小时', '22', '22', null, '2014-05-13 00:05:08', null, null, '22.000');
INSERT INTO `sys_code_dict` VALUES ('72', 'HOURS', '小时', '23', '23', null, '2014-05-13 00:05:08', null, null, '23.000');
INSERT INTO `sys_code_dict` VALUES ('73', 'HOURS', '小时', '24', '24', null, '2014-05-13 00:05:08', null, null, '24.000');
INSERT INTO `sys_code_dict` VALUES ('74', 'MINUTE', '分钟', '05', '05', null, '2014-05-13 00:05:08', null, null, '5.000');
INSERT INTO `sys_code_dict` VALUES ('75', 'MINUTE', '分钟', '10', '10', null, '2014-05-13 00:05:08', null, null, '10.000');
INSERT INTO `sys_code_dict` VALUES ('76', 'MINUTE', '分钟', '15', '15', null, '2014-05-13 00:05:08', null, null, '15.000');
INSERT INTO `sys_code_dict` VALUES ('77', 'MINUTE', '分钟', '20', '20', null, '2014-05-13 00:05:08', null, null, '20.000');
INSERT INTO `sys_code_dict` VALUES ('78', 'MINUTE', '分钟', '25', '25', null, '2014-05-13 00:05:08', null, null, '25.000');
INSERT INTO `sys_code_dict` VALUES ('79', 'MINUTE', '分钟', '30', '30', null, '2014-05-13 00:05:08', null, null, '30.000');
INSERT INTO `sys_code_dict` VALUES ('80', 'MINUTE', '分钟', '35', '35', null, '2014-05-13 00:05:08', null, null, '35.000');
INSERT INTO `sys_code_dict` VALUES ('81', 'MINUTE', '分钟', '40', '40', null, '2014-05-13 00:05:08', null, null, '40.000');
INSERT INTO `sys_code_dict` VALUES ('82', 'MINUTE', '分钟', '45', '45', null, '2014-05-13 00:05:08', null, null, '45.000');
INSERT INTO `sys_code_dict` VALUES ('83', 'MINUTE', '分钟', '50', '50', null, '2014-05-13 00:05:08', null, null, '50.000');
INSERT INTO `sys_code_dict` VALUES ('84', 'MINUTE', '分钟', '55', '55', null, '2014-05-13 00:05:08', null, null, '55.000');
INSERT INTO `sys_code_dict` VALUES ('85', 'MINUTE', '分钟', '00', '00', null, '2014-05-13 00:05:08', null, null, '0.000');
INSERT INTO `sys_code_dict` VALUES ('87', 'FOLWNAME', '任务名称', 'limits_apply', '额度申请', null, '2014-05-13 00:05:08', null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('88', 'FOLWNAME', '任务名称', 'withdrawals_apply', '提现申请', null, '2014-05-13 00:05:08', null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('89', 'FOLWNAME', '任务名称', 'loan_apply', '借款申请', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('90', 'FOLWNAME', '任务名称', 'product_apply', '理财产品申请', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('91', 'FOLWNAME', '任务名称', 'after_loan', '贷后任务', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('92', 'FOLWNAME', '任务名称', '', '团队长/经纪人', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('93', 'productType', '产品类别', '1', '信用标', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('94', 'productType', '产品类别', '2', '担保标', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('95', 'productType', '产品类别', '3', '抵押标', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('96', 'businessType', '业务类别', '1', '额度申请', null, '2014-05-13 00:05:08', null, '业务类型', null);
INSERT INTO `sys_code_dict` VALUES ('97', 'businessType', '业务类别', '2', '借款申请', null, '2014-05-13 00:05:08', null, '业务类型', null);
INSERT INTO `sys_code_dict` VALUES ('98', 'businessType', '业务类别', '3', '二合一', null, '2014-05-13 00:05:08', null, '业务类型', null);
INSERT INTO `sys_code_dict` VALUES ('99', 'loanStatusCd', '贷款状态', '0', '未结清', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('100', 'loanStatusCd', '贷款状态', '1', '结清', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('101', 'loanStatusCd', '贷款状态', '2', '展期', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('102', 'loanStatusCd', '贷款状态', '3', '逾期', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('103', 'loanStatusCd', '贷款状态', '4', '平台垫款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('104', 'loanStatusCd', '贷款状态', '5', '呆账', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('105', 'custTypeCd', '客户类型', '0', '个人', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('106', 'custTypeCd', '客户类型', '1', '公司', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('107', 'tenderTypeCd', '标的类型', '0', '抵押', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('108', 'tenderTypeCd', '标的类型', '1', '担保', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('109', 'tenderTypeCd', '标的类型', '2', '信用', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('110', 'maritalStatusCd', '婚姻状况', '0', '已婚', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('111', 'maritalStatusCd', '婚姻状况', '1', '未婚', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('112', 'maritalStatusCd', '婚姻状况', '2', '离异', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('113', 'maritalStatusCd', '婚姻状况', '3', '丧偶', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('114', 'educationCd', '学历', '0', '本科', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('115', 'educationCd', '学历', '1', '大专', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('116', 'educationCd', '学历', '2', '高中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('117', 'educationCd', '学历', '3', '初中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('118', 'educationCd', '学历', '4', '小学', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('119', 'contactsTypeCd', '联系人关系', '0', '配偶', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('120', 'contactsTypeCd', '联系人关系', '0', '父母', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('121', 'contactsTypeCd', '联系人关系', '0', '子女', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('122', 'workContactsTypeCd', '工作联系人关系', '0', '同事', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('123', 'workContactsTypeCd', '工作联系人关系', '1', 'HR', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('124', 'workContactsTypeCd', '工作联系人关系', '2', '领导', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('125', 'otherContactsTypeCd', '其他联系人关系', '0', '朋友', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('126', 'otherContactsTypeCd', '其他联系人关系', '1', '同学', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('127', 'otherContactsTypeCd', '其他联系人关系', '2', '其他', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('128', 'companyTypeCd', '单位性质', '0', '机关及事业单位', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('129', 'companyTypeCd', '单位性质', '1', '国营', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('130', 'companyTypeCd', '单位性质', '2', '民营', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('131', 'companyTypeCd', '单位性质', '3', '三资企业', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('132', 'companyTypeCd', '单位性质', '4', '其他', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('133', 'jobIncomeCd', '月收入', '0', '3W以下', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('134', 'jobIncomeCd', '月收入', '1', '3W-5W', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('135', 'jobIncomeCd', '月收入', '2', '5W-10W', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('136', 'jobIncomeCd', '月收入', '3', '10W-30W', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('137', 'jobIncomeCd', '月收入', '4', '30-50W', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('138', 'jobIncomeCd', '月收入', '5', '50W以上', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('139', 'jobPositionCd', '职务', '0', '部门总监', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('140', 'jobPositionCd', '职务', '1', '部门经理', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('141', 'jobYearCd', '工作年限', '0', '1年', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('142', 'jobYearCd', '工作年限', '1', '2年', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('143', 'guaranteeTypeCd', '担保品类型', '0', '房地产抵押', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('144', 'guaranteeTypeCd', '担保品类型', '1', '车子抵押', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('147', 'rechargeStatusCd', '充值卡状态', '0', '生效', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('148', 'rechargeStatusCd', '充值卡状态', '1', '使用中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('149', 'rechargeStatusCd', '充值卡状态', '2', '已使用', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('150', 'rechargeStatusCd', '充值卡状态', '3', '作废', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('151', 'repayTypeCd', '还款方式', '0', '等额本息', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('152', 'repayTypeCd', '还款方式', '1', '等额本金', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('153', 'repayTypeCd', '还款方式', '2', '利随本清', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('154', 'repayTypeCd', '还款方式', '3', '按固定周期付息', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('155', 'approveStatusCd', '借款发布状态', '0', '投标中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('156', 'approveStatusCd', '借款发布状态', '1', '满标', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('157', 'approveStatusCd', '借款发布状态', '2', '撤标', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('158', 'applyStatusCd', '借款状态', '0', '借款申请中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('159', 'applyStatusCd', '借款状态', '1', '申请通过，投标中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('160', 'applyStatusCd', '借款状态', '2', '放款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('161', 'applyStatusCd', '借款状态', '3', '还款中', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('162', 'applyStatusCd', '借款状态', '4', '已结清', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('163', 'FOLWNAME', '任务名称', 'loan', '放款申请', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('165', 'loanTypeCd', '借款类型', '0', '普通贷款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('166', 'loanTypeCd', '借款类型', '1', '工薪贷', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('167', 'loanTypeCd', '借款类型', '2', '生意贷', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('168', 'certificateTypeCd', '证件类型', '0', '身份证', '2014-05-03 15:39:28', '2014-05-13 00:05:08', '1', '', '1.000');
INSERT INTO `sys_code_dict` VALUES ('169', 'certificateTypeCd', '证件类型', '1', '户口簿', '2014-05-03 15:40:28', '2014-05-13 00:05:08', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('170', 'certificateTypeCd', '证件类型', '2', '护照', '2014-05-03 15:44:19', '2014-05-13 00:05:08', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('171', 'certificateTypeCd', '证件类型', '3', '军官证', '2014-05-03 15:44:36', '2014-05-13 00:05:08', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('172', 'certificateTypeCd', '证件类型', '4', '士兵证', '2014-05-03 15:44:49', '2014-05-13 00:05:08', '1', '', '5.000');
INSERT INTO `sys_code_dict` VALUES ('173', 'certificateTypeCd', '证件类型', '5', '港澳居民来往内地通行证', '2014-05-03 15:45:01', '2014-05-13 00:05:08', '1', '', '6.000');
INSERT INTO `sys_code_dict` VALUES ('174', 'certificateTypeCd', '证件类型', '6', '台湾同胞来往内地通行证', '2014-05-03 15:46:36', '2014-05-13 00:05:08', '1', '', '7.000');
INSERT INTO `sys_code_dict` VALUES ('175', 'certificateTypeCd', '证件类型', '7', '临时身份证', '2014-05-03 15:46:47', '2014-05-13 00:05:08', '1', '', '8.000');
INSERT INTO `sys_code_dict` VALUES ('176', 'certificateTypeCd', '证件类型', '8', '外国人居留证', '2014-05-03 15:47:04', '2014-05-13 00:05:08', '1', '', '9.000');
INSERT INTO `sys_code_dict` VALUES ('177', 'certificateTypeCd', '证件类型', '9', '警官证', '2014-05-03 15:47:21', '2014-05-13 00:05:08', '1', '', '10.000');
INSERT INTO `sys_code_dict` VALUES ('178', 'certificateTypeCd', '证件类型', 'a', '组织机构代码证', '2014-05-03 15:47:35', '2014-05-13 00:05:08', '1', '', '11.000');
INSERT INTO `sys_code_dict` VALUES ('179', 'certificateTypeCd', '证件类型', 'b', '营业执照', '2014-05-03 15:47:49', '2014-05-13 00:05:08', '1', '', '12.000');
INSERT INTO `sys_code_dict` VALUES ('180', 'certificateTypeCd', '证件类型', 'c', '贷款卡', '2014-05-03 15:48:03', '2014-05-13 00:05:08', '1', '', '13.000');
INSERT INTO `sys_code_dict` VALUES ('181', 'certificateTypeCd', '证件类型', 'x', '其他证件', '2014-05-03 15:48:17', '2014-05-13 00:05:08', '1', '', '14.000');
INSERT INTO `sys_code_dict` VALUES ('182', 'guarantTypeCd', '担保类型(担保品)', '1', '抵押', '2014-05-03 15:52:24', '2014-05-13 00:05:08', '1', '', '1.000');
INSERT INTO `sys_code_dict` VALUES ('183', 'guarantTypeCd', '担保类型(担保品)', '2', '质押', '2014-05-03 15:52:38', '2014-05-13 00:05:08', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('184', 'guarantorTypeCd', '担保类型', '3', '单人保证', '2014-05-03 15:56:46', '2014-05-13 00:05:08', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('185', 'guarantorTypeCd', '担保类型', '4', '多人分包', '2014-05-03 15:56:59', '2014-05-13 00:05:08', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('186', 'guarantorTypeCd', '担保类型', '5', '多人联保', '2014-05-03 15:57:20', '2014-05-13 00:05:08', '1', '', '5.000');
INSERT INTO `sys_code_dict` VALUES ('187', 'collateralTypeCd', '担保品类型', 'A1', '金融质押品', '2014-05-03 16:09:29', '2014-05-13 00:05:08', '1', '', '1.000');
INSERT INTO `sys_code_dict` VALUES ('188', 'collateralTypeCd', '担保品类型', 'B1', '应收账款', '2014-05-03 16:09:55', '2014-05-13 00:05:08', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('189', 'collateralTypeCd', '担保品类型', 'C1', '商品房', '2014-05-03 16:10:05', '2014-05-13 00:05:08', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('190', 'collateralTypeCd', '担保品类型', 'C2', '限价房、廉价房、经济适用房、保障房', '2014-05-03 16:10:17', '2014-05-13 00:05:08', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('191', 'collateralTypeCd', '担保品类型', 'C3', '车库/车位', '2014-05-03 16:10:34', '2014-05-13 00:05:08', '1', '', '5.000');
INSERT INTO `sys_code_dict` VALUES ('192', 'collateralTypeCd', '担保品类型', 'C4', '商铺', '2014-05-03 16:10:48', '2014-05-13 00:05:08', '1', '', '6.000');
INSERT INTO `sys_code_dict` VALUES ('193', 'collateralTypeCd', '担保品类型', 'C5', '写字楼', '2014-05-03 16:11:05', '2014-05-13 00:05:08', '1', '', '7.000');
INSERT INTO `sys_code_dict` VALUES ('194', 'collateralTypeCd', '担保品类型', 'C6', '土地', '2014-05-03 16:11:24', '2014-05-13 00:05:08', '1', '', '8.000');
INSERT INTO `sys_code_dict` VALUES ('195', 'collateralTypeCd', '担保品类型', 'C7', '厂房', '2014-05-03 16:11:43', '2014-05-13 00:05:08', '1', '', '9.000');
INSERT INTO `sys_code_dict` VALUES ('196', 'collateralTypeCd', '担保品类型', 'Z9', '其他', '2014-05-03 16:12:33', '2014-05-13 00:05:08', '1', '', '9.000');
INSERT INTO `sys_code_dict` VALUES ('197', 'crStatusCd', '债权状态', '3', '逾期中', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('198', 'crStatusCd', '债权状态', '1', '投标中', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('199', 'crStatusCd', '债权状态', '2', '还款中', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('200', 'repayTypeCd1', '债券还款方式', '0', '等额本息', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('201', 'repayTypeCd1', '债券还款方式', '1', '等额本金', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('202', 'repayTypeCd1', '债券还款方式', '2', '利随本清', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('203', 'repayTypeCd1', '债券还款方式', '3', '按固定周期付息,到期还款', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('204', 'crStatusCd', '债权状态', '4', '结清', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('205', 'crStatusCd', '债权状态', '5', '撤标', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('206', 'crtStatusCd', '债权转让发布状态', '0', '申请审批中', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('207', 'crtStatusCd', '债权转让发布状态', '1', '审批不通过', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('208', 'crtStatusCd', '债权转让发布状态', '2', '(审批通过)债权转让投标中', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('209', 'crtStatusCd', '债权转让发布状态', '3', '已满标', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('210', 'crtStatusCd', '债权转让发布状态', '4', '撤标', null, '2014-05-13 00:05:08', '1', null, null);
INSERT INTO `sys_code_dict` VALUES ('211', 'repayStatusCd', '还款状态', '0', '未还', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('212', 'repayStatusCd', '还款状态', '1', '已还', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('213', 'repayStatusCd', '还款状态', '2', '平台垫付', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('214', 'repayStatusCd', '还款状态', '3', '呆账', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('216', 'incomeTypeCd', '收益关联类型', '0', '债权', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('217', 'incomeTypeCd', '收益关联类型', '1', '理财', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('218', 'repayWayCd', '还款结清方式', '0', '初始化状态', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('219', 'repayWayCd', '还款结清方式', '1', '正常还款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('220', 'repayWayCd', '还款结清方式', '2', '提前还款', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('221', 'repayWayCd', '还款结清方式', '3', '平台垫付', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('222', 'tradeTypeCd', '交易类型', '0', '充值', null, '2014-05-13 00:05:08', null, null, '0.000');
INSERT INTO `sys_code_dict` VALUES ('223', 'tradeTypeCd', '交易类型', '1', '提现', null, '2014-05-13 00:05:08', null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('224', 'tradeTypeCd', '交易类型', '2', '投资', null, '2014-05-13 00:05:08', null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('225', 'tradeTypeCd', '交易类型', '3', '借款', null, '2014-05-13 00:05:08', null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('226', 'tradeTypeCd', '交易类型', '4', '正常还款', null, '2014-05-13 00:05:08', null, null, '4.000');
INSERT INTO `sys_code_dict` VALUES ('227', 'tradeTypeCd', '交易类型', '5', '提前还款', null, '2014-05-13 00:05:08', null, null, '5.000');
INSERT INTO `sys_code_dict` VALUES ('228', 'tradeTypeCd', '交易类型', '6', '展期还款', null, '2014-05-13 00:05:08', null, null, '6.000');
INSERT INTO `sys_code_dict` VALUES ('229', 'tradeTypeCd', '交易类型', '7', '逾期还款', null, '2014-05-13 00:05:08', null, null, '7.000');
INSERT INTO `sys_code_dict` VALUES ('230', 'tradeTypeCd', '交易类型', '8', '平台垫付', null, '2014-05-13 00:05:08', null, null, '8.000');
INSERT INTO `sys_code_dict` VALUES ('231', 'tradeTypeCd', '交易类型', '9', '提现管理费', null, '2014-05-13 00:05:08', null, null, '9.000');
INSERT INTO `sys_code_dict` VALUES ('232', 'tradeTypeCd', '交易类型', '10', '充值管理费', null, '2014-05-13 00:05:08', null, null, '10.000');
INSERT INTO `sys_code_dict` VALUES ('233', 'tradeTypeCd', '交易类型', '11', '退回投资', null, '2014-05-13 00:05:08', null, null, '11.000');
INSERT INTO `sys_code_dict` VALUES ('234', 'tradeTypeCd', '交易类型', '12', '归还风险准备金', null, '2014-05-13 00:05:08', null, null, '12.000');
INSERT INTO `sys_code_dict` VALUES ('235', 'tradeTypeCd', '交易类型', '13', '提取风险准备金', null, '2014-05-13 00:05:08', null, null, '13.000');
INSERT INTO `sys_code_dict` VALUES ('236', 'tradeTypeCd', '交易类型', '14', '债权转让管理费', null, '2014-05-13 00:05:08', null, null, '14.000');
INSERT INTO `sys_code_dict` VALUES ('237', 'tradeTypeCd', '交易类型', '15', '接手奖金', null, '2014-05-13 00:05:08', null, null, '15.000');
INSERT INTO `sys_code_dict` VALUES ('238', 'tradeTypeCd', '交易类型', '16', '债权转让', null, '2014-05-13 00:05:08', null, null, '16.000');
INSERT INTO `sys_code_dict` VALUES ('239', 'tradeTypeCd', '交易类型', '17', '资金回收', null, '2014-05-13 00:05:08', null, null, '17.000');
INSERT INTO `sys_code_dict` VALUES ('240', 'tradeTypeCd', '交易类型', '18', '利息收益', null, '2014-05-13 00:05:08', null, null, '18.000');
INSERT INTO `sys_code_dict` VALUES ('241', 'tradeTypeCd', '交易类型', '19', '平台收益抽成', null, '2014-05-13 00:05:08', null, null, '19.000');
INSERT INTO `sys_code_dict` VALUES ('242', 'tradeTypeCd', '交易类型', '20', '展期管理费', null, '2014-05-13 00:05:08', null, null, '20.000');
INSERT INTO `sys_code_dict` VALUES ('243', 'tradeTypeCd', '交易类型', '21', '逾期管理费', null, '2014-05-13 00:05:08', null, null, '21.000');
INSERT INTO `sys_code_dict` VALUES ('244', 'tradeTypeCd', '交易类型', '22', '借款管理费', null, '2014-05-13 00:05:08', null, null, '22.000');
INSERT INTO `sys_code_dict` VALUES ('245', 'tradeTypeCd', '交易类型', '23', '提前还款违约金', null, '2014-05-13 00:05:08', null, null, '23.000');
INSERT INTO `sys_code_dict` VALUES ('246', 'loginTypeCd', '系统登陆方式', '0', '网页', '2014-05-11 23:52:16', '2014-05-13 00:05:08', '1', '121', '1.000');
INSERT INTO `sys_code_dict` VALUES ('247', 'loginTypeCd', '系统登陆方式', '1', 'Android', '2014-05-11 23:52:34', '2014-05-13 00:05:08', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('248', 'loginTypeCd', '系统登陆方式', '2', 'IOS', '2014-05-11 23:52:45', '2014-05-13 00:05:08', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('249', 'loginTypeCd', '系统登陆方式', '3', '微信', '2014-05-11 23:52:53', '2014-05-13 00:05:08', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('250', 'payoutTypeCd', '充值方式', '1', '银行充值', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('251', 'payoutTypeCd', '充值方式', '2', '充值卡充值', null, '2014-05-13 00:05:08', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('260', 'msgTmpTypeCd', '短信模板类型', '1', '短信', '2014-05-14 20:36:14', '2014-05-16 19:44:02', '1', '短信模板类型：短信', '1.000');
INSERT INTO `sys_code_dict` VALUES ('261', 'msgTmpTypeCd', '短信模板类型', '2', '邮件', '2014-05-14 20:37:16', '2014-05-16 19:44:19', '1', '短信模板类型：邮件', '2.000');
INSERT INTO `sys_code_dict` VALUES ('262', 'msgTmpTypeCd', '短信模板类型', '3', '系统消息', '2014-05-14 20:37:47', '2014-05-17 21:02:12', '1', '短信模板类型：系统消息', '3.000');
INSERT INTO `sys_code_dict` VALUES ('263', 'baseConfMsg', '基本信息通知设置', 'A1', '注册', '2014-05-17 21:31:48', '2014-05-17 21:47:38', '1', '', '1.000');
INSERT INTO `sys_code_dict` VALUES ('264', 'baseConfMsg', '基本信息通知设置', 'A2', '登陆提醒短信', '2014-05-17 21:35:19', '2014-05-17 21:47:26', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('265', 'baseConfMsg', '基本信息通知设置', 'A3', '修改密码', '2014-05-17 21:35:57', '2014-05-17 21:47:15', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('266', 'baseConfMsg', '基本信息通知设置', 'A4', '修改提现密码', '2014-05-17 21:36:06', '2014-05-17 21:47:06', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('267', 'baseConfMsg', '基本信息通知设置', 'A5', '重置安全问题', '2014-05-17 21:36:59', '2014-05-17 21:46:56', '1', '', '5.000');
INSERT INTO `sys_code_dict` VALUES ('268', 'baseConfMsg', '基本信息通知设置', 'A6', '修改手机号', '2014-05-17 21:37:32', '2014-05-17 21:46:47', '1', '', '6.000');
INSERT INTO `sys_code_dict` VALUES ('269', 'baseConfMsg', '基本信息通知设置', 'A7', '修改邮箱地址', '2014-05-17 21:37:46', '2014-05-17 21:46:38', '1', '', '7.000');
INSERT INTO `sys_code_dict` VALUES ('270', 'baseConfMsg', '基本信息通知设置', 'A8', '修改银行帐号', '2014-05-17 21:38:10', '2014-05-17 21:46:29', '1', '', '8.000');
INSERT INTO `sys_code_dict` VALUES ('271', 'baseConfMsg', '基本信息通知设置', 'A9', '升级会员', '2014-05-17 21:38:28', '2014-05-17 21:46:21', '1', '', '9.000');
INSERT INTO `sys_code_dict` VALUES ('272', 'baseConfMsg', '基本信息通知设置', 'A10', '会员延期', '2014-05-17 21:38:46', '2014-05-17 21:46:11', '1', '', '10.000');
INSERT INTO `sys_code_dict` VALUES ('273', 'baseConfMsg', '基本信息通知设置', 'A11', '线上充值完成', '2014-05-17 21:38:58', '2014-05-18 14:20:08', '1', '', '11.000');
INSERT INTO `sys_code_dict` VALUES ('274', 'baseConfMsg', '基本信息通知设置', 'A12', '资金提现', '2014-05-17 21:39:10', '2014-05-18 14:20:23', '1', '', '12.000');
INSERT INTO `sys_code_dict` VALUES ('275', 'baseConfMsg', '基本信息通知设置', 'A13', '收到奖金', '2014-05-17 21:39:21', '2014-05-17 21:45:37', '1', '', '13.000');
INSERT INTO `sys_code_dict` VALUES ('276', 'baseConfMsg', '基本信息通知设置', 'A14', '月度对账单', '2014-05-17 21:39:33', '2014-05-17 21:45:27', '1', '', '14.000');
INSERT INTO `sys_code_dict` VALUES ('277', 'loanConfMsg', '借款通知设置', 'B1', '借款标发标成功', '2014-05-17 21:42:12', '2014-05-17 21:42:12', '1', '', '1.000');
INSERT INTO `sys_code_dict` VALUES ('278', 'loanConfMsg', '借款通知设置', 'B2', '借款标满标', '2014-05-17 21:42:27', '2014-05-17 21:42:27', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('279', 'loanConfMsg', '借款通知设置', 'B3', '借款人还款提醒', '2014-05-17 21:44:15', '2014-05-17 21:44:15', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('280', 'loanConfMsg', '借款通知设置', 'B4', '借款人还款成功', '2014-05-17 21:44:36', '2014-05-17 21:44:36', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('281', 'loanConfMsg', '借款通知设置', 'B5', '借款人逾期提醒', '2014-05-17 21:44:50', '2014-05-17 21:44:50', '1', '', '5.000');
INSERT INTO `sys_code_dict` VALUES ('282', 'invConfMsg', '投资通知设置', 'C1', '自动投标设置', '2014-05-17 21:50:23', '2014-05-17 21:50:23', '1', '', '1.000');
INSERT INTO `sys_code_dict` VALUES ('283', 'invConfMsg', '投资通知设置', 'C2', '自动投标借出完成', '2014-05-17 21:50:38', '2014-05-17 21:50:38', '1', '', '2.000');
INSERT INTO `sys_code_dict` VALUES ('284', 'invConfMsg', '投资通知设置', 'C3', '借出成功', '2014-05-17 21:50:50', '2014-05-17 21:50:50', '1', '', '3.000');
INSERT INTO `sys_code_dict` VALUES ('285', 'invConfMsg', '投资通知设置', 'C4', '收到还款', '2014-05-17 21:51:03', '2014-05-17 21:51:03', '1', '', '4.000');
INSERT INTO `sys_code_dict` VALUES ('286', 'invConfMsg', '投资通知设置', 'C5', '借款逾期', '2014-05-17 21:51:14', '2014-05-17 21:51:14', '1', '', '5.000');
INSERT INTO `sys_code_dict` VALUES ('287', 'invConfMsg', '投资通知设置', 'C6', '平台代为偿还', '2014-05-17 21:51:28', '2014-05-17 21:51:28', '1', '', '6.000');
INSERT INTO `sys_code_dict` VALUES ('288', 'invConfMsg', '投资通知设置', 'C7', '债权投资成功', '2014-05-17 21:51:40', '2014-05-17 21:51:40', '1', '', '7.000');
INSERT INTO `sys_code_dict` VALUES ('289', 'paymentWayCd', '支付方式', '0', '自主支付', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('290', 'paymentWayCd', '支付方式', '1', '受托支付', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('291', 'rechargeSearchStatusCd', '充值方式搜索条件', '0', '生效', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('292', 'rechargeSearchStatusCd', '充值方式搜索条件', '1', '使用中', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('293', 'rechargeSearchStatusCd', '充值方式搜索条件', '3', '作废', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('294', 'FOLWNAME', '任务名称', 'limits_loan_apply', '二合一申请', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('295', 'postLoanStatusCd', '贷后状态', '1', '新建', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('296', 'postLoanStatusCd', '贷后状态', '2', '逾期', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('297', 'postLoanStatusCd', '贷后状态', '3', '贷后完成申请中', null, null, null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('298', 'postLoanStatusCd', '贷后状态', '4', '完成', null, null, null, null, '4.000');
INSERT INTO `sys_code_dict` VALUES ('299', 'postLoanGenerateType', '贷后产生方式', '1', '手动', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('300', 'postLoanGenerateType', '贷后产生方式', '2', '自动', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('301', 'checkMode', '检查方式', '1', '电话联系', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('302', 'checkMode', '检查方式', '2', '实地考察', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('303', 'checkTarget', '检查对象', '1', '借款人', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('304', 'checkTarget', '检查对象', '2', '抵质押品', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('305', 'checkTarget', '检查对象', '3', '配偶', null, null, null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('306', 'checkTarget', '检查对象', '4', '其他关联人', null, null, null, null, '4.000');
INSERT INTO `sys_code_dict` VALUES ('307', 'checkResult', '检查结论', '1', '该客户还处于正常状态', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('308', 'checkResult', '检查结论', '2', '该客户存在轻微问题', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('309', 'checkResult', '检查结论', '3', '该客户存在严重问题', null, null, null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('310', 'withdrawalsStatusCd', '提现申请状态', '0', '审批中', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('311', 'withdrawalsStatusCd', '提现申请状态', '1', '审批通过', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('312', 'withdrawalsStatusCd', '提现申请状态', '2', '审批失败', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('313', 'withdrawalsStatusCd', '提现申请状态', '3', '已导出', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('314', 'rechargeStatusCd', '充值卡状态', '4', '已导出', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('315', 'creditRate', '信用等级', 'AAA', 'AAA', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('316', 'creditRate', '信用等级', 'AA', 'AA', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('317', 'creditRate', '信用等级', 'A', 'A', null, null, null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('318', 'creditRate', '信用等级', 'BBB', 'BBB', null, null, null, null, '4.000');
INSERT INTO `sys_code_dict` VALUES ('319', 'creditRate', '信用等级', 'BB', 'BB', null, null, null, null, '5.000');
INSERT INTO `sys_code_dict` VALUES ('320', 'creditRate', '信用等级', 'B', 'B', null, null, null, null, '6.000');
INSERT INTO `sys_code_dict` VALUES ('321', 'creditRate', '信用等级', 'CCC', 'CCC', null, null, null, null, '7.000');
INSERT INTO `sys_code_dict` VALUES ('322', 'creditRate', '信用等级', 'CC', 'CC', null, null, null, null, '8.000');
INSERT INTO `sys_code_dict` VALUES ('323', 'creditRate', '信用等级', 'C', 'C', null, null, null, null, '9.000');
INSERT INTO `sys_code_dict` VALUES ('324', 'creditRate', '信用等级', 'D', 'D', null, null, null, null, '10.000');
INSERT INTO `sys_code_dict` VALUES ('325', 'FOLWNAME', '任务名称', 'pre_loan_apply', '前台借款申请', null, '2014-05-31 15:01:40', null, null, null);
INSERT INTO `sys_code_dict` VALUES ('326', 'authItemCd', '认证项目', '0', '身份证', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('327', 'authItemCd', '认证项目', '15', '户口本', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('328', 'authItemCd', '认证项目', '8', '学历证明', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('329', 'authItemCd', '认证项目', '4', '收入证明', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('330', 'authItemCd', '认证项目', '16', '社保缴费账单', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('331', 'authItemCd', '认证项目', '17', '银行信用报告', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('332', 'authItemCd', '认证项目', '18', '个人所得税', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('333', 'authItemCd', '认证项目', '19', '购房合同', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('334', 'authItemCd', '认证项目', '20', '汽车行驶证', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('335', 'authItemCd', '认证项目', '21', '房屋产权证', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('336', 'authItemCd', '认证项目', '22', '车位产权证', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('337', 'authStatusCd', '认证项目状态', '1', '未认证', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('338', 'authStatusCd', '认证项目状态', '2', '认证', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('339', 'tenderWay', '投标方式', '0', '自动投标', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('340', 'tenderWay', '投标方式', '1', '手动投标', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('341', 'processStatusCd', '处理状态', '0', '未处理', null, '2014-05-31 22:03:46', null, null, '0.000');
INSERT INTO `sys_code_dict` VALUES ('342', 'processStatusCd', '处理状态', '1', '已处理', null, '2014-05-31 22:04:19', null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('343', 'DATE_UNIT_CD', '年月日', '2', '年', null, null, null, null, '1.000');
INSERT INTO `sys_code_dict` VALUES ('344', 'DATE_UNIT_CD', '年月日', '1', '月', null, null, null, null, '2.000');
INSERT INTO `sys_code_dict` VALUES ('345', 'DATE_UNIT_CD', '年月日', '0', '天', null, null, null, null, '3.000');
INSERT INTO `sys_code_dict` VALUES ('346', 'jobStatusCd', '职业身份', '1', '企业家', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('347', 'companyIndustryCd', '行业性质', '0', '制造业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('348', 'companyIndustryCd', '行业性质', '1', 'IT', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('349', 'companyIndustryCd', '行业性质', '2', '政府机关', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('350', 'companyIndustryCd', '行业性质', '3', '媒体/广告', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('351', 'companyIndustryCd', '行业性质', '4', '零售/批发', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('352', 'companyIndustryCd', '行业性质', '5', '教育/培训', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('353', 'companyIndustryCd', '行业性质', '6', '公共事业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('354', 'companyIndustryCd', '行业性质', '7', '交通运输业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('355', 'companyIndustryCd', '行业性质', '8', '房地产业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('356', 'companyIndustryCd', '行业性质', '9', '能源业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('357', 'companyIndustryCd', '行业性质', '10', '金融/法律', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('358', 'companyIndustryCd', '行业性质', '11', '餐饮/旅馆业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('359', 'companyIndustryCd', '行业性质', '12', '医疗/卫生', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('360', 'companyIndustryCd', '行业性质', '13', '保健建筑工程', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('361', 'companyIndustryCd', '行业性质', '14', '农业娱乐服务业', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('362', 'companyIndustryCd', '行业性质', '15', '体育/艺术', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('363', 'companyIndustryCd', '行业性质', '16', '公益组织', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('364', 'FOLWNAME', '任务名称', 'pre_limits_loan_apply', '前台借款申请', null, null, null, null, null);
INSERT INTO `sys_code_dict` VALUES ('365', 'tradeTypeCd', '交易类型', '24', '借款申请', null, '2014-06-08 11:13:06', null, null, '24.000');
INSERT INTO `sys_code_dict` VALUES ('366', 'tradeTypeCd', '交易类型', '25', '投资满标', null, '2014-06-08 11:55:04', null, null, '25.000');
INSERT INTO `sys_code_dict` VALUES ('367', 'approveStatusCd', '借款发布状态', '3', '放款成功', '2014-06-08 18:39:35', '2014-06-08 18:39:35', '1', '', '4.000');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `DEPT_ID` bigint(22) NOT NULL AUTO_INCREMENT,
  `DEPT_CODE` varchar(32) DEFAULT NULL,
  `DEPT_NAME` varchar(32) DEFAULT NULL,
  `PARENT_DEPT_ID` bigint(22) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `LEVEL_NUM` bigint(22) DEFAULT NULL,
  `ORDER_NUM` bigint(22) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPT_ID`),
  UNIQUE KEY `PRIMARYSYS_DEPT1` (`DEPT_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=10016 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '000000', '公司总部', null, '1', '1', '1', null, '2014-05-11 17:51:05', 'admin', null);
INSERT INTO `sys_dept` VALUES ('10001', '010000', '胖毛在线思明区营业厅', '0', '1', '1', '2', null, '2014-05-03 14:54:20', 'admin', null);
INSERT INTO `sys_dept` VALUES ('10015', '020000', '下属分支机构', '10001', '1', '1', '2', '2014-05-03 20:16:12', '2014-05-14 00:55:39', 'admin', '');

-- ----------------------------
-- Table structure for `sys_function`
-- ----------------------------
DROP TABLE IF EXISTS `sys_function`;
CREATE TABLE `sys_function` (
  `FUN_ID` bigint(22) NOT NULL AUTO_INCREMENT,
  `FUN_ICON` varchar(255) DEFAULT NULL,
  `FUN_LEVEL` varchar(255) DEFAULT NULL,
  `FUN_NAME` varchar(32) DEFAULT NULL,
  `FUN_STATUS` varchar(1) DEFAULT NULL,
  `FUN_TYPE` varchar(2) DEFAULT NULL,
  `PARENT_FUN_ID` bigint(22) DEFAULT NULL,
  `SORT` bigint(22) DEFAULT NULL,
  `FUN_PATH` varchar(300) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `FUN_CODE` varchar(20) DEFAULT NULL,
  `IS_LAST` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`FUN_ID`),
  UNIQUE KEY `PRIMARYSYS_FUNCTION1` (`FUN_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=1000405 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_function
-- ----------------------------
INSERT INTO `sys_function` VALUES ('1000', null, '1', '我的胖毛', '1', '1', null, '11', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('1001', null, '2', '我的首页', '1', '2', '1000', '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('1002', null, '2', '安全信息', '1', '2', '1000', '2', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('1003', null, '2', '好友管理', '1', '2', '1000', '3', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('1004', null, '2', '会员服务', '1', '2', '1000', '4', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('2000', null, '1', '资金管理', '1', '1', null, '12', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('2001', null, '2', '我要充值', '1', '2', '2000', '1', '/pages/web/addRecharge.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('2002', null, '2', '我要提现', '1', '2', '2000', '2', '/pages/web/submitWithdrawals.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('2003', null, '2', '交易流水', '1', '2', '2000', '3', '/pages/web/paymentManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('2004', null, '2', '我的银行卡', '1', '2', '2000', '4', '/pages/web/bankCardManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('3000', null, '1', '理财管理', '1', '1', null, '13', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('3001', null, '2', '我的投资', '1', '2', '3000', '1', '/pages/web/creditorManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('3002', null, '2', '债权转让列表', '1', '2', '3000', '2', '/pages/web/myCreditorTranList.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('3003', null, '2', '自动投标', '1', '2', '3000', '3', '/pages/web/autoTender.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('4000', null, '1', '借款管理', '1', '1', null, '14', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('4001', null, '2', '我的借款', '1', '2', '4000', '1', '/pages/web/myLoanList.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('4002', null, '2', '还款管理', '1', '2', '4000', '2', '/pages/web/myRepayList.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('4003', null, '2', '我的授信', '1', '2', '4000', '3', '/pages/app/limit/creditLimitApplyInfo.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('5000', null, '1', '消息管理', '1', '1', null, '15', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('5001', null, '2', '通知设置', '1', '2', '5000', '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('5002', null, '2', '消息管理', '1', '2', '5000', '2', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('6000', null, '1', '推荐管理', '1', '1', null, '16', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('6001', null, '2', '我的推荐', '1', '2', '6000', '1', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('6002', null, '2', '我的经纪人', '1', '2', '6000', '2', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('6003', null, '2', '我的收益', '1', '2', '6000', '3', null, null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('7000', null, '1', '虚拟目录', '1', '1', null, '17', '', null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('7001', null, '2', '投资列表', '1', '2', '7000', '1', '/pages/web/loanList.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('7002', null, '2', '债权转让发布列表', '1', '2', '7000', '2', '/pages/web/creditorTranManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('100000', null, '1', '系统管理', '1', '1', null, '1', null, null, null, null, null, 'PRVLGMANAGE', '0');
INSERT INTO `sys_function` VALUES ('100100', null, '2', '用户管理', '1', '2', '100000', '1', '/pages/permissions/userManage.jsf', null, null, null, null, 'USERMANAGE', '1');
INSERT INTO `sys_function` VALUES ('100200', null, '2', '角色管理', '1', '2', '100000', '2', '/pages/permissions/roleManage.jsf', null, null, null, null, 'ROLEMANAGE', '1');
INSERT INTO `sys_function` VALUES ('100300', null, '2', '权限管理', '0', '2', '100000', '3', '/pages/permissions/funManage.jsf', null, null, null, null, 'FUNMANAGE', '1');
INSERT INTO `sys_function` VALUES ('100400', null, '2', '部门管理', '1', '2', '100000', '4', '/pages/permissions/deptManage.jsf', null, null, null, null, 'DEPTMANAGE', '1');
INSERT INTO `sys_function` VALUES ('100500', null, '2', '参数管理', '1', '2', '100000', '5', '/pages/common/parameterManage.jsf', null, null, null, null, 'PMPARAMMANAGE', '1');
INSERT INTO `sys_function` VALUES ('100600', null, '2', '授权管理', '0', '2', '100000', '6', '/pages/common/grantUser.jsf', null, null, null, null, 'PMALTERMANAGER', '1');
INSERT INTO `sys_function` VALUES ('100700', null, '2', '产品管理', '1', '2', '100000', '7', '/pages/app/product/productInfoManage.jsf', null, null, null, null, 'PROAPPLY', '1');
INSERT INTO `sys_function` VALUES ('100800', null, '2', '字典管理', '1', '2', '100000', '8', '/pages/common/codeDictManage.jsf', null, null, null, null, 'CODEDICTMANAGE', '1');
INSERT INTO `sys_function` VALUES ('200000', null, '1', '批任务管理', '1', '1', null, '2', null, null, null, null, null, 'BATCHMANAGE', '0');
INSERT INTO `sys_function` VALUES ('200100', null, '2', '批任务查看', '1', '2', '200000', '1', '/pages/batch/batchJobMain.jsf', null, null, null, null, 'BATCHMAIN', '1');
INSERT INTO `sys_function` VALUES ('200200', null, '2', '任务实例查看', '1', '2', '200000', '2', '/pages/batch/batchJobInstanceMain.jsf', null, null, null, null, 'BATCHJOBINSTANCE', '1');
INSERT INTO `sys_function` VALUES ('300000', null, '1', '流程管理', '1', '1', null, '3', null, null, null, null, null, null, '0');
INSERT INTO `sys_function` VALUES ('300100', null, '2', '流程发布', '1', '2', '300000', '1', '/pages/jbpm/flowMain.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('300200', null, '3', '流程发布', '1', '3', '300100', '2', '/pages/jbpm/flowAdd.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('400000', null, '1', '我的工作台', '1', '1', null, '4', null, null, null, null, null, 'MYWORKTAB', '0');
INSERT INTO `sys_function` VALUES ('400100', null, '2', '待办事项', '1', '2', '400000', '1', '/pages/jbpm/myTasks.jsf', null, null, null, null, 'TODOWORK', '1');
INSERT INTO `sys_function` VALUES ('400200', null, '2', '额度申请', '0', '2', '400000', '2', '/pages/app/limit/creditLimitApply.jsf', null, null, null, null, 'CLAPPLY', '1');
INSERT INTO `sys_function` VALUES ('400300', null, '2', '借款申请', '0', '2', '400000', '3', '/pages/app/loan/borrower/borrower.jsf', null, null, null, null, 'BRWAPPLY', '1');
INSERT INTO `sys_function` VALUES ('400400', null, '2', '理财产品管理', '0', '2', '500000', '4', '/pages/app/limit/creditLimitApplyAppro.jsf', null, null, null, null, 'FINPROAPPLY', '1');
INSERT INTO `sys_function` VALUES ('400500', null, '2', '贷后任务', '0', '2', '400000', '5', null, null, null, null, null, 'AFTERLOAN', '1');
INSERT INTO `sys_function` VALUES ('400600', null, '2', '提现申请', '0', '2', '500000', '6', '/pages/app/payout/submitWithdrawals.jsf', null, null, null, null, 'GETCASH', '1');
INSERT INTO `sys_function` VALUES ('400700', null, '2', '团队长/经纪人申请', '0', '2', '500000', '7', null, null, null, null, null, 'LEADERAPPLY', '1');
INSERT INTO `sys_function` VALUES ('400800', null, '2', '已办事项', '1', '2', '400000', '8', '/pages/jbpm/myHistoryTasks.jsf', null, null, null, null, 'DONEWORK', '1');
INSERT INTO `sys_function` VALUES ('500000', null, '1', '日常管理', '1', '1', null, '5', null, null, null, null, null, 'DAILYMANAGE', '0');
INSERT INTO `sys_function` VALUES ('500100', null, '2', '客户管理', '1', '2', '500000', '1', '/pages/app/custInfo/custInfoManage.jsf', null, null, null, null, 'CUSTMANAGE', '1');
INSERT INTO `sys_function` VALUES ('500200', null, '2', '已发布借款', '1', '2', '500000', '2', '/pages/app/loan/loanManage.jsf', null, null, null, null, 'BRWMANAGE', '1');
INSERT INTO `sys_function` VALUES ('500300', null, '2', '债权管理', '1', '2', '500000', '3', '/pages/app/creditor/creditorManage.jsf', null, null, null, null, 'RIGHTTRANSFER', '1');
INSERT INTO `sys_function` VALUES ('500400', '', '2', '充值卡管理', '1', '2', '500000', '4', '/pages/app/payout/card/rechargeCardManage.jsf', null, null, null, null, null, null);
INSERT INTO `sys_function` VALUES ('500500', null, '2', '借款申请列表', '1', '2', '500000', '2', '/pages/app/loan/loanApplyManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('500600', null, '2', '债权转让列表', '1', '2', '500000', '4', '/pages/app/creditor/creditorTranManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('500700', null, '2', '提现列表', '1', '2', '500000', '7', '/pages/app/payout/withdrawals/withdrawalsManage.jsf', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('500800', null, '2', '借款意向列表', '1', '2', '500000', '9', '/pages/app/loan/loanIntentionManage.jsf', null, null, null, null, null, null);
INSERT INTO `sys_function` VALUES ('600000', null, '1', '日常查询', '1', '1', null, '6', null, null, null, null, null, 'DAILYCHECK', '0');
INSERT INTO `sys_function` VALUES ('600100', null, '2', '充值查询', '1', '2', '600000', '1', '/pages/app/payout/recharge.jsf', null, null, null, null, 'CHARGECHK', '1');
INSERT INTO `sys_function` VALUES ('600200', null, '2', '提现查询', '1', '2', '600000', '2', '/pages/app/payout/withdrawals.jsf', null, null, null, null, 'GETCASHCHK', '1');
INSERT INTO `sys_function` VALUES ('600300', null, '2', 'PM币查询', '1', '2', '600000', '3', '/pages/app/dailyInfo/pmManage.jsf', null, null, null, null, 'PMCHK', '1');
INSERT INTO `sys_function` VALUES ('600400', null, '2', '积分查询', '0', '2', '600000', '4', null, null, null, null, null, 'SCORECHK', '1');
INSERT INTO `sys_function` VALUES ('600500', null, '2', '交易查询', '1', '2', '600000', '5', '/pages/app/dailyInfo/paymentManage.jsf', null, null, null, null, 'TRANSCHK', '1');
INSERT INTO `sys_function` VALUES ('600600', null, '2', '登陆查询', '1', '2', '600000', '6', '/pages/app/dailyInfo/userOnlineManage.jsf', null, null, null, null, 'LOGINCHK', '1');
INSERT INTO `sys_function` VALUES ('600700', null, '2', '收益查询', '1', '2', '600000', '7', '/pages/app/income/incomeManage.jsf', null, null, null, null, 'GETCASHCHK', '1');
INSERT INTO `sys_function` VALUES ('700000', null, '1', '贷后管理', '1', '1', null, '7', null, null, null, null, null, 'AFTERLOAN', '0');
INSERT INTO `sys_function` VALUES ('700100', null, '2', '逾期贷款', '1', '2', '700000', '1', '/pages/app/postLoan/overDueManage.jsf?loanStatusCd=3', null, null, null, null, 'DUELOAN', '1');
INSERT INTO `sys_function` VALUES ('700200', null, '2', '平台垫付', '1', '2', '700000', '2', '/pages/app/postLoan/platformPayManage.jsf?loanStatusCd=4', null, null, null, null, 'FLATPAY', '1');
INSERT INTO `sys_function` VALUES ('700300', null, '2', '30天应还', '1', '2', '700000', '3', '/pages/app/postLoan/pay30Manage.jsf?loanStatusCd=-1', null, null, null, null, 'THYPAYBAK', '1');
INSERT INTO `sys_function` VALUES ('700400', null, '2', '贷后任务', '1', '2', '700000', '4', '/pages/app/postLoan/postLoanTaskManage.jsf', null, null, null, null, 'AFTERLOANJOB', '1');
INSERT INTO `sys_function` VALUES ('700500', null, '2', '逾期贷后任务', '1', '2', '700000', '5', '/pages/app/postLoan/postLoanTaskManage.jsf?loanStatusCd=2', null, null, null, null, 'DUEAFTERLOANJOB', '1');
INSERT INTO `sys_function` VALUES ('700600', null, '2', '已还贷款', '1', '2', '700000', '6', '/pages/app/postLoan/replayEndManage.jsf?loanStatusCd=1', null, null, null, null, null, '1');
INSERT INTO `sys_function` VALUES ('800000', null, '1', '经纪人管理', '1', '1', null, '8', null, null, null, null, null, 'BIZNAMAGE', '0');
INSERT INTO `sys_function` VALUES ('800100', null, '2', '团队长管理', '1', '2', '800000', '1', '/pages/app/agent/agentManage.jsf', null, null, null, null, 'LEADERMANAGER', '1');
INSERT INTO `sys_function` VALUES ('800200', null, '2', '经纪人管理', '1', '2', '800000', '2', null, null, null, null, null, 'AGENTMANAGER', '1');
INSERT INTO `sys_function` VALUES ('800300', null, '2', '团队长收益查询', '1', '2', '800000', '3', '/pages/app/agent/agentIncome.jsf?role=leader', null, null, null, null, 'LEADERPAYCHK', '1');
INSERT INTO `sys_function` VALUES ('800400', null, '2', '经纪人收益查询', '1', '2', '800000', '4', '/pages/app/agent/agentIncome.jsf?role=agent', null, null, null, null, 'AGENTPAYCHK', '1');
INSERT INTO `sys_function` VALUES ('900000', null, '1', '报表统计', '1', '1', null, '9', null, null, null, null, null, 'REPORT', '0');
INSERT INTO `sys_function` VALUES ('900100', null, '2', '充值统计', '1', '2', '900000', '1', null, null, null, null, null, 'CHARGE', '1');
INSERT INTO `sys_function` VALUES ('900200', null, '2', '提现统计', '1', '2', '900000', '2', null, null, null, null, null, 'GETMONEY', '1');
INSERT INTO `sys_function` VALUES ('900300', null, '2', '新增人员统计', '1', '2', '900000', '3', null, null, null, null, null, 'NEWROLECHK', '1');
INSERT INTO `sys_function` VALUES ('1000000', null, '1', '网站管理', '1', '1', null, '1', null, null, null, null, null, 'PAGEMANAGE', '0');
INSERT INTO `sys_function` VALUES ('1000100', null, '2', '内容管理', '0', '2', '1000000', '1', null, null, null, null, null, 'WEBPUB', '1');
INSERT INTO `sys_function` VALUES ('1000200', null, '2', '论坛管理', '1', '2', '1000000', '2', null, null, null, null, null, 'MSGMANAGE', '1');
INSERT INTO `sys_function` VALUES ('1000300', null, '2', '站内信管理', '1', '2', '1000000', '3', null, null, null, null, null, 'LETTERCHK', '1');
INSERT INTO `sys_function` VALUES ('1000400', null, '2', '短信管理', '1', '2', '1000000', '4', '/pages/common/messageManage.jsf', null, null, null, null, 'SENDMSGCHK', '1');
INSERT INTO `sys_function` VALUES ('1000401', null, '2', '导航管理', '1', '2', '1000000', '5', '/pages/cms/cmsNavigation.jsf', null, null, null, null, 'CMSNAVIGATION', '1');
INSERT INTO `sys_function` VALUES ('1000402', null, '2', '友情链接管理', '1', '2', '1000000', '6', '/pages/cms/cmsFriendlink.jsf', null, null, null, null, 'CMSFRIENDLINK', '1');
INSERT INTO `sys_function` VALUES ('1000403', null, '2', '栏目管理', '1', '2', '1000000', '7', '/pages/cms/cmsCatalog.jsf', null, null, null, null, 'CMSCATALOG', '1');
INSERT INTO `sys_function` VALUES ('1000404', null, '2', '栏目分类', '1', '2', '1000000', '8', '/pages/cms/cmsCatalogType.jsf', null, null, null, null, 'CMSCATALOGTYPE', '1');

-- ----------------------------
-- Table structure for `sys_message_template`
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_template`;
CREATE TABLE `sys_message_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MSG_TMP_NAME` varchar(32) DEFAULT NULL COMMENT '模板名称',
  `MSG_TMP_CODE` varchar(32) DEFAULT NULL COMMENT '模板代码',
  `MSG_TMP_SUBJECT` varchar(500) DEFAULT NULL COMMENT '标题',
  `MSG_TMP_CONTENT` longtext COMMENT '模板内容',
  `MSG_TMP_TYPE_CD` varchar(2) DEFAULT NULL COMMENT '模板类型',
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `SYS_CREATE_TIME` datetime DEFAULT NULL COMMENT '系统创建时间',
  `SYS_UPDATE_USER` int(11) DEFAULT NULL COMMENT '系统更新人员',
  `SYS_UPDATE_TIME` datetime DEFAULT NULL COMMENT '系统更新时间',
  `EVENT_TYPE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_template
-- ----------------------------
INSERT INTO `sys_message_template` VALUES ('11', '注册', 'register', '注册', '胖毛在线感谢您的注册，注册验证码：${imgcode}.', '1', '1', '2014-06-06 00:56:55', '1', '2014-06-06 01:42:25', null);
INSERT INTO `sys_message_template` VALUES ('12', '充值提醒', 'sms_recharge', '【胖毛在线】充值提醒', '您在${date}为账号${accno}充值${amt}元已到账，详咨XXXXXXXXXXXX', '1', '1', '2014-06-06 00:58:17', '1', '2014-06-07 01:27:21', '0');
INSERT INTO `sys_message_template` VALUES ('13', '提现', 'withdrawals', '提现', '您在${date}从账号${accno}提现${amt}元，详咨XXXXXXXXXXXX', '1', '1', '2014-06-06 00:59:33', '1', '2014-06-07 00:17:52', '1');
INSERT INTO `sys_message_template` VALUES ('14', '还款提醒', 'repayment', '还款提醒', '胖毛账号${accno}在${date}有一笔${amt}元还款，请在${date}前还款，避免产生息费，详咨XXXXXXXXXXXX', '1', '1', '2014-06-06 01:01:01', '1', '2014-06-06 01:43:16', null);
INSERT INTO `sys_message_template` VALUES ('15', '还款成功', 'repaymentSucc', '【胖毛在线】还款成功提醒', '胖毛账号${accno}于${date}成功还款${amt}元，详咨XXXXXXXXXXXX', '1', '1', '2014-06-06 01:02:35', '1', '2014-06-07 00:19:21', '4');
INSERT INTO `sys_message_template` VALUES ('16', '逾期提醒', 'overdue', '逾期提醒', '胖毛账号${accno}有一笔${amt}元还款，还款日：${date}已逾期，请及时还款，详咨XXXXXXXXXXXX', '1', '1', '2014-06-06 01:03:46', '1', '2014-06-06 01:43:38', null);
INSERT INTO `sys_message_template` VALUES ('17', '需要短信验证码', 'smsVerification', '需要短信验证码', '你的手机验证码：${imgCode}，欢迎使用【胖毛在线】，如非本人操作请致电 ：xxxxxxxxx', '1', '1', '2014-06-06 01:05:19', '1', '2014-06-06 01:43:57', null);
INSERT INTO `sys_message_template` VALUES ('18', '修改密码', 'modifyPassword', '修改密码', '尊敬客户，你的胖毛账号${accno}，修改密码成功，如非本人操作请致电 ：xxxxxxxxx', '1', '1', '2014-06-06 01:08:25', '1', '2014-06-06 01:44:05', null);
INSERT INTO `sys_message_template` VALUES ('19', '修改提现密码', 'modifyWithdrawaslPass', '修改提现密码', '尊敬客户，你的胖毛账号${accno}，提现密码修改成功，如非本人操作请致电 ：xxxxxxxxx', '1', '1', '2014-06-06 01:12:10', '1', '2014-06-06 01:44:14', null);
INSERT INTO `sys_message_template` VALUES ('20', '邮件充值提醒', 'mail_recharge', '【胖毛在线】充值提醒', '【胖毛在线】您在${date}为账号${accno}充值${amt}元已到账，详咨XXXXXXXXXXXX', '2', '1', '2014-06-07 00:21:41', '1', '2014-06-07 01:05:14', '0');
INSERT INTO `sys_message_template` VALUES ('21', '借款标发标成功短信提醒', 'smsLoanApply', '借款标发标成功', '尊敬的客户，您已成功实施借款发标，发标金额为${amt} ，感谢您选择胖毛在线', '1', '1', '2014-06-08 11:04:15', '1', '2014-06-08 11:23:21', '24');
INSERT INTO `sys_message_template` VALUES ('22', '借款标发标成功邮件提醒', 'emailLoanApply', '借款标发标成功', '【胖毛在线】尊敬的客户，您已成功实施借款发标，发标金额为${amt} ，感谢您选择胖毛在线', '2', '1', '2014-06-08 11:24:36', '1', '2014-06-08 11:24:36', '24');
INSERT INTO `sys_message_template` VALUES ('23', '借款标满标短信提醒', 'smsNoticeMB', '借款标满标提醒', '尊敬的客户，你在胖毛在线【标名称】借款已满标，请耐心等待', '1', '1', '2014-06-08 12:57:54', '1', '2014-06-08 12:57:54', '25');
INSERT INTO `sys_message_template` VALUES ('24', '借款标满标邮件提醒', 'emailNoticeMB', '借款标满标提醒', '【胖毛在线】尊敬的客户，你在胖毛在线【标名称】借款已满标，请耐心等待', '2', '1', '2014-06-08 12:59:34', '1', '2014-06-08 13:00:32', '25');

-- ----------------------------
-- Table structure for `sys_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `sys_parameter`;
CREATE TABLE `sys_parameter` (
  `PARAMETER_ID` bigint(22) NOT NULL AUTO_INCREMENT,
  `PARAMETER_CODE` varchar(20) DEFAULT NULL,
  `PARAMETER_VALUE` varchar(200) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `SYS_CREATE_USER` int(11) DEFAULT NULL COMMENT '系统创建人',
  `PARAMETER_TYPE_CD` varchar(20) DEFAULT NULL COMMENT '参数类型代号',
  `PARAMETER_TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '参数类型名称',
  `PARAMETER_DISPLAY_NAME` varchar(50) DEFAULT NULL COMMENT '参数显示名称',
  `PARAMETER_SORT` int(11) DEFAULT NULL COMMENT '参数排序',
  PRIMARY KEY (`PARAMETER_ID`),
  UNIQUE KEY `PRIMARYSYS_PARAMETER1` (`PARAMETER_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_parameter
-- ----------------------------
INSERT INTO `sys_parameter` VALUES ('1', 'picWidth', '1024', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('2', 'picHeight', '768', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('3', 'picFileUpladDir', 'myfile', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('4', 'defaultPassword', 'password', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('5', 'IMAGENUM', '100', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('6', 'INDEXTOPPHOTO', '10', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('7', 'INDEXTOPIMAGE', '10', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('10', 'smsComCode', 'pmtzcom', '2014-04-24 22:57:22', '2014-05-13 00:07:34', '1', '短信发送平台注册的公司编码', '1', null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('11', 'smsLoginName', 'pmtz', '2014-04-24 22:58:12', '2014-05-13 00:07:34', '1', '短信发送平台注册的登陆名', '1', null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('12', 'smsPswd', '123456', '2014-04-24 22:58:39', '2014-05-13 00:07:34', '1', '短信发送平台注册的登录密码', '1', null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('13', 'ZQGLFL', '0.3', null, '2014-05-13 00:07:34', null, '展期借款管理费率', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('14', 'YQGLFL', '0.5', null, '2014-05-13 00:07:34', null, '逾期借款管理费率', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('15', 'JKGLFL', '0.01', null, '2014-05-13 00:07:34', null, '借款管理费率', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('16', 'FXZBJBL', '0.01', null, '2014-05-13 00:07:34', null, '风险准备金比例', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('17', 'YQSFBL', '0.5', null, '2014-05-13 00:07:34', null, '逾期上浮比例', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('18', 'ZQSFBL', '0.3', null, '2014-05-13 00:07:34', null, '展期上浮比例', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('19', 'KXQTS', '7', null, '2014-05-13 00:07:34', null, '宽限期天数', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('20', 'TQHKWYJBL', '0.1', null, '2014-05-13 00:07:34', null, null, null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('22', 'ZQZRGLFL', '0.132', '2014-05-06 00:11:36', '2014-05-13 00:13:43', '1', '债权转让管理费率', '1', '1', '债权转让管理费率', '债权转让管理费率', '1');
INSERT INTO `sys_parameter` VALUES ('26', 'AUTH_QUERY_TYPE_P', '25121', '2014-05-15 23:37:17', '2014-05-15 23:37:17', '1', '个人认证代码', '1', 'PERSONALAUTH', '认证类型', '身份证认证', '1');
INSERT INTO `sys_parameter` VALUES ('27', 'AUTH_REF_ID_P', '1', '2014-05-15 23:39:15', '2014-05-15 23:52:23', '1', '身份证认证', '1', 'PERSONALAUTH', '身份证认证', '身份证认证', '2');
INSERT INTO `sys_parameter` VALUES ('28', 'AUTH_SUBREPORT_IDS_P', '10602', '2014-05-15 23:40:44', '2014-05-15 23:52:32', '1', '身份证认证', '1', 'PERSONALAUTH', '身份证认证', '身份证认证', '2');
INSERT INTO `sys_parameter` VALUES ('29', 'AUTH_USER_ID_P', 'pmwsquery', '2014-05-15 23:42:22', '2014-05-15 23:52:41', '1', '身份证认证用户', '1', 'PERSONALAUTH', '身份证认证用户', '身份证认证用户', '4');
INSERT INTO `sys_parameter` VALUES ('30', 'AUTH_PASSWORD_P', '/o8FTDxgnhqP4/7SBdwEBw==', '2014-05-15 23:43:26', '2014-05-15 23:52:52', '1', '身份证认证', '1', 'PERSONALAUTH', '认证秘密', '认证秘密', '6');
INSERT INTO `sys_parameter` VALUES ('31', 'PAY_MER_CODE', '19464', '2014-05-15 23:58:39', '2014-05-15 23:58:39', '1', '这次商户代码', '1', 'PAY_CODE', '支付参数', '这次商户代码', '1');
INSERT INTO `sys_parameter` VALUES ('32', 'PAY_MD5_KEY', 'R[Qjw^zN', '2014-05-15 23:59:57', '2014-05-15 23:59:57', '1', '支付参数', '1', 'PAY_CODE', '支付参数', 'MD5_KEY', '2');
INSERT INTO `sys_parameter` VALUES ('33', 'PAY_QUERY_ORDER_URL', 'https://merchant.ecpss.cn/merchantBatchQueryAPI', '2014-05-16 00:02:49', '2014-05-16 00:03:01', '1', 'https://merchant.ecpss.cn/merchantBatchQueryAPI', '1', 'PAY_CODE', '支付参数', '订单查询地址', '4');
INSERT INTO `sys_parameter` VALUES ('34', 'PAY_QUERY_ORDER_TX', '1001', '2014-05-16 00:16:39', '2014-05-16 00:16:39', '1', '支付订单查询代码', '1', 'PAY_CODE', '支付参数', '支付订单查询代码', '4');
INSERT INTO `sys_parameter` VALUES ('35', 'MIN_TENDER_AMT', '50', '2014-05-31 12:19:20', '2014-05-31 12:19:23', '1', '最小每份金额', '1', null, null, null, '1');
INSERT INTO `sys_parameter` VALUES ('36', 'PAY_RETURN_URL', 'http://new.pmzaixian.net/payment/returnBack.do', '2014-06-01 13:35:20', '2014-06-01 13:35:16', '1', '充值返回地址', '1', 'PAY_CODE', '支付参数', '充值返回地址', '5');
INSERT INTO `sys_parameter` VALUES ('37', 'PAY_ADVICE_URL', 'http://new.pmzaixian.net/payment/adviceBack.do', '2014-06-01 13:35:08', '2014-06-01 13:35:12', '1', '充值后台返回地址', '1', 'PAY_CODE', '支付参数', '充值后台返回地址', '6');
INSERT INTO `sys_parameter` VALUES ('38', 'PTSYFL', '0.1', null, null, null, '平台收益费率', null, null, null, null, null);
INSERT INTO `sys_parameter` VALUES ('39', 'WMBXTLB', '1', null, null, null, '未满标X天流标', null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_province`
-- ----------------------------
DROP TABLE IF EXISTS `sys_province`;
CREATE TABLE `sys_province` (
  `provinceid` int(6) NOT NULL,
  `province` varchar(50) NOT NULL,
  PRIMARY KEY (`provinceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='省份信息表';

-- ----------------------------
-- Records of sys_province
-- ----------------------------
INSERT INTO `sys_province` VALUES ('110000', '北京市');
INSERT INTO `sys_province` VALUES ('120000', '天津市');
INSERT INTO `sys_province` VALUES ('130000', '河北省');
INSERT INTO `sys_province` VALUES ('140000', '山西省');
INSERT INTO `sys_province` VALUES ('150000', '内蒙古自治区');
INSERT INTO `sys_province` VALUES ('210000', '辽宁省');
INSERT INTO `sys_province` VALUES ('220000', '吉林省');
INSERT INTO `sys_province` VALUES ('230000', '黑龙江省');
INSERT INTO `sys_province` VALUES ('310000', '上海市');
INSERT INTO `sys_province` VALUES ('320000', '江苏省');
INSERT INTO `sys_province` VALUES ('330000', '浙江省');
INSERT INTO `sys_province` VALUES ('340000', '安徽省');
INSERT INTO `sys_province` VALUES ('350000', '福建省');
INSERT INTO `sys_province` VALUES ('360000', '江西省');
INSERT INTO `sys_province` VALUES ('370000', '山东省');
INSERT INTO `sys_province` VALUES ('410000', '河南省');
INSERT INTO `sys_province` VALUES ('420000', '湖北省');
INSERT INTO `sys_province` VALUES ('430000', '湖南省');
INSERT INTO `sys_province` VALUES ('440000', '广东省');
INSERT INTO `sys_province` VALUES ('450000', '广西壮族自治区');
INSERT INTO `sys_province` VALUES ('460000', '海南省');
INSERT INTO `sys_province` VALUES ('500000', '重庆市');
INSERT INTO `sys_province` VALUES ('510000', '四川省');
INSERT INTO `sys_province` VALUES ('520000', '贵州省');
INSERT INTO `sys_province` VALUES ('530000', '云南省');
INSERT INTO `sys_province` VALUES ('540000', '西藏自治区');
INSERT INTO `sys_province` VALUES ('610000', '陕西省');
INSERT INTO `sys_province` VALUES ('620000', '甘肃省');
INSERT INTO `sys_province` VALUES ('630000', '青海省');
INSERT INTO `sys_province` VALUES ('640000', '宁夏回族自治区');
INSERT INTO `sys_province` VALUES ('650000', '新疆维吾尔自治区');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` bigint(22) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(32) DEFAULT NULL,
  `ROLE_NAME` varchar(32) DEFAULT NULL,
  `DEPT_ID` bigint(22) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `ROLE_DESC` varchar(100) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `PRIMARYSYS_ROLE1` (`ROLE_ID`) ,
  KEY `IDX_FKA50F92C88CCD7C9FSYS_ROLE` (`DEPT_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'manage', '超级管理员', '1', null, null, null, null, null);
INSERT INTO `sys_role` VALUES ('10001', 'user', '会员', '10001', '2014-03-08 13:08:32', '2014-05-03 14:37:58', 'admin', '网站会员', null);
INSERT INTO `sys_role` VALUES ('10008', 'riskControl', '风控岗', null, '2014-03-30 14:41:13', '2014-05-03 14:43:04', 'admin', '风控岗', null);
INSERT INTO `sys_role` VALUES ('10009', 'compliance', '合规岗', null, '2014-03-30 14:43:25', '2014-05-03 14:43:15', 'admin', '合规岗', null);
INSERT INTO `sys_role` VALUES ('10010', 'accountManager', '客户经理', null, '2014-03-30 16:03:53', '2014-05-03 14:43:25', 'admin', '客户经理', null);
INSERT INTO `sys_role` VALUES ('10013', 'financialManage', '财务管理', null, '2014-04-10 22:04:03', '2014-05-03 14:43:34', 'admin', '财务管理', null);
INSERT INTO `sys_role` VALUES ('10014', 'custService', '客服', '0', '2014-05-30 00:30:38', '2014-05-30 00:32:14', 'admin', '客服', null);

-- ----------------------------
-- Table structure for `sys_role_function`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function` (
  `ROLE_ID` bigint(22) DEFAULT NULL,
  `FUN_ID` bigint(22) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PRIMARYSYS_ROLE_FUNCTION1` (`ROLE_ID`,`FUN_ID`) ,
  KEY `IDX_FKDE0FA36F34BF5638SYS_ROLE` (`FUN_ID`) ,
  KEY `IDX_FKDE0FA36F823C82FFSYS_ROLE` (`ROLE_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=2362 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES ('19', '400000', '2014-04-15 10:43:22', '2014-04-15 10:43:22', 'admin', '1237');
INSERT INTO `sys_role_function` VALUES ('19', '400100', '2014-04-15 10:43:22', '2014-04-15 10:43:22', 'admin', '1238');
INSERT INTO `sys_role_function` VALUES ('19', '400400', '2014-04-15 10:43:22', '2014-04-15 10:43:22', 'admin', '1239');
INSERT INTO `sys_role_function` VALUES ('19', '400500', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1240');
INSERT INTO `sys_role_function` VALUES ('19', '400600', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1241');
INSERT INTO `sys_role_function` VALUES ('19', '400700', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1242');
INSERT INTO `sys_role_function` VALUES ('19', '400800', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1243');
INSERT INTO `sys_role_function` VALUES ('19', '500000', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1244');
INSERT INTO `sys_role_function` VALUES ('19', '500100', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1245');
INSERT INTO `sys_role_function` VALUES ('19', '500200', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1246');
INSERT INTO `sys_role_function` VALUES ('19', '500300', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1247');
INSERT INTO `sys_role_function` VALUES ('19', '500400', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1248');
INSERT INTO `sys_role_function` VALUES ('19', '600000', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1249');
INSERT INTO `sys_role_function` VALUES ('19', '600100', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1250');
INSERT INTO `sys_role_function` VALUES ('19', '600200', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1251');
INSERT INTO `sys_role_function` VALUES ('19', '600300', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1252');
INSERT INTO `sys_role_function` VALUES ('19', '600400', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1253');
INSERT INTO `sys_role_function` VALUES ('19', '600500', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1254');
INSERT INTO `sys_role_function` VALUES ('19', '600600', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1255');
INSERT INTO `sys_role_function` VALUES ('19', '700000', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1256');
INSERT INTO `sys_role_function` VALUES ('19', '700100', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1257');
INSERT INTO `sys_role_function` VALUES ('19', '700200', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1258');
INSERT INTO `sys_role_function` VALUES ('19', '700300', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1259');
INSERT INTO `sys_role_function` VALUES ('19', '700400', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1260');
INSERT INTO `sys_role_function` VALUES ('19', '700500', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1261');
INSERT INTO `sys_role_function` VALUES ('19', '800000', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1262');
INSERT INTO `sys_role_function` VALUES ('19', '800100', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1263');
INSERT INTO `sys_role_function` VALUES ('19', '800200', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1264');
INSERT INTO `sys_role_function` VALUES ('19', '800300', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1265');
INSERT INTO `sys_role_function` VALUES ('19', '800400', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1266');
INSERT INTO `sys_role_function` VALUES ('19', '900000', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1267');
INSERT INTO `sys_role_function` VALUES ('19', '900100', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1268');
INSERT INTO `sys_role_function` VALUES ('19', '900200', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1269');
INSERT INTO `sys_role_function` VALUES ('19', '900300', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1270');
INSERT INTO `sys_role_function` VALUES ('19', '1000000', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1271');
INSERT INTO `sys_role_function` VALUES ('19', '1000100', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1272');
INSERT INTO `sys_role_function` VALUES ('19', '1000200', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1273');
INSERT INTO `sys_role_function` VALUES ('19', '1000300', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1274');
INSERT INTO `sys_role_function` VALUES ('19', '1000400', '2014-04-15 10:43:23', '2014-04-15 10:43:23', 'admin', '1275');
INSERT INTO `sys_role_function` VALUES ('10002', '900000', '2014-05-01 15:24:11', '2014-05-01 15:24:11', 'admin', '1700');
INSERT INTO `sys_role_function` VALUES ('10002', '900100', '2014-05-01 15:24:11', '2014-05-01 15:24:11', 'admin', '1701');
INSERT INTO `sys_role_function` VALUES ('10002', '900200', '2014-05-01 15:24:11', '2014-05-01 15:24:11', 'admin', '1702');
INSERT INTO `sys_role_function` VALUES ('10002', '900300', '2014-05-01 15:24:11', '2014-05-01 15:24:11', 'admin', '1703');
INSERT INTO `sys_role_function` VALUES ('10002', '800000', '2014-05-01 15:24:11', '2014-05-01 15:24:11', 'admin', '1704');
INSERT INTO `sys_role_function` VALUES ('10002', '800100', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1705');
INSERT INTO `sys_role_function` VALUES ('10002', '800200', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1706');
INSERT INTO `sys_role_function` VALUES ('10002', '800300', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1707');
INSERT INTO `sys_role_function` VALUES ('10002', '800400', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1708');
INSERT INTO `sys_role_function` VALUES ('10002', '700000', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1709');
INSERT INTO `sys_role_function` VALUES ('10002', '700100', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1710');
INSERT INTO `sys_role_function` VALUES ('10002', '700200', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1711');
INSERT INTO `sys_role_function` VALUES ('10002', '700300', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1712');
INSERT INTO `sys_role_function` VALUES ('10002', '700400', '2014-05-01 15:24:12', '2014-05-01 15:24:12', 'admin', '1713');
INSERT INTO `sys_role_function` VALUES ('10002', '700500', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1714');
INSERT INTO `sys_role_function` VALUES ('10002', '700600', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1715');
INSERT INTO `sys_role_function` VALUES ('10002', '600000', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1716');
INSERT INTO `sys_role_function` VALUES ('10002', '600100', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1717');
INSERT INTO `sys_role_function` VALUES ('10002', '600200', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1718');
INSERT INTO `sys_role_function` VALUES ('10002', '600300', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1719');
INSERT INTO `sys_role_function` VALUES ('10002', '600400', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1720');
INSERT INTO `sys_role_function` VALUES ('10002', '600500', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1721');
INSERT INTO `sys_role_function` VALUES ('10002', '600600', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1722');
INSERT INTO `sys_role_function` VALUES ('10002', '600700', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1723');
INSERT INTO `sys_role_function` VALUES ('10002', '500000', '2014-05-01 15:24:13', '2014-05-01 15:24:13', 'admin', '1724');
INSERT INTO `sys_role_function` VALUES ('10002', '500100', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1725');
INSERT INTO `sys_role_function` VALUES ('10002', '500200', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1726');
INSERT INTO `sys_role_function` VALUES ('10002', '500300', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1727');
INSERT INTO `sys_role_function` VALUES ('10002', '500400', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1728');
INSERT INTO `sys_role_function` VALUES ('10002', '500500', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1729');
INSERT INTO `sys_role_function` VALUES ('10002', '500600', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1730');
INSERT INTO `sys_role_function` VALUES ('10002', '500700', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1731');
INSERT INTO `sys_role_function` VALUES ('10002', '400000', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1732');
INSERT INTO `sys_role_function` VALUES ('10002', '400100', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1733');
INSERT INTO `sys_role_function` VALUES ('10002', '400800', '2014-05-01 15:24:14', '2014-05-01 15:24:14', 'admin', '1734');
INSERT INTO `sys_role_function` VALUES ('10001', '1000', '2014-05-02 18:02:26', '2014-05-02 18:02:26', 'admin', '1924');
INSERT INTO `sys_role_function` VALUES ('10001', '1001', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1925');
INSERT INTO `sys_role_function` VALUES ('10001', '1002', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1926');
INSERT INTO `sys_role_function` VALUES ('10001', '1003', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1927');
INSERT INTO `sys_role_function` VALUES ('10001', '1004', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1928');
INSERT INTO `sys_role_function` VALUES ('10001', '2000', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1929');
INSERT INTO `sys_role_function` VALUES ('10001', '2001', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1930');
INSERT INTO `sys_role_function` VALUES ('10001', '2002', '2014-05-02 18:02:27', '2014-05-02 18:02:27', 'admin', '1931');
INSERT INTO `sys_role_function` VALUES ('10001', '2003', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1932');
INSERT INTO `sys_role_function` VALUES ('10001', '2004', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1933');
INSERT INTO `sys_role_function` VALUES ('10001', '3000', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1934');
INSERT INTO `sys_role_function` VALUES ('10001', '3001', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1935');
INSERT INTO `sys_role_function` VALUES ('10001', '3002', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1936');
INSERT INTO `sys_role_function` VALUES ('10001', '3003', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1937');
INSERT INTO `sys_role_function` VALUES ('10001', '4000', '2014-05-02 18:02:28', '2014-05-02 18:02:28', 'admin', '1938');
INSERT INTO `sys_role_function` VALUES ('10001', '4001', '2014-05-02 18:02:29', '2014-05-02 18:02:29', 'admin', '1939');
INSERT INTO `sys_role_function` VALUES ('10001', '4002', '2014-05-02 18:02:29', '2014-05-02 18:02:29', 'admin', '1940');
INSERT INTO `sys_role_function` VALUES ('10001', '4003', '2014-05-02 18:02:29', '2014-05-02 18:02:29', 'admin', '1941');
INSERT INTO `sys_role_function` VALUES ('10001', '5000', '2014-05-02 18:02:29', '2014-05-02 18:02:29', 'admin', '1942');
INSERT INTO `sys_role_function` VALUES ('10001', '5001', '2014-05-02 18:02:29', '2014-05-02 18:02:29', 'admin', '1943');
INSERT INTO `sys_role_function` VALUES ('10001', '5002', '2014-05-02 18:02:29', '2014-05-02 18:02:29', 'admin', '1944');
INSERT INTO `sys_role_function` VALUES ('10001', '6000', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1945');
INSERT INTO `sys_role_function` VALUES ('10001', '6001', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1946');
INSERT INTO `sys_role_function` VALUES ('10001', '6002', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1947');
INSERT INTO `sys_role_function` VALUES ('10001', '6003', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1948');
INSERT INTO `sys_role_function` VALUES ('10001', '7000', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1949');
INSERT INTO `sys_role_function` VALUES ('10001', '7001', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1950');
INSERT INTO `sys_role_function` VALUES ('10001', '400000', '2014-05-02 18:02:30', '2014-05-02 18:02:30', 'admin', '1951');
INSERT INTO `sys_role_function` VALUES ('10001', '400100', '2014-05-02 18:02:31', '2014-05-02 18:02:31', 'admin', '1952');
INSERT INTO `sys_role_function` VALUES ('10001', '400800', '2014-05-02 18:02:31', '2014-05-02 18:02:31', 'admin', '1953');
INSERT INTO `sys_role_function` VALUES ('10001', '7002', '2014-05-02 18:02:31', '2014-05-02 18:02:31', 'admin', '1954');
INSERT INTO `sys_role_function` VALUES ('10008', '400000', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1955');
INSERT INTO `sys_role_function` VALUES ('10008', '400100', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1956');
INSERT INTO `sys_role_function` VALUES ('10008', '400800', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1957');
INSERT INTO `sys_role_function` VALUES ('10008', '500000', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1958');
INSERT INTO `sys_role_function` VALUES ('10008', '500100', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1959');
INSERT INTO `sys_role_function` VALUES ('10008', '500200', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1960');
INSERT INTO `sys_role_function` VALUES ('10008', '500300', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1961');
INSERT INTO `sys_role_function` VALUES ('10008', '500400', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1962');
INSERT INTO `sys_role_function` VALUES ('10008', '500500', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1963');
INSERT INTO `sys_role_function` VALUES ('10008', '500600', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1964');
INSERT INTO `sys_role_function` VALUES ('10008', '500700', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1965');
INSERT INTO `sys_role_function` VALUES ('10008', '600000', '2014-05-03 14:44:29', '2014-05-03 14:44:29', 'admin', '1966');
INSERT INTO `sys_role_function` VALUES ('10008', '600100', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1967');
INSERT INTO `sys_role_function` VALUES ('10008', '600200', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1968');
INSERT INTO `sys_role_function` VALUES ('10008', '600300', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1969');
INSERT INTO `sys_role_function` VALUES ('10008', '600400', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1970');
INSERT INTO `sys_role_function` VALUES ('10008', '600500', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1971');
INSERT INTO `sys_role_function` VALUES ('10008', '600600', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1972');
INSERT INTO `sys_role_function` VALUES ('10008', '600700', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1973');
INSERT INTO `sys_role_function` VALUES ('10008', '700000', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1974');
INSERT INTO `sys_role_function` VALUES ('10008', '700100', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1975');
INSERT INTO `sys_role_function` VALUES ('10008', '700200', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1976');
INSERT INTO `sys_role_function` VALUES ('10008', '700300', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1977');
INSERT INTO `sys_role_function` VALUES ('10008', '700400', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1978');
INSERT INTO `sys_role_function` VALUES ('10008', '700500', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1979');
INSERT INTO `sys_role_function` VALUES ('10008', '700600', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1980');
INSERT INTO `sys_role_function` VALUES ('10008', '800000', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1981');
INSERT INTO `sys_role_function` VALUES ('10008', '800100', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1982');
INSERT INTO `sys_role_function` VALUES ('10008', '800200', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1983');
INSERT INTO `sys_role_function` VALUES ('10008', '800300', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1984');
INSERT INTO `sys_role_function` VALUES ('10008', '800400', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1985');
INSERT INTO `sys_role_function` VALUES ('10008', '900000', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1986');
INSERT INTO `sys_role_function` VALUES ('10008', '900100', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1987');
INSERT INTO `sys_role_function` VALUES ('10008', '900200', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1988');
INSERT INTO `sys_role_function` VALUES ('10008', '900300', '2014-05-03 14:44:30', '2014-05-03 14:44:30', 'admin', '1989');
INSERT INTO `sys_role_function` VALUES ('10009', '900000', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1990');
INSERT INTO `sys_role_function` VALUES ('10009', '900100', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1991');
INSERT INTO `sys_role_function` VALUES ('10009', '900200', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1992');
INSERT INTO `sys_role_function` VALUES ('10009', '900300', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1993');
INSERT INTO `sys_role_function` VALUES ('10009', '800000', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1994');
INSERT INTO `sys_role_function` VALUES ('10009', '800100', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1995');
INSERT INTO `sys_role_function` VALUES ('10009', '800200', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1996');
INSERT INTO `sys_role_function` VALUES ('10009', '800300', '2014-05-03 14:44:51', '2014-05-03 14:44:51', 'admin', '1997');
INSERT INTO `sys_role_function` VALUES ('10009', '800400', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '1998');
INSERT INTO `sys_role_function` VALUES ('10009', '700000', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '1999');
INSERT INTO `sys_role_function` VALUES ('10009', '700100', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2000');
INSERT INTO `sys_role_function` VALUES ('10009', '700200', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2001');
INSERT INTO `sys_role_function` VALUES ('10009', '700300', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2002');
INSERT INTO `sys_role_function` VALUES ('10009', '700400', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2003');
INSERT INTO `sys_role_function` VALUES ('10009', '700500', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2004');
INSERT INTO `sys_role_function` VALUES ('10009', '700600', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2005');
INSERT INTO `sys_role_function` VALUES ('10009', '600000', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2006');
INSERT INTO `sys_role_function` VALUES ('10009', '600100', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2007');
INSERT INTO `sys_role_function` VALUES ('10009', '600200', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2008');
INSERT INTO `sys_role_function` VALUES ('10009', '600300', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2009');
INSERT INTO `sys_role_function` VALUES ('10009', '600400', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2010');
INSERT INTO `sys_role_function` VALUES ('10009', '600500', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2011');
INSERT INTO `sys_role_function` VALUES ('10009', '600600', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2012');
INSERT INTO `sys_role_function` VALUES ('10009', '600700', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2013');
INSERT INTO `sys_role_function` VALUES ('10009', '500000', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2014');
INSERT INTO `sys_role_function` VALUES ('10009', '500100', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2015');
INSERT INTO `sys_role_function` VALUES ('10009', '500200', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2016');
INSERT INTO `sys_role_function` VALUES ('10009', '500300', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2017');
INSERT INTO `sys_role_function` VALUES ('10009', '500400', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2018');
INSERT INTO `sys_role_function` VALUES ('10009', '500500', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2019');
INSERT INTO `sys_role_function` VALUES ('10009', '500600', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2020');
INSERT INTO `sys_role_function` VALUES ('10009', '500700', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2021');
INSERT INTO `sys_role_function` VALUES ('10009', '400000', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2022');
INSERT INTO `sys_role_function` VALUES ('10009', '400100', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2023');
INSERT INTO `sys_role_function` VALUES ('10009', '400800', '2014-05-03 14:44:52', '2014-05-03 14:44:52', 'admin', '2024');
INSERT INTO `sys_role_function` VALUES ('10010', '800000', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2025');
INSERT INTO `sys_role_function` VALUES ('10010', '800100', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2026');
INSERT INTO `sys_role_function` VALUES ('10010', '800200', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2027');
INSERT INTO `sys_role_function` VALUES ('10010', '800300', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2028');
INSERT INTO `sys_role_function` VALUES ('10010', '800400', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2029');
INSERT INTO `sys_role_function` VALUES ('10010', '700000', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2030');
INSERT INTO `sys_role_function` VALUES ('10010', '700100', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2031');
INSERT INTO `sys_role_function` VALUES ('10010', '700200', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2032');
INSERT INTO `sys_role_function` VALUES ('10010', '700300', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2033');
INSERT INTO `sys_role_function` VALUES ('10010', '700400', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2034');
INSERT INTO `sys_role_function` VALUES ('10010', '700500', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2035');
INSERT INTO `sys_role_function` VALUES ('10010', '700600', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2036');
INSERT INTO `sys_role_function` VALUES ('10010', '600000', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2037');
INSERT INTO `sys_role_function` VALUES ('10010', '600100', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2038');
INSERT INTO `sys_role_function` VALUES ('10010', '600200', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2039');
INSERT INTO `sys_role_function` VALUES ('10010', '600300', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2040');
INSERT INTO `sys_role_function` VALUES ('10010', '600400', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2041');
INSERT INTO `sys_role_function` VALUES ('10010', '600500', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2042');
INSERT INTO `sys_role_function` VALUES ('10010', '600600', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2043');
INSERT INTO `sys_role_function` VALUES ('10010', '600700', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2044');
INSERT INTO `sys_role_function` VALUES ('10010', '500000', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2045');
INSERT INTO `sys_role_function` VALUES ('10010', '500100', '2014-05-03 14:45:03', '2014-05-03 14:45:03', 'admin', '2046');
INSERT INTO `sys_role_function` VALUES ('10010', '500200', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2047');
INSERT INTO `sys_role_function` VALUES ('10010', '500300', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2048');
INSERT INTO `sys_role_function` VALUES ('10010', '500400', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2049');
INSERT INTO `sys_role_function` VALUES ('10010', '500500', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2050');
INSERT INTO `sys_role_function` VALUES ('10010', '500600', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2051');
INSERT INTO `sys_role_function` VALUES ('10010', '500700', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2052');
INSERT INTO `sys_role_function` VALUES ('10010', '400000', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2053');
INSERT INTO `sys_role_function` VALUES ('10010', '400100', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2054');
INSERT INTO `sys_role_function` VALUES ('10010', '400800', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2055');
INSERT INTO `sys_role_function` VALUES ('10010', '900000', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2056');
INSERT INTO `sys_role_function` VALUES ('10010', '900100', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2057');
INSERT INTO `sys_role_function` VALUES ('10010', '900200', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2058');
INSERT INTO `sys_role_function` VALUES ('10010', '900300', '2014-05-03 14:45:04', '2014-05-03 14:45:04', 'admin', '2059');
INSERT INTO `sys_role_function` VALUES ('10013', '900000', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2060');
INSERT INTO `sys_role_function` VALUES ('10013', '900100', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2061');
INSERT INTO `sys_role_function` VALUES ('10013', '900200', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2062');
INSERT INTO `sys_role_function` VALUES ('10013', '900300', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2063');
INSERT INTO `sys_role_function` VALUES ('10013', '800000', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2064');
INSERT INTO `sys_role_function` VALUES ('10013', '800100', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2065');
INSERT INTO `sys_role_function` VALUES ('10013', '800200', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2066');
INSERT INTO `sys_role_function` VALUES ('10013', '800300', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2067');
INSERT INTO `sys_role_function` VALUES ('10013', '800400', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2068');
INSERT INTO `sys_role_function` VALUES ('10013', '700000', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2069');
INSERT INTO `sys_role_function` VALUES ('10013', '700100', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2070');
INSERT INTO `sys_role_function` VALUES ('10013', '700200', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2071');
INSERT INTO `sys_role_function` VALUES ('10013', '700300', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2072');
INSERT INTO `sys_role_function` VALUES ('10013', '700400', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2073');
INSERT INTO `sys_role_function` VALUES ('10013', '700500', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2074');
INSERT INTO `sys_role_function` VALUES ('10013', '700600', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2075');
INSERT INTO `sys_role_function` VALUES ('10013', '600000', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2076');
INSERT INTO `sys_role_function` VALUES ('10013', '600100', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2077');
INSERT INTO `sys_role_function` VALUES ('10013', '600200', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2078');
INSERT INTO `sys_role_function` VALUES ('10013', '600300', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2079');
INSERT INTO `sys_role_function` VALUES ('10013', '600400', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2080');
INSERT INTO `sys_role_function` VALUES ('10013', '600500', '2014-05-03 14:45:16', '2014-05-03 14:45:16', 'admin', '2081');
INSERT INTO `sys_role_function` VALUES ('10013', '600600', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2082');
INSERT INTO `sys_role_function` VALUES ('10013', '600700', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2083');
INSERT INTO `sys_role_function` VALUES ('10013', '500000', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2084');
INSERT INTO `sys_role_function` VALUES ('10013', '500100', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2085');
INSERT INTO `sys_role_function` VALUES ('10013', '500200', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2086');
INSERT INTO `sys_role_function` VALUES ('10013', '500300', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2087');
INSERT INTO `sys_role_function` VALUES ('10013', '500400', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2088');
INSERT INTO `sys_role_function` VALUES ('10013', '500500', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2089');
INSERT INTO `sys_role_function` VALUES ('10013', '500600', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2090');
INSERT INTO `sys_role_function` VALUES ('10013', '500700', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2091');
INSERT INTO `sys_role_function` VALUES ('10013', '400000', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2092');
INSERT INTO `sys_role_function` VALUES ('10013', '400100', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2093');
INSERT INTO `sys_role_function` VALUES ('10013', '400800', '2014-05-03 14:45:17', '2014-05-03 14:45:17', 'admin', '2094');
INSERT INTO `sys_role_function` VALUES ('10054', '1000', '2014-05-03 20:17:21', '2014-05-03 20:17:21', 'admin', '2095');
INSERT INTO `sys_role_function` VALUES ('10054', '1001', '2014-05-03 20:17:21', '2014-05-03 20:17:21', 'admin', '2096');
INSERT INTO `sys_role_function` VALUES ('10054', '1002', '2014-05-03 20:17:21', '2014-05-03 20:17:21', 'admin', '2097');
INSERT INTO `sys_role_function` VALUES ('10054', '1003', '2014-05-03 20:17:22', '2014-05-03 20:17:22', 'admin', '2098');
INSERT INTO `sys_role_function` VALUES ('10054', '1004', '2014-05-03 20:17:22', '2014-05-03 20:17:22', 'admin', '2099');
INSERT INTO `sys_role_function` VALUES ('10014', '400000', '2014-05-31 20:23:31', '2014-05-31 20:23:31', 'admin', '2128');
INSERT INTO `sys_role_function` VALUES ('10014', '400100', '2014-05-31 20:23:31', '2014-05-31 20:23:31', 'admin', '2129');
INSERT INTO `sys_role_function` VALUES ('10014', '400800', '2014-05-31 20:23:31', '2014-05-31 20:23:31', 'admin', '2130');
INSERT INTO `sys_role_function` VALUES ('10014', '500800', '2014-05-31 20:23:31', '2014-05-31 20:23:31', 'admin', '2131');
INSERT INTO `sys_role_function` VALUES ('1', '100000', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2169');
INSERT INTO `sys_role_function` VALUES ('1', '100100', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2170');
INSERT INTO `sys_role_function` VALUES ('1', '100200', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2171');
INSERT INTO `sys_role_function` VALUES ('1', '100400', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2172');
INSERT INTO `sys_role_function` VALUES ('1', '100500', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2173');
INSERT INTO `sys_role_function` VALUES ('1', '100700', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2174');
INSERT INTO `sys_role_function` VALUES ('1', '100800', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2175');
INSERT INTO `sys_role_function` VALUES ('1', '200000', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2176');
INSERT INTO `sys_role_function` VALUES ('1', '200100', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2177');
INSERT INTO `sys_role_function` VALUES ('1', '200200', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2178');
INSERT INTO `sys_role_function` VALUES ('1', '300000', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2179');
INSERT INTO `sys_role_function` VALUES ('1', '300100', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2180');
INSERT INTO `sys_role_function` VALUES ('1', '300200', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2181');
INSERT INTO `sys_role_function` VALUES ('1', '400000', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2182');
INSERT INTO `sys_role_function` VALUES ('1', '400100', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2183');
INSERT INTO `sys_role_function` VALUES ('1', '400800', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2184');
INSERT INTO `sys_role_function` VALUES ('1', '1000000', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2185');
INSERT INTO `sys_role_function` VALUES ('1', '1000200', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2186');
INSERT INTO `sys_role_function` VALUES ('1', '1000300', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2187');
INSERT INTO `sys_role_function` VALUES ('1', '1000400', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2188');
INSERT INTO `sys_role_function` VALUES ('1', '1000401', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2189');
INSERT INTO `sys_role_function` VALUES ('1', '1000402', '2014-05-31 20:39:00', '2014-05-31 20:39:00', 'admin', '2190');
INSERT INTO `sys_role_function` VALUES ('1', '1000403', '2014-05-31 20:39:01', '2014-05-31 20:39:01', 'admin', '2191');
INSERT INTO `sys_role_function` VALUES ('1', '1000404', '2014-05-31 20:39:01', '2014-05-31 20:39:01', 'admin', '2192');
INSERT INTO `sys_role_function` VALUES ('1', '500800', '2014-05-31 20:39:01', '2014-05-31 20:39:01', 'admin', '2193');
INSERT INTO `sys_role_function` VALUES ('10015', '1000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2278');
INSERT INTO `sys_role_function` VALUES ('10015', '1001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2279');
INSERT INTO `sys_role_function` VALUES ('10015', '1002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2280');
INSERT INTO `sys_role_function` VALUES ('10015', '1003', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2281');
INSERT INTO `sys_role_function` VALUES ('10015', '1004', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2282');
INSERT INTO `sys_role_function` VALUES ('10015', '2000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2283');
INSERT INTO `sys_role_function` VALUES ('10015', '2001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2284');
INSERT INTO `sys_role_function` VALUES ('10015', '2002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2285');
INSERT INTO `sys_role_function` VALUES ('10015', '2003', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2286');
INSERT INTO `sys_role_function` VALUES ('10015', '2004', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2287');
INSERT INTO `sys_role_function` VALUES ('10015', '3000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2288');
INSERT INTO `sys_role_function` VALUES ('10015', '3001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2289');
INSERT INTO `sys_role_function` VALUES ('10015', '3002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2290');
INSERT INTO `sys_role_function` VALUES ('10015', '3003', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2291');
INSERT INTO `sys_role_function` VALUES ('10015', '4000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2292');
INSERT INTO `sys_role_function` VALUES ('10015', '4001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2293');
INSERT INTO `sys_role_function` VALUES ('10015', '4002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2294');
INSERT INTO `sys_role_function` VALUES ('10015', '4003', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2295');
INSERT INTO `sys_role_function` VALUES ('10015', '5000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2296');
INSERT INTO `sys_role_function` VALUES ('10015', '5001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2297');
INSERT INTO `sys_role_function` VALUES ('10015', '5002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2298');
INSERT INTO `sys_role_function` VALUES ('10015', '6000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2299');
INSERT INTO `sys_role_function` VALUES ('10015', '6001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2300');
INSERT INTO `sys_role_function` VALUES ('10015', '6002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2301');
INSERT INTO `sys_role_function` VALUES ('10015', '6003', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2302');
INSERT INTO `sys_role_function` VALUES ('10015', '7000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2303');
INSERT INTO `sys_role_function` VALUES ('10015', '7001', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2304');
INSERT INTO `sys_role_function` VALUES ('10015', '7002', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2305');
INSERT INTO `sys_role_function` VALUES ('10015', '100000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2306');
INSERT INTO `sys_role_function` VALUES ('10015', '100100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2307');
INSERT INTO `sys_role_function` VALUES ('10015', '100200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2308');
INSERT INTO `sys_role_function` VALUES ('10015', '100400', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2309');
INSERT INTO `sys_role_function` VALUES ('10015', '100500', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2310');
INSERT INTO `sys_role_function` VALUES ('10015', '100700', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2311');
INSERT INTO `sys_role_function` VALUES ('10015', '100800', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2312');
INSERT INTO `sys_role_function` VALUES ('10015', '200000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2313');
INSERT INTO `sys_role_function` VALUES ('10015', '200100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2314');
INSERT INTO `sys_role_function` VALUES ('10015', '200200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2315');
INSERT INTO `sys_role_function` VALUES ('10015', '300000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2316');
INSERT INTO `sys_role_function` VALUES ('10015', '300100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2317');
INSERT INTO `sys_role_function` VALUES ('10015', '300200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2318');
INSERT INTO `sys_role_function` VALUES ('10015', '400000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2319');
INSERT INTO `sys_role_function` VALUES ('10015', '400100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2320');
INSERT INTO `sys_role_function` VALUES ('10015', '400800', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2321');
INSERT INTO `sys_role_function` VALUES ('10015', '500000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2322');
INSERT INTO `sys_role_function` VALUES ('10015', '500100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2323');
INSERT INTO `sys_role_function` VALUES ('10015', '500200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2324');
INSERT INTO `sys_role_function` VALUES ('10015', '500300', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2325');
INSERT INTO `sys_role_function` VALUES ('10015', '500400', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2326');
INSERT INTO `sys_role_function` VALUES ('10015', '500500', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2327');
INSERT INTO `sys_role_function` VALUES ('10015', '500600', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2328');
INSERT INTO `sys_role_function` VALUES ('10015', '500700', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2329');
INSERT INTO `sys_role_function` VALUES ('10015', '500800', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2330');
INSERT INTO `sys_role_function` VALUES ('10015', '600000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2331');
INSERT INTO `sys_role_function` VALUES ('10015', '600100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2332');
INSERT INTO `sys_role_function` VALUES ('10015', '600200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2333');
INSERT INTO `sys_role_function` VALUES ('10015', '600300', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2334');
INSERT INTO `sys_role_function` VALUES ('10015', '600500', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2335');
INSERT INTO `sys_role_function` VALUES ('10015', '600600', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2336');
INSERT INTO `sys_role_function` VALUES ('10015', '600700', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2337');
INSERT INTO `sys_role_function` VALUES ('10015', '700000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2338');
INSERT INTO `sys_role_function` VALUES ('10015', '700100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2339');
INSERT INTO `sys_role_function` VALUES ('10015', '700200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2340');
INSERT INTO `sys_role_function` VALUES ('10015', '700300', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2341');
INSERT INTO `sys_role_function` VALUES ('10015', '700400', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2342');
INSERT INTO `sys_role_function` VALUES ('10015', '700500', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2343');
INSERT INTO `sys_role_function` VALUES ('10015', '700600', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2344');
INSERT INTO `sys_role_function` VALUES ('10015', '800000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2345');
INSERT INTO `sys_role_function` VALUES ('10015', '800100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2346');
INSERT INTO `sys_role_function` VALUES ('10015', '800200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2347');
INSERT INTO `sys_role_function` VALUES ('10015', '800300', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2348');
INSERT INTO `sys_role_function` VALUES ('10015', '800400', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2349');
INSERT INTO `sys_role_function` VALUES ('10015', '900000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2350');
INSERT INTO `sys_role_function` VALUES ('10015', '900100', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2351');
INSERT INTO `sys_role_function` VALUES ('10015', '900200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2352');
INSERT INTO `sys_role_function` VALUES ('10015', '900300', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2353');
INSERT INTO `sys_role_function` VALUES ('10015', '1000000', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2354');
INSERT INTO `sys_role_function` VALUES ('10015', '1000200', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2355');
INSERT INTO `sys_role_function` VALUES ('10015', '1000300', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2356');
INSERT INTO `sys_role_function` VALUES ('10015', '1000400', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2357');
INSERT INTO `sys_role_function` VALUES ('10015', '1000401', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2358');
INSERT INTO `sys_role_function` VALUES ('10015', '1000402', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2359');
INSERT INTO `sys_role_function` VALUES ('10015', '1000403', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2360');
INSERT INTO `sys_role_function` VALUES ('10015', '1000404', '2014-06-03 09:33:17', '2014-06-03 09:33:17', 'admin', '2361');

-- ----------------------------
-- Table structure for `sys_seq`
-- ----------------------------
DROP TABLE IF EXISTS `sys_seq`;
CREATE TABLE `sys_seq` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SEQ_NAME` varchar(50) NOT NULL COMMENT '参数值',
  `SEQ_VALUE` int(11) NOT NULL COMMENT '序列值',
  `PREFIX` varchar(50) DEFAULT NULL COMMENT '前缀',
  `POSTFIX` varchar(50) DEFAULT NULL COMMENT '后缀',
  `SIZE` int(11) NOT NULL COMMENT '长度',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEX_SEQ_NAME` (`SEQ_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='序列表';

-- ----------------------------
-- Records of sys_seq
-- ----------------------------
INSERT INTO `sys_seq` VALUES ('2', 'TXNO', '227', 'S', 'E', '12');
INSERT INTO `sys_seq` VALUES ('3', 'CARDNUM', '21', 'PM', null, '17');
INSERT INTO `sys_seq` VALUES ('4', 'BATCHCARDNUM', '3', '1', null, '9');
INSERT INTO `sys_seq` VALUES ('5', 'PAYNUM', '7', null, null, '6');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(22) NOT NULL AUTO_INCREMENT,
  `BIRTH_DATE` datetime DEFAULT NULL,
  `CARDID` varchar(20) DEFAULT NULL,
  `IS_ADMIN` varchar(1) DEFAULT NULL,
  `PASSWORD` varchar(128) DEFAULT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `TEL` varchar(11) DEFAULT NULL,
  `USER_CODE` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `MSN` varchar(32) DEFAULT NULL,
  `QQ` varchar(32) DEFAULT NULL,
  `PASSQUESTION` varchar(32) DEFAULT NULL,
  `PASSANSWER` varchar(32) DEFAULT NULL,
  `INTRODUCTION` text,
  `EMAIL` varchar(32) DEFAULT NULL,
  `HEAD_PATH` varchar(255) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `REMARK` text,
  `LOGIN_TIME` datetime DEFAULT NULL,
  `LOGOUT_TIME` datetime DEFAULT NULL,
  `ERROR_COUNT` bigint(22) DEFAULT NULL,
  `SUCCESS_COUNT` bigint(22) NOT NULL DEFAULT '0',
  `IS_ALLOW_FRIEND` varchar(1) DEFAULT NULL,
  `TRADE_PASSWORD` varchar(20) DEFAULT NULL,
  `USER_REFEREE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `PRIMARYSYS_USER1` (`USER_ID`) ,
  UNIQUE KEY `PRIMARYSYS_USER_CODE` (`USER_CODE`) 
) ENGINE=InnoDB AUTO_INCREMENT=10322 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2014-03-08 00:00:00', '35068119880924103X', '1', '5f4dcc3b5aa765d61d8327deb882cf99', '0', '1', '12345678909', 'admin', '管理员', 'ee@qq.com', '410229816', null, null, '好人一个', '410229816@qq.com', 'myfile/46e2ec19d70a466caeedde300dc540ab_small.jpg', '2014-03-08 13:08:33', '2014-08-22 18:06:22', 'admin', null, '2014-08-22 18:06:22', '2014-06-08 23:23:21', '0', '2026', null, null, null);
INSERT INTO `sys_user` VALUES ('10240', null, null, null, '80ebc1e12a0b65bd9739c832d6a1b2ea', null, null, '18950179627', 'Teddy', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-01 21:44:05', '2014-06-01 21:44:05', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10241', null, null, '1', 'f7bd7c47f4073e5d035aea618b749813', null, '1', '15880208800', 'wush', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-01 21:59:46', '2014-06-08 10:25:00', null, null, '2014-06-08 10:25:00', null, '0', '2', '0', null, null);
INSERT INTO `sys_user` VALUES ('10244', null, null, '1', 'eed8d0921afedb6d53a2583d21011fbb', null, '1', '', 'morris', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-02 11:43:10', '2014-06-07 13:22:31', null, null, '2014-06-05 14:27:16', '2014-06-05 12:19:54', '2', '3', '0', null, null);
INSERT INTO `sys_user` VALUES ('10245', '1984-08-17 00:00:00', '35000000000000000000', '1', '92636166b27480bfa3a1761f5610e2b4', '1', null, '15880208870', 'fengkong', 'fengkong', null, null, null, null, null, 'wushanhu535@163.com', 'myfile/noface.jpg', '2014-06-02 15:44:39', '2014-08-22 18:05:17', null, null, '2014-06-08 21:05:05', '2014-06-08 18:15:34', '1', '73', '0', null, null);
INSERT INTO `sys_user` VALUES ('10246', '1984-08-17 00:00:00', '350000000000000000', '1', 'd3cf368d453780b0cd4308f2d0f0e90b', '1', null, '15880208871', 'hegui', 'hegui', null, null, null, null, null, 'wushanu105@163.com', 'myfile/noface.jpg', '2014-06-02 15:47:24', '2014-06-08 23:00:29', null, null, '2014-06-08 23:00:29', '2014-06-07 16:38:40', '0', '44', '0', null, null);
INSERT INTO `sys_user` VALUES ('10247', null, null, null, '55270462c1f39e89aa0a36e5b1c376ab', null, null, '13770000000', 'wushTest', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-02 17:01:42', '2014-06-30 23:01:58', null, null, '2014-06-30 23:01:58', null, '0', '1', '0', null, null);
INSERT INTO `sys_user` VALUES ('10249', null, null, null, '29f016a62d5a6af0768d3e6c92eacd99', null, null, '15159290000', 'kangyc', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-02 23:19:52', '2014-06-03 10:40:26', null, null, '2014-06-02 23:20:29', null, '1', '1', '0', null, null);
INSERT INTO `sys_user` VALUES ('10250', '2014-06-03 00:00:00', '1234578901', '1', '99b47f02926077867f9fc2de214d5257', '1', null, '1234578901', 'caiwu', '财务', null, null, null, null, null, '12@qq.com', 'myfile/noface.jpg', '2014-06-03 00:58:45', '2014-06-08 23:01:19', null, null, '2014-06-08 23:01:19', '2014-06-05 09:29:48', '0', '18', '0', null, null);
INSERT INTO `sys_user` VALUES ('10251', '1993-04-04 00:00:00', '411381199304044831', '1', '44bf025d27eea66336e5c1133c3827f7', '1', null, '15816840090', '123456', 'morris', null, null, null, null, null, '130290801@qq.com', 'myfile/noface.jpg', '2014-06-03 09:47:43', '2014-06-08 17:07:21', null, null, '2014-06-08 17:07:21', '2014-06-08 17:59:50', '0', '23', '0', null, null);
INSERT INTO `sys_user` VALUES ('10252', null, null, null, 'c027184be0bf840c10438c08e722b213', null, null, '15060212345', 'dubei', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 10:37:08', '2014-06-03 10:40:40', null, null, '2014-06-03 10:40:40', null, '0', '2', '0', null, null);
INSERT INTO `sys_user` VALUES ('10253', null, null, null, '47daaac6799c87b083dddf7b4016de7f', null, null, '15888888888', 'wushTest1', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 13:44:03', '2014-06-03 13:44:03', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10260', null, null, null, '306e68cfe76a5df9e36f31e66e621316', null, null, '15888888811', 'wushTest4', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 18:42:57', '2014-06-03 18:42:57', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10261', null, null, null, '3e287110a6801a6e7799349a44ec18e0', null, null, '18650011033', 'haha', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 18:44:25', '2014-06-03 18:44:25', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10262', null, null, null, '7dedce0150f67bc82a84e5a69a7c729e', null, null, '15880208333', 'coral_hero', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 20:04:51', '2014-06-03 20:04:51', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10263', null, null, null, 'f1ad77143a8cc5a647038dbe14f6e0b6', null, null, '13559220222', '中国胖毛在线', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 20:26:35', '2014-06-03 20:26:35', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10264', null, null, null, 'd959caadac9b13dcb3e609440135cf54', null, null, '15980814562', '12345678', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 21:43:15', '2014-06-03 21:43:15', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10266', null, null, null, 'ab28a7cf779b9fe8b5db3b6b7eb09e76', null, null, '15q', 'cicici', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 21:47:24', '2014-06-03 21:47:24', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10267', null, '11223344556677889a', null, '70d9c934f3be452fbf7d76fc2b50b035', '1', null, '15960398480', 'kangyc2', '康英材2', null, null, null, null, null, '410229816@qq.com', 'myfile/noface.jpg', '2014-06-03 21:52:23', '2014-06-08 20:20:00', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10268', null, null, null, '5037b90a725a3a015b9a1e35ff90a396', null, null, '15159900126', 'kangyc3', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-03 21:55:24', '2014-06-03 21:55:24', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10271', null, null, null, '6512bd43d9caa6e02c990b0a82652dca', null, null, '15203875971', '1', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-04 09:18:18', '2014-06-04 09:18:18', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10272', null, null, null, 'c34cd4e888815dae4471bafe66ba8e5c', null, null, '15816850011', 'yang199344', null, null, null, null, null, null, null, 'myfile/noface.jpg', '2014-06-04 09:21:26', '2014-06-04 09:21:26', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10273', null, null, null, '65da9d44ce7f62bb51b1976969285e14', null, null, '18659203280', 'wangsusu', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-04 20:35:45', '2014-06-04 20:35:45', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10274', null, null, null, '8e744d01002f9b143c277f0be5fa0083', null, null, '15060734522', 'beibeidu', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-05 08:48:08', '2014-06-05 08:48:08', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10275', null, null, null, '00368610fb49376c280014c330a8ec9d', null, null, '', '', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-05 11:14:42', '2014-06-05 11:14:42', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10276', null, null, null, '020c44a7351acec000d41ec8c7b07615', null, null, null, 'fang33', null, null, null, null, null, null, 'xmfang1@163.com', 'myfile/noface.jpg', '2014-06-05 11:17:28', '2014-06-05 11:17:28', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10277', null, null, null, 'f1d4adff22e24630e7d3acd97c8c7fe4', null, null, '18606036400', '骆森帆香肠嘴', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-05 11:17:51', '2014-06-05 11:17:51', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10278', null, null, null, 'a2b522c2944c6bbe081fa996af714004', null, null, '13400662557', 'xiuzishi', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-05 11:52:40', '2014-06-05 11:52:40', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10279', null, null, null, '4fe72097f0067511bdd5adaf3b6d04d9', null, null, null, '243333535@qq.com', null, null, null, null, null, null, '243333535@qq.com', 'myfile/noface.jpg', '2014-06-05 15:42:21', '2014-06-05 15:42:21', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10280', null, null, null, '1a0ab46a07d11550a9ab204ed66f35c5', null, null, '13779990407', 'shanhu', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-06 00:25:33', '2014-06-06 00:25:33', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10281', '2014-06-06 00:00:00', '35052419840812000x', '1', 'ba0b1528130f528889647ac951993324', '1', null, '1111', 'houtai', '客户经理', null, null, null, null, null, '111@163.COM', 'myfile/noface.jpg', '2014-06-06 00:29:45', '2014-06-08 20:02:14', null, null, '2014-06-08 20:02:14', '2014-06-08 15:19:32', '0', '3', '0', null, null);
INSERT INTO `sys_user` VALUES ('10282', '2014-06-06 00:00:00', '35052419840812000x', '1', 'fa6280675194a0e98257adf18ef2cc75', '1', null, '1111', 'cust_manager', '客户经理1', null, null, null, null, null, '11111222@163.COM', 'myfile/noface.jpg', '2014-06-06 00:43:14', '2014-06-08 21:16:01', null, null, '2014-06-08 21:16:00', '2014-06-08 22:56:04', '0', '36', '0', null, null);
INSERT INTO `sys_user` VALUES ('10284', null, null, null, 'e8d475cf4b03ce7acd061e0612ffe60e', null, null, '15159290665', 'baofeng', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-06 21:12:58', '2014-06-06 21:12:58', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10285', null, null, null, '854dc0b2a5abb76dac6d2cf0558c86b9', null, ' ', '15880208111', 'wush1', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 11:33:26', '2014-06-07 11:33:26', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10286', null, null, null, 'c6671d822b1ddab982d36d7acda43677', null, null, '15880208811', 'wush2', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 13:30:44', '2014-06-07 13:30:44', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10287', null, '11223344556677889a', null, '19e593287e41a7ea8b4eefb5122fd4b7', '1', null, '15159290666', 'tiankong', '天空', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 14:32:49', '2014-06-07 15:23:15', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10288', null, '', null, 'b3b80eb5bea6d1ac8d46180fb40106a2', '1', null, '15159290664', 'dadi', '', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 15:28:31', '2014-06-07 17:41:54', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10289', null, '11223344556677889a', null, '74904d6980b02ae9f889cb8ed753bbe7', '1', null, '15159290664', 'canglan', '苍蓝', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 15:54:25', '2014-06-07 23:11:56', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10290', '2014-06-04 00:00:00', '11223344556677889z', '1', 'e16b2ab8d12314bf4efbd6203906ea6c', '1', null, '15159290664', 'test', '测试', null, null, null, null, null, '461452502@qq.com', 'myfile/noface.jpg', '2014-06-07 16:32:38', '2014-06-07 23:20:57', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10291', null, '41139119920003', null, 'b3d6c58914051faa04c58e47dc79da24', '1', null, '15880208111', 'wush5', '吴珊瑚5', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 17:16:04', '2014-06-07 17:25:53', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10292', null, null, null, 'aefcf2959aed20ce4acc27d2622c32d9', null, null, '15816850010', 'admin1', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 18:45:52', '2014-06-07 18:45:52', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10293', null, null, null, '96b5ccde02750c9865ffdd3aba265daf', null, null, '15816850020', 'admin2', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 18:51:30', '2014-06-07 18:51:30', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10294', null, null, null, 'fccd77eb0e66c41ad681650d2df03dc8', null, null, '15816150090', 'admin12', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 19:00:31', '2014-06-07 19:00:31', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10295', null, null, null, '85f71780a0b04c6c2289b2f24eb91555', null, null, '15816852090', 'admin1213', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 19:18:53', '2014-06-07 19:18:53', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10296', null, null, null, '2569d419bfea999ff13fd1f7f4498b89', null, null, '15816851090', 'qwe', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 19:26:01', '2014-06-07 19:26:01', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10306', null, null, null, 'b8114f251cc61970d3b01a1e5f644a6c', null, null, '11111', 'wush6', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 22:10:43', '2014-06-07 22:10:43', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10307', null, null, null, '04ebe1a7d84b7f81329361eb2d03ddde', null, null, '15880208871', 'wush7', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-07 22:16:22', '2014-06-07 22:29:16', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10308', null, null, null, 'd15ba7cc5f57e0eff93a58717ede7822', null, null, '15980817468', 'daniel', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 10:12:11', '2014-06-08 10:12:11', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10309', null, '350524198408172513', null, 'a18cd9ea0c9e110ee3965c5ee9770991', '1', null, '1588020881', 'wush8', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 10:15:22', '2014-06-08 10:22:03', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10310', null, null, null, '71f6f999c34a550610a3a555ad4b2af4', null, null, '18650806652', 'dubeibei', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 11:24:50', '2014-06-08 11:24:50', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10311', null, '350524198408172514', null, '31f0ff26e23388e6fbe1db192ea39774', '1', null, '15880208112', 'wush535', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 11:58:55', '2014-06-08 12:14:56', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10312', null, null, null, 'e58907b793cfc550f9824e5fea4ad499', null, null, '15880208811', 'wushTest535', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 12:20:52', '2014-06-08 12:20:52', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10313', null, null, null, 'a3c18f44bb40311921701652cf9a0872', null, null, '15816850490', 'morris1', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 15:18:14', '2014-06-08 15:18:14', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10314', null, '35068119060924103X', null, '985efc00ed3a3d418ca02b9c2965e3e5', '1', null, '1588020811', 'wushTest111', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 15:27:22', '2014-06-08 16:06:08', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10315', null, '333333333333333333', null, 'd0243956eef77b11b86154f10c4233b6', '1', null, '15880208811', '11111', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 16:05:20', '2014-06-08 20:43:09', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10316', null, null, null, '2901b9ab531fd3c4d9df4d1209d65836', null, null, '15880208872', 'wush222', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 16:28:25', '2014-06-08 23:21:48', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10317', null, null, null, 'cd3df81d65cbced8ace42a42dd786da2', null, null, '15816850090', 'morris12', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 16:32:27', '2014-06-08 16:32:27', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10318', null, '350524198408172514', null, '12789474bb1349b42976821faa11f9a2', '1', null, '15880208871', '22222', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 16:53:37', '2014-06-08 16:58:03', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10319', null, '123456789012345678', null, '49c138f0b16f4a0551a6d902296bdb9e', '1', null, '15880208811', '33333', '吴珊瑚', null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 19:09:58', '2014-06-08 21:03:17', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10320', '2014-06-05 00:00:00', '11223344556677889z', '1', 'e91f96091b6c2b83b2e7022750cf9efa', '1', null, '15159290664', 'kk', '苍白', null, null, null, null, null, '3343444@qq.com', 'myfile/noface.jpg', '2014-06-08 21:12:09', '2014-06-08 21:14:08', null, null, null, null, '0', '0', '0', null, null);
INSERT INTO `sys_user` VALUES ('10321', null, null, null, '8fcfc0d024736df126f7904566068924', null, null, '15880208872', '44444', null, null, null, null, null, null, '', 'myfile/noface.jpg', '2014-06-08 21:16:00', '2014-06-08 21:16:00', null, null, null, null, '0', '0', '0', null, null);

-- ----------------------------
-- Table structure for `sys_user_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(22) DEFAULT NULL,
  `DEPT_ID` bigint(22) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PRIMARYSYS_USER_DEPT1` (`USER_ID`,`DEPT_ID`) ,
  KEY `IDX_FKAAB4FB27276746DFSYS_USER` (`USER_ID`) ,
  KEY `IDX_FKAAB4FB278CCD7C9FSYS_USER` (`DEPT_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO `sys_user_dept` VALUES ('103', '10245', '1', '2014-06-02 15:47:14', '2014-06-02 15:47:14', 'admin');
INSERT INTO `sys_user_dept` VALUES ('104', '10246', '1', '2014-06-02 15:48:26', '2014-06-02 15:48:26', 'admin');
INSERT INTO `sys_user_dept` VALUES ('106', '10250', '1', '2014-06-03 00:59:42', '2014-06-03 00:59:42', 'admin');
INSERT INTO `sys_user_dept` VALUES ('112', '10251', '1', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin');
INSERT INTO `sys_user_dept` VALUES ('113', '10281', '1', '2014-06-06 00:30:54', '2014-06-06 00:30:54', 'admin');
INSERT INTO `sys_user_dept` VALUES ('114', '10282', '1', '2014-06-06 00:44:10', '2014-06-06 00:44:10', 'admin');
INSERT INTO `sys_user_dept` VALUES ('115', '1', '1', '2014-06-07 11:40:54', '2014-06-07 11:40:54', 'admin');
INSERT INTO `sys_user_dept` VALUES ('116', '10290', '1', '2014-06-07 16:33:03', '2014-06-07 16:33:03', 'admin');
INSERT INTO `sys_user_dept` VALUES ('117', '10320', '1', '2014-06-08 21:12:20', '2014-06-08 21:12:20', 'admin');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ID` bigint(22) DEFAULT NULL,
  `ROLE_ID` bigint(22) DEFAULT NULL,
  `SYS_CREATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_TIME` datetime DEFAULT NULL,
  `SYS_UPDATE_USER` varchar(32) DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PRIMARYSYS_USER_ROLE1` (`USER_ID`,`ROLE_ID`) ,
  KEY `IDX_FKAABB7D58276746DFSYS_USER` (`USER_ID`) ,
  KEY `IDX_FKAABB7D58823C82FFSYS_USER` (`ROLE_ID`) 
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('10245', '10008', '2014-06-02 15:47:14', '2014-06-02 15:47:14', 'admin', '117');
INSERT INTO `sys_user_role` VALUES ('10246', '10009', '2014-06-02 15:48:26', '2014-06-02 15:48:26', 'admin', '118');
INSERT INTO `sys_user_role` VALUES ('10250', '10013', '2014-06-03 00:59:42', '2014-06-03 00:59:42', 'admin', '120');
INSERT INTO `sys_user_role` VALUES ('10251', '1', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin', '146');
INSERT INTO `sys_user_role` VALUES ('10251', '10008', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin', '147');
INSERT INTO `sys_user_role` VALUES ('10251', '10009', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin', '148');
INSERT INTO `sys_user_role` VALUES ('10251', '10010', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin', '149');
INSERT INTO `sys_user_role` VALUES ('10251', '10013', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin', '150');
INSERT INTO `sys_user_role` VALUES ('10251', '10014', '2014-06-05 11:59:35', '2014-06-05 11:59:35', 'admin', '151');
INSERT INTO `sys_user_role` VALUES ('10281', '10010', '2014-06-06 00:30:54', '2014-06-06 00:30:54', 'admin', '152');
INSERT INTO `sys_user_role` VALUES ('10282', '10010', '2014-06-06 00:44:10', '2014-06-06 00:44:10', 'admin', '153');
INSERT INTO `sys_user_role` VALUES ('1', '1', '2014-06-07 11:40:54', '2014-06-07 11:40:54', 'admin', '154');
INSERT INTO `sys_user_role` VALUES ('1', '10013', '2014-06-07 11:40:54', '2014-06-07 11:40:54', 'admin', '155');
INSERT INTO `sys_user_role` VALUES ('10290', '1', '2014-06-07 16:33:03', '2014-06-07 16:33:03', 'admin', '156');
INSERT INTO `sys_user_role` VALUES ('10320', '1', '2014-06-08 21:12:20', '2014-06-08 21:12:20', 'admin', '157');

-- ----------------------------
-- Function structure for `11`
-- ----------------------------
DROP FUNCTION IF EXISTS `11`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `11`(rootId INT) RETURNS text CHARSET utf8
BEGIN
DECLARE sTemp text;
DECLARE sTempChd text;
SET sTemp = '$';
SET sTempChd =cast(rootId as CHAR);
WHILE sTempChd is not null DO
SET sTemp = concat(sTemp,',',sTempChd);
SELECT group_concat(dept_id) INTO sTempChd FROM sys_dept where FIND_IN_SET(parent_dept_id,sTempChd)>0;
END WHILE;
RETURN SUBSTRING(sTemp,3);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getChildDeptIdList`
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildDeptIdList`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getChildDeptIdList`(rootId INT) RETURNS text CHARSET utf8
BEGIN
DECLARE sTemp text;
DECLARE sTempChd text;
SET sTemp = '$';
SET sTempChd =cast(rootId as CHAR);
WHILE sTempChd is not null DO
SET sTemp = concat(sTemp,',',sTempChd);
SELECT group_concat(dept_id) INTO sTempChd FROM sys_dept where FIND_IN_SET(parent_dept_id,sTempChd)>0;
END WHILE;
RETURN SUBSTRING(sTemp,3);
END
;;
DELIMITER ;
