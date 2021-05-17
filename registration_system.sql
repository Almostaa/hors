/*
 Navicat Premium Data Transfer

 Source Server         : work
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : registration_system

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 01/12/2020 13:09:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apptinfo
-- ----------------------------
DROP TABLE IF EXISTS `apptinfo`;
CREATE TABLE `apptinfo`  (
  `apptNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '挂号订单编号',
  `usno` int(11) DEFAULT NULL COMMENT '用户编号',
  `dno` int(11) DEFAULT NULL COMMENT '医生编号',
  `state` int(20) DEFAULT NULL COMMENT '支付状态，1已支付，0未支付',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `overTime` datetime DEFAULT NULL COMMENT '关闭时间',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '挂号费',
  `apptDate` date DEFAULT NULL COMMENT '预约日期',
  `apptTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '预约时间段',
  PRIMARY KEY (`apptNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of apptinfo
-- ----------------------------
INSERT INTO `apptinfo` VALUES (1, 1, 101, 1, '2020-10-13 18:13:07', '2020-10-13 13:03:17', 5.00, '2020-11-23', '9:00-11:00');
INSERT INTO `apptinfo` VALUES (2, 2, 102, 1, '2020-10-09 18:13:11', '2020-11-21 11:26:05', 6.00, '2020-10-12', '2:00-4:00');
INSERT INTO `apptinfo` VALUES (3, 1, 101, 0, '2019-10-12 15:19:28', NULL, 5.00, '2019-10-12', '上午');
INSERT INTO `apptinfo` VALUES (4, 1, 101, 0, '2020-11-20 08:55:24', NULL, 3.00, '2020-11-20', '下午');
INSERT INTO `apptinfo` VALUES (85, 8, 101, 0, '2020-11-24 14:21:02', NULL, 3.00, '2020-11-26', '上午');
INSERT INTO `apptinfo` VALUES (86, 8, 101, 1, '2020-11-24 14:22:51', '2020-11-24 14:25:14', 3.00, '2020-11-26', '上午');
INSERT INTO `apptinfo` VALUES (92, 8, 101, 0, '2020-11-24 15:06:17', NULL, 3.00, '2020-11-25', '下午');
INSERT INTO `apptinfo` VALUES (93, 16, 101, 1, '2020-11-26 13:58:56', '2020-11-26 14:00:59', 3.00, '2020-11-27', '下午');
INSERT INTO `apptinfo` VALUES (94, 16, 101, 0, '2020-11-26 14:00:15', NULL, 3.00, '2020-11-27', '下午');
INSERT INTO `apptinfo` VALUES (97, 16, 101, 1, '2020-11-26 14:08:54', '2020-11-26 14:09:22', 3.00, '2020-11-27', '下午');
INSERT INTO `apptinfo` VALUES (98, 17, 101, 0, '2020-11-30 20:34:23', NULL, 3.00, '2020-12-03', '上午');
INSERT INTO `apptinfo` VALUES (99, 17, 101, 1, '2020-11-30 20:34:30', '2020-11-30 20:35:50', 3.00, '2020-12-01', '上午');
INSERT INTO `apptinfo` VALUES (100, 20, 101, 0, '2020-11-30 20:44:07', NULL, 3.00, '2020-12-01', '上午');
INSERT INTO `apptinfo` VALUES (101, 20, 101, 1, '2020-11-30 20:45:25', '2020-11-30 20:45:52', 3.00, '2020-12-01', '上午');

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge`  (
  `chargeNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '收费编号',
  `grade` int(11) DEFAULT NULL COMMENT '等级',
  `fee` double(10, 2) DEFAULT NULL COMMENT '费用',
  `priceTypeNo` int(11) DEFAULT NULL COMMENT '价格类型编号',
  PRIMARY KEY (`chargeNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of charge
-- ----------------------------
INSERT INTO `charge` VALUES (1, 1, 2.00, 1);
INSERT INTO `charge` VALUES (2, 2, 3.00, 1);
INSERT INTO `charge` VALUES (3, 3, 5.00, 1);
INSERT INTO `charge` VALUES (4, 4, 6.00, 1);
INSERT INTO `charge` VALUES (5, 2, 5.00, 2);
INSERT INTO `charge` VALUES (6, 3, 10.00, 2);
INSERT INTO `charge` VALUES (7, 4, 20.00, 2);
INSERT INTO `charge` VALUES (8, 1, 3.00, 2);

-- ----------------------------
-- Table structure for charge_type
-- ----------------------------
DROP TABLE IF EXISTS `charge_type`;
CREATE TABLE `charge_type`  (
  `priceTypeNo` int(255) NOT NULL AUTO_INCREMENT COMMENT '价格类型编号',
  `priceTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '问诊费，挂号费。。',
  PRIMARY KEY (`priceTypeNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of charge_type
-- ----------------------------
INSERT INTO `charge_type` VALUES (1, '挂号费');
INSERT INTO `charge_type` VALUES (2, '诊疗费');

-- ----------------------------
-- Table structure for consultinfo
-- ----------------------------
DROP TABLE IF EXISTS `consultinfo`;
CREATE TABLE `consultinfo`  (
  `consultNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '门诊订单编号',
  `usno` int(11) DEFAULT NULL COMMENT '用户编号',
  `dno` int(11) DEFAULT NULL COMMENT '医生编号',
  `state` int(2) DEFAULT NULL COMMENT '支付状态',
  `startTime` datetime DEFAULT NULL COMMENT '创建时间',
  `endTime` datetime DEFAULT NULL COMMENT '关闭时间',
  `price` double(10, 2) DEFAULT NULL COMMENT '问诊费',
  PRIMARY KEY (`consultNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of consultinfo
-- ----------------------------
INSERT INTO `consultinfo` VALUES (1, 1, 101, 1, '2020-10-14 22:10:04', '2020-10-15 01:03:59', 20.00);
INSERT INTO `consultinfo` VALUES (2, 1, 102, 0, '2020-10-14 22:10:08', '2020-10-15 01:04:06', 80.00);
INSERT INTO `consultinfo` VALUES (3, 1, 103, 0, '2020-10-21 22:10:12', '2020-10-22 01:04:10', 65.00);
INSERT INTO `consultinfo` VALUES (64, 16, 102, 1, '2020-11-26 21:48:51', '2020-11-26 21:49:02', 20.00);
INSERT INTO `consultinfo` VALUES (65, 16, 101, 0, NULL, NULL, 5.00);
INSERT INTO `consultinfo` VALUES (66, 17, 102, 0, NULL, NULL, 20.00);
INSERT INTO `consultinfo` VALUES (67, 17, 103, 1, '2020-11-28 14:10:32', '2020-11-28 14:12:08', 3.00);
INSERT INTO `consultinfo` VALUES (68, 17, 104, 1, '2020-11-30 20:01:56', '2020-11-30 20:12:14', 5.00);
INSERT INTO `consultinfo` VALUES (69, 17, 102, 1, '2020-11-30 20:33:38', '2020-11-30 20:33:42', 20.00);
INSERT INTO `consultinfo` VALUES (70, 20, 102, 1, '2020-12-01 12:39:56', '2020-12-01 12:54:34', 20.00);
INSERT INTO `consultinfo` VALUES (71, 20, 102, 1, '2020-12-01 12:55:14', '2020-12-01 12:58:22', 20.00);
INSERT INTO `consultinfo` VALUES (72, 20, 102, 1, '2020-12-01 12:59:49', '2020-12-01 13:01:52', 20.00);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `dno` int(10) NOT NULL AUTO_INCREMENT COMMENT '医生编号',
  `dname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '医生姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '医生性别',
  `roomNo` int(11) DEFAULT NULL COMMENT '科室编号',
  `rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职称',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '等级',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`dno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (101, '张三丰', '男', 1, '主治医师', '2', '创立武当派、振兴道教、发扬太极拳、武学泰山北斗', '1.png');
INSERT INTO `doctor` VALUES (102, '华佗', '男', 1, '主任医师', '4', '外科鼻祖，发明麻沸散、五禽戏，爱吃饭', '2.png');
INSERT INTO `doctor` VALUES (103, '李时珍', '女', 1, '住院医师', '1', '明代著名医药学家。与“医圣”万密斋齐名，古有“万密斋的方，李时珍的药”之说。', '3.png');
INSERT INTO `doctor` VALUES (104, '张文', '男', 2, '主治医师', '2', '擅长心血管疾病诊治、预防、随访管理。尤其是难治性高血压、心房颤动、冠心病、心力衰竭的诊治，相关慢病如高脂血症、睡眠障碍的防治管理', '4.png');
INSERT INTO `doctor` VALUES (105, '徐伟海', '男', 2, '副主任医师', '3', '疑难脑卒中，青年卒中，中枢神经系统疾病疑难疾病，头晕，头痛，癫痫，帕金森病，痴呆和其他危重神经系统疾病。世界神经病学联盟神经超声执委会委员，中国医师协会神经超声专委会主任委员，中国研究型医院协会神经科学专委会副主任委员。', '5.png');
INSERT INTO `doctor` VALUES (106, '王文军', '男', 3, '主任医师', '4', '熟练掌握各类血管外科疾病的开放手术和腔内介入微创治疗，如各种类型儿童血管瘤和脉管畸形，肾动脉狭窄性高血压，输液港植入，主动脉缩窄，儿童血液透析通路的建立，儿童深静脉血栓，动脉血栓性疾病，多发性大动脉炎，血管损伤等疾病的诊治。', '8.png');
INSERT INTO `doctor` VALUES (107, '李晓晓', '女', 3, '主治医师', '2', '从事儿内科临床工作多年，擅长新生儿科  缺氧缺血性脑病的评估、预后及早期干预及儿内科的呼吸系统及消化系统疾病。毕业后一直从事儿内科工作。1998.10-至今一直从事新生儿科工作。', '9.png');
INSERT INTO `doctor` VALUES (108, '张瑞', '男', 2, '主治医师', '2', '主要从事重型肝炎发病机制研究。开展细胞因子引起肝坏死机制研究；开展乙肝病毒基因变异引起重型肝炎免疫异常研究；开展细胞因子对肾小球前小动脉平滑肌细胞内IP3受体过度表达基因调控研究；开展重型肝炎和肝硬化肝血流和肾血流异常发生机制研究；开展细胞因子对脑水肿发生的影响的研究；开展感染性休克时细胞因子引起心肌细胞损伤、循环衰竭机制研究。', '10.png');
INSERT INTO `doctor` VALUES (109, '苏皖', '男', 1, '住院医师', '1', '病毒性肝炎，肝硬化，不明原因肝损伤，肾综合征出血热，新型布尼亚病毒感染所致的发热伴血小板减少综合征及常见传染病的诊治', '11.png');
INSERT INTO `doctor` VALUES (112, '蒋若云', '女', 4, '副主任医师', '3', '擅长各种妇产科良恶性肿瘤的微创手术治疗：子宫颈癌根治性手术；子宫内膜癌分期手术；早期卵巢癌分期手术；晚期卵巢癌肿瘤细胞减灭术；年轻宫颈癌患者保留生育功能手术；深部子宫内膜异位症根治术；腹腔镜下阴道顶端骶骨悬吊术；腹腔镜下重度盆腔及肠道粘连分离术；宫腔镜下系列手术。', '12.png');
INSERT INTO `doctor` VALUES (113, '杨琳琳', '女', 5, '住院医师', '1', '擅长各种妇产科疾病的诊断治疗，在处理产科急危重症和妊娠合并症并发症中有丰富经验。', '13.png');
INSERT INTO `doctor` VALUES (114, '黄玉峰', '男', 6, '住院医师', '1', '男性不育、性功能障碍、生殖道感染（前列腺炎、精囊炎、附睾炎、睾丸炎、尿道炎）、迟发性性腺功能减退症（男性更年期综合征）、阴茎硬结症（Peyronie病）', '11.png');
INSERT INTO `doctor` VALUES (115, '张尚俊', '男', 7, '副主任医师', '3', '男性常见疾病的诊断与治疗。', '7.png');
INSERT INTO `doctor` VALUES (116, '汪洋', '男', 8, '住院医师', '1', '焦虑症、抑郁症、进食障碍、失眠症、强迫症，以及各类常见情绪情感问题，失眠及人际关系问题。', '14.png');
INSERT INTO `doctor` VALUES (117, '艾克华', '男', 9, '主治医师', '2', '擅长失眠、抑郁症、焦虑症、强迫症、躯体形式障碍、精神分裂症、老年痴呆等病的诊断及治疗，对于考前紧张、社交恐怖、恋爱婚姻及家庭问题的心理疏导与治疗有独到之处。', '15.png');
INSERT INTO `doctor` VALUES (118, '林枫', '男', 10, '主治医师', '2', ' 擅长红斑狼疮、硬皮病等自身免疫性皮肤病的诊治，对皮炎、湿疹、荨麻疹、药疹等过敏性疾病，以及白癜风、黄褐斑、银屑病和痤疮、疱疹、皮肤癣病有独特的治疗经验。', '16.png');
INSERT INTO `doctor` VALUES (119, '阚青堃', '女', 5, '住院医师', '1', '主要致力于毛发疾病发病机制和治疗的研究、常见皮肤病（痤疮、白癜风、银屑病、湿疹等）的中西医结合治疗和皮肤病的药物临床试验，负责并参与多中心临床研究40余项。', '17.png');
INSERT INTO `doctor` VALUES (120, '杜家坎', '男', 11, '副主任医师', '3', '中医肾病、糖尿病、肾炎、IgA肾病、肾病综合征、泌尿系统感染、糖尿病、狼疮性肾病、肿瘤、男性疾病、胃炎等', '18.png');
INSERT INTO `doctor` VALUES (121, '冯美玲', '女', 12, '主治医师', '2', '中西医结合诊治消化系统疾病（溃疡性结肠炎、乙肝、慢性胃炎）、肾脏病（包括慢性肾功能不全、狼疮性肾炎、糖尿病肾病、急慢性肾炎等）、肿瘤（晚期肿瘤的综合治疗）等疾病。', '19.png');
INSERT INTO `doctor` VALUES (122, '王全', '男', 5, '主治医师', '2', '主要研究领域为恶性肿瘤（胃肠肿瘤）的内科治疗，特别擅长分子靶向与免疫治疗', '20.png');
INSERT INTO `doctor` VALUES (123, '别发咍', '男', 14, '主任医师', '4', '常见实体肿瘤的诊治，尤其是脑肿瘤包括脑转移癌的内科治疗', '21.png');
INSERT INTO `doctor` VALUES (124, '郝颖', '男', 13, '住院医师', '1', ' 股骨头坏死，髋臼发育不良，老年膝关节骨关节炎，类风湿性关节炎，强直性脊柱炎，复杂人工关节置换、人工关节翻修手术', '22.png');
INSERT INTO `doctor` VALUES (125, '余林东', '男', 28, '主治医师', '2', '颈椎病、腰椎滑脱、椎管内肿瘤、脊柱侧弯、脊柱感染性疾病及骨科疑难杂症的诊断和治疗。', '6.png');
INSERT INTO `doctor` VALUES (126, '向浩', '男', 28, '住院医师', '1', '专业特长：嗓音疾病及喉癌、咽喉肿瘤治疗。1、 嗓音疾病治疗：声带息肉、声带粘连、声带麻痹、气管狭窄的微创治疗。2、 喉癌前病变治疗：声带白斑、喉白斑、肥厚性喉炎、喉乳头状瘤的微创手术。3、 喉癌、喉咽癌治疗：早期喉癌的微创手术，中晚期喉癌保留讲话功能的喉部分治疗。4、 晚期喉癌全喉切除术后发声重建恢复讲话功能。5、 扁桃体癌、喉咽癌、咽旁肿瘤、颈淋巴结转移的外科治疗及综合治疗；复杂喉癌、咽喉肿瘤外科治疗，头颈肿瘤术后组织缺损修复（胸大肌皮瓣、股外侧瓣、前臂皮瓣、锁骨上皮瓣、游离空肠等修复术后组织缺损）。', '7.png');
INSERT INTO `doctor` VALUES (127, '向军', '男', 29, '主任医师', '4', '诊治角膜病、化学伤、干眼症、翼状胬肉、角膜移植、羊膜移植、结膜移植、义眼座植入、泪道置管、倒睫等。 擅长肉毒素注射治疗眼睑痉挛，去除脸部细纹（包括抬头纹，鱼尾纹，皱眉紋），瘦脸（v脸）', '25.png');
INSERT INTO `doctor` VALUES (128, '王文东', '男', 15, '副主任医师', '3', '1.慢性软组织疼痛：关节和脊柱周围疾病、带状疱疹后遗神经痛的诊疗尤其是微创治疗；2.中晚期癌痛的治疗：规范癌痛药物治疗，提高肿瘤患者生活质量，同时通过射频消融、微波消融以及建立椎管内尤其是鞘内给药通道等疼痛介入手段治疗顽固性癌痛；3.中长期静脉输液通道的建立：静脉输液港（port）的植入和并发症的处理', '26.png');
INSERT INTO `doctor` VALUES (129, '秦枳', '男', 16, '主治医师', '2', '各种疾病导致营养不良、营养性疾病、消化与营养、新生儿和婴幼儿营养、围手术期肠外肠内营养支持，以及营养评估等方面的临床工作和研究。', '27.png');
INSERT INTO `doctor` VALUES (130, '项英英', '女', 41, '主任医师', '4', '一直从事临床检验诊断学的研究，在肿瘤标志物筛选及其转化医学研究、诊断性抗体的研发等方面取得了卓著的成就', '28.png');
INSERT INTO `doctor` VALUES (131, '寇金俊', '男', 42, '副主任医师', '3', '重大脑疾病影像学诊断、脊髓与脊柱疾病的CT与MRI诊断、全身疾病的影像学诊断', '29.png');
INSERT INTO `doctor` VALUES (132, '臧宇威', '男', 45, '主治医师', '2', '系统性红斑狼疮、狼疮妊娠和其它风湿病妊娠、复发性免疫胎停、类风湿关节炎、强直性脊柱炎、干燥综合征、痛风、原发和继发骨质疏松症、及其他不明原因的发热、关节肌肉疼痛、反复口腔溃疡等疑难风湿免疫性疾病的诊断和治疗、尤其专注于狼疮妊娠和复发性免疫胎停的诊治。', '30.png');
INSERT INTO `doctor` VALUES (133, '胡佳俊', '男', 46, '住院医师', '1', '从事多发性创伤的紧急救治及急性创伤的诊治流程和各种创伤抢救的标准流程，擅长现场急救及群伤处理，掌握各种急救技术，尤擅长处理创伤骨科和颅脑创伤。', '31.png');
INSERT INTO `doctor` VALUES (134, '刘嘉豪', '男', 52, '主治医师', '2', '擅长呼吸系统疑难病症综合影像诊断，在肺癌的CT和核磁共振诊断方面有丰富的经验。', '32.png');

-- ----------------------------
-- Table structure for doctor_im_info
-- ----------------------------
DROP TABLE IF EXISTS `doctor_im_info`;
CREATE TABLE `doctor_im_info`  (
  `doctorImNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '医生即时通信信息表编号',
  `dno` int(10) DEFAULT NULL COMMENT '医生编号',
  `accid` int(10) DEFAULT NULL COMMENT 'im登录通信证',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'im登录密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`doctorImNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctor_im_info
-- ----------------------------
INSERT INTO `doctor_im_info` VALUES (1, NULL, 102, '0298d529855cfe22880829bbdd150c74', NULL);
INSERT INTO `doctor_im_info` VALUES (2, NULL, 104, '579b53ab97efb75c3c20214824fb7322', NULL);
INSERT INTO `doctor_im_info` VALUES (3, NULL, 105, 'b20a03948ab16d56474756c0323d44a2', NULL);
INSERT INTO `doctor_im_info` VALUES (4, NULL, 106, '37200266294190d295db72fe24b13dbb', NULL);
INSERT INTO `doctor_im_info` VALUES (5, NULL, 107, '2aa6dca21408e6cf1ff64883a2aa337f', NULL);
INSERT INTO `doctor_im_info` VALUES (6, NULL, 108, 'b0a8d92db78edd63a8d873a01e3e6701', NULL);
INSERT INTO `doctor_im_info` VALUES (7, NULL, 109, '36071c0a24e38ccb8bd1d94be79a9304', NULL);
INSERT INTO `doctor_im_info` VALUES (8, NULL, 112, '831713d8b80636a1325dd4db8a1f8256', NULL);
INSERT INTO `doctor_im_info` VALUES (9, NULL, 113, 'f59012cfda849cd097014b992ee933b5', NULL);

-- ----------------------------
-- Table structure for duty
-- ----------------------------
DROP TABLE IF EXISTS `duty`;
CREATE TABLE `duty`  (
  `dutyNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '值班编号',
  `dno` int(11) NOT NULL COMMENT '医生编号',
  `dutyDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '排班星期',
  `timeSlotId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '具体的排班时间段对应的id',
  PRIMARY KEY (`dutyNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of duty
-- ----------------------------
INSERT INTO `duty` VALUES (1, 101, 'Monday', '1');
INSERT INTO `duty` VALUES (2, 101, 'Monday', '2');
INSERT INTO `duty` VALUES (3, 101, 'Tuesday', '1');
INSERT INTO `duty` VALUES (4, 101, 'Tuesday', '2');
INSERT INTO `duty` VALUES (5, 101, 'Wednesday', '2');
INSERT INTO `duty` VALUES (6, 101, 'Thursday', '1');
INSERT INTO `duty` VALUES (7, 101, 'Tuesday', '2');
INSERT INTO `duty` VALUES (8, 101, 'Friday', '2');
INSERT INTO `duty` VALUES (9, 102, 'Monday', '2');
INSERT INTO `duty` VALUES (10, 102, 'Wednesday', '1');
INSERT INTO `duty` VALUES (11, 102, 'Wednesday', '2');
INSERT INTO `duty` VALUES (12, 102, 'Friday', '1');
INSERT INTO `duty` VALUES (13, 103, 'Monday', '1');
INSERT INTO `duty` VALUES (14, 103, 'Money', '2');
INSERT INTO `duty` VALUES (15, 103, 'Tuesday', '1');
INSERT INTO `duty` VALUES (16, 103, 'Tuesday', '2');
INSERT INTO `duty` VALUES (17, 103, 'Wednesday', '1');
INSERT INTO `duty` VALUES (18, 103, 'Wednesday', '2');
INSERT INTO `duty` VALUES (19, 103, 'Thursday', '2');
INSERT INTO `duty` VALUES (20, 103, 'Friday', '1');
INSERT INTO `duty` VALUES (21, 103, 'Friday', '2');
INSERT INTO `duty` VALUES (22, 103, 'Saturday', '1');
INSERT INTO `duty` VALUES (23, 103, 'Sunday', '1');
INSERT INTO `duty` VALUES (24, 103, 'Sunday', '2');
INSERT INTO `duty` VALUES (25, 101, 'Monday', '1');
INSERT INTO `duty` VALUES (26, 101, 'Monday', '2');
INSERT INTO `duty` VALUES (27, 101, 'Tuesday', '1');
INSERT INTO `duty` VALUES (28, 101, 'Tuesday', '2');
INSERT INTO `duty` VALUES (29, 101, 'Wednesday', '2');
INSERT INTO `duty` VALUES (30, 101, 'Thursday', '1');
INSERT INTO `duty` VALUES (31, 101, 'Tuesday', '2');
INSERT INTO `duty` VALUES (32, 101, 'Friday', '2');
INSERT INTO `duty` VALUES (33, 102, 'Monday', '2');
INSERT INTO `duty` VALUES (34, 102, 'Wednesday', '1');
INSERT INTO `duty` VALUES (35, 102, 'Wednesday', '2');
INSERT INTO `duty` VALUES (36, 102, 'Friday', '1');
INSERT INTO `duty` VALUES (37, 103, 'Monday', '1');
INSERT INTO `duty` VALUES (38, 103, 'Money', '2');
INSERT INTO `duty` VALUES (39, 103, 'Tuesday', '1');
INSERT INTO `duty` VALUES (40, 103, 'Tuesday', '2');
INSERT INTO `duty` VALUES (41, 103, 'Wednesday', '1');
INSERT INTO `duty` VALUES (42, 103, 'Wednesday', '2');
INSERT INTO `duty` VALUES (43, 103, 'Thursday', '2');
INSERT INTO `duty` VALUES (44, 103, 'Friday', '1');
INSERT INTO `duty` VALUES (45, 103, 'Friday', '2');
INSERT INTO `duty` VALUES (46, 103, 'Saturday', '1');
INSERT INTO `duty` VALUES (47, 103, 'Sunday', '1');
INSERT INTO `duty` VALUES (48, 103, 'Sunday', '2');
INSERT INTO `duty` VALUES (49, 101, 'Monday', '1');
INSERT INTO `duty` VALUES (50, 101, 'Monday', '2');
INSERT INTO `duty` VALUES (51, 101, 'Tuesday', '1');
INSERT INTO `duty` VALUES (52, 101, 'Tuesday', '2');
INSERT INTO `duty` VALUES (53, 101, 'Wednesday', '2');
INSERT INTO `duty` VALUES (54, 101, 'Thursday', '1');
INSERT INTO `duty` VALUES (55, 101, 'Tuesday', '2');
INSERT INTO `duty` VALUES (56, 101, 'Friday', '2');
INSERT INTO `duty` VALUES (57, 102, 'Monday', '2');
INSERT INTO `duty` VALUES (58, 102, 'Wednesday', '1');
INSERT INTO `duty` VALUES (59, 102, 'Wednesday', '2');
INSERT INTO `duty` VALUES (60, 102, 'Friday', '1');
INSERT INTO `duty` VALUES (61, 103, 'Monday', '1');
INSERT INTO `duty` VALUES (62, 103, 'Money', '2');
INSERT INTO `duty` VALUES (63, 103, 'Tuesday', '1');
INSERT INTO `duty` VALUES (64, 103, 'Tuesday', '2');
INSERT INTO `duty` VALUES (65, 103, 'Wednesday', '1');
INSERT INTO `duty` VALUES (66, 103, 'Wednesday', '2');
INSERT INTO `duty` VALUES (67, 103, 'Thursday', '2');
INSERT INTO `duty` VALUES (68, 103, 'Friday', '1');
INSERT INTO `duty` VALUES (69, 103, 'Friday', '2');
INSERT INTO `duty` VALUES (70, 103, 'Saturday', '1');
INSERT INTO `duty` VALUES (71, 103, 'Sunday', '1');
INSERT INTO `duty` VALUES (72, 103, 'Sunday', '2');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`  (
  `pno` int(11) NOT NULL AUTO_INCREMENT COMMENT '资讯编号',
  `informationTypeNo` int(20) DEFAULT NULL COMMENT '资讯类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '副标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '视频',
  PRIMARY KEY (`pno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (1, 1, '康复吧，少年', '少年行来', '那么无症状感染者是否会带来潜在的大规模传播风险？张文宏表示，这个传播风险是可以控制住的。“如果这么多无症状感染者不在早期被发现，随着时间推移，一定会出现有症状感染者。只不过这个时候会失去最佳控制时机，但这不代表我们控制不住。”\r\n\r\n“数据显示，世界上50%的病例是由无症状感染者传染的，整个社会上的传播，无症状感染者和有症状感染者各占一半。也就是说无论是无症状还是有症状，对我们来讲都要全面地进行控制。这并不意味着无症状感染者传染性更弱，也不代表无症状感染者更吓人。新疆喀什', '2020-10-06 18:27:04', 'w', '1.jpg', NULL);
INSERT INTO `information` VALUES (2, 2, '康维明', '11', '北京协和医院基本外科\r\n\r\n主任医师，教授，博士生导师\r\n\r\n擅长：胃肠道肿瘤外科治疗、肥胖症及糖尿病手术治疗、甲状腺疾病及肠内肠外营养治疗等', '2020-11-08 13:40:38', '康维明', '18.png', NULL);
INSERT INTO `information` VALUES (3, 4, '华医网承办常见病管理学院直播会议', '0', '为深入贯彻落实党的十九大和《“健康中国”2030规划纲要》与《“十三五”卫生与健康规划》，持续提升基层服务能力，改善服务质量，有针对性的加强基层常见病、多发病的诊疗能力，使更多医务人员受益，促进分级诊疗制度的落实，同时使广大群众能够就近享有安全、有效、方便、经济的基本医疗卫生服务，华医网与北京医学奖励基金于2020年4月发起在线基层常见病规范化诊疗教育项目，面向基层多学科领域医务工作者开展。', '2020-11-07 13:40:41', '搜索', '7.jpg', NULL);
INSERT INTO `information` VALUES (4, 3, '华医题库：职称考试全覆盖', '', '1. 覆盖广。高级职称题库就有109科、初中级职称题库118科，基本实现了全面覆盖。\r\n\r\n2. 更新快。每年的职称考试后，我们会增加历年真题；对于学员的纠错与反馈，不断修正内容；关于用户使用与操作问题，我们经常不定期更新。\r\n\r\n3. 终身有效。部分学员由于工作紧张、家庭琐事缠身等问题，不能及时练习或未能通过考试，华医题库可以终身免费使用，直到您考过为止。\r\n\r\n4. 实战模拟。针对目前越来越流行的人机对话考试，我们设计了模拟考场，让您在考试之前预先熟悉考试环境。', '2020-11-05 13:40:46', '嗷嗷', '4.jpg', NULL);
INSERT INTO `information` VALUES (5, 2, '蔡军，主任医师、教授、博士生导师。', NULL, '蔡军，主任医师、教授、博士生导师。国家心血管病中心、中国医学科学院阜外医院高血压中心主任；海峡两岸医药卫生交流协会高血压专委会主任委员；中国医师协会高血压专委会副主任委员；中国医师协会心血管分会常委、高血压学组主任委员；中国医师协会高血压质控工作委员会主任委员；中国高血压中心认证工作委员会副主任委员兼秘书长；中华医学会心血管病学分会高血压学组委员；', '2020-11-08 16:13:18', '晒晒', '16.png', NULL);
INSERT INTO `information` VALUES (6, 1, '又新增1例！病毒从入境到被检出存活近20天，国务院出手了！', NULL, '从天津市防控指挥部获悉，11月9日，天津市新增1名无症状感染者，为货车司机，曾到本地11月8日新增的确诊病例所工作的滨海新区中新生态城海联冷库拉货。\r\n\r\n该男子曾于11月5日上午11时左右驾驶货车到中新天津生态城海联冷库装载冷链食品。该司机虽不属于冷库工作人员，但与涉事场所有关联，属于疾控部门排查的第二圈层。', '2020-11-11 11:02:15', '健康时报', '6.jpg', NULL);
INSERT INTO `information` VALUES (7, 1, '原研与非原研，距离有多远 ——浅谈不同种类生物药品之间的差别', NULL, '编者按：生物制药在全球范围内应用广泛，近年，在科技进步、临床需求、医保控费及市场的多因素推动下，生物制药仿制品——生物类似物在抗肿瘤、抗风湿等多个领域的研发迅速走红。随着我国集采呈常态化发展趋势，这股浪潮终将冲击到糖尿病用药领域。但新事物发展越是处于热潮时期，就越需要客观冷静的思考和判断，生物类似物与原研药物之间的距离到底有多远？类似是否等同？经典生物药品胰岛素及其类似物会被取代吗？糖尿病生物药品市场未来格局走向如何？知其然，需知其所以然... ...', '2020-11-10 11:03:37', '战略支援部队特色医学中心 ', '5.jpg', NULL);
INSERT INTO `information` VALUES (8, 2, '郁琦,主任医师，教授，博士研究生导师', NULL, '北京协和医院妇产科\r\n\r\n内分泌与生殖妇科中心主任兼妇产科学系副主任\r\n\r\n主任医师，教授，博士研究生导师\r\n\r\n擅长 : 不育、绝经、多囊卵巢综合征、各种妇科内分泌疾病', '2020-11-11 11:05:09', '郁琦', '17.png', NULL);
INSERT INTO `information` VALUES (9, 2, '潘慧，医学博士，北京协和医院医务处处长，内分泌主任医师，博士生导师。', NULL, '主持或参与国自然等课题30余项，发表论文220余篇，其中SCI收录40余篇。现任中国医师协会住院医师规范化培训管理委员会副主任委员，师资培训组组长，中国医师协会毕业后教育专家委员会执行委员会副总干事长，中华医学会行为医学分会中国生长发育行为医学专业委员会主任委员，中国医院管理协会医院图书情报分会副主任委员，中国卫生摄影协会教育与科研分会主任委员，中国医师协会青春期医学专业委员会常委，学校健康学组组长，中华医学会内分泌学会垂体学组委员，中华医学会全科分会委员。', '2020-11-11 11:13:19', '潘慧', '15.png', NULL);
INSERT INTO `information` VALUES (10, 1, '最新！抗新冠药物和疫苗的研发，有重大发现！', NULL, '中国科研团队近日在美国《科学》杂志在线发表论文说，他们发现了两种可有效阻断新冠病毒感染的人源单克隆抗体，有望用于抗新冠药物和疫苗的研发。\r\n\r\n中国首都医科大学、中国科学院微生物研究所、中国科学院天津工业生物技术研究所、深圳市第三人民医院等多家单位参与这项研究。\r\n\r\n分离出4种人源单克隆抗体\r\n\r\n研究人员从一名新冠康复患者的外周血单核细胞中分离出4种人源单克隆抗体。', '2020-09-16 11:16:39', '新华社', '2.jpg', NULL);
INSERT INTO `information` VALUES (11, 3, '中医确有专长考试辅导班', NULL, '国家中医药管理局公布的《中医医术确有专长人员医师资格考核注册管理暂行办法》于 2017年12月20日起开始实施。按照该办法规定，通过中医医术确有专长人员医师资格考核即可获得《中医（专长）医师资格证书》，经注册可以合法执业。此《办法》的实施，对于众多民间中医或是有志于从事中医事业但因缺少学历而被拒之门外的人来说，如遇甘霖。这一政策的实施，将在瞬间点燃无法人的中医梦。', '2020-11-06 11:21:52', '华医网', '8.jpg', NULL);
INSERT INTO `information` VALUES (12, 3, '临床执业医师无忧班', NULL, '特色1 名师划重点，邀请业内金牌讲师为大家突出重点，简化难点。\r\n\r\n特色2 碎片化学习，每日一练，充分利用碎片化时间，积少成多。\r\n\r\n特色3 测试，帮助您跳过容易，直达难点，补齐短板。\r\n\r\n本系列课包含纸质教材，请已购买学员联系华医班主任（hybzr002）领取及加入学习群。\r\n\r\n本系列课一次未通过，第二年免费重学。祝大家考试成功！', '2020-11-02 11:23:12', '华医网', '9.jpg', NULL);
INSERT INTO `information` VALUES (13, 3, '主管护师考试精品班', NULL, '该课程为主管护师职称考试相关内容，包含护理学、内、外、妇、儿、社区护理学共6个亚科的考试内容，结合考试科目中基础知识、相关专业知识、专业知识及专业实践能力进行分类，具有多年考试辅导经验的名师讲解清晰，重点突出，能帮助广大考生轻松备考，顺利通过考试。\r\n\r\n5位老师均为本专业权威讲师，在知识讲解的同时，结合试题讲解，让你在收获知识的同时，一次性通过考试。', '2020-11-01 11:24:23', '华医网', '10.jpg', NULL);
INSERT INTO `information` VALUES (14, 3, '乡村全科执业助理无忧班', NULL, '2018年计生卫生工作会议明确提到提高基层医疗卫生服务能力和质量。把更多的人才技术、财力物力、优惠政策向基层倾斜，做好做实家庭医生签约服务。\r\n\r\n国家卫生计生委医师资格考试委员会关于印发《医师资格考试发展规划（2018-2020年）》的通知[国卫医考委发〔2017〕7号]文件提到将进一步推行乡村全科执业助理医师资格考试，到2020年末，预计准入乡村全科执业助理医师6万人，努力实现万人口全科医生数2名以上的发展目标，进一步提高全科医生队伍素质，优化人员结构。\r\n\r\n', '2020-11-06 11:25:40', '华医网', '11.jpg', NULL);
INSERT INTO `information` VALUES (15, 4, '山西省卫生健康职业学院携手华医网－－开启校企合作新篇章', NULL, '4月16日上午，华医网校区事业部关金利、庞旭明、李科科来到山西省卫生健康职业学院，就校企合作事宜与学院进行洽谈，就继续医学教育远程培训进行座谈交流。\r\n\r\n会上，关金利介绍了华医网的基本情况和“以教育推动医疗发展”的公司理念，汇报了公司在互联网医学教育、卫生科教管理信息化等领域取得的成果，以及近年来公司获得的各项成绩。他希望和学院建立校企合作关系，优势互补、互利共赢，促进我省医疗卫生人员实现终身教育，促进职业发展。  ', '2020-11-07 11:28:49', '华医网', '12.jpg', NULL);
INSERT INTO `information` VALUES (16, 4, '社区基层卫生人员能力训练培训会', NULL, '2020年6月3日，郑州市金开区潮河社区组织培训会，邀请华医网对社区卫生人员进行了河南省基层卫生人员能力训练项目的操作培训和实操答疑。\r\n\r\n潮河社区地处郑州市经济技术开发区，有卫生技术人员86人，服务周边群众约52783人。由于距离市区较远，周边社区比较分散，是周围群众最近的，也是最主要医疗服务来源。通过详细的培训讲解、操作演示和互动答疑，使大家了解了项目背景、学习操作方法，方便他们能顺利的参加线上学习培训，提高服务能力。', '2020-11-05 11:30:51', '华医网', '13.jpg', NULL);
INSERT INTO `information` VALUES (17, 4, '内蒙古继续医学教育委员会与华医网合作开展面授转线上继教项目', NULL, '内蒙古自治区继教委及时响应国家文件，挑选出30余项2020年自治区级继续医学教育项目，与华医网合作将面授项目转为线上举办。项目申报单位来自内蒙古自治区人民医院、内蒙古医科大学附属医院两家三级甲等医院，授课教师均为各专业领域的学术带头人。为保障面授项目转线上后的举办质量，华医网派出摄制组前往呼和浩特实地拍摄。', '2020-11-11 11:32:07', 'huayiw', '14.jpg', NULL);

-- ----------------------------
-- Table structure for information_type
-- ----------------------------
DROP TABLE IF EXISTS `information_type`;
CREATE TABLE `information_type`  (
  `informationTypeNo` int(11) NOT NULL COMMENT '资讯类型编号',
  `informationTypeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资讯类型名称',
  PRIMARY KEY (`informationTypeNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of information_type
-- ----------------------------
INSERT INTO `information_type` VALUES (1, '医学资讯');
INSERT INTO `information_type` VALUES (2, '专家之窗');
INSERT INTO `information_type` VALUES (3, '医护考试');
INSERT INTO `information_type` VALUES (4, '教学日志');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `newsNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `newstitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '新闻标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `createTime` datetime DEFAULT NULL COMMENT '创建日期',
  `newsPicture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '新闻图片',
  PRIMARY KEY (`newsNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '国家医保局官宣！医保支付将发生重大改革！', '日前，国家医疗保障局印发《区域点数法总额预算和按病种分值付费试点工作方案的通知》（以下简称《通知》）。\r\n\r\n《通知》称，将遴选符合条件的地区作为试点，并用1-2年的时间，将统筹地区医保总额预算与点数法相结合，实现住院以按病种分值付费为主的多元复合支付方式。', '2020-10-13 21:59:50', '1.jpg');
INSERT INTO `news` VALUES (2, '新疆又一县出现疫情!', '近日，据新疆新疆喀什疫情防控新闻发布会通报：与疏附县相邻的克孜勒苏柯尔克孜自治州阿克陶县喀热开其克乡和皮拉勒乡，报告新增15例无症状感染者，均为接受隔离医学观察人员。\r\n\r\n对于眼下国内备受关注的新疆喀什疫情，复旦大学附属华山医院感染科主任张文宏、北京大学第一医院呼吸和危重症医学科主任王广发进行了解读。', '2020-10-01 21:59:56', '2.jpg');
INSERT INTO `news` VALUES (3, '餐后血糖新近研究及临床意义', '血糖波动（Glucose Variability，GV，又称血糖变异）是指血糖水平在其峰值和低谷之间变化的不稳定状态，包括日内血糖波动和日间血糖波动[1]。餐后血糖（Postprandial Plasma Glucose, PPG）升高和低血糖共同构成日内血糖波动，其中餐后高血糖是日内血糖波动的最主要原因[2]。', '2020-10-30 22:00:00', '4.jpg');
INSERT INTO `news` VALUES (4, '重磅文件下发！事关医务人员职称晋升！', '近日，河南省人力资源和社会保障厅印发《关于进一步做好基层专业技术人员职称工作的通知》（以下简称《通知》）。\r\n\r\n《通知》中，明确了基层医务人员在职称晋升上享受多重福利，让扎根基层的专业技术人才发展有空间、晋升有通道、作出贡献者有更多成就感、获得感。重点内容整理如下：', '2020-11-13 22:00:03', '3.jpg');
INSERT INTO `news` VALUES (5, '如何保障医护的薪酬待遇、职称晋升？国家卫健委回复...', '近日，中国政府网刊登人民日报发表的《一系列措施出台，努力让医务人员留得住、能发展》文章。\r\n\r\n自抗疫以来，各级党委和政府、全社会都要关心爱护医务工作者。当前，相关部门出台了哪些保护、关心、爱护医务人员的政策措施？一线医务人员的待遇保障如何提升？未来怎样建立保护关心爱护医务人员长效机制？人民日报记者采访了国家卫健委相关负责人。', '2020-11-07 11:07:07', '5.jpg');
INSERT INTO `news` VALUES (6, '青岛疫情，张文宏最新判断！专家确认，全球二次疫情已开始！', '近日，山东省青岛市再现本土确诊病例，青岛制定并已启动全员检测方案。目前，青岛市胸科医院全部科室已经于11日停诊，青岛市第三人民医院已11日起门诊急诊全部停诊，作为备用医院启用。\r\n\r\n据央视新闻报道，国家卫生健康委目前已经派出工作组，赴青岛指导当地开展疫情防控工作。\r\n\r\n此外，张文宏与中国疾控中心原副主任功焕对青岛疫情及全球疫情做了研判...', '2020-11-07 11:09:18', '6.jpg');
INSERT INTO `news` VALUES (7, 'CKD患者高磷血症如何管理？听专家精彩解说！', '慢性肾脏病（chronic kidney disease, CKD）对全球健康影响重大[1]：', '2020-11-07 12:04:15', '7.jpg');
INSERT INTO `news` VALUES (8, '聚焦起始切点，选择适合方案——浅谈中低预混胰岛素', '过去40年间，中国糖尿病患病率呈井喷式急剧增长，预混胰岛素在改善基础和餐时胰岛素分泌不足的同时，可减少注射次数，帮助2型糖尿病（T2DM）患者有效兼顾空腹血糖（Postprandial Plasma Glucose, FPG）和餐后血糖（Fasting Plasma Glucose, PPG），安全性良好。', '2020-09-29 05:57:15', '8.jpg');
INSERT INTO `news` VALUES (9, '原研与非原研，距离有多远 ——浅谈不同种类生物药品之间的差别', '生物制药在全球范围内应用广泛，近年，在科技进步、临床需求、医保控费及市场的多因素推动下，生物制药仿制品——生物类似物在抗肿瘤、抗风湿等多个领域的研发迅速走红。随着我国集采呈常态化发展趋势，这股浪潮终将冲击到糖尿病用药领域。基于现状用发展的眼光来看待糖尿病领域的生物药品应用，原研生物制品的循证医学证据体系完善，及时顺应医保改革方针，积极扩大药品可及性，未来必将惠及更多患者。', '2020-11-08 12:12:52', '9.jpg');
INSERT INTO `news` VALUES (10, '过敏性紫癜的诊治进展', '过敏性紫癜( Henoch-Schnlein purpura，HSP) ， 亦称免疫球蛋白( immunoglobulin，Ig) A 血管炎，是 主要由 IgA 沉积于血管壁引起的血管炎，主要累及 细小血管和毛细血管，特征为非血小板减少的皮肤 可触性紫癜，常伴单关节肿胀疼痛、关节炎、腹胀腹 痛、血尿、蛋白尿等。目前 HSP 的病因及发病机制 尚不清楚，可能与感染、食物、精神、药物、免疫复合 物沉积、补体激活等因素有关［1-3］。有学者发现，基因 在 HSP 的发病机制中起关键作用，包括人类白细胞 抗原', '2020-11-06 12:15:52', '10.jpg');
INSERT INTO `news` VALUES (11, '直肠癌放射治疗四大更新要点', '结直肠癌发病率和死亡率一直居高不下，直肠癌的发病率与术后局部复发率通常高于结肠癌。近日，美国放射肿瘤学会（ASTRO）更新了直肠癌放射治疗临床实践指南，更新后的指南对直肠癌全程新辅助治疗（TNT）模式、非手术治疗（NOM）、选择性放疗等热点问题进行了阐述，为临床医生提供指导。', '2020-11-06 12:17:26', '11.jpg');
INSERT INTO `news` VALUES (12, '稳定性冠心病：最佳药物治疗及相关证据一览表', '冠心病是一种慢性全身性疾病。通过改变生活方式、危险因素控制和药物治疗，可以减缓动脉粥样硬化进展，降低斑块破裂和血栓形成风险，从而减少或避免冠心病相关的不良事件。随着预防和药物治疗有效性的提高，冠脉血运重建的作用已经降低，并且主要限于不能耐受的心绞痛、严重的左心室收缩功能障碍或高危冠脉解剖亚组。稳定性冠心病患者的治疗目标包括：（1）改善无事件生存率；（2）改善症状、身体功能和生活质量。主要的管理策略仍然是生活方式干预和强化药物二级预防（通常被称为：最佳药物治疗，OMT）；若单纯药物治疗无效，可考虑进行冠脉血', '2020-11-09 12:20:32', '12.jpg');
INSERT INTO `news` VALUES (13, '肺部疾病的皮肤表现：你是否忽略了这些诊断线索？', '发绀是指皮肤呈现独特的蓝色或紫色改变，提示不饱和血红蛋白≥5g/dL。发绀可根据其病因分为中心性发绀和周围性发绀.杵状指是由于结缔组织增生引起的手指和脚趾远端的球状、棒状变形。希波克拉底最早描述了杵状指，因此另一个术语是“希波克拉底手指”。杵状指可能是遗传性的（即原发性肥厚性骨关节炎），但更多是后天性的，并与许多感染性、炎症性、肿瘤性和血管疾病有关。多种肺病可有杵状指表现，如肺癌、肺结核、肺脓肿、支气管扩张、囊性纤维化、特发性肺纤维化等。肺癌是全球因癌死亡的首要原因，即使肺癌向皮肤、皮下或浅表淋巴结转移的', '2020-11-06 12:23:04', '13.jpg');
INSERT INTO `news` VALUES (14, 'POLO：第一个验证胰腺癌生物标志物驱动治疗的III期试验', '既往研究显示，携带遗传性BRCA1和/或BRCA2突变(gBRCAm)的胰腺癌患者对PARP抑制剂奥拉帕尼有反应(Kaufman 2015)。\r\n\r\n        研究者开展国际、随机、双盲、安慰剂对照POLO试验，这是第一项评估PARP抑制剂对胰腺癌维持治疗效果的III期试验，招募患有gBRCAm胰腺癌经16周以上一线PBC治疗的无进展转移性癌症患者。将患者按3：2比例随机分组到奥拉帕尼片剂(300mg bid)维持治疗组(O)或安慰剂组(P)。\r\n\r\n        在最后一次PBC给药后4-8周开', '2019-06-19 12:24:40', '14.jpg');
INSERT INTO `news` VALUES (15, '经静脉神经刺激治疗中枢性睡眠呼吸暂停：一项随机对照试验', '在2013年4月17日至2015年5月28日期间， 151例符合条件的患者被随机分配至治疗组(n=73)或对照组(n=78)。在意向治疗人群的分析中，与对照组[8/73(11%)]相比，治疗组[35/68(51%)]6个月后AHI较基线下降≥50%的患者更多(组间差异41%，95%置信区间25-54，P<0.0001)。151例患者中，138例(91%)在12个月内未见严重不良事件。在对照组中发生了7例(9%)严重不良事件，在治疗组中报道了6例(8%)不良事件。7例患者死亡(与植入操作、神经刺激装置或治疗', '2020-11-06 12:26:17', '15.jpg');
INSERT INTO `news` VALUES (16, '新型抗AB疫苗可能有助于阻止老年痴呆症的发展', '佛罗里达州坦帕市(2020年10月20日)-我们的免疫系统抵抗包括毒素在内的外来物质的良好调节防御能力，会随着年龄的增长而减弱，并使疫苗在65岁以上的人群中失效。已显示针对神经毒性形式的肽淀粉样蛋白β(寡聚Aβ)的免疫疗法可能会阻止阿尔茨海默氏病(一种最常见的年龄相关性神经退行性疾病)的进展。\r\n\r\n        通过领导的研究小组川海曹博士，在的南佛罗里达健康(USF生)的大学，一直专注于克服，在那些与免疫功能低下，过度的炎症以及与治疗阿尔茨海默氏症疫苗开发干扰等并发症。\r\n\r\n        现在，', '2020-10-22 12:27:26', '16.jpg');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `recordNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '排班编号',
  `dno` int(11) DEFAULT NULL COMMENT '医生编号',
  `timeSlotId` int(10) DEFAULT NULL COMMENT '关联值班时间段表，一个医生在当天的值班记录最多有4条',
  `Booking_numb` int(11) DEFAULT NULL COMMENT '剩余挂号量',
  `dutyDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dutyNo` int(20) DEFAULT NULL COMMENT '星期对应日期',
  PRIMARY KEY (`recordNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (5, 101, 1, 20, '2020-11-16', 1);
INSERT INTO `record` VALUES (6, 101, 1, 20, '2020-11-23', NULL);
INSERT INTO `record` VALUES (7, 101, 1, 20, '2020-11-30', NULL);
INSERT INTO `record` VALUES (8, 101, 1, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (9, 101, 2, 20, '2020-11-16', 2);
INSERT INTO `record` VALUES (10, 101, 2, 20, '2020-11-23', NULL);
INSERT INTO `record` VALUES (11, 101, 2, 20, '2020-11-30', NULL);
INSERT INTO `record` VALUES (12, 101, 2, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (13, 101, 1, 20, '2020-11-17', 3);
INSERT INTO `record` VALUES (14, 101, 1, 20, '2020-11-24', NULL);
INSERT INTO `record` VALUES (15, 101, 1, 20, '2020-12-01', NULL);
INSERT INTO `record` VALUES (16, 101, 1, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (17, 101, 2, 20, '2020-11-17', 4);
INSERT INTO `record` VALUES (18, 101, 2, 20, '2020-11-24', NULL);
INSERT INTO `record` VALUES (19, 101, 2, 20, '2020-12-01', NULL);
INSERT INTO `record` VALUES (20, 101, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (21, 101, 2, 20, '2020-11-18', 5);
INSERT INTO `record` VALUES (22, 101, 2, 20, '2020-11-25', NULL);
INSERT INTO `record` VALUES (23, 101, 2, 20, '2020-12-02', NULL);
INSERT INTO `record` VALUES (24, 101, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (25, 101, 1, 20, '2020-11-19', 6);
INSERT INTO `record` VALUES (26, 101, 1, 20, '2020-11-26', NULL);
INSERT INTO `record` VALUES (27, 101, 1, 20, '2020-12-03', NULL);
INSERT INTO `record` VALUES (28, 101, 1, 20, '2020-12-10', NULL);
INSERT INTO `record` VALUES (29, 101, 2, 20, '2020-11-17', 7);
INSERT INTO `record` VALUES (30, 101, 2, 20, '2020-11-24', NULL);
INSERT INTO `record` VALUES (31, 101, 2, 20, '2020-12-01', NULL);
INSERT INTO `record` VALUES (32, 101, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (33, 101, 2, 20, '2020-11-20', 8);
INSERT INTO `record` VALUES (34, 101, 2, 20, '2020-11-27', NULL);
INSERT INTO `record` VALUES (35, 101, 2, 20, '2020-12-04', NULL);
INSERT INTO `record` VALUES (36, 101, 2, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (37, 102, 2, 20, '2020-11-16', 9);
INSERT INTO `record` VALUES (38, 102, 2, 20, '2020-11-23', NULL);
INSERT INTO `record` VALUES (39, 102, 2, 20, '2020-11-30', NULL);
INSERT INTO `record` VALUES (40, 102, 2, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (41, 102, 1, 20, '2020-11-18', 10);
INSERT INTO `record` VALUES (42, 102, 1, 20, '2020-11-25', NULL);
INSERT INTO `record` VALUES (43, 102, 1, 20, '2020-12-02', NULL);
INSERT INTO `record` VALUES (44, 102, 1, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (45, 102, 2, 20, '2020-11-18', 11);
INSERT INTO `record` VALUES (46, 102, 2, 20, '2020-11-25', NULL);
INSERT INTO `record` VALUES (47, 102, 2, 20, '2020-12-02', NULL);
INSERT INTO `record` VALUES (48, 102, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (49, 102, 1, 20, '2020-11-20', 12);
INSERT INTO `record` VALUES (50, 102, 1, 20, '2020-11-27', NULL);
INSERT INTO `record` VALUES (51, 102, 1, 20, '2020-12-04', NULL);
INSERT INTO `record` VALUES (52, 102, 1, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (53, 103, 1, 20, '2020-11-16', 13);
INSERT INTO `record` VALUES (54, 103, 1, 20, '2020-11-23', NULL);
INSERT INTO `record` VALUES (55, 103, 1, 20, '2020-11-30', NULL);
INSERT INTO `record` VALUES (56, 103, 1, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (57, 103, 2, 20, NULL, 14);
INSERT INTO `record` VALUES (58, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (59, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (60, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (61, 103, 1, 20, '2020-11-17', 15);
INSERT INTO `record` VALUES (62, 103, 1, 20, '2020-11-24', NULL);
INSERT INTO `record` VALUES (63, 103, 1, 20, '2020-12-01', NULL);
INSERT INTO `record` VALUES (64, 103, 1, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (65, 103, 2, 20, '2020-11-17', 16);
INSERT INTO `record` VALUES (66, 103, 2, 20, '2020-11-24', NULL);
INSERT INTO `record` VALUES (67, 103, 2, 20, '2020-12-01', NULL);
INSERT INTO `record` VALUES (68, 103, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (69, 103, 1, 20, '2020-11-18', 17);
INSERT INTO `record` VALUES (70, 103, 1, 20, '2020-11-25', NULL);
INSERT INTO `record` VALUES (71, 103, 1, 20, '2020-12-02', NULL);
INSERT INTO `record` VALUES (72, 103, 1, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (73, 103, 2, 20, '2020-11-18', 18);
INSERT INTO `record` VALUES (74, 103, 2, 20, '2020-11-25', NULL);
INSERT INTO `record` VALUES (75, 103, 2, 20, '2020-12-02', NULL);
INSERT INTO `record` VALUES (76, 103, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (77, 103, 2, 20, '2020-11-19', 19);
INSERT INTO `record` VALUES (78, 103, 2, 20, '2020-11-26', NULL);
INSERT INTO `record` VALUES (79, 103, 2, 20, '2020-12-03', NULL);
INSERT INTO `record` VALUES (80, 103, 2, 20, '2020-12-10', NULL);
INSERT INTO `record` VALUES (81, 103, 1, 20, '2020-11-20', 20);
INSERT INTO `record` VALUES (82, 103, 1, 20, '2020-11-27', NULL);
INSERT INTO `record` VALUES (83, 103, 1, 20, '2020-12-04', NULL);
INSERT INTO `record` VALUES (84, 103, 1, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (85, 103, 2, 20, '2020-11-20', 21);
INSERT INTO `record` VALUES (86, 103, 2, 20, '2020-11-27', NULL);
INSERT INTO `record` VALUES (87, 103, 2, 20, '2020-12-04', NULL);
INSERT INTO `record` VALUES (88, 103, 2, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (89, 103, 1, 20, '2020-11-21', 22);
INSERT INTO `record` VALUES (90, 103, 1, 20, '2020-11-28', NULL);
INSERT INTO `record` VALUES (91, 103, 1, 20, '2020-12-05', NULL);
INSERT INTO `record` VALUES (92, 103, 1, 20, '2020-12-12', NULL);
INSERT INTO `record` VALUES (93, 103, 1, 20, '2020-11-15', 23);
INSERT INTO `record` VALUES (94, 103, 1, 20, '2020-11-22', NULL);
INSERT INTO `record` VALUES (95, 103, 1, 20, '2020-11-29', NULL);
INSERT INTO `record` VALUES (96, 103, 1, 20, '2020-12-06', NULL);
INSERT INTO `record` VALUES (97, 103, 2, 20, '2020-11-15', 24);
INSERT INTO `record` VALUES (98, 103, 2, 20, '2020-11-22', NULL);
INSERT INTO `record` VALUES (99, 103, 2, 20, '2020-11-29', NULL);
INSERT INTO `record` VALUES (100, 103, 2, 20, '2020-12-06', NULL);
INSERT INTO `record` VALUES (101, 101, 1, 20, '2020-11-30', 25);
INSERT INTO `record` VALUES (102, 101, 1, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (103, 101, 1, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (104, 101, 1, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (105, 101, 2, 20, '2020-11-30', 26);
INSERT INTO `record` VALUES (106, 101, 2, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (107, 101, 2, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (108, 101, 2, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (109, 101, 1, 20, '2020-12-01', 27);
INSERT INTO `record` VALUES (110, 101, 1, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (111, 101, 1, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (112, 101, 1, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (113, 101, 2, 20, '2020-12-01', 28);
INSERT INTO `record` VALUES (114, 101, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (115, 101, 2, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (116, 101, 2, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (117, 101, 2, 20, '2020-12-02', 29);
INSERT INTO `record` VALUES (118, 101, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (119, 101, 2, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (120, 101, 2, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (121, 101, 1, 20, '2020-12-03', 30);
INSERT INTO `record` VALUES (122, 101, 1, 20, '2020-12-10', NULL);
INSERT INTO `record` VALUES (123, 101, 1, 20, '2020-12-17', NULL);
INSERT INTO `record` VALUES (124, 101, 1, 20, '2020-12-24', NULL);
INSERT INTO `record` VALUES (125, 101, 2, 20, '2020-12-01', 31);
INSERT INTO `record` VALUES (126, 101, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (127, 101, 2, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (128, 101, 2, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (129, 101, 2, 20, '2020-12-04', 32);
INSERT INTO `record` VALUES (130, 101, 2, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (131, 101, 2, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (132, 101, 2, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (133, 102, 2, 20, '2020-11-30', 33);
INSERT INTO `record` VALUES (134, 102, 2, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (135, 102, 2, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (136, 102, 2, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (137, 102, 1, 20, '2020-12-02', 34);
INSERT INTO `record` VALUES (138, 102, 1, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (139, 102, 1, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (140, 102, 1, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (141, 102, 2, 20, '2020-12-02', 35);
INSERT INTO `record` VALUES (142, 102, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (143, 102, 2, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (144, 102, 2, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (145, 102, 1, 20, '2020-12-04', 36);
INSERT INTO `record` VALUES (146, 102, 1, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (147, 102, 1, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (148, 102, 1, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (149, 103, 1, 20, '2020-11-30', 37);
INSERT INTO `record` VALUES (150, 103, 1, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (151, 103, 1, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (152, 103, 1, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (153, 103, 2, 20, NULL, 38);
INSERT INTO `record` VALUES (154, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (155, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (156, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (157, 103, 1, 20, '2020-12-01', 39);
INSERT INTO `record` VALUES (158, 103, 1, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (159, 103, 1, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (160, 103, 1, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (161, 103, 2, 20, '2020-12-01', 40);
INSERT INTO `record` VALUES (162, 103, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (163, 103, 2, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (164, 103, 2, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (165, 103, 1, 20, '2020-12-02', 41);
INSERT INTO `record` VALUES (166, 103, 1, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (167, 103, 1, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (168, 103, 1, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (169, 103, 2, 20, '2020-12-02', 42);
INSERT INTO `record` VALUES (170, 103, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (171, 103, 2, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (172, 103, 2, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (173, 103, 2, 20, '2020-12-03', 43);
INSERT INTO `record` VALUES (174, 103, 2, 20, '2020-12-10', NULL);
INSERT INTO `record` VALUES (175, 103, 2, 20, '2020-12-17', NULL);
INSERT INTO `record` VALUES (176, 103, 2, 20, '2020-12-24', NULL);
INSERT INTO `record` VALUES (177, 103, 1, 20, '2020-12-04', 44);
INSERT INTO `record` VALUES (178, 103, 1, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (179, 103, 1, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (180, 103, 1, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (181, 103, 2, 20, '2020-12-04', 45);
INSERT INTO `record` VALUES (182, 103, 2, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (183, 103, 2, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (184, 103, 2, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (185, 103, 1, 20, '2020-12-05', 46);
INSERT INTO `record` VALUES (186, 103, 1, 20, '2020-12-12', NULL);
INSERT INTO `record` VALUES (187, 103, 1, 20, '2020-12-19', NULL);
INSERT INTO `record` VALUES (188, 103, 1, 20, '2020-12-26', NULL);
INSERT INTO `record` VALUES (189, 103, 1, 20, '2020-11-29', 47);
INSERT INTO `record` VALUES (190, 103, 1, 20, '2020-12-06', NULL);
INSERT INTO `record` VALUES (191, 103, 1, 20, '2020-12-13', NULL);
INSERT INTO `record` VALUES (192, 103, 1, 20, '2020-12-20', NULL);
INSERT INTO `record` VALUES (193, 103, 2, 20, '2020-11-29', 48);
INSERT INTO `record` VALUES (194, 103, 2, 20, '2020-12-06', NULL);
INSERT INTO `record` VALUES (195, 103, 2, 20, '2020-12-13', NULL);
INSERT INTO `record` VALUES (196, 103, 2, 20, '2020-12-20', NULL);
INSERT INTO `record` VALUES (197, 101, 1, 20, '2020-11-30', 49);
INSERT INTO `record` VALUES (198, 101, 1, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (199, 101, 1, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (200, 101, 1, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (201, 101, 2, 20, '2020-11-30', 50);
INSERT INTO `record` VALUES (202, 101, 2, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (203, 101, 2, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (204, 101, 2, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (205, 101, 1, 20, '2020-12-01', 51);
INSERT INTO `record` VALUES (206, 101, 1, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (207, 101, 1, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (208, 101, 1, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (209, 101, 2, 20, '2020-12-01', 52);
INSERT INTO `record` VALUES (210, 101, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (211, 101, 2, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (212, 101, 2, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (213, 101, 2, 20, '2020-12-02', 53);
INSERT INTO `record` VALUES (214, 101, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (215, 101, 2, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (216, 101, 2, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (217, 101, 1, 20, '2020-12-03', 54);
INSERT INTO `record` VALUES (218, 101, 1, 20, '2020-12-10', NULL);
INSERT INTO `record` VALUES (219, 101, 1, 20, '2020-12-17', NULL);
INSERT INTO `record` VALUES (220, 101, 1, 20, '2020-12-24', NULL);
INSERT INTO `record` VALUES (221, 101, 2, 20, '2020-12-01', 55);
INSERT INTO `record` VALUES (222, 101, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (223, 101, 2, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (224, 101, 2, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (225, 101, 2, 20, '2020-12-04', 56);
INSERT INTO `record` VALUES (226, 101, 2, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (227, 101, 2, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (228, 101, 2, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (229, 102, 2, 20, '2020-11-30', 57);
INSERT INTO `record` VALUES (230, 102, 2, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (231, 102, 2, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (232, 102, 2, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (233, 102, 1, 20, '2020-12-02', 58);
INSERT INTO `record` VALUES (234, 102, 1, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (235, 102, 1, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (236, 102, 1, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (237, 102, 2, 20, '2020-12-02', 59);
INSERT INTO `record` VALUES (238, 102, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (239, 102, 2, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (240, 102, 2, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (241, 102, 1, 20, '2020-12-04', 60);
INSERT INTO `record` VALUES (242, 102, 1, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (243, 102, 1, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (244, 102, 1, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (245, 103, 1, 20, '2020-11-30', 61);
INSERT INTO `record` VALUES (246, 103, 1, 20, '2020-12-07', NULL);
INSERT INTO `record` VALUES (247, 103, 1, 20, '2020-12-14', NULL);
INSERT INTO `record` VALUES (248, 103, 1, 20, '2020-12-21', NULL);
INSERT INTO `record` VALUES (249, 103, 2, 20, NULL, 62);
INSERT INTO `record` VALUES (250, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (251, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (252, 103, 2, 20, NULL, NULL);
INSERT INTO `record` VALUES (253, 103, 1, 20, '2020-12-01', 63);
INSERT INTO `record` VALUES (254, 103, 1, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (255, 103, 1, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (256, 103, 1, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (257, 103, 2, 20, '2020-12-01', 64);
INSERT INTO `record` VALUES (258, 103, 2, 20, '2020-12-08', NULL);
INSERT INTO `record` VALUES (259, 103, 2, 20, '2020-12-15', NULL);
INSERT INTO `record` VALUES (260, 103, 2, 20, '2020-12-22', NULL);
INSERT INTO `record` VALUES (261, 103, 1, 20, '2020-12-02', 65);
INSERT INTO `record` VALUES (262, 103, 1, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (263, 103, 1, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (264, 103, 1, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (265, 103, 2, 20, '2020-12-02', 66);
INSERT INTO `record` VALUES (266, 103, 2, 20, '2020-12-09', NULL);
INSERT INTO `record` VALUES (267, 103, 2, 20, '2020-12-16', NULL);
INSERT INTO `record` VALUES (268, 103, 2, 20, '2020-12-23', NULL);
INSERT INTO `record` VALUES (269, 103, 2, 20, '2020-12-03', 67);
INSERT INTO `record` VALUES (270, 103, 2, 20, '2020-12-10', NULL);
INSERT INTO `record` VALUES (271, 103, 2, 20, '2020-12-17', NULL);
INSERT INTO `record` VALUES (272, 103, 2, 20, '2020-12-24', NULL);
INSERT INTO `record` VALUES (273, 103, 1, 20, '2020-12-04', 68);
INSERT INTO `record` VALUES (274, 103, 1, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (275, 103, 1, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (276, 103, 1, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (277, 103, 2, 20, '2020-12-04', 69);
INSERT INTO `record` VALUES (278, 103, 2, 20, '2020-12-11', NULL);
INSERT INTO `record` VALUES (279, 103, 2, 20, '2020-12-18', NULL);
INSERT INTO `record` VALUES (280, 103, 2, 20, '2020-12-25', NULL);
INSERT INTO `record` VALUES (281, 103, 1, 20, '2020-12-05', 70);
INSERT INTO `record` VALUES (282, 103, 1, 20, '2020-12-12', NULL);
INSERT INTO `record` VALUES (283, 103, 1, 20, '2020-12-19', NULL);
INSERT INTO `record` VALUES (284, 103, 1, 20, '2020-12-26', NULL);
INSERT INTO `record` VALUES (285, 103, 1, 20, '2020-11-29', 71);
INSERT INTO `record` VALUES (286, 103, 1, 20, '2020-12-06', NULL);
INSERT INTO `record` VALUES (287, 103, 1, 20, '2020-12-13', NULL);
INSERT INTO `record` VALUES (288, 103, 1, 20, '2020-12-20', NULL);
INSERT INTO `record` VALUES (289, 103, 2, 20, '2020-11-29', 72);
INSERT INTO `record` VALUES (290, 103, 2, 20, '2020-12-06', NULL);
INSERT INTO `record` VALUES (291, 103, 2, 20, '2020-12-13', NULL);
INSERT INTO `record` VALUES (292, 103, 2, 20, '2020-12-20', NULL);

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `roomNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `roomName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '室名称',
  `RoomDescribe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科室描述',
  `sectionNo` int(11) DEFAULT NULL COMMENT '科编号',
  PRIMARY KEY (`roomNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '心血管内科', '心内科，即心血管内科，是各级医院大内科为了诊疗心血管血管疾病而设置的一个临床科室，治疗的疾病包括心绞痛、高血压、猝死、心律失常、心力衰竭、早搏、心律不齐、心肌梗死、心肌病、心肌炎、急性心肌梗死等心血管疾病。', 1);
INSERT INTO `room` VALUES (2, '神经内科', '神经内科是关于神经方面的二级学科,主要收治脑血管疾病（脑梗塞、脑出血）、偏头痛、脑部炎症性疾病（脑炎、脑膜炎）、脊髓炎、癫痫、痴呆、代谢病和遗传倾向疾病、三叉神经痛、坐骨神经病、周围神经病及重症肌无力等。', 1);
INSERT INTO `room` VALUES (3, '普通内科', '普通内科收治一些免疫系统疾病（风湿，类风湿，血液病，红斑狼疮）内分泌系统疾病（糖尿病，甲亢，甲减）', 1);
INSERT INTO `room` VALUES (4, '消化内科', '消化系统，包括肝胆胰。多属“肚子里的问题”，当然也不全是。还有内镜、消化系统疾病的介入。', 1);
INSERT INTO `room` VALUES (5, '呼吸内科', '主要是治疗呼吸系统疾病的科室，呼吸系统包括呼吸道(鼻腔、咽、喉、气管、支气管)和肺。呼吸系统疾病是一种常见病、多发病，主要病变在气管、支气管、肺部及胸腔，病变轻者多咳嗽、胸痛、呼吸受影响，重者呼吸困难、缺氧，甚至呼吸衰竭而致死。', 1);
INSERT INTO `room` VALUES (6, '内分泌科', '内分泌、代谢系统。以各激素调节轴的异常为主线，常见糖尿病、骨质疏松、甲亢、垂体疾病等等。', 1);
INSERT INTO `room` VALUES (7, '肾病内科', '肾内科是各级医院为了诊疗肾脏病而设置的一个临床科室。常见的肾脏替代治疗方式有肾移植、血液透析和腹膜透析。', 1);
INSERT INTO `room` VALUES (8, '血液内科', '血液造血系统的非感染性疾病。', 1);
INSERT INTO `room` VALUES (9, '感染内科', '感染内科常见疾病. 乙肝 (4637位推荐大夫,2698位提供在线咨询) 肝炎 (2710位推荐大夫,1625位提供在线咨询) 肝硬化 (3605位推荐大夫,2387位提供在线咨询) 脂肪肝 (1166位推荐大夫,889位提供在线咨询) 肺结核. 肺炎. 艾滋病. 细菌性痢疾.', 1);
INSERT INTO `room` VALUES (10, '老年病内科', '1.老年神经系统疾病的治疗与康复：认知康复、脑血管病脑出血和脑梗死后偏瘫、吞咽功能障碍、言语功能障碍、神经变性疾病、帕金森病、周围神经病、神经损伤、脊髓损伤等神经系统疾病康复；2.老年康复；3.老年骨质疏松、骨关节疾病的诊断及治疗；4.老年综合评估。', 1);
INSERT INTO `room` VALUES (11, '风湿免疫内科', '主要是结缔组织的）自身免疫疾病。但如果涉及其他器官系统的严重问题，则在相应专科治疗，如狼疮肾病到肾内科。', 1);
INSERT INTO `room` VALUES (12, '透析科', '透析科主要是利用相应医疗器械，对急性慢性肾功能衰竭的患者进行血液净化，尤其是尿毒症患者进行血液透析治疗。', 1);
INSERT INTO `room` VALUES (13, '变态反应科', '把一些难治的局限的变态反应性疾病独立出来治疗，如鼻炎、哮喘。', 1);
INSERT INTO `room` VALUES (14, '普通外科', '普外科(Department of general surgery)是以手术为主要方法治疗肝脏、胆道、胰腺、胃肠、肛肠、血管疾病、甲状腺和乳房的肿瘤及外伤等其它疾病的临床学科，是外科系统最大的专科。', 2);
INSERT INTO `room` VALUES (15, '泌尿外科', '泌尿生殖系统问题的外科治疗，肾上腺、肾、输尿管、膀胱、前列腺、尿道、睾丸等，至男性外生殖器。', 2);
INSERT INTO `room` VALUES (16, '神经外科', '神经外科（Neurosurgery）是外科学中的一个分支，是在外科学以手术为主要治疗手段的基础上，应用独特的神经外科学研究方法，研究人体神经系统，如脑、脊髓和周围神经系统，以及与之相关的附属机构。', 2);
INSERT INTO `room` VALUES (17, '胸外科', '胸外科是一门医学专科，专门研究胸腔内器官，主要指食道、肺部、纵隔病变的诊断及治疗，乳腺外科领域也被归入这个专科，其中又以肺外科和食道外科为主。', 2);
INSERT INTO `room` VALUES (18, '整形外科', '整形外科学（plastic and cosmetic surgery ）是外科学的一个分支，又称整复外科或成形外科，治疗范围主要是皮肤、肌肉及骨骼等创伤、疾病，先天性或后天性组织或器官的缺陷与畸形。', 2);
INSERT INTO `room` VALUES (19, '肛肠外科', '肛肠外科是以手术为主要方法治疗发生于肛门和大肠部位的肿瘤、外伤及其他疾病的临床学科，肛肠疾病以发生在肛门直肠肠段最多见。', 2);
INSERT INTO `room` VALUES (20, '肝胆外科', '肝胆外科主要研究肝细胞癌、肝胆管结石、肝炎后肝硬化和重型肝炎所致的急性肝功能衰竭', 2);
INSERT INTO `room` VALUES (21, '乳腺外科', '乳腺外科是临床外科学下一学科分支，主要针对乳腺疾病的外科学方面：乳腺解剖、乳腺感染、乳腺肿瘤病理、乳腺肿瘤诊治原则、乳腺肿瘤诊断、乳腺肿瘤外科手术的各种术式、化疗、放疗、内分泌治疗。', 2);
INSERT INTO `room` VALUES (22, '心血管外科', '心血管外科是一门有关人体的血管循环系统，包括动脉和静脉相关疾病的诊断及外科治疗的专科', 2);
INSERT INTO `room` VALUES (23, '心脏外科', '心脏外科是外科领域个分支中较年轻的一个学科，主要是以手术治疗心脏病，如心脏搭桥术、先天性心脏病手术、瓣膜置换术等。而所治疗的常见心脏病有：先天性心脏病、瓣膜性心脏病、冠心病、胸主动脉瘤、心包疾病、心脏肿瘤等。', 2);
INSERT INTO `room` VALUES (24, '器官移植', '移植是指将一个个体的细胞、组织或器官用手术或其他方法，导入自体或另一个个体的某一部分，以替代原已丧失功能的一门技术。根据导入移植物不同，分为细胞、组织和器官移植。', 2);
INSERT INTO `room` VALUES (25, '微创外科', '微创外科(Minimally Invasive Surgery MIS 、Minimal Access Surgery MAS)是通过微小创伤或微小入路，将特殊器械、物理能量或化学药剂送入人体内部，完成对人体内病变、畸形、创伤的灭活...', 2);
INSERT INTO `room` VALUES (26, '功能神经外科', '神经外科学从治疗的疾病谱上主要划分为脑肿瘤、脑血管病和功能脑病。采用手术的方法修正神经系统功能异常的医学分支是为功能神经外科学', 2);
INSERT INTO `room` VALUES (27, '腺体外科', '着重为乳腺、甲状腺以及胰腺等疾病', 2);
INSERT INTO `room` VALUES (28, '儿科综合', '针对新生儿至青少年时期的健康问题，但有些太过专科的情况需要专科解决，比如一些复杂的先天畸形的外科矫治。', 3);
INSERT INTO `room` VALUES (29, '小儿外科', '基本上是小儿方面的普外、骨科、泌尿', 3);
INSERT INTO `room` VALUES (30, '儿童保健科', '负责对儿童健康资料的收集、整理、分析和利用。儿童保健包括了医学、教育学、心理学、营养学、以及美学等多方面学科，全方面的对儿童进行综合保健。', 3);
INSERT INTO `room` VALUES (31, '新生儿科', '新生儿常见病、多发病及各种危重症的抢救治疗', 3);
INSERT INTO `room` VALUES (32, '小儿骨科', '刚出身的婴幼儿发生的骨折现象，以及先天性髋脱位、先天性多指（趾）畸形、先天性马蹄内翻足、儿童骨肿瘤等疾病', 3);
INSERT INTO `room` VALUES (33, '小儿神经内科', '小儿神经系统疾病，主要研究儿童遗传代谢病、线粒体病、儿童多发硬化及免疫性脑炎等', 3);
INSERT INTO `room` VALUES (34, '小儿呼吸科', '在儿童呼吸相关疑难重症疾病诊治，如儿童哮喘', 3);
INSERT INTO `room` VALUES (35, '小儿血液科', '小儿血液科主要是看关于小儿的血液系统相关疾病，如小儿白血病，小儿贫血，小儿再生障碍性贫血，小儿溶血性贫血等疾病。', 3);
INSERT INTO `room` VALUES (36, '小儿耳鼻喉科', '专注于14周岁（含14周岁）以下儿童耳鼻喉疾病的诊断、治疗及康复', 3);
INSERT INTO `room` VALUES (37, '小儿心内科', '小儿心内科主要是看关于小儿的心脏系统相关的疾病，如小儿心肌炎、心律失常', 3);
INSERT INTO `room` VALUES (38, '小儿康复科', '帮助小儿恢复身体功能', 3);
INSERT INTO `room` VALUES (39, '小儿精神科', '满足儿童少年心理健康需求，防止出现心理扭曲而不及时矫正，如校园暴力、精神分裂症', 3);
INSERT INTO `room` VALUES (40, '小儿妇科', '小儿妇科，是指新生儿到14岁这段时期，围绕女孩生殖器官的生长、发育、性生理改变及疾病而形成的相对独立的一门学科。', 3);
INSERT INTO `room` VALUES (41, '传染科', '传染病科是治疗传染病的部门。常见传染病有菌痢、伤寒、霍乱、甲型毒性肝炎、流脑、猩红热、百日咳、流感、麻疹、丝虫病、乙型脑炎、血吸虫病等。', 4);
INSERT INTO `room` VALUES (42, '肝病科', '肝病科，是一个与许多科室交叉的学科，如感染科、消化内科、肝胆外科、普外科，其诊疗内容内、外兼顾，涉及范围较广。', 4);
INSERT INTO `room` VALUES (43, '艾滋病科', '专门治疗艾滋病，艾滋病是一种危害性极大的传染病，由感染艾滋病病毒（HIV病毒）引起。HIV是一种能攻击人体免疫系统的病毒。它把人体免疫系统中最重要的CD4T淋巴细胞作为主要攻击目标，大量破坏该细胞，使人体丧失免疫功能。', 4);
INSERT INTO `room` VALUES (44, '传染危重室', '着重治疗危重性的传染病', 4);
INSERT INTO `room` VALUES (45, '妇产科综合', '妇科综合是指妇科基础学、妇科炎症、妇科内分泌相关疾病、妇科外伤性疾病的统称。', 5);
INSERT INTO `room` VALUES (46, '妇科', '妇科是妇产科的一个分支专业，是以诊疗女性妇科病为诊疗的专业科室，分为西医妇科与中医妇科。妇科疾病包括：女性生殖系统的疾病即为妇科疾病，包括外阴疾病、阴道疾病、子宫疾病、输卵管疾病、卵巢疾病等', 5);
INSERT INTO `room` VALUES (47, '产科', '主要研究女性生殖器官疾病的病因、病理、诊断及防治，妊娠、分娩的生理和病理变化，高危妊娠及难产的预防和诊治，女性生殖内分分泌，计划生育及妇女保健等。', 5);
INSERT INTO `room` VALUES (48, '妇科内分泌', '由于调节人体的代谢和生理功能出现肌肤恶化、脾气暴躁等状况', 5);
INSERT INTO `room` VALUES (49, '遗传咨询科', '遗传咨询是咨询医师和咨询者就其家庭中遗传病的病因、遗传方式、诊断、治疗、预防、复发风险等所面临的全部问题进行讨论和商谈，最后做出恰当的对策和选择，并在咨询医师的帮助下付诸实施，以达到防治效果的过程。除了外伤，绝大多数自发性疾病都可以列入遗传咨询范围。', 5);
INSERT INTO `room` VALUES (50, '产前检查科', '产前检查是指为妊娠期妇女提供一系列的医疗和护理建议和措施，目的是通过对于孕妇和胎儿的监护及早预防和发现并发症，减少其不良影响，在此期间提供正确的检查手段和医学建议是降低孕产妇死亡率和围产儿死亡率的关键。', 5);
INSERT INTO `room` VALUES (51, '妇泌尿科', '妇泌尿科是泌尿外科学与妇科学的一个临床分支学科。主要诊治与女性盆腔器官、肌肉和其周围支持器官、结缔组织相关的疾病，如尿失禁和盆底疾病。', 5);
INSERT INTO `room` VALUES (52, '前列腺', '主要治疗前列腺疾病', 6);
INSERT INTO `room` VALUES (53, '性功能障碍', '性功能是一个复杂的生理过程。正常性功能的维持依赖人体多系统的协作，涉及到神经系统、心血管系统、内分泌系统和生殖系统的协调一致，除此之外，还须具有良好的精神状态和健康的心理。', 6);
INSERT INTO `room` VALUES (54, '生殖器感染', '较常见的生殖感染有淋病、梅毒、非淋菌性尿道炎、尖锐湿疣、沙眼依原体、软下疳、生殖器疱疹、滴虫病、乙型肝炎和艾滋病等。', 6);
INSERT INTO `room` VALUES (55, '男性不育', '临床上把男性不育分为性功能障碍和性功能正常两类，后者依据精液分析结果可进一步分为无精子症、少精子症、弱精子症、精子无力症和精子数正常性不育。', 6);
INSERT INTO `room` VALUES (56, '生殖整形', '生殖整形是对生殖器的先天畸形及后天性缺损进行修复重建，以达到恢复或接近正常的生理功能与外形的目的。生殖整形按性别区分，分为女性生殖整形与男性生殖整形。', 6);
INSERT INTO `room` VALUES (57, '精神科', '精神科是一组以表现在行为、心理活动上的紊乱为主的神经系统疾病。主要是由于家庭、社会环境等外在原因，和患者自身的生理遗传因素、神经生化因素等内在原因相互作用所导致的心理活动、行为、及其神经系统功能紊乱为主要特征的病症', 7);
INSERT INTO `room` VALUES (58, '司法鉴定科', '司法鉴定是指在诉讼活动中鉴定人运用科学技术或者专门知识对诉讼涉及的专门性问题进行鉴别和判断并提供鉴定意见的活动。', 7);
INSERT INTO `room` VALUES (59, '药物依赖科', '药物依赖是一组认知、行为和生理症状群，使用者尽管明白使用成瘾物质会带来问题，但还在继续使用。药物滥用和依赖是社会、心理和生物因素相互作用的结果。', 7);
INSERT INTO `room` VALUES (60, '中医精神科', '中医、中西医结合、针灸、心理综合治疗神经症、精神分裂症、情感障碍，运用中西医结合手段治疗老年精神障碍。', 7);
INSERT INTO `room` VALUES (61, '双相障碍科', '主要治疗情感性精神障碍，以抑郁发作与躁狂或轻躁狂发作交替出现，或躁狂抑郁混合发作为特征的一类精神障碍。', 7);
INSERT INTO `room` VALUES (62, '皮肤科', '主要治疗各种皮肤病，常见皮肤病有牛皮癣 、 疱疹 、酒渣鼻 、脓疱疮 、化脓菌感染 、疤痕 、癣 、鱼鳞病 、腋臭 、青春痘 、毛囊炎 、斑秃脱发 、男科炎症 、婴儿尿布疹 、鸡眼 、雀斑 、汗疱疹 、螨虫性皮炎 、白癜风 、湿疹 、灰指甲 、硬皮病 、皮肤瘙痒 、口腔部护理 、脱毛 、黄褐斑等。', 8);
INSERT INTO `room` VALUES (63, '性病科', '性病科性病是危害人类最严重、发病最广泛的一种传染病', 8);
INSERT INTO `room` VALUES (64, '中医综合科', '集中医专家门诊、疼痛及痛风门诊、住院病区、西医康复、中医针灸、推拿、理疗为一体的综合性临床科室', 9);
INSERT INTO `room` VALUES (65, '针灸科', '针灸科是指在一般中医院中，以针灸为主要治疗手段，治疗部分针灸疗效较好疾病的特色科室。', 9);
INSERT INTO `room` VALUES (66, '中医骨科', '中医骨伤科学是研究防治人体皮肉、筋骨、气血、脏腑经络损伤与疾患的一门科学', 9);
INSERT INTO `room` VALUES (67, '中医妇产科', '中医妇科学传统的研究范围，包括月经不调、崩漏、带下、子嗣、临产、产后、；乳疾，症瘕、前阴诸疾及杂病等项', 9);
INSERT INTO `room` VALUES (68, '中医外科', '中医外科是以中医药理论为指导，研究外科疾病发生、发展及其防治规律的一门临床学科。包括疮疡、乳房疾病、瘿、瘤、岩、皮肤及性传播疾病、肛门直肠疾病、泌尿男性生殖系统疾病、周围血管和淋巴疾病及外科其他疾病等内容。', 9);
INSERT INTO `room` VALUES (69, '中医儿科', '以中医学理论体系为指导，中国传统的中药、针灸、推拿等治疗方法为手段，研究自胎儿至青少年这一时期小儿的生长发育、生理病理、喂养保健，以及各类疾病预防和治疗', 9);
INSERT INTO `room` VALUES (70, '中医肛肠科', '以中医学理论体系来治疗肛肠疾病', 9);
INSERT INTO `room` VALUES (71, '中医皮肤科', '以中药及针灸的方法来治疗皮肤类疾病', 9);
INSERT INTO `room` VALUES (72, '中医五官科', '利用中医理论来治疗五官，如中药熏蒸', 9);
INSERT INTO `room` VALUES (73, '中医按摩科', '利用中医理论进行按摩', 9);
INSERT INTO `room` VALUES (74, '中医消化科', '利用中医理论对消化系统的疾病进行理疗，如针灸', 9);
INSERT INTO `room` VALUES (75, '中医肿瘤科', '利用中医理论对肿瘤理疗，可以减轻放化疗等治疗的副反应，还有清热解毒、扶正益气等等辅助治疗的作用。', 9);
INSERT INTO `room` VALUES (76, '中医心内科', '利用中医理论对心脏等疾病进行理疗', 9);
INSERT INTO `room` VALUES (77, '中医神经内科', '利用中医的手段对精神方面的疾病进行治疗', 9);
INSERT INTO `room` VALUES (78, '中医肾病内科', '利用中医的手段对肾病方面的疾病进行治疗', 9);
INSERT INTO `room` VALUES (79, '肿瘤综合科', '常见疾病：肺癌 食管癌 直肠癌 肝癌 结肠癌 胰腺癌 腺癌 原发性肝癌 胆囊癌 纵膈肿瘤 贲门癌 胆管癌 胸腺瘤 鳞状细胞癌 胸膜间皮瘤', 10);
INSERT INTO `room` VALUES (80, '肿瘤内科', '肿瘤内科是以保守治疗为主，或者称为非手术治疗为主，比如做静脉输液化疗，比如做静脉输液营养支持，或者口服相关的药物治疗', 10);
INSERT INTO `room` VALUES (81, '放疗科', '利用放射性按治疗肿瘤', 10);
INSERT INTO `room` VALUES (82, '肿瘤外科', '肿瘤外科关键在根治性切除肿瘤病灶，包括周围正常组织切除+区域淋巴结清扫。', 10);
INSERT INTO `room` VALUES (83, '肿瘤妇科', '常见的妇科肿瘤有外阴肿瘤、阴道肿瘤、子宫肿瘤、卵巢肿瘤和输卵管肿瘤。以子宫及卵巢肿瘤多见，外阴及输卵管肿瘤少见。', 10);
INSERT INTO `room` VALUES (84, '骨肿瘤科', '骨肿瘤是发生于骨骼或其附属组织的肿瘤。有良性，恶性之分，良性骨肿瘤易根治，预后良好，恶性骨肿瘤发展迅速，预后不佳，死亡率高。恶性骨肿瘤分为原发性和继发性。从体内其他组织或器官的恶性肿瘤经血液循环、淋巴系统转移至骨骼为继发性恶性骨肿瘤。', 10);
INSERT INTO `room` VALUES (85, '肿瘤康复科', '肿瘤术后的恢复身体的基本功能', 10);
INSERT INTO `room` VALUES (86, '骨外科', '骨外科是医疗机构的一个诊疗科目，是创伤、脊柱外科的总称，是以诊疗各种类型断指、断掌、多指离断的再植、各种类型皮瓣移植、神经修复术、四肢先天性畸形、臂丛神经损伤及神经卡压的诊治的专业科室。', 11);
INSERT INTO `room` VALUES (87, '手外科', '手外科，指手部的外科学。手，是指腕部以远的部分，由腕部，手掌部及手指部构成；手的功能复杂，意义重大，是人类使用最为频繁，最为重要的的器官之一。', 11);
INSERT INTO `room` VALUES (88, '创伤骨科', '创伤骨科就是骨科学的一个细小的分支，面向的人群为各种创伤性疾病。比如上臂的骨折、下肢的骨折、脊柱的骨折以及其他部位的骨折等。所面临的人群主要是以各种骨折为主，但所治疗的人群和其他的科也有重叠的地方。', 11);
INSERT INTO `room` VALUES (89, '脊柱外科', '脊柱外科表针针对一些脊柱的变病', 11);
INSERT INTO `room` VALUES (90, '骨关节科', '骨关节外科以慢性病、老年病为主。', 11);
INSERT INTO `room` VALUES (91, '骨质疏松科', '骨质疏松（osteoporosis）系指每个单位内骨组织数量减少。专门针对老年人设立', 11);
INSERT INTO `room` VALUES (92, '矫形骨科', '对于一些骨头的矫正治疗', 11);
INSERT INTO `room` VALUES (93, '耳鼻咽喉头颈科', '针对耳鼻咽喉头颈的疾病进行检查及治疗', 12);
INSERT INTO `room` VALUES (94, '口腔科', '口腔科主要开展：正畸、冷光美白、美容性修复、精工制作各类烤瓷牙，局部可摘义齿、胶托、钢托、钛合金钢托牙及各类精密附件、即刻义齿、全口义齿。同时开展牙髓病、牙周病、根尖周病、根管治疗、玻璃离子、复合树脂光固化补牙及儿童牙病的预防和治疗。', 12);
INSERT INTO `room` VALUES (95, '眼科', '眼科的全称是“眼病专科”，是研究发生在视觉系统，包括眼球及与其相关联的组织有关疾病的学科。眼科一般研究玻璃体、视网膜疾病，眼视光学，青光眼和视神经病变，白内障等多种眼科疾病。', 12);
INSERT INTO `room` VALUES (96, '康复科', '进行手术等治疗后，恢复身体机能。', 13);
INSERT INTO `room` VALUES (97, '理疗科', '理疗科主要是利用人工或自然界物理因素作用于人体，使之产生有利的反应，达到预防和治疗疾病目的。物理因素通过对局部的直接作用，和神经、体液的间接作用引起人体反应，调整血液循环，改善营养代谢，提高免疫力，调节神经系统功能，促进组织修复，因而消除致病因素，改善病理过程，最后达到治病目的。', 13);
INSERT INTO `room` VALUES (98, '麻醉科', '所有手术的麻醉，保障病人在手术中及术后的无痛和舒适，最重要保证病人在术中的安全', 14);
INSERT INTO `room` VALUES (99, '疼痛科', '疼痛科主要治疗各种急性和慢性顽固性疼痛，为患者创造无痛轻松生活。', 14);
INSERT INTO `room` VALUES (100, '营养科', '营养科是对不同生理和病理状态下（包括疾病和医源性因素引起）的营养代谢改变者，通过营养检测和评价进行营养诊断，使用各类肠内营养制剂、肠外营养制剂和治疗膳食等进行营养治疗的临床业务科室。', 15);
INSERT INTO `room` VALUES (101, '高压氧科', '高压氧治疗为脑外伤的治疗提供了新的科学有效的辅助治疗方法，对改善脑外伤患者的预后，提高治愈率，降低致残率具有重大的现实意义。', 16);
INSERT INTO `room` VALUES (102, '功能检查科', '利用超声、内窥镜、心导管等仪器和检查技术、直接或间接观察肌体功能状态，取得各种参数或图像的科室。', 16);
INSERT INTO `room` VALUES (103, '病理科', '病理科其主要任务是在医疗过程中承担病理诊断工作，包括通过活体组织检查、脱落和细针穿刺细胞学检查以及尸体剖检，为临床提供明确的病理诊断，确定疾病的性质，查明死亡原因。', 16);
INSERT INTO `room` VALUES (104, '检验科', '检验科每天承担包括病房、门急诊病人、各类体检以及科研的各种人体和动物标本的检测工作。检验科分组　一般检验科按检查项目分组。', 16);
INSERT INTO `room` VALUES (105, '实验中心', '对一些病理切片进行研究', 16);
INSERT INTO `room` VALUES (106, '心电图科', '专门是心电图的检测', 16);
INSERT INTO `room` VALUES (107, '放射科', '放射科是一个集检查、诊断、治疗于一体的科室，临床各科许多疾病都须通过放射科设备检查达到明确诊断和辅助诊断。', 17);
INSERT INTO `room` VALUES (108, '超声诊断科', '利用超声对疾病进行检测', 17);
INSERT INTO `room` VALUES (109, '医学影像科', '为了医疗或医学研究，对人体或人体某部分，以非侵入方式取得内部组织影像的技术与处理', 17);
INSERT INTO `room` VALUES (110, '核医学科', '核医学科，利用核科学技术和手段对疾病进行诊断和治疗，是现代医学的主要手段之一，主要开展核医学检查项目，是辅助临床科室对疾病作出正确诊断的有效手段之一。', 17);
INSERT INTO `room` VALUES (111, '药剂科', '药剂科业务根据医院医疗、科研和教学的需要及基本用药目录编制药品计划，查询掌握药品科技和药品市场信息，向临床提供安全有效、质优价廉的各类药品', 18);
INSERT INTO `room` VALUES (112, '护理科', '对病人进行专业的照顾', 18);
INSERT INTO `room` VALUES (113, '体检科', '检查人体健康状况', 18);
INSERT INTO `room` VALUES (114, '急诊科', '急诊医学科（室）或急诊医学中心是医院中重症病人最集中、病种最多、抢救和管理任务最重的科室，是所有急诊病人入院治疗的必经之路。', 18);
INSERT INTO `room` VALUES (115, '公共卫生与预防科', '对于一些流感性疾病进行防御控制', 18);
INSERT INTO `room` VALUES (116, '设备科', '设备科是采购、管理医院医疗设备。', 18);
INSERT INTO `room` VALUES (117, '财务科', '负责收费管理及其他收入管理，包括收费许可证的报批，收费的组织工作，收费数据的管理，银行代收的稽核，离职离校手续的办理等与收费有关的工作。', 18);

-- ----------------------------
-- Table structure for rotation
-- ----------------------------
DROP TABLE IF EXISTS `rotation`;
CREATE TABLE `rotation`  (
  `rotNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图编号',
  `rotPicture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  `rotDescribe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片描述',
  `rotCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`rotNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rotation
-- ----------------------------
INSERT INTO `rotation` VALUES (1, '1.png', '无私奉献', '2020-10-14 18:23:44');
INSERT INTO `rotation` VALUES (2, '2.png', '白衣天使守护你', '2020-10-22 18:23:47');
INSERT INTO `rotation` VALUES (3, '3.png', '33', '2020-11-06 21:23:34');
INSERT INTO `rotation` VALUES (4, '4.png', '44', '2020-11-06 21:23:37');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `sectionNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '科编号',
  `sectionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科名称',
  PRIMARY KEY (`sectionNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES (1, '外科');
INSERT INTO `section` VALUES (2, '内科');
INSERT INTO `section` VALUES (3, '儿科');
INSERT INTO `section` VALUES (4, '传染病科');
INSERT INTO `section` VALUES (5, '妇产科');
INSERT INTO `section` VALUES (6, '男科');
INSERT INTO `section` VALUES (7, '精神心理科');
INSERT INTO `section` VALUES (8, '皮肤性病科');
INSERT INTO `section` VALUES (9, '中医科');
INSERT INTO `section` VALUES (10, '肿瘤科');
INSERT INTO `section` VALUES (11, '骨科');
INSERT INTO `section` VALUES (12, '五官科');
INSERT INTO `section` VALUES (13, '康复医学科');
INSERT INTO `section` VALUES (14, '麻醉医学科');
INSERT INTO `section` VALUES (15, '营养科');
INSERT INTO `section` VALUES (16, '医技科');
INSERT INTO `section` VALUES (17, '医学影像科');
INSERT INTO `section` VALUES (18, '其他科室');

-- ----------------------------
-- Table structure for timeslot
-- ----------------------------
DROP TABLE IF EXISTS `timeslot`;
CREATE TABLE `timeslot`  (
  `timeSlotId` int(11) NOT NULL COMMENT '时间段表设4条记录',
  `timeSlotRange` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '具体时间段的范围（8:00-10:00，14:00-16:00....）',
  PRIMARY KEY (`timeSlotId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of timeslot
-- ----------------------------
INSERT INTO `timeslot` VALUES (1, '上午');
INSERT INTO `timeslot` VALUES (2, '下午');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userName` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `idCardNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证号码',
  `socialCard` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '社保卡号',
  `phoneNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  PRIMARY KEY (`userNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_im_info
-- ----------------------------
DROP TABLE IF EXISTS `user_im_info`;
CREATE TABLE `user_im_info`  (
  `userIMNo` int(10) NOT NULL AUTO_INCREMENT,
  `userNo` int(20) DEFAULT NULL,
  `accid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`userIMNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_im_info
-- ----------------------------

-- ----------------------------
-- Procedure structure for conv_weekday
-- ----------------------------
DROP PROCEDURE IF EXISTS `conv_weekday`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conv_weekday`(`wkd` VARCHAR(20),`dutyNos` INT(10))
BEGIN

-- 获取当前年份周
  SET @str=(SELECT YEARWEEK(NOW())) ; 
-- 	拼接年份周和星期
	SET @sourceStr=CONCAT(@str,wkd);	
	
-- 	使用STR_TO_DATE（）转换成对应日期
	SET @strDate= (SELECT STR_TO_DATE(@sourceStr , '%X%V %W'));
-- 		将record表的dutyDate值修改为日期类型表示
	UPDATE `record` SET dutyDate=@strDate WHERE dutyNo=dutyNos;
	
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_data`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_data`(`wkd` VARCHAR(20),`dno` VARCHAR(20),`timeSlotId` VARCHAR(20))
BEGIN

-- 定义变量
    DECLARE v_i int unsigned DEFAULT 1;
	
    WHILE v_i < 4 DO
					
			SET @str=(SELECT YEARWEEK(NOW()))+v_i ; 
			-- 	拼接年份周和星期
			SET @sourceStr=CONCAT(@str,wkd);	
		   -- 	使用STR_TO_DATE（）转换成对应日期
			SET @strDate= (SELECT STR_TO_DATE(@sourceStr , '%X%V %W'));
			
      insert into record(dno,timeSlotId,dutyDate) VALUES(dno,timeSlotId,@strDate); 
		  SET v_i = v_i+1;
      
    END WHILE;

	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_data`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_data`(`id` INT(20))
BEGIN

-- 查询修改的值班日期
-- @d:2020-11-20
		set @d=(SELECT dutyDate    FROM record WHERE recordNo = id)	;
		
-- @d1:2020-11-27		
		set @d1=(SELECT  DATE_ADD(@d,INTERVAL 7 DAY))	;	
-- @r1:52				
		set @r1=(SELECT `recordNo`    FROM record WHERE recordNo > id LIMIT 1)	;
-- 将日期重新换算成周		@w1：202047
		set  @w1=(SELECT YEARWEEK(@d1));
-- 		将从数据库获取的日期类型值转换成英文表示的星期 @e_w1=Friday
		set @e_w1=(select DAYNAME(@d1));

-- 重新	拼接年份周和星期
--  @sourceStr1=202047Friday
	SET @sourceStr1=CONCAT(@w1,@e_w1);		
-- 	使用STR_TO_DATE（）转换成对应日期
	SET @strDate1= (SELECT STR_TO_DATE(@sourceStr1 , '%X%V %W'));
 UPDATE `record` SET dutyDate=@strDate1 WHERE recordNo=@r1 ;
-- 
-- -- 		-----------------------------------------------------------------------------------------------------------------
		
-- @d1:2020-11-27		
		set @d2=(SELECT  DATE_ADD(@d1,INTERVAL 7 DAY))	;	
-- @r1:52				
		set @r2=(SELECT `recordNo`    FROM record WHERE recordNo > @r1 LIMIT 1)	;
-- 将日期重新换算成周		@w1：202047
		set  @w2=(SELECT YEARWEEK(@d2));
-- 		将从数据库获取的日期类型值转换成英文表示的星期 @e_w1=Friday
		set @e_w2=(select DAYNAME(@d2));

-- 重新	拼接年份周和星期
--  @sourceStr1=202047Friday
	SET @sourceStr2=CONCAT(@w2,@e_w2);		
-- 	使用STR_TO_DATE（）转换成对应日期
	SET @strDate2= (SELECT STR_TO_DATE(@sourceStr2 , '%X%V %W'));
 UPDATE `record` SET dutyDate=@strDate2 WHERE recordNo=@r2 ;
-- 
-- -- 		-----------------------------------------------------------------------------------------------------------------
-- @d1:2020-11-27		
		set @d3=(SELECT  DATE_ADD(@d2,INTERVAL 7 DAY))	;	
-- @r1:52				
		set @r3=(SELECT `recordNo`    FROM record WHERE recordNo > @r2 LIMIT 1)	;
-- 将日期重新换算成周		@w1：202047
		set  @w3=(SELECT YEARWEEK(@d3));
-- 		将从数据库获取的日期类型值转换成英文表示的星期 @e_w1=Friday
		set @e_w3=(select DAYNAME(@d3));

-- 重新	拼接年份周和星期
--  @sourceStr1=202047Friday
	SET @sourceStr3=CONCAT(@w3,@e_w3);		
-- 	使用STR_TO_DATE（）转换成对应日期
	SET @strDate3= (SELECT STR_TO_DATE(@sourceStr3 , '%X%V %W'));
 UPDATE `record` SET dutyDate=@strDate3 WHERE recordNo=@r3 ;
-- 


-- -- 		-----------------------------------------------------------------------------------------------------------------
-- @d1:2020-11-27		
		set @d4=(SELECT  DATE_ADD(@d3,INTERVAL 7 DAY))	;	
-- @r1:52				
		set @r4=(SELECT `recordNo`    FROM record WHERE recordNo > @r3 LIMIT 1)	;
-- 将日期重新换算成周		@w1：202047
		set  @w4=(SELECT YEARWEEK(@d4));
-- 		将从数据库获取的日期类型值转换成英文表示的星期 @e_w1=Friday
		set @e_w4=(select DAYNAME(@d4));

-- 重新	拼接年份周和星期
--  @sourceStr1=202047Friday
	SET @sourceStr4=CONCAT(@w4,@e_w4);		
-- 	使用STR_TO_DATE（）转换成对应日期
	SET @strDate4= (SELECT STR_TO_DATE(@sourceStr4 , '%X%V %W'));
 UPDATE `record` SET dutyDate=@strDate4 WHERE recordNo=@r4 ;
-- 
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table duty
-- ----------------------------
DROP TRIGGER IF EXISTS `sychronization_record_addinfo`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` TRIGGER `sychronization_record_addinfo` AFTER INSERT ON `duty` FOR EACH ROW BEGIN
	insert into record(dno,dutyNo,timeSlotId,dutyDate) VALUES(new.dno,new.dutyNo,new.timeSlotId,new.dutyDate);
	select new.dutyDate INTO @dweek ;
	select new.dutyNo INTO @did ;
	select new.dno INTO @dno ;
	select new.timeSlotId INTO @timeSlotId ;
	call conv_weekday(@dweek,@did);
	call insert_data(@dweek,@dno,@timeSlotId);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table duty
-- ----------------------------
DROP TRIGGER IF EXISTS `update_record`;
delimiter ;;
CREATE DEFINER = `root`@`localhost` TRIGGER `update_record` AFTER UPDATE ON `duty` FOR EACH ROW BEGIN
update record  set  timeSlotId=new.timeSlotId ,dutyDate=new.dutyDate  where record.dutyNo=new.dutyNo;
	select new.dutyDate INTO @dweek ;
	select new.dutyNo INTO @did ;
	select recordNo INTO @rid FROM record where record.dutyNo=new.dutyNo;
	call conv_weekday(@dweek,@did);
	call update_data(@rid);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
