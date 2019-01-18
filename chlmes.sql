/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : chlmes

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 18/01/2019 11:34:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_art
-- ----------------------------
DROP TABLE IF EXISTS `t_art`;
CREATE TABLE `t_art`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Art_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `Art_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Art_used` tinyint(1) NULL DEFAULT NULL COMMENT '有效状态',
  `Art_explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `Art_date` datetime(0) NULL DEFAULT NULL,
  `Art_manager` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工艺管理员',
  `company_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_art
-- ----------------------------
INSERT INTO `t_art` VALUES (21, '202', '189131.4作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (13, '101', 'A858.859作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (5, '004', 'PA001作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (6, '005', 'PA002作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (7, '006', 'PA003作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (8, '007', 'PA004作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (9, '008', 'PA005作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (10, '009', 'PA006作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (11, '010', 'PA007作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (12, '011', 'PA008作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (15, '103', 'A73.74.75.76作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (20, '102', '877、878作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (39, '106', 'A0056455作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (22, '201', '192376.4作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (24, 'SPA004', '800039.0 作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (29, 'SPA003', '325835.0 作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (28, 'SPA003', '325835.0 作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (30, 'SPA005', '306720.2 作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (31, 'SPA006', '192303.1 作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (32, 'SPA007', '325842.0 作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (33, 'SPA008', 'HMN4720552505 作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (34, 'SPA009', '325808.0 作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (35, '105', 'A00433、434作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (36, 'SPA010', '325908.0 作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (37, 'SPA011', '306721.3 作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (40, '107', 'A0051045、46作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (41, '108', 'A0037984、85作业指导书', 1, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (42, '109', 'A0041460作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (43, '104', 'A00287、288作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (44, 'SPA001', '189131.4、192376.4 作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (45, 'SPA002', '192478.2、192568.3 作业指导书', 1, '', NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (46, 'SPA001_1', '复制_189131.4、192376.4 作业指导书', 0, NULL, NULL, NULL, NULL);
INSERT INTO `t_art` VALUES (47, 'THK001', 'THK作业指导书（HOY）', 1, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_artdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_artdetail`;
CREATE TABLE `t_artdetail`  (
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `Art_id` int(11) NOT NULL COMMENT '工艺编号',
  `Work_order` int(11) NOT NULL COMMENT '顺序',
  `Work_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工序名称',
  `Work_add` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `person_liable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `Unt_NameCn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `Stat_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计件计时',
  `show_num` tinyint(1) NULL DEFAULT 0 COMMENT '客户端是否显示数量1显示0不显示',
  `isproduce` tinyint(4) NULL DEFAULT 0 COMMENT '是否生产用工序0不是，1是生产用',
  `isquality` tinyint(1) NULL DEFAULT 1 COMMENT '是否质检工序0非质检，1质检',
  `isattachment` tinyint(1) NULL DEFAULT 0 COMMENT '附加项',
  `attachvalue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '附加项值',
  `pstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态',
  `workcenter` int(11) NULL DEFAULT NULL,
  `Work_sumcost` decimal(10, 2) NULL DEFAULT NULL COMMENT '标准工序总成本',
  `work_number` int(10) NULL DEFAULT NULL COMMENT '计件计时起算数量',
  `work_pretime` decimal(10, 2) NULL DEFAULT NULL COMMENT '准备时数（小时）',
  `work_explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工序说明',
  `work_filename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  PRIMARY KEY (`det_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 557 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_artdetail
-- ----------------------------
INSERT INTO `t_artdetail` VALUES (114, 17, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200°C。使用设备：中频加热炉。加热节拍：6-11S。每天必须用高温计校对炉温，看测温仪和高温计数是否保持一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (112, 17, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：GB45钢，下料符合产品下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (113, 17, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用热模铁对模具进行加热，模具温度为200~300°C，用手提测温枪检测模具球头为标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (12, 4, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 6, 0.00, 0, 0.00, '材质：45钢，下料负荷产品下料作业指导书.', NULL);
INSERT INTO `t_artdetail` VALUES (13, 4, 2, '磨具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 6, 0.00, 0, 0.00, '磨具预热：', NULL);
INSERT INTO `t_artdetail` VALUES (14, 5, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：GB45钢，下料符合产品下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (15, 5, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用热模铁对模具进行加热，模具温度为200~300°C，用手提测温枪检测模具球头为标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (16, 5, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200°C。使用设备：中频加热炉。加热节拍：6-11S。每天必须用高温计校对炉温，看测温仪和高温计数是否保持一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (17, 5, 5, '制坯', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '制坯使用设备：150kg空气锤。检测：自己标准样坯放置锤砧作为后续坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (18, 5, 6, '成型', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具：PA12359.00成型压模；使用设备：300T摩擦压力机。每班锻打试棒一根，尺寸Φ20×180。;', NULL);
INSERT INTO `t_artdetail` VALUES (19, 5, 7, '热冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具PA12359.00热冲孔模；使用设备63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (20, 5, 8, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具：PA12359.00切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (21, 5, 9, '检验', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷；尺寸按产品图检测。', NULL);
INSERT INTO `t_artdetail` VALUES (22, 5, 10, '选别、修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (23, 5, 11, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火：抗拉强度545-850N/MM²', NULL);
INSERT INTO `t_artdetail` VALUES (24, 5, 12, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (25, 5, 13, '冷精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：冷精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (26, 5, 14, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (27, 5, 15, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (28, 5, 16, '清洗、浸油', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，使用油基防锈液清洗1-2分钟，产品无漏禁油。', NULL);
INSERT INTO `t_artdetail` VALUES (29, 5, 17, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '包装入库。', NULL);
INSERT INTO `t_artdetail` VALUES (30, 6, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:45钢，下料符合产品下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (31, 6, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用产品棒料加热后对模具进行加热，温度为150~300°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (32, 6, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200°C。使用设备：中频加热炉。加热节拍：6-11S。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (33, 6, 4, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：250kg空气锤；检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (34, 6, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清楚干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具：PA12109.00切边模；使用设备：400T摩擦压力机。每班锻打试棒一根，尺寸Φ20×180。', NULL);
INSERT INTO `t_artdetail` VALUES (35, 6, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具：PA12A109.00切边模；使用设备：400T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (36, 6, 7, '检验', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷；尺寸按产品图检测。', NULL);
INSERT INTO `t_artdetail` VALUES (37, 6, 8, '选别丶修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹，氧化皮，折叠，毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (38, 6, 9, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火：抗拉强度545-890N/mm²。', NULL);
INSERT INTO `t_artdetail` VALUES (39, 6, 10, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (40, 6, 11, '冷冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具PA12A109.00冷冲孔模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (41, 6, 12, '精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (42, 6, 13, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹，氧化皮，折叠，毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (43, 6, 14, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (44, 6, 15, '清洗、浸油', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，使用油机防锈液清洗1-2分钟，产品无漏浸油。', NULL);
INSERT INTO `t_artdetail` VALUES (45, 6, 16, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '包装入库', NULL);
INSERT INTO `t_artdetail` VALUES (46, 7, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：45#，下料根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (47, 7, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用产品棒料加热后对模具进行加热，温度为150~300°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (48, 7, 3, '棒料加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200°C，加热节拍：9-18S。100%按照《电炉加热工艺》和《烧制监控记录》。每天必须用高温计较对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (49, 7, 4, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：空气锤与63吨冲床；使用模具：PA12276.00(PA12277.00)折弯模。检测：自制标准样坯放置工序旁，作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (50, 7, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具:PA12276.00（PA12277.00）成型压模；使用设备：400T压力机。每班班前用产品棒料锻打Φ20*L试棒。', NULL);
INSERT INTO `t_artdetail` VALUES (51, 7, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具：PA12276.00(PA12277.00)切边模，使用设备63吨冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (52, 7, 7, '检验', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷。尺寸按产品图检测。', NULL);
INSERT INTO `t_artdetail` VALUES (53, 7, 8, '修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '修磨锻件存在外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (54, 7, 9, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火：抗拉强度545-850N/mm²。', NULL);
INSERT INTO `t_artdetail` VALUES (55, 7, 10, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (56, 7, 11, '冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用冲孔模，使用设备：63吨冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (57, 7, 12, '精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用精压模，使用设备160吨压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (58, 7, 13, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹，氧化皮，折叠，毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (59, 7, 14, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (60, 7, 15, '清洗、浸油', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，用煤油清洗1-2分钟，油机防锈液浸泡。', NULL);
INSERT INTO `t_artdetail` VALUES (61, 7, 16, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求。', NULL);
INSERT INTO `t_artdetail` VALUES (62, 8, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：45钢，下料符合产品下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (63, 8, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用产品棒料加热后对模具进行加热，温度为150~300℃，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (64, 8, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200℃。使用设备：中频加热炉。加热节拍：6-11S。每天必须用高温计校对炉温，看测温仪和高温计读数是否一只，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (65, 8, 4, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：150kg空气锤；检测：自制标准坯放置锤砧作为后续坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (66, 8, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用成型模具。使用设备：300T摩擦压力机。每班锻打试棒一根，尺寸Φ20×180。', NULL);
INSERT INTO `t_artdetail` VALUES (67, 8, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用切边模具，使用设备：60T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (68, 8, 7, '检验', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷；尺寸按产品图检测。', NULL);
INSERT INTO `t_artdetail` VALUES (69, 8, 8, '选别丶修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (70, 8, 9, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火：抗拉强度 545-850N/mm²。', NULL);
INSERT INTO `t_artdetail` VALUES (71, 8, 10, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (72, 8, 11, '冷冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用冲孔模具冷冲孔，使用设备63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (73, 8, 12, '精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模。使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (74, 8, 13, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (75, 8, 14, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (76, 8, 15, '清洗丶浸油', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，使用油基防锈液清洗1-2分钟，产品无漏禁油。', NULL);
INSERT INTO `t_artdetail` VALUES (77, 8, 16, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '包装入库。', NULL);
INSERT INTO `t_artdetail` VALUES (78, 9, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：45#。 下料根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (79, 9, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用产品棒料加热后对模具进行加热，温度为150~300℃，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (80, 9, 3, '棒料加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200℃，加热节拍：15-30S。100%按照《电炉加热工艺》。做好《烧制监控记录》。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (81, 9, 4, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：空气锤与63吨冲床。使用折弯模折弯。检测：自制标准样坯放置工序旁，作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (82, 9, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用成型压模，使用设备630T压力机。每班班前用产品棒料锻打φ20*L试棒。', NULL);
INSERT INTO `t_artdetail` VALUES (83, 9, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用切边模具切模，使用设备，63吨冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (84, 9, 7, '检验', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷；尺寸按产品图检测。', NULL);
INSERT INTO `t_artdetail` VALUES (85, 9, 8, '修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '修磨锻件存在外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (86, 9, 9, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火，抗拉强度545-850N/mm²。', NULL);
INSERT INTO `t_artdetail` VALUES (87, 9, 10, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (88, 9, 11, '冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用冲孔模冲孔，使用设备：63吨冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (89, 9, 12, '精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用精压模精压；使用设备：160吨压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (90, 9, 13, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (91, 9, 14, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (92, 9, 15, '清洗、浸油', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，用煤油清洗1-2分钟，油基防锈液浸泡。', NULL);
INSERT INTO `t_artdetail` VALUES (93, 9, 16, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求。', NULL);
INSERT INTO `t_artdetail` VALUES (94, 10, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：45#，下料根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (95, 10, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用产品棒料加热后对模具进行加热，温度为200~300℃，手提测温仪以模腔最深处为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具的预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (96, 11, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：45#，下料根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (97, 11, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为200~300℃，手提测温仪以模腔最深处为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (98, 11, 3, '棒料加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100~1200℃，加热节拍：15-30S。100%按照《电炉加热工艺》。做好《烧制监控记录》。每天必须用高温计较对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (99, 11, 4, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：空气锤与63吨冲床；使用折弯模折弯。检测：自制标准样坯放置工序旁，作为后续坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (100, 11, 5, '成型', '', '成型', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用成型压模；使用设备：400T压力机。每班班前用产品棒料锻打Φ20×L棒料。', NULL);
INSERT INTO `t_artdetail` VALUES (101, 11, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用切边模切切边。使用设备：63吨冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (102, 11, 7, '检测', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷;尺寸按产品图检测', NULL);
INSERT INTO `t_artdetail` VALUES (103, 11, 8, '修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '修磨锻件存在外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (104, 11, 9, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火，抗拉强度545-850N/mm²。', NULL);
INSERT INTO `t_artdetail` VALUES (105, 11, 10, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (106, 11, 11, '冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用冲孔模冲孔。使用设备：63吨冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (107, 11, 12, '精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用精压模精压，使用设备：160吨压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (108, 11, 13, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (109, 11, 14, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (110, 11, 15, '磷化', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备。', NULL);
INSERT INTO `t_artdetail` VALUES (111, 11, 16, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求。', NULL);
INSERT INTO `t_artdetail` VALUES (115, 17, 4, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '制坯使用设备：150kg空气锤。检测：自己标准样坯放置锤砧作为后续坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (116, 17, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具：PA12359.00成型压模；使用设备：300T摩擦压力机。每班锻打试棒一根，尺寸Φ20×180。;', NULL);
INSERT INTO `t_artdetail` VALUES (117, 17, 6, '热冲孔', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具PA12359.00热冲孔模；使用设备63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (118, 17, 7, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具：PA12359.00切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (119, 17, 8, '检验', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有毛刺、裂纹、冷隔、折叠、氧化皮等缺陷；尺寸按产品图检测。', NULL);
INSERT INTO `t_artdetail` VALUES (120, 17, 9, '选别、修磨', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (121, 17, 10, '热处理', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火：抗拉强度545-850N/MM²', NULL);
INSERT INTO `t_artdetail` VALUES (122, 17, 11, '抛丸', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (123, 17, 12, '冷精压', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：冷精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (124, 17, 13, '选别', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (125, 17, 14, '磁粉探伤', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (126, 17, 15, '清洗、浸油', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，使用油基防锈液清洗1-2分钟，产品无漏禁油。', NULL);
INSERT INTO `t_artdetail` VALUES (127, 17, 16, '包装', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '包装入库。', NULL);
INSERT INTO `t_artdetail` VALUES (181, 13, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和A0048858/A0048859切边模。切边模每三个班次需要对模具返修一次。', NULL);
INSERT INTO `t_artdetail` VALUES (182, 13, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品上线温度范围严格控制在750-900℃，下线温度＜500℃抗拉强度：Rm600-800N/mm²。', NULL);
INSERT INTO `t_artdetail` VALUES (183, 13, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：角磨机/砂轮机。修磨锻件存在外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (184, 13, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：抛丸机。产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (185, 13, 10, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：160T摩压机和A0048858/A0048859精压模。', NULL);
INSERT INTO `t_artdetail` VALUES (186, 13, 11, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (187, 13, 12, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (188, 13, 13, '材料分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：分选机。无混料、无漏热处理工序、无错热处理工艺产品。', NULL);
INSERT INTO `t_artdetail` VALUES (189, 13, 14, '磷化', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '盐雾试验最少10分钟产品无变色。', NULL);
INSERT INTO `t_artdetail` VALUES (190, 13, 15, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，无裂纹、毛刺、折叠等锻造缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (191, 13, 16, '防锈丶包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '防锈油全部覆盖在产品表面。包装按客户要求。', NULL);
INSERT INTO `t_artdetail` VALUES (157, 20, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (141, 15, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (142, 15, 10, '冲孔', '', '', '', '', 1, 1, 0, 1, '01', '1', 0, 0.00, 0, 0.00, '使用冲孔模冲孔，使用设备63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (143, 15, 11, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备160吨摩压机；使用模具精压模。', NULL);
INSERT INTO `t_artdetail` VALUES (144, 15, 12, '铣平面', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：铣床', NULL);
INSERT INTO `t_artdetail` VALUES (145, 15, 13, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、毛刺、氧化皮、折叠等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (146, 15, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤', NULL);
INSERT INTO `t_artdetail` VALUES (147, 15, 15, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：硬度分选仪。', NULL);
INSERT INTO `t_artdetail` VALUES (148, 15, 16, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件无裂纹、毛刺、折叠等锻造缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (149, 15, 17, '浸油包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '油基防锈液浸泡1~2分钟。按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (175, 20, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB160-220.', NULL);
INSERT INTO `t_artdetail` VALUES (308, 31, 10, '检验', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有裂纹、氧化皮、折叠、毛刺、冷隔等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (179, 13, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：空气锤。', NULL);
INSERT INTO `t_artdetail` VALUES (180, 13, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '300T压力机和A0048858/A0048859成形模。班前用加热后的棒料预热模具，温度为250-400℃。检验标准为滴油冒白烟。成形模具需每两个班次需要对模具返修一次。连续作业时，喷石墨乳冷却润滑。', NULL);
INSERT INTO `t_artdetail` VALUES (133, 15, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质C35，根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (134, 15, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '节拍5S~9S,温度1000~1080°，加热棒料：温度超过上差的棒料，给予报废处理，严禁使用。温度低于下差的棒料，只允许抛丸后重复加热使用一次。每班用高温计校对炉温，对比测温仪和高温计是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (135, 15, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '150Kg空气锤。', NULL);
INSERT INTO `t_artdetail` VALUES (136, 15, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用300T摩擦压力机和成型模具，班前用加热后的棒料预热模具，温度为250-400℃，检验标准为滴油或喷石墨乳冒白烟，成型模具需每两个班次需要对模具返修一次。连续作业喷石墨乳冷却润滑。', NULL);
INSERT INTO `t_artdetail` VALUES (137, 15, 6, '锻压', '', '', '', '', 1, 1, 0, 1, '02', '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (138, 15, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边落实，方可冲切。使用设备63T冲床；使用模具切边模。', NULL);
INSERT INTO `t_artdetail` VALUES (140, 15, 8, '修磨', '', '', '', '', 1, 1, 1, 1, '02', '1', 0, 0.00, 0, 0.00, '修磨锻件存在的外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (132, 5, 4, '锻造', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (158, 20, 10, '冷冲孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用冲孔模冲孔，使用设备63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (159, 20, 11, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备160吨冲床；使用模具：精压模。', NULL);
INSERT INTO `t_artdetail` VALUES (160, 20, 15, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '硬度分选仪', NULL);
INSERT INTO `t_artdetail` VALUES (161, 20, 13, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、毛刺、氧化皮、折叠等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (162, 20, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤', NULL);
INSERT INTO `t_artdetail` VALUES (163, 20, 12, '铣平面', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '铣床', NULL);
INSERT INTO `t_artdetail` VALUES (176, 13, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质C45，下料根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (165, 20, 18, '浸油丶包装', '', '', '', '', 1, 1, 0, 0, NULL, '-1', 0, 0.00, 0, 0.00, '油基防锈液浸泡1~2分钟。按客户要求发货。', NULL);
INSERT INTO `t_artdetail` VALUES (166, 20, 19, '包装发货', '', '', '', '', 0, 0, 0, 0, NULL, '-1', 0, 0.00, 0, 0.00, '外包装用免熏蒸木箱，内包装为VCI粗料袋，木箱尺寸800mm×600mm×550mm,装入量数量1400件/箱。根据TRW要求发货。', NULL);
INSERT INTO `t_artdetail` VALUES (167, 20, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (168, 0, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '节拍9S~15S,温度1100~1180°，加热棒料：温度超过上差的棒料，给予报废处理，严禁使用。温度低于下差的棒料，只允许抛丸后重复加热使用一次。每班用高温计校对炉温，对比测温仪和高温计是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (169, 20, 3, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '150Kg空气锤。', NULL);
INSERT INTO `t_artdetail` VALUES (170, 20, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用300T电动螺旋和成型模具，班前用加热后的棒料预热模具，温度为250-400℃，检验标准为滴油或喷石墨乳冒白烟，成型模具需每两个班次需要对模具返修一次。连续作业喷石墨乳冷却润滑。', NULL);
INSERT INTO `t_artdetail` VALUES (171, 20, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (172, 20, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边落实，方可冲切。使用设备63T冲床；使用模具切边模。', NULL);
INSERT INTO `t_artdetail` VALUES (177, 13, 6, '锻压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (178, 13, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：中频电炉。加热节拍：5S~9S。温度：1000~1080℃。温度超过上差的棒料，给予报废处理，严禁使用。温度低于下差的棒料，只允许抛丸后重复加热使用一次。', NULL);
INSERT INTO `t_artdetail` VALUES (174, 20, 8, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '修磨锻件存在的外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (193, 15, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HV170~230（Rm540-750N/mm²）', NULL);
INSERT INTO `t_artdetail` VALUES (194, 22, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书下料', NULL);
INSERT INTO `t_artdetail` VALUES (195, 22, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '每班班前用产品棒料加热后对模具进行加热，温度为150~300℃，以滴废机油为检验标准，生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (196, 22, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000~1100℃。使用设备：中频加热炉。加热节拍：7-13S100%通过温度分选仪分选。做好《烧制监控记录》。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%', NULL);
INSERT INTO `t_artdetail` VALUES (197, 22, 4, '预制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：150T空气锤。检测：自制标准样坯放置锤砧作为后续坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (469, 20, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '设备：中频电炉节拍：5S-9S温度：1000℃-1080℃', NULL);
INSERT INTO `t_artdetail` VALUES (198, 20, 16, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '无裂纹、毛刺、折叠等锻造缺陷(符合TRW S0000302标准）', NULL);
INSERT INTO `t_artdetail` VALUES (200, 24, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:16MnCr5 符合标准DIN 17210', NULL);
INSERT INTO `t_artdetail` VALUES (201, 24, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (202, 24, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000～1100℃。使用设备：中频加热炉。 ;加热节拍：7-13s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。 ; ; ;;', NULL);
INSERT INTO `t_artdetail` VALUES (203, 24, 4, '预制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：150T空气锤;;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (204, 24, 5, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：300T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (205, 24, 6, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。 ;;使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (206, 24, 7, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (207, 24, 8, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理硬度140-187HBW。', NULL);
INSERT INTO `t_artdetail` VALUES (208, 24, 9, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品修磨 无毛刺折叠等缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (209, 24, 10, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (210, 24, 11, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺、冷隔等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (211, 24, 12, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (212, 24, 13, '厚度选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (213, 24, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (214, 24, 15, '产品喷码', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '探伤后对产品100%喷码', NULL);
INSERT INTO `t_artdetail` VALUES (215, 24, 16, '清洗，包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (216, 0, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:16MnCr5 符合标准 DIN 17210', NULL);
INSERT INTO `t_artdetail` VALUES (217, 25, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (218, 25, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000～1100℃。使用设备：中频加热炉。 ;加热节拍：7-13s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。 ; ; ;;', NULL);
INSERT INTO `t_artdetail` VALUES (219, 25, 4, '预制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：150T空气锤;;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (220, 25, 5, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：300T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (221, 25, 6, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。 ;;使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (222, 25, 7, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (223, 25, 8, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理硬度140-187HBW。', NULL);
INSERT INTO `t_artdetail` VALUES (224, 25, 9, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品修磨 无毛刺折叠等缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (225, 25, 10, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (226, 25, 11, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺、冷隔等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (227, 25, 12, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (228, 25, 13, '厚度选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (229, 25, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (230, 25, 15, '产品喷码', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '探伤后对产品100%喷码', NULL);
INSERT INTO `t_artdetail` VALUES (231, 25, 16, '清洗，包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (233, 27, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (234, 27, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品上线温度范围严格控制在750-900℃，下线温度&lt;500℃。HB160-220（Rm540-750N/mm²）。', NULL);
INSERT INTO `t_artdetail` VALUES (235, 27, 10, '冲孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用冲孔模冲孔，使用设备63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (236, 27, 11, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备160吨摩压机；使用模具精压模。', NULL);
INSERT INTO `t_artdetail` VALUES (237, 27, 12, '铣平面', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：铣床', NULL);
INSERT INTO `t_artdetail` VALUES (238, 27, 13, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别锻件是否存在裂纹、毛刺、氧化皮、折叠等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (239, 27, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤', NULL);
INSERT INTO `t_artdetail` VALUES (240, 27, 15, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：硬度分选仪。', NULL);
INSERT INTO `t_artdetail` VALUES (241, 27, 17, '浸油丶包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '油基防锈液浸泡1~2分钟。按客户要求发货。', NULL);
INSERT INTO `t_artdetail` VALUES (470, 20, 17, '浸油丶包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '油基防锈液浸泡按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (243, 27, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质C35R，根据下料作业指导书。', NULL);
INSERT INTO `t_artdetail` VALUES (244, 27, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '节拍5S~9S,温度1000~1080°，加热棒料：温度超过上差的棒料，给予报废处理，严禁使用。温度低于下差的棒料，只允许抛丸后重复加热使用一次。每班用高温计校对炉温，对比测温仪和高温计是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (245, 27, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '150Kg空气锤。', NULL);
INSERT INTO `t_artdetail` VALUES (246, 27, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用300T摩擦压力机和成型模具，班前用加热后的棒料预热模具，温度为250-400℃，检验标准为滴油或喷石墨乳冒白烟，成型模具需每两个班次需要对模具返修一次。连续作业喷石墨乳冷却润滑。', NULL);
INSERT INTO `t_artdetail` VALUES (247, 27, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (248, 27, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边落实，方可冲切。使用设备63T冲床；使用模具切边模。', NULL);
INSERT INTO `t_artdetail` VALUES (249, 27, 8, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '修磨锻件存在的外观缺陷和切边毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (250, 27, 16, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，表面无缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (252, 28, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:16MnCr5 符合标准EN 10084', NULL);
INSERT INTO `t_artdetail` VALUES (253, 28, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为200~300°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (254, 28, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000～1100℃。使用设备：中频加热炉。 ;加热节拍：7-13s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。 ; ; ;;', NULL);
INSERT INTO `t_artdetail` VALUES (255, 28, 4, '预制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：150T空气锤;;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (256, 28, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：300T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (257, 28, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。 ;;使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (258, 28, 7, '锻压', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (259, 28, 8, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理硬度140-187HBW。组织为铁素体+珠光体', NULL);
INSERT INTO `t_artdetail` VALUES (260, 28, 9, '修磨', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品修磨 无毛刺折叠等缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (261, 28, 10, '抛丸', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (262, 28, 11, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (263, 28, 12, '精压', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (264, 28, 13, '厚度选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (265, 28, 14, '磁粉探伤', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (266, 28, 15, '产品喷码', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '探伤后对产品100%喷码', NULL);
INSERT INTO `t_artdetail` VALUES (267, 28, 16, '清洗，包装', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (268, 25, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：16MnCr5 符合标准DIN 17210', NULL);
INSERT INTO `t_artdetail` VALUES (269, 29, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:16MnCr5 符合标准EN 10084', NULL);
INSERT INTO `t_artdetail` VALUES (270, 29, 2, '模具预热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为200~300°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (271, 29, 3, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000～1100℃。使用设备：中频加热炉。 ;加热节拍：7-13s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。 ; ; ;;', NULL);
INSERT INTO `t_artdetail` VALUES (272, 29, 4, '预制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：150T空气锤;;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (273, 29, 5, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：300T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (274, 29, 6, '切边', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。 ;;使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (275, 29, 7, '锻压', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (276, 29, 8, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理硬度140-187HBW。组织为铁素体+珠光体', NULL);
INSERT INTO `t_artdetail` VALUES (277, 29, 9, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品修磨 无毛刺折叠等缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (278, 29, 10, '抛丸', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (279, 29, 11, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (280, 29, 12, '精压', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (281, 29, 13, '厚度选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (282, 29, 14, '磁粉探伤', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (283, 29, 15, '产品喷码', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '探伤后对产品100%喷码', NULL);
INSERT INTO `t_artdetail` VALUES (284, 29, 16, '清洗，包装', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (285, 30, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:16MnCr5; 产地江阴兴澄（SPA专用料）;', NULL);
INSERT INTO `t_artdetail` VALUES (286, 30, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (287, 30, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000～1100℃。使用设备：中频加热炉。 加热节拍：6-11s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (288, 30, 4, '预制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：63T冲床；压扁去除氧化皮;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (289, 30, 5, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。;使用模具成型压模；使用设备：400T电动螺旋。', NULL);
INSERT INTO `t_artdetail` VALUES (290, 30, 6, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。;使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (291, 30, 7, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (292, 30, 8, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '去除产品上的毛刺等外观缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (293, 30, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '抛丸；使用设备：抛丸机', NULL);
INSERT INTO `t_artdetail` VALUES (294, 30, 10, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺、等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (295, 30, 11, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤，选别；', NULL);
INSERT INTO `t_artdetail` VALUES (296, 30, 12, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (297, 30, 13, '厚度选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100% 厚度选别', NULL);
INSERT INTO `t_artdetail` VALUES (298, 30, 14, '清洗、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (299, 31, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：C45/GB', NULL);
INSERT INTO `t_artdetail` VALUES (300, 31, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (301, 31, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1000～1100℃。使用设备：中频加热炉。 加热节拍：7-13s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (302, 31, 4, '预制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：63T冲床;;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (303, 31, 5, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (304, 31, 6, '冲孔', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具冲孔模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (305, 31, 7, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (306, 31, 8, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (307, 31, 9, '热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'BY热处理：HB206-252', NULL);
INSERT INTO `t_artdetail` VALUES (309, 31, 11, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (310, 31, 12, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (471, 43, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书下料。', NULL);
INSERT INTO `t_artdetail` VALUES (312, 31, 13, '磁粉探伤/选别', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤，选别；', NULL);
INSERT INTO `t_artdetail` VALUES (313, 31, 14, '清洗、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (472, 43, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '节拍：9S-15S温度：1100-1180℃设备：中频电炉', NULL);
INSERT INTO `t_artdetail` VALUES (316, 32, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:42CrMo4 ; 符合标准 EN 10083-2006', NULL);
INSERT INTO `t_artdetail` VALUES (317, 32, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为200~300°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (318, 32, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100～1200℃。使用设备：中频加热炉。 加热节拍：11-18s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (319, 32, 4, '预制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：750T空气锤; 检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (320, 32, 5, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。产品字多 需注意字迹清晰‍产品;使用模具成型压模；使用设备：630T摩擦压力机。锻造重点控制尺寸：编号11:;; 2±0.3编号9：; 44+0.6/+0.3编号12：;46+0.6/+0.3', NULL);
INSERT INTO `t_artdetail` VALUES (321, 32, 6, '冲孔', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具冲孔模；使用设备：160T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (322, 32, 7, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。冲孔与切边方向相反注意方向使用模具切边模；使用设备：160T冲床', NULL);
INSERT INTO `t_artdetail` VALUES (323, 32, 8, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (324, 32, 9, '热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '调质热处理：Rm1000-1200N/mm2, Rp≥750N/mm2; 本体取样;', NULL);
INSERT INTO `t_artdetail` VALUES (325, 32, 10, '热精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理后热压。 使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (326, 32, 11, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (327, 32, 12, '选别检验', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺、冷隔等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (328, 32, 13, '过卡板', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品厚度100%过卡板', NULL);
INSERT INTO `t_artdetail` VALUES (329, 32, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (330, 32, 15, '清洗、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (331, 33, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：C45，下料根据《SPA下料作业指导书》', NULL);
INSERT INTO `t_artdetail` VALUES (332, 33, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (333, 33, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100～1200℃。100%按照《电炉加热工艺》。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (334, 33, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：630T压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (335, 33, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具切边模；使用设备：100T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (336, 33, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (337, 33, 7, '检验', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '锻坯表面不能有裂纹、氧化皮、折叠、毛刺、冷隔等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (338, 33, 8, '选别、修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别；修磨去除残余飞边和毛刺', NULL);
INSERT INTO `t_artdetail` VALUES (339, 33, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (340, 33, 10, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (341, 33, 11, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (342, 33, 12, '清洗、浸油、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，用煤油清洗1-2分钟，油基防锈液浸泡。按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (343, 35, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书下料', NULL);
INSERT INTO `t_artdetail` VALUES (344, 35, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用设备：中频电炉；加热棒料：温度超过上差的棒料，给予报废处理，严禁使用。温度低于下差的棒料，进行抛丸后可以重复加热使用一次，棒料加热不得做多两次。每班用高温计校对炉温，对比测温仪和高温计是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (345, 34, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：根据《SPA下料作业指导书》', NULL);
INSERT INTO `t_artdetail` VALUES (346, 35, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '400Kg空气锤', NULL);
INSERT INTO `t_artdetail` VALUES (347, 35, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '400T摩擦压力机和成型模。', NULL);
INSERT INTO `t_artdetail` VALUES (348, 34, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (349, 35, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和切边模。', NULL);
INSERT INTO `t_artdetail` VALUES (350, 35, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (351, 35, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HV187-233(600-750N/mm2)', NULL);
INSERT INTO `t_artdetail` VALUES (352, 34, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：950～1050℃。100%按照《电炉加热工艺》。 每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (353, 35, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无毛刺、飞边、折叠等锻打缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (354, 34, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T电动螺旋压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (355, 35, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (356, 34, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具冲孔模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (357, 34, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (358, 35, 10, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '无裂纹、毛刺、折叠等锻造缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (359, 35, 11, '冷冲孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和冲孔模', NULL);
INSERT INTO `t_artdetail` VALUES (360, 35, 12, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T摩擦压力机和精压模', NULL);
INSERT INTO `t_artdetail` VALUES (361, 35, 13, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，无裂纹、毛刺、折叠等锻造缺陷（符合S3000302/C标准）', NULL);
INSERT INTO `t_artdetail` VALUES (362, 35, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%磁粉探伤', NULL);
INSERT INTO `t_artdetail` VALUES (363, 35, 15, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用硬度分选仪。', NULL);
INSERT INTO `t_artdetail` VALUES (364, 34, 7, '余温处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '余温处理，硬度HB160-240。', NULL);
INSERT INTO `t_artdetail` VALUES (365, 35, 16, '浸油丶包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%浸油，按客户要求包装发货。', NULL);
INSERT INTO `t_artdetail` VALUES (366, 34, 8, '检验', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺、冷隔等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (367, 34, 9, '选别、修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别，修磨去除残余飞边和毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (368, 34, 10, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (369, 34, 11, '打字', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰。使用模具打字模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (370, 34, 12, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (371, 34, 13, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在裂纹、氧化皮、折叠、毛刺等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (372, 34, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (373, 34, 15, '清洗、浸油、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，用煤油清洗1-2分钟，油基防锈液浸泡。按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (374, 36, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质:16MnCr5/DBL4027 产地江阴兴澄', NULL);
INSERT INTO `t_artdetail` VALUES (375, 36, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (376, 36, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：900～1000℃。使用设备：中频加热炉。 加热节拍：6-11s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (377, 36, 4, '预制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯使用设备：63T冲床;检测：自制标准样坯放置锤砧作为后序坯样目视对比。', NULL);
INSERT INTO `t_artdetail` VALUES (378, 36, 5, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T电动螺旋。', NULL);
INSERT INTO `t_artdetail` VALUES (379, 36, 6, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (380, 36, 7, '锻压', '', '', '', '', 0, 1, 0, 1, '01', '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (381, 36, 8, '热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '空冷热处理：硬度〈250HB。组织为铁素体与珠光体结构，无贝氏体。', NULL);
INSERT INTO `t_artdetail` VALUES (382, 36, 9, '检验', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (383, 36, 10, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (384, 36, 11, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (385, 36, 12, '磁粉探伤/选别', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤，选别；', NULL);
INSERT INTO `t_artdetail` VALUES (386, 36, 13, '清洗、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '清洗，浸油按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (387, 37, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '材质：下料根据《SPA下料作业指导书》。', NULL);
INSERT INTO `t_artdetail` VALUES (388, 37, 2, '模具预热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '模具预热：每班班前用产品棒料加热后对模具进行加热，温度为150~350°C，以滴废机油冒烟为检验标准。生产过程中停机后应及时对模具进行加热，冬季因室温较低应相应延长对模具预热时间。', NULL);
INSERT INTO `t_artdetail` VALUES (389, 37, 3, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：950～1050℃。100%按照《电炉加热工艺》。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (390, 37, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T电动螺旋压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (391, 37, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (392, 37, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (393, 37, 7, '检验', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (394, 37, 8, '选别、修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%选别，修磨去除残余飞边和毛刺。', NULL);
INSERT INTO `t_artdetail` VALUES (395, 37, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (396, 37, 10, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、折叠、氧化皮等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (397, 37, 11, '打字', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰。使用模具打字模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (398, 37, 12, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (399, 37, 13, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (400, 37, 14, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、折叠、氧化皮等外观缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (401, 37, 15, '清洗、浸油、包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '专用设备，用煤油清洗1-2分钟，油基防锈液浸泡。按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (402, 38, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书下料。', NULL);
INSERT INTO `t_artdetail` VALUES (403, 38, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '中频加热炉。节拍5S~9S,加热温度1000℃~1080℃。每班用高温计校对炉温，对比测温仪和高温计是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (404, 38, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '150kg空气锤', NULL);
INSERT INTO `t_artdetail` VALUES (405, 38, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '300T摩压机和A0036877/A0036878-中心距2mm成形模', NULL);
INSERT INTO `t_artdetail` VALUES (406, 38, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和A0036877/A0036878-中心距2mm切边模', NULL);
INSERT INTO `t_artdetail` VALUES (407, 38, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (408, 38, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB160-220', NULL);
INSERT INTO `t_artdetail` VALUES (409, 38, 8, '修磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%去除毛刺，折叠，飞边等。', NULL);
INSERT INTO `t_artdetail` VALUES (410, 38, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面100%无氧化皮', NULL);
INSERT INTO `t_artdetail` VALUES (411, 38, 10, '冷冲孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和A0036877/A0036878-中心距2mm冲孔模', NULL);
INSERT INTO `t_artdetail` VALUES (412, 38, 11, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T摩压机和A0036877/A0036878-中心距2mm精压模', NULL);
INSERT INTO `t_artdetail` VALUES (413, 38, 12, '铣平面', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '铣床', NULL);
INSERT INTO `t_artdetail` VALUES (414, 38, 13, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，产品表面100%无裂纹、毛刺、折叠等锻造缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (415, 38, 14, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%磁粉探伤。', NULL);
INSERT INTO `t_artdetail` VALUES (416, 38, 15, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB160-220', NULL);
INSERT INTO `t_artdetail` VALUES (417, 38, 16, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '无裂纹、毛刺、折叠等锻造缺陷(符合TRW S0000302标准）', NULL);
INSERT INTO `t_artdetail` VALUES (418, 38, 17, '浸油包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '浸油1-2min按客户要求包装发货', NULL);
INSERT INTO `t_artdetail` VALUES (419, 39, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '按照下料作业指导书下料', NULL);
INSERT INTO `t_artdetail` VALUES (420, 39, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '节拍10S~18S；加热温度：1100~1180℃；使用设备;中频电炉。', NULL);
INSERT INTO `t_artdetail` VALUES (421, 39, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '空气锤', NULL);
INSERT INTO `t_artdetail` VALUES (422, 39, 4, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '630电动螺旋和成型模具。', NULL);
INSERT INTO `t_artdetail` VALUES (423, 39, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和切边模具。', NULL);
INSERT INTO `t_artdetail` VALUES (424, 39, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (425, 39, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB209~252', NULL);
INSERT INTO `t_artdetail` VALUES (426, 39, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面100%无毛刺折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (427, 39, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (428, 39, 10, '冲大孔（Φ20）', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和冲孔模。', NULL);
INSERT INTO `t_artdetail` VALUES (429, 39, 11, '打字', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和打字模', NULL);
INSERT INTO `t_artdetail` VALUES (430, 39, 12, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T摩擦压力机和精压模。', NULL);
INSERT INTO `t_artdetail` VALUES (431, 39, 13, '冷冲三个小孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和冲孔模', NULL);
INSERT INTO `t_artdetail` VALUES (432, 39, 14, '倒角', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床', NULL);
INSERT INTO `t_artdetail` VALUES (433, 39, 15, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，无裂纹、毛刺、折叠等锻造缺陷（符合S3000302标准）', NULL);
INSERT INTO `t_artdetail` VALUES (434, 39, 16, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%磁粉探伤', NULL);
INSERT INTO `t_artdetail` VALUES (435, 39, 17, '浸油包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%浸油，按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (436, 41, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '按照下料作业指导书下料。', NULL);
INSERT INTO `t_artdetail` VALUES (437, 41, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '中频电炉。节拍10S-18S。温度1100-1200℃。', NULL);
INSERT INTO `t_artdetail` VALUES (438, 41, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '400kg空气锤。', NULL);
INSERT INTO `t_artdetail` VALUES (439, 41, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '400T摩擦压力机和成型模具。', NULL);
INSERT INTO `t_artdetail` VALUES (440, 41, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和切边模具', NULL);
INSERT INTO `t_artdetail` VALUES (441, 41, 6, '锻压', '', '', '', '', 0, 1, 0, 1, '02', '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (442, 41, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB187-233', NULL);
INSERT INTO `t_artdetail` VALUES (443, 41, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面100%无氧化层。', NULL);
INSERT INTO `t_artdetail` VALUES (444, 41, 11, '冷冲孔', '', '冷精压', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和冲孔模具', NULL);
INSERT INTO `t_artdetail` VALUES (445, 41, 12, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T摩压机和精压模', NULL);
INSERT INTO `t_artdetail` VALUES (446, 41, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无毛刺折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (447, 41, 10, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无毛刺氧化皮等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (448, 41, 13, '头部整形', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (449, 41, 14, '二次选别', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，无裂纹、毛刺、折叠等锻造缺陷（符合S3000302标准）', NULL);
INSERT INTO `t_artdetail` VALUES (450, 41, 15, '磁粉探伤', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%磁粉探伤', NULL);
INSERT INTO `t_artdetail` VALUES (451, 41, 16, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '硬度分选仪', NULL);
INSERT INTO `t_artdetail` VALUES (452, 41, 17, '浸油包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '油基防锈液浸泡按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (453, 42, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书下料。', NULL);
INSERT INTO `t_artdetail` VALUES (454, 42, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '中频电炉节拍：11S~18S加热温度：1100℃~1200℃。', NULL);
INSERT INTO `t_artdetail` VALUES (455, 42, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '150kg空气锤', NULL);
INSERT INTO `t_artdetail` VALUES (456, 42, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '300T摩擦压力机和成型模具。', NULL);
INSERT INTO `t_artdetail` VALUES (457, 42, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和切边模具', NULL);
INSERT INTO `t_artdetail` VALUES (458, 42, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '', NULL);
INSERT INTO `t_artdetail` VALUES (459, 42, 7, '空冷', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB238-280', NULL);
INSERT INTO `t_artdetail` VALUES (460, 42, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '去除残余飞边、毛刺、折叠等锻造缺陷', NULL);
INSERT INTO `t_artdetail` VALUES (461, 42, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮', NULL);
INSERT INTO `t_artdetail` VALUES (462, 42, 10, '冲孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '125T冲床和冲孔模', NULL);
INSERT INTO `t_artdetail` VALUES (463, 42, 11, '精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T摩压机和精压模', NULL);
INSERT INTO `t_artdetail` VALUES (464, 42, 12, '探伤', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%探伤', NULL);
INSERT INTO `t_artdetail` VALUES (465, 42, 13, '硬度分选', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '硬度分选仪', NULL);
INSERT INTO `t_artdetail` VALUES (466, 42, 14, '铣平面', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '铣床', NULL);
INSERT INTO `t_artdetail` VALUES (467, 42, 15, '选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '无裂纹、毛刺、折叠等锻造缺陷(符合TRW S0000302/C版 标准）', NULL);
INSERT INTO `t_artdetail` VALUES (468, 42, 16, '浸油包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '油基防锈液浸泡按客户要求包装', NULL);
INSERT INTO `t_artdetail` VALUES (473, 43, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '空气锤', NULL);
INSERT INTO `t_artdetail` VALUES (474, 43, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '630T电动螺旋和A0038287/A0038288 成形模;', NULL);
INSERT INTO `t_artdetail` VALUES (475, 43, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和切边模具', NULL);
INSERT INTO `t_artdetail` VALUES (476, 43, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (477, 43, 7, '热精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T冲床和A0038287/A0038288 精压模', NULL);
INSERT INTO `t_artdetail` VALUES (478, 43, 8, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, 'HB190-233', NULL);
INSERT INTO `t_artdetail` VALUES (479, 43, 9, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '残余飞边小于0.7mm，无明显闪筋，无毛刺', NULL);
INSERT INTO `t_artdetail` VALUES (480, 43, 10, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (481, 43, 11, '冲大孔（Φ20）', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床和A0038287/A0038288冲孔模', NULL);
INSERT INTO `t_artdetail` VALUES (482, 43, 12, '选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%无毛刺，裂纹，折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (483, 43, 13, '打字', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和A0038287/A0038288打字模', NULL);
INSERT INTO `t_artdetail` VALUES (484, 43, 14, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '160T摩压机和A0038287/A0038288 精压模', NULL);
INSERT INTO `t_artdetail` VALUES (485, 43, 15, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '磁粉探伤仪100%磁粉探伤', NULL);
INSERT INTO `t_artdetail` VALUES (486, 43, 16, '冷冲3个小孔', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床和A0038287/A0038288 冲孔模', NULL);
INSERT INTO `t_artdetail` VALUES (487, 43, 17, '倒角', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '冲床去毛刺', NULL);
INSERT INTO `t_artdetail` VALUES (488, 43, 18, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '字迹清晰，无裂纹、毛刺、折叠等锻造缺陷（符合S3000302标准）', NULL);
INSERT INTO `t_artdetail` VALUES (489, 43, 19, '浸油包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '表面防锈油按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (490, 44, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据《下料作业指导书》。', NULL);
INSERT INTO `t_artdetail` VALUES (491, 44, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100～1200℃。使用设备：中频加热炉。 加热节拍：300T生产线为8-13s，400T生产线为9-15s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (492, 44, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯尺寸根据图纸要求。使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (493, 44, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T电动螺旋压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (494, 44, 5, '冲切', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型后的产品，放入冲孔、切边附和凹模中，周边实落后，方可冲切。使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (495, 44, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (496, 44, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理硬度HB201-252，锻造珠光体结构符合DBL4532。', NULL);
INSERT INTO `t_artdetail` VALUES (497, 44, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品研磨，无毛刺折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (498, 44, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (499, 44, 10, '一次选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (500, 44, 11, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (501, 44, 12, '冷精压', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (502, 44, 13, '厚度选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (503, 44, 14, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (504, 44, 15, '包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (505, 46, 1, '下料', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据《下料作业指导书》。', NULL);
INSERT INTO `t_artdetail` VALUES (506, 46, 2, '加热', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：1100～1200℃。使用设备：中频加热炉。 加热节拍：300T生产线为7-13s，400T生产线为9-15s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (507, 46, 3, '制坯', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯尺寸根据图纸要求。使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (508, 46, 4, '成型', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T电动螺旋压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (509, 46, 5, '冲切', '', '', '', '', 0, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型后的产品，放入冲孔、切边附和凹模中，周边实落后，方可冲切。使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (510, 46, 6, '锻压', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (511, 46, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '热处理硬度HB201-252，锻造珠光体结构符合DBL4532。', NULL);
INSERT INTO `t_artdetail` VALUES (512, 46, 8, '研磨', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品研磨，无毛刺折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (513, 46, 9, '抛丸', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (514, 46, 10, '一次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (515, 46, 11, '磁粉探伤', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (516, 46, 12, '冷精压', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T摩擦压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (517, 46, 13, '厚度选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (518, 46, 14, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (519, 46, 15, '包装', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (520, 45, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据《下料作业指导书》。', NULL);
INSERT INTO `t_artdetail` VALUES (521, 45, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度：900～1000℃。使用设备：中频加热炉。 加热节拍：300T生产线为8-13s，400T生产线为9-15s 。每天必须用高温计校对炉温，看测温仪和高温计读数是否一致，误差≤1%。', NULL);
INSERT INTO `t_artdetail` VALUES (522, 45, 3, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '预制坯尺寸根据图纸要求。使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (523, 45, 4, '成型', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '用钢丝刷清除干净氧化皮，速放入模腔成型，连续作业需保持模腔干净，并用石墨乳冷却润滑。使用模具成型压模；使用设备：400T电动螺旋压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (524, 45, 5, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '将成型件放入切边凹模，周边实落，方可冲切。使用模具切边模；使用设备：63T冲床。', NULL);
INSERT INTO `t_artdetail` VALUES (525, 45, 6, '锻压', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (526, 45, 7, '余温热处理', '', '', '', '', 0, 1, 1, 0, '', '1', 0, 0.00, 0, 0.00, '硬度250HB,珠光体+铁素体，无贝氏体', NULL);
INSERT INTO `t_artdetail` VALUES (527, 45, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品研磨，无毛刺折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (528, 45, 9, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品表面无氧化皮。', NULL);
INSERT INTO `t_artdetail` VALUES (529, 45, 10, '一次选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (530, 45, 11, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '产品100%磁粉探伤。使用设备：磁粉探伤机。', NULL);
INSERT INTO `t_artdetail` VALUES (531, 45, 12, '冷精压', '', '', '', '', 1, 1, 0, 0, '', '1', 0, 0.00, 0, 0.00, '使用模具：精压模；使用设备：160T压力机。', NULL);
INSERT INTO `t_artdetail` VALUES (532, 45, 13, '厚度选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '检测厚度尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (533, 45, 14, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '选别锻件是否存在毛刺、裂纹、冷隔、折叠、氧化皮等外观缺陷。检测尺寸 按图纸检测', NULL);
INSERT INTO `t_artdetail` VALUES (534, 45, 15, '包装', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (535, 47, 1, '下料', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '根据下料作业指导书下料。', NULL);
INSERT INTO `t_artdetail` VALUES (536, 47, 2, '加热', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '加热温度1100-1200℃300T摩擦压力机8S-13S400T摩擦压力机9S-18S', NULL);
INSERT INTO `t_artdetail` VALUES (537, 47, 31, '制坯', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '<p><img src=\"/ueditor/php/upload/image/20180424/1524555371872168.jpg\" alt=\"1524555371872168.jpg\"/><img src=\"/ueditor/php/upload/image/20180424/1524555391830513.jpg\" alt=\"1524555391830513.jpg\"/></p>', NULL);
INSERT INTO `t_artdetail` VALUES (538, 47, 4, '锻造', '', '', '', '', 1, 0, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '<p><img src=\"/ueditor/php/upload/image/20180424/1524555565816743.jpg\" alt=\"1524555565816743.jpg\"/></p>', NULL);
INSERT INTO `t_artdetail` VALUES (539, 47, 51, '切边', '', '', '', '', 0, 0, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '63T冲床', NULL);
INSERT INTO `t_artdetail` VALUES (540, 47, 6, '锻压', '', '', '', '', 1, 1, 1, 1, '01', '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (541, 47, 7, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无氧化皮', NULL);
INSERT INTO `t_artdetail` VALUES (542, 47, 8, '研磨', '', '', '', '', 1, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无毛刺裂纹飞边等。', NULL);
INSERT INTO `t_artdetail` VALUES (543, 47, 9, '热处理', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '正火', NULL);
INSERT INTO `t_artdetail` VALUES (544, 47, 10, '抛丸', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无氧化皮', NULL);
INSERT INTO `t_artdetail` VALUES (545, 47, 11, '冷精压', '', '', '', '', 1, 1, 0, 0, '', '1', 0, 0.00, 0, 0.00, '160T压力机和精压模', NULL);
INSERT INTO `t_artdetail` VALUES (546, 47, 12, '一次选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无裂纹，毛刺，折叠等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (547, 47, 13, '磁粉探伤', '', '', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%磁粉探伤', NULL);
INSERT INTO `t_artdetail` VALUES (548, 47, 14, '厚度选别', '', '', '', '', 0, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '按产品图检测', NULL);
INSERT INTO `t_artdetail` VALUES (549, 47, 15, '二次选别', '', '', '', '', 0, 1, 1, 0, NULL, '1', 0, 0.00, 0, 0.00, '100%无毛刺氧化皮，裂纹等缺陷。', NULL);
INSERT INTO `t_artdetail` VALUES (550, 47, 16, '包装', '', 'df', '', '', 1, 1, 0, 0, NULL, '1', 0, 0.00, 0, 0.00, '按客户要求包装。', NULL);
INSERT INTO `t_artdetail` VALUES (551, 21, 31, 'testtest', '', '', '', '', 1, 1, 1, 0, '01', '1', 2, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (552, 21, 32, '121112', '', '', '', '', 0, 1, 1, 0, '02', '1', 0, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (553, 47, 3, 'test123', '', '', '', '', 1, 1, 1, 1, '01', '1', 2, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (554, 47, 5, '打印批次', '', '', '', '', 1, 1, 0, 1, '01', '1', 2, 0.00, 0, 0.00, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (555, 47, 3, 'test', NULL, NULL, NULL, NULL, 0, 0, 1, 0, '', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_artdetail` VALUES (556, 7, 1, 'test', NULL, '123', '个', '321', 1, 1, 1, 0, '', '1', NULL, 123.00, 123, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_bas_producebom
-- ----------------------------
DROP TABLE IF EXISTS `t_bas_producebom`;
CREATE TABLE `t_bas_producebom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `Pd_Code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物料编码',
  `Pb_ChildCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子物料编码',
  `Pb_ChildGross` decimal(18, 4) NOT NULL COMMENT '子物料毛数量',
  `Pb_ChildNet` decimal(18, 4) NOT NULL COMMENT '子物料净数量',
  `Pb_ChildPer` decimal(10, 4) NOT NULL COMMENT '子物料出成率',
  `Pb_ChildMay` bit(1) NOT NULL COMMENT '是否可选',
  `Pb_Per` decimal(10, 4) NOT NULL COMMENT '出成率',
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `moddate` int(11) NOT NULL,
  `Pb_Note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bas_producebom
-- ----------------------------
INSERT INTO `t_bas_producebom` VALUES (45, 'D1290001', 'D1290024', 2.0000, 2.0000, 3.0000, b'1', 3.0000, 'admin', 1547177264, '1');
INSERT INTO `t_bas_producebom` VALUES (44, 'D1290001', 'D1030014', 2.0000, 2.0000, 3.0000, b'1', 3.0000, 'admin', 1547177264, '3');
INSERT INTO `t_bas_producebom` VALUES (14, 'PA002', '0', 0.0000, 0.0000, 0.0000, b'0', 99.5555, 'admin', 1524548152, NULL);
INSERT INTO `t_bas_producebom` VALUES (13, 'PA001', '0', 0.0000, 0.0000, 0.0000, b'0', 99.5555, 'admin', 1524548152, NULL);
INSERT INTO `t_bas_producebom` VALUES (47, 'D1290024', '3323', 3.0000, 3.0000, 3.0000, b'1', 1.0000, 'admin', 1547426232, '2');
INSERT INTO `t_bas_producebom` VALUES (48, 'D1290024', 'PA009', 1.0000, 1.0000, 1.0000, b'1', 1.0000, 'admin', 1547426232, '1');
INSERT INTO `t_bas_producebom` VALUES (49, 'D1030014', 'PA004', 5.0000, 5.0000, 5.0000, b'1', 4.0000, 'admin', 1547427829, '5');
INSERT INTO `t_bas_producebom` VALUES (50, 'D1030014', 'D1290023', 5.0000, 5.0000, 5.0000, b'1', 4.0000, 'admin', 1547427829, '4');
INSERT INTO `t_bas_producebom` VALUES (51, 'PA009', 'PA008', 8.0000, 5.0000, 5.0000, b'0', 55.0000, 'admin', 1547428451, '5');
INSERT INTO `t_bas_producebom` VALUES (52, 'D1290035', 'PA001', 5.0000, 5.0000, 5.0000, b'1', 99.0000, 'admin', 1547617270, '5');
INSERT INTO `t_bas_producebom` VALUES (53, 'D1290035', 'PA002', 2.0000, 2.0000, 2.0000, b'1', 99.0000, 'admin', 1547617270, '2');

-- ----------------------------
-- Table structure for t_box_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `t_box_basic_info`;
CREATE TABLE `t_box_basic_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_identify` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '箱子识别号',
  `inspection_interval` int(11) NULL DEFAULT NULL COMMENT '检验周期',
  `depart_id` int(11) NULL DEFAULT NULL COMMENT '所属部门',
  `material` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '箱子材质',
  `box_L` int(11) NULL DEFAULT NULL COMMENT '箱子长度',
  `box_W` int(11) NULL DEFAULT NULL COMMENT '箱子宽度',
  `box_H` int(11) NULL DEFAULT NULL COMMENT '箱子高度',
  `use_state` int(11) NULL DEFAULT NULL COMMENT '0使用中，-1不使用中',
  `box_tare` float(11, 3) NULL DEFAULT NULL COMMENT '箱子皮重',
  `weight_date` int(11) NULL DEFAULT NULL COMMENT '箱子称重日期',
  `stock_state` int(11) NULL DEFAULT NULL COMMENT '库存状态 1：在库，-1出库',
  `modman` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经办人',
  `moddate` int(11) NULL DEFAULT NULL COMMENT '经办日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 CHECKSUM = 1 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_box_basic_info
-- ----------------------------
INSERT INTO `t_box_basic_info` VALUES (8, '20003', 6666, 4, '1', 1, 1, 1, 0, 3.000, NULL, 1, 'admin', 1546399698);
INSERT INTO `t_box_basic_info` VALUES (9, '20002', 33, 4, 't', 2, 2, 2, NULL, 2.000, NULL, -1, 'admin', 1546397572);
INSERT INTO `t_box_basic_info` VALUES (10, '20004', 888, 4, '7', 7, 7, 7, NULL, 999.000, NULL, NULL, 'admin', 1547003668);
INSERT INTO `t_box_basic_info` VALUES (11, '10001', 50, 3, '213', 2, 2, 2, NULL, 2222.000, NULL, NULL, 'admin', 1547003675);

-- ----------------------------
-- Table structure for t_box_inspection
-- ----------------------------
DROP TABLE IF EXISTS `t_box_inspection`;
CREATE TABLE `t_box_inspection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_identify` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight_tare` float(10, 3) NULL DEFAULT NULL,
  `modman` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_box_inspection
-- ----------------------------
INSERT INTO `t_box_inspection` VALUES (17, '20003', 1.000, 'admin', 1546399557);
INSERT INTO `t_box_inspection` VALUES (11, '10001', 2.000, 'admin', 1546397481);
INSERT INTO `t_box_inspection` VALUES (12, '20001', 1.000, 'admin', 1546397544);
INSERT INTO `t_box_inspection` VALUES (13, '20002', 2.000, 'admin', 1546397572);
INSERT INTO `t_box_inspection` VALUES (14, '20003', 1.000, 'admin', 1546398598);
INSERT INTO `t_box_inspection` VALUES (19, '20004', 7.000, 'admin', 1546399579);
INSERT INTO `t_box_inspection` VALUES (18, '20004', 7.000, 'admin', 1546399572);
INSERT INTO `t_box_inspection` VALUES (20, '20004', 999.000, 'admin', 1546399615);
INSERT INTO `t_box_inspection` VALUES (21, '20003', 3.000, 'admin', 1546399698);
INSERT INTO `t_box_inspection` VALUES (22, '10001', 2222.000, 'admin', 1546399816);
INSERT INTO `t_box_inspection` VALUES (23, '20004', 999.000, 'admin', 1547003668);
INSERT INTO `t_box_inspection` VALUES (24, '10001', 2222.000, 'admin', 1547003675);

-- ----------------------------
-- Table structure for t_box_stock_out_or_in
-- ----------------------------
DROP TABLE IF EXISTS `t_box_stock_out_or_in`;
CREATE TABLE `t_box_stock_out_or_in`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '1：入库 -1出库',
  `box_identify` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stock_state` int(11) NULL DEFAULT NULL,
  `recipients` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领用人/归还人',
  `modman` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经办人',
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cate_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1级分类',
  `cate_order` int(11) NULL DEFAULT NULL COMMENT '排序',
  `cate_parentid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cate_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '汽车配件', 1, 0);
INSERT INTO `t_category` VALUES (2, '建筑配件', 2, 0);
INSERT INTO `t_category` VALUES (3, '机加工', 3, 0);
INSERT INTO `t_category` VALUES (4, '机械配件', 4, 0);
INSERT INTO `t_category` VALUES (24, '球碗', 1, 1);
INSERT INTO `t_category` VALUES (25, '胶套', 3, 1);
INSERT INTO `t_category` VALUES (26, 'test', 3, 1);

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reg_asset` decimal(10, 2) NULL DEFAULT NULL,
  `c_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `c_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES (2, '天赢公司', NULL, NULL, '城阳', '123', NULL, NULL, NULL, '1');
INSERT INTO `t_company` VALUES (3, '重庆公司', NULL, NULL, '重庆', '456', NULL, NULL, NULL, '1');
INSERT INTO `t_company` VALUES (6, '控股公司', '房地产', 922112.00, '青岛市崂山区檀香湾2号楼2106', '0532-81923355', 'www.qdmds.com', '单某某', '控股', '1');

-- ----------------------------
-- Table structure for t_cust_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_cust_customer`;
CREATE TABLE `t_cust_customer`  (
  `cust_id` int(10) NOT NULL AUTO_INCREMENT,
  `cust_code` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '��λ����',
  `cust_iscust` tinyint(4) NULL DEFAULT 1 COMMENT '客户标志',
  `cust_isprov` tinyint(4) NULL DEFAULT NULL COMMENT '供应商',
  `cust_isshiper` tinyint(4) NULL DEFAULT NULL COMMENT '是否货代',
  `cust_isexport` tinyint(4) NULL DEFAULT NULL COMMENT '是否出口商',
  `cust_isassist` tinyint(4) NULL DEFAULT NULL COMMENT '外协厂商标记',
  `Ctt_id` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位类别',
  `cust_hpcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '助记码',
  `cust_nameCn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `cust_shortname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `cust_NameEn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `ccl_code` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行业类别编码',
  `cec_code` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经济类型编码',
  `cust_LinkMan` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `cust_Manger` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `cust_addrCn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文地址',
  `cust_addrEn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文地址',
  `cust_zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `cust_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�绰',
  `cust_fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '����',
  `cust_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�����ʼ�',
  `cust_web` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��վ',
  `cust_bank1` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������1',
  `cust_bankno1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ʺ�1',
  `cust_bank2` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������2',
  `cust_Bankno2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ʺ�2',
  `cust_Taxno` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '˰��',
  `cust_Enabled` tinyint(4) NOT NULL DEFAULT 0 COMMENT '可用状态',
  `cust_credit` int(11) NULL DEFAULT NULL COMMENT '信誉度',
  `cust_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `cust_Man` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `Cust_Delivery` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交/送货地点',
  `cust_FinDest` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地',
  `Cp_PortId` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关港口',
  `Cust_RegDate` int(11) NULL DEFAULT NULL COMMENT '登记日期',
  `ModMan` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '�޸���',
  `ModDate` int(11) NOT NULL COMMENT '�޸�����',
  `Ord_Interior` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否本公司',
  PRIMARY KEY (`cust_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cust_customer
-- ----------------------------
INSERT INTO `t_cust_customer` VALUES (1, '2018070300', 1, 0, 1, 1, 0, '03', '211', '测试', 'CS', 'ceshi', '03', '11', '周杰伦', '李宗盛', '台湾', 'taiwan', '4454121@qq', '18363958512', '052654845', '54512654', 'www.baudic.com', 'zhonghang', '4454115', '招商', '321321323', '554', 1, 1, '3213', '测试', '33', '11', '333', 0, 'admin', 1530378436, 1);
INSERT INTO `t_cust_customer` VALUES (6, '6', 1, 1, 1, 1, 0, '01', '4', '测试4433', '43', '55', '01', NULL, '4', '443', '9', '4', '2', '8', '4', '21', '7', '4', '2', '4', '222', '5', 1, -1, '324234234324', '44', '2', '5', '4', 0, 'admin', 1531723288, 0);
INSERT INTO `t_cust_customer` VALUES (7, '99', 0, 1, 0, 1, 1, '02', '789', '98', '89', 'yty', '01', NULL, '789', '897', '8', '87', '8', '8', '789', '8', '8', '78', '8', '8', '8', '8', 0, 0, '878987987', '8', '8', '8', '8', 1530778467, 'admin', 1530778467, 0);
INSERT INTO `t_cust_customer` VALUES (8, '2018070500', 1, 0, 1, 1, 0, '03', 'CS11', '测试11', 'cs11', 'ceshi11', '02', NULL, '李某1', '王某1', '青岛崂山', 'qingdaolaoshan1', '266000', '18363970368', '053254211', '784562259@163.com', 'www.baidu.com', '中国银行', '370986589854562157', '招商银行', '845623587468542668', '15264325894521', 1, -1, '测试测试测试锤石是回复此誓师大会四大行上帝之手21212', '孙某某', '青岛', '上海', '青岛港', 0, 'admin', 1531096838, 1);
INSERT INTO `t_cust_customer` VALUES (5, '32121', 1, 1, 1, 1, 0, '01', 'DSGDFG', '测试321', '23', '123', '01', NULL, '123', '443', '6', '321', '4656', '5', '23', '3454', '4', '54', '3432', '54', '234', '4', 0, 0, '65654654324', '45', '342', '2', '54', 0, 'admin', 1531723272, 0);
INSERT INTO `t_cust_customer` VALUES (9, '22222', 1, 1, 1, 1, 0, '02', 'cs12344', '测试12344', 'ces', 'ceshi12344', '02', NULL, '赵某', '李某', '北京', 'beijing', '256222', '183639720368', '025462132', '112354@qq.com', 'www.ndhd.com', '中银', '45652154497445541', '招银', '656464648979641631634164', '', 1, 0, '问问群二无群二群二群二', '单某某某', '巴黎', '法国', '青岛港q1', 0, 'admin', 1531721553, 0);
INSERT INTO `t_cust_customer` VALUES (15, '123', 1, 0, 0, 1, 0, '02', 'DSGDFG', '第三个电饭锅', '', '', '02', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '', '', '', 1531447819, 'admin', 1531447819, 0);
INSERT INTO `t_cust_customer` VALUES (17, '2018337445', 1, 1, 1, 1, 0, '03', 'SSFJCCX', '市司法局常出现', 'shd', 'dddfd', '01', NULL, '张三', '李四', '青岛崂山', 'qingdao', '266000', '18365951265', '053256842564', '548952161@qq.com', 'www.gdyns.com', '招商', '1225441223554212363', '光大', '1445115484565241445', '5452145d5e5sw5s544', 1, 0, '圣诞节金额现场最下面炒鸡蛋放放假倒计时法新材料是龙卷风的金额将额外企鹅地方吗', '王五', '青岛港口', '广州', '广州港', 0, 'admin', 1531796737, 0);
INSERT INTO `t_cust_customer` VALUES (18, 'test', 1, 1, NULL, NULL, NULL, '01', 'LXM', '李晓明', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1536293009, 'admin', 1536293009, 0);
INSERT INTO `t_cust_customer` VALUES (19, 'cy911', 0, 1, 1, 0, 0, '01', 'CSYX', '城市印象', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1536299893, 'admin', 1536299893, 0);
INSERT INTO `t_cust_customer` VALUES (20, '0001', 1, 0, 0, 0, 0, '01', 'QDMDS', '青岛麦迪绅', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1536300115, 'admin', 1536300115, 1);
INSERT INTO `t_cust_customer` VALUES (21, '0002', 0, 0, 0, 0, 0, '01', 'ZXCGV', '自行车GV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1536300809, 'admin', 1536300809, 0);
INSERT INTO `t_cust_customer` VALUES (22, '900878', 0, 0, 0, 0, 1, '01', '123123', '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1537240007, 'admin', 1537240007, 0);
INSERT INTO `t_cust_customer` VALUES (23, '1231233333', 0, 0, 0, 0, 1, '01', '123', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1537240463, 'admin', 1537240463, 1);
INSERT INTO `t_cust_customer` VALUES (24, '3453454', 0, 0, 0, 0, 1, '01', 'ttttttt', 'ttttttt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1537240481, 'admin', 1537240481, 0);
INSERT INTO `t_cust_customer` VALUES (25, '55555', 0, 0, 0, 0, 1, '01', '555555', '555555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1537240497, 'admin', 1537240497, 0);

-- ----------------------------
-- Table structure for t_dat_storage
-- ----------------------------
DROP TABLE IF EXISTS `t_dat_storage`;
CREATE TABLE `t_dat_storage`  (
  `Stor_id` int(11) NOT NULL AUTO_INCREMENT,
  `Stor_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库编号',
  `Stor_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `Sp_ParentNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父仓库编号',
  `Sp_GetNo` int(11) NULL DEFAULT NULL COMMENT '物流取货号',
  `st_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `ss_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态编码',
  `Stor_L` int(11) NULL DEFAULT NULL COMMENT '长',
  `Stor_W` int(11) NULL DEFAULT NULL COMMENT '宽',
  `Stor_H` int(11) NULL DEFAULT NULL COMMENT '高',
  `Stor_capability` int(11) NULL DEFAULT NULL COMMENT '容量',
  `Stor_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `Stor_tempe` int(11) NULL DEFAULT NULL COMMENT '温度',
  `Stor_humidity` int(11) NULL DEFAULT NULL COMMENT '湿度',
  `Stor_position` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `Stor_depart` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `Stor_tel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stor_fax` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stor_usable` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可用',
  `Stor_manager` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库管员',
  `Stor_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Stor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dat_storage
-- ----------------------------
INSERT INTO `t_dat_storage` VALUES (1, '01', '1号库', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (2, '02', '2号库', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (8, '010013', '3号', '01001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (9, '010015', '5号', '01001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (245, '02001016', '02001016号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (13, '010038', '45647号', '01003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (236, '02001007', '02001007号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (235, '02001006', '02001006号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (18, '04', '4号库', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (23, '04003', '04003架', '04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (165, '01006', '01006架', '01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (231, '02001002', '02001002号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (232, '02001003', '02001003号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (233, '02001004', '02001004号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (40, '04003001', '04003001号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (246, '02001017', '02001017号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (42, '04003003', '04003003号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (43, '04003004', '04003004号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (44, '04003005', '04003005号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (237, '02001008', '02001008号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (238, '02001009', '02001009号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (239, '02001010', '02001010号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (240, '02001011', '02001011号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (241, '02001012', '02001012号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (242, '02001013', '02001013号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (243, '02001014', '02001014号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (244, '02001015', '02001015号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (248, '02001019', '02001019号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (247, '02001018', '02001018号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (230, '02001001', '02001001号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (160, '01010', '01010架', '01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (161, '01011', '01011架', '01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (234, '02001005', '02001005号', '02001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (227, '02001', '02001架', '02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (290, '04003006', '04003006号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (291, '04003007', '04003007号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (292, '04003008', '04003008号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (293, '04003009', '04003009号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (294, '04003010', '04003010号', '04003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (298, '04002', '04002', '04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (297, '04001', '04001', '04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (299, '04001001', '04001001', '04001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_dat_storage` VALUES (300, '04001002', '04001002', '04001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);

-- ----------------------------
-- Table structure for t_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_depart`;
CREATE TABLE `t_depart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Parentid` int(11) NULL DEFAULT NULL COMMENT '父id',
  `Dpt_Name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `Dpt_MainMan` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要负责人',
  `Dpt_Persons` int(11) NULL DEFAULT NULL COMMENT '人数',
  `Dpt_Tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `Dpt_Describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `Dpt_Order` int(11) NULL DEFAULT NULL,
  `pstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `ModMan` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES (1, 0, '青岛天赢工业', '', NULL, NULL, NULL, NULL, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (2, 1, '生产管理部', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (9, 1, '贸易部', '', NULL, '', '', NULL, '1', '', '2017-11-08 10:46:30');
INSERT INTO `t_depart` VALUES (4, 2, '铸锻车间', '刘国喜', NULL, NULL, NULL, NULL, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (5, 2, '机加工车间', '刘琦', 0, '', '', 7, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (6, 2, '管件车间', '王思', 0, '', '', 6, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (7, 9, '内贸', NULL, NULL, NULL, NULL, 1, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (10, 9, '外贸', '', 0, '', '', 0, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (13, 2, '模具车间', 'dd', 5, '', '', 8, '1', NULL, NULL);
INSERT INTO `t_depart` VALUES (3, 2, '下料车间', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL);

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sect_id` int(11) NULL DEFAULT NULL COMMENT ' 所属分区ID',
  `device_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `device_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `vender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '厂家名称',
  `tech_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术文档编号',
  `contactman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contactphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `device_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `modman` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `moddate` int(11) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES (1, 1, '0001', '1号压力机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (2, 1, '0002', '2号压力机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (3, 1, '0003', '1号电热炉', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (4, 1, '0004', '3号机器人', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (5, 1, '0005', '2号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (6, 2, '0006', '3号压力机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (7, 2, '0007', '4号压力机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (8, 2, '0008', '2号电热炉', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (9, 2, '0009', '4号机器人', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (22, 2, 't', 't222', '测试321', 't', '123', '5', NULL, 'admin', 1544167786);
INSERT INTO `t_device` VALUES (12, 4, '0012', '5号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (13, 4, '0013 ', '6号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (14, 5, '0014', '7号精压机', '测试321', 't', '123', '5', NULL, 'admin', 1543824868);
INSERT INTO `t_device` VALUES (15, 6, '0015', '7号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (16, 7, '0016', '8号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (17, 7, '0017', '9号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (18, 8, '0018', '10号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (19, 8, '0019', '11号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (20, 9, '0020', '12号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (21, 9, '0021', '13号精压机', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_device` VALUES (23, 2, 'test', 'test', '市司法局常出现', 'test', '张三', '18365951265', NULL, 'admin', 1543821576);
INSERT INTO `t_device` VALUES (24, 2, 'd1', 'ddd', '市司法局常出现', 'ddd', '张三', '18365951265', NULL, 'admin', 1543888919);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_cat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别编号',
  `dic_cat_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `dic_item_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '明细数据编号',
  `dic_item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '明细数据名称',
  `dic_order` int(11) NULL DEFAULT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  `issystem` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`dic_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, 'cust_type', '客户类型', '01', '供应商', 1, NULL, NULL);
INSERT INTO `t_dict` VALUES (2, 'cust_type', '客户类型', '02', '客户', 2, NULL, NULL);
INSERT INTO `t_dict` VALUES (3, 'cust_type', '客户类型', '03', '货代', 3, NULL, NULL);
INSERT INTO `t_dict` VALUES (4, 'cust_level', '客户级别', '1', '1级客户', 4, NULL, NULL);
INSERT INTO `t_dict` VALUES (5, 'cust_level', '客户级别', '2', '2级客户', 11, NULL, NULL);
INSERT INTO `t_dict` VALUES (6, 'cust_level', '客户级别', '3', '3级客户', 12, NULL, NULL);
INSERT INTO `t_dict` VALUES (7, 'company_type', '公司类型', '01', '有限公司', 21, NULL, NULL);
INSERT INTO `t_dict` VALUES (8, 'company_type', '公司类型', '02', '国有企业', 22, NULL, NULL);
INSERT INTO `t_dict` VALUES (9, 'company_type', '公司类型', '03', '外资企业', 23, NULL, NULL);
INSERT INTO `t_dict` VALUES (10, 'location', '配件位置', '01', 'front1', 2, NULL, NULL);
INSERT INTO `t_dict` VALUES (11, 'location', '配件位置', '02', 'front,driver side', 25, NULL, NULL);
INSERT INTO `t_dict` VALUES (12, 'location', '配件位置', '03', 'front,passenger side', 26, NULL, NULL);
INSERT INTO `t_dict` VALUES (13, 'location', '配件位置', '04', 'front,driver passenger side', 27, NULL, NULL);
INSERT INTO `t_dict` VALUES (18, 'location', '配件位置', '05', 'rear', 28, NULL, NULL);
INSERT INTO `t_dict` VALUES (15, 'location', '配件位置', '06', 'rear,driver side', 29, NULL, NULL);
INSERT INTO `t_dict` VALUES (16, 'location', '配件位置', '07', 'rear,passenger side', 30, NULL, NULL);
INSERT INTO `t_dict` VALUES (17, 'location', '配件位置', '08', 'rear,driver passenger side', 31, NULL, NULL);
INSERT INTO `t_dict` VALUES (19, 'unit_type', '单位', '001', '公斤', 41, NULL, NULL);
INSERT INTO `t_dict` VALUES (20, 'unit_type', '单位', '002', '吨', 42, NULL, NULL);
INSERT INTO `t_dict` VALUES (21, 'unit_type', '单位', '003', '米', 43, NULL, NULL);
INSERT INTO `t_dict` VALUES (22, 'unit_type', '单位', '004', '克', 44, NULL, NULL);
INSERT INTO `t_dict` VALUES (23, 'attachment', '附加项', '01', '炉号', 43, NULL, NULL);
INSERT INTO `t_dict` VALUES (24, 'attachment', '附加项', '02', '批次', 44, NULL, NULL);
INSERT INTO `t_dict` VALUES (25, 'customer_type', '客服问题类别', '01', '设备维护', 45, NULL, NULL);
INSERT INTO `t_dict` VALUES (26, 'customer_type', '客服问题类别', '02', 'MES运维', 46, NULL, NULL);
INSERT INTO `t_dict` VALUES (27, 'plan_type', '计划类别', '01', '锻压生产', 47, NULL, 1);
INSERT INTO `t_dict` VALUES (28, 'plan_type', '计划类别', '03', '锻压外协', 55, NULL, 1);
INSERT INTO `t_dict` VALUES (29, 'exec_type', '执行类型', '01', '生产执行', 60, NULL, 1);
INSERT INTO `t_dict` VALUES (30, 'exec_type', '执行类型', '02', '分箱退回', 61, NULL, 1);
INSERT INTO `t_dict` VALUES (31, 'patition_type', '分箱类型', '01', '外协返工', 70, NULL, 1);
INSERT INTO `t_dict` VALUES (32, 'patition_type', '分箱类型', '08', '废品处理', 79, NULL, 1);
INSERT INTO `t_dict` VALUES (33, 'plan_type', '计划类别', '04', '外协返工', 55, NULL, 1);
INSERT INTO `t_dict` VALUES (34, 'oper_type', '操作类型', '101', '采购收购', 80, NULL, 1);
INSERT INTO `t_dict` VALUES (35, 'oper_type', '操作类型', '101', '采购收购', 80, NULL, 1);
INSERT INTO `t_dict` VALUES (36, 'oper_type', '操作类型', '102', '销售发货', 81, NULL, 1);
INSERT INTO `t_dict` VALUES (37, 'oper_type', '操作类型', '103', '采购退货', 82, NULL, 1);
INSERT INTO `t_dict` VALUES (38, 'oper_type', '操作类型', '104', '销售退货', 83, NULL, 1);
INSERT INTO `t_dict` VALUES (39, 'oper_type', '操作类型', '105', '调拨入库', 84, NULL, 1);
INSERT INTO `t_dict` VALUES (40, 'oper_type', '操作类型', '106', '调拨出库', 85, NULL, 1);
INSERT INTO `t_dict` VALUES (41, 'oper_type', '操作类型', '107', '德胜利入库', 86, NULL, 1);
INSERT INTO `t_dict` VALUES (42, 'oper_type', '操作类型', '108', '德胜利出库', 87, NULL, 1);
INSERT INTO `t_dict` VALUES (44, 'repair_type', '维修类型', '1', '生产设备维修', 88, NULL, NULL);
INSERT INTO `t_dict` VALUES (45, 'repair_type', '维修类型', '2', '网络设备维修', 89, NULL, NULL);
INSERT INTO `t_dict` VALUES (46, 'repair_type', '维修类型', '3', 'MES系统故障', 90, NULL, NULL);
INSERT INTO `t_dict` VALUES (48, 'alert_type', '异常类型', '01', '设备故障', 91, NULL, NULL);
INSERT INTO `t_dict` VALUES (49, 'alert_type', '异常类型', '02', '技术问题', 92, NULL, NULL);
INSERT INTO `t_dict` VALUES (50, 'alert_type', '异常类型', '03', '质量问题', 93, NULL, NULL);

-- ----------------------------
-- Table structure for t_hum_state
-- ----------------------------
DROP TABLE IF EXISTS `t_hum_state`;
CREATE TABLE `t_hum_state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user2_id` int(11) NOT NULL,
  `state` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `modman` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hum_state
-- ----------------------------
INSERT INTO `t_hum_state` VALUES (1, 64, '0', '1', 1542784901);
INSERT INTO `t_hum_state` VALUES (2, 64, '1', '1', 1542894901);

-- ----------------------------
-- Table structure for t_hum_stuff
-- ----------------------------
DROP TABLE IF EXISTS `t_hum_stuff`;
CREATE TABLE `t_hum_stuff`  (
  `Stf_Id` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工编码 *',
  `Stf_NameCn` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名*',
  `Stf_HelpCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '助记码',
  `Stf_OldName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '曾用名',
  `Stf_NameEn` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `Stf_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别*',
  `Stf_Brithday` date NULL DEFAULT NULL COMMENT '出生日期*',
  `Stf_NaPlace` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯*',
  `Stf_Folk` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族*',
  `Sto_BookId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户口性质*',
  `Stf_CarId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号*',
  `Stf_Adress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址*',
  `Stf_HomePhone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭电话*',
  `Stf_Mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动电话*',
  `Stf_Bp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'BP机号',
  `Stf_Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件*',
  `Sto_Marriage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况*',
  `Sto_Health` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '健康状况',
  `Stf_CanFood` bit(2) NULL DEFAULT NULL COMMENT '是否允许从事',
  `Stf_WorkLong` int(11) NULL DEFAULT NULL COMMENT '参加工作时间',
  `Stf_InFac` int(11) NULL DEFAULT NULL COMMENT '进入本单位*',
  `Stf_OutFac` int(11) NULL DEFAULT NULL COMMENT '离开本单位*',
  `Wt_WorkType` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作形式* ',
  `Stf_Wagebase` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本工资*',
  `Acv_No` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '档案号',
  `Stf_Foreigner` bit(1) NULL DEFAULT NULL COMMENT '离开本单标志',
  `Edu_Level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历*',
  `Deg_Degree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学位*',
  `grd_Grade` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称*',
  `Stf_Regular` int(11) NULL DEFAULT NULL COMMENT '转正时间*',
  `Sto_GradDate` int(11) NULL DEFAULT NULL COMMENT '毕业时间*',
  `Sto_GradSchool` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校*',
  `Stf_SubjectMain` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主修专业*',
  `Stf_SubjectSub` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅修专业',
  `Sto_OldCommpany` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原工作单位*',
  `Sto_EnterDate` int(50) NULL DEFAULT NULL COMMENT '进入本系统时间*',
  `Sto_OldDuty` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原任职务',
  `Stf_Account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工资账号',
  `role_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `Dpt_DptCode` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织机构编码*',
  `Stf_OS` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可否操作本系统*',
  `Stf_Pass` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录口令',
  `Stf_Photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工照片*',
  `Stf_Resume` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简历',
  `Stf_AttendNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤卡号',
  `Stf_CheckCode` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤编码',
  `Stf_CheckedBit` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否参与考勤*',
  `Stf_Note` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ModMan` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ModDate` int(11) NULL DEFAULT NULL,
  `Stf_DownPos` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载Pos机',
  PRIMARY KEY (`Stf_Id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hum_stuff
-- ----------------------------
INSERT INTO `t_hum_stuff` VALUES (1, '测试名1', '1', '测试曾用名1', 'testname1', 'F', '1997-03-06', '山东青岛', '汉族', '农业', '330327199704031715', 'testaddress', '13210107876', '15554536854', '', '843611554@qq.com', '1', '良好', NULL, NULL, 1434384000, NULL, '1', '5000', NULL, b'1', '初中', NULL, NULL, 1539619200, 1402761600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '0', NULL, 'stuff_photo/20190109133527848.png', NULL, NULL, NULL, '1', 'note', 'admin', 1547012130, NULL);
INSERT INTO `t_hum_stuff` VALUES (2, '测试名2', '1', '测试曾用名2', 'testname2', 'M', '1980-11-12', '山东潍坊', '汉族', '非农业', '330327199704031716', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434452800, NULL, '0', '4000', NULL, b'1', '初中', NULL, NULL, 1539648000, 1339718400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13', '1', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (3, '测试名3', '1', '测试曾用名3', 'testname3', 'F', '1973-12-17', '山东青岛', '汉族', '农业', '330327199704031717', 'testaddress', NULL, '13215144887', NULL, NULL, '0', '良好', NULL, NULL, 1434442800, NULL, '1', '10000', NULL, b'1', '本科', '学士', NULL, 1539648000, 1339718400, '青岛大学', '软件工程', NULL, NULL, NULL, NULL, NULL, NULL, '4', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (4, '测试名4', '1', '测试曾用名4', 'testname4', 'M', '1994-11-21', '山东青岛', '汉族', '农业', '330327199704031718', 'testaddress', NULL, '13210107871', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '8000', NULL, b'1', '高中', NULL, NULL, 1539648000, 1402790400, '青岛二中', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13', '1', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (6, '测试名6', '1', '测试曾用名2', 'testname6', 'F', '1980-11-12', '北京', '汉族', '农业', '330327199704031719', 'testaddress', NULL, '17854645687', NULL, NULL, '1', '良好', NULL, NULL, 1434412800, NULL, '1', '9000', NULL, b'1', '本科', '学士', NULL, 1539648000, 1497484800, '中国海洋大学', '能源与动力', NULL, NULL, NULL, NULL, NULL, NULL, '4', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (9, '测试名9', '1', '测试曾用名2', 'testname8', 'F', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (8, '测试名8', '1', '', 'testname8', 'F', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (10, '测试名10', '1', '测试曾用名2', 'testname10', 'M', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (11, '测试名11', '1', '测试曾用名2', '', 'M', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (12, '测试名12', '1', '', 'testname8', 'F', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (13, '测试名13', '1', '测试曾用名2', '', 'M', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '1', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (14, '测试名14', '1', '', '', 'F', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, '843611554@qq.com', '1', '良好', NULL, NULL, 1434384000, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539619200, 1497456000, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, 'stuff_photo/20181127053839964.jpg', NULL, NULL, NULL, '1', NULL, 'admin', 1547697255, NULL);
INSERT INTO `t_hum_stuff` VALUES (15, '测试名15', '1', '', 'testname8', 'F', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, NULL, '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `t_hum_stuff` VALUES (16, '测试名16', '1', '测试曾用名2', 'testname8', 'F', '1980-11-12', '山东青岛', '藏族', '农业', '330327199704031722', 'testaddress', NULL, '17854645687', NULL, '843611554@qq.com', '0', '良好', NULL, NULL, 1434412800, NULL, '1', '7000', NULL, b'1', '本科', NULL, NULL, 1539648000, 1497484800, '青岛科技大学', '能源与动力', NULL, '海尔', NULL, NULL, NULL, NULL, '6', '1', NULL, 'stuff_photo/20181127062656217.jpg', NULL, NULL, NULL, '1', NULL, 'admin', 1543300017, NULL);
INSERT INTO `t_hum_stuff` VALUES (17, 'test', NULL, NULL, NULL, 'F', '2018-11-26', 't', 't', '非农业', 't', 't', '13210107876', '13210107876', NULL, '843611554@qq.com', '1', NULL, NULL, NULL, 1543190400, NULL, '1', '10000', NULL, NULL, 't', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '1', NULL, 'stuff_photo/20181127054135687.jpg', NULL, NULL, NULL, '1', NULL, 'admin', 1543297308, NULL);
INSERT INTO `t_hum_stuff` VALUES (18, 'test1', NULL, NULL, NULL, 'M', '2018-11-26', 't', 't', '非农业', 'tt', 't', '13210107876', '13210107876', NULL, '843611554@qq.com', '1', NULL, NULL, NULL, 1543190400, NULL, '1', '10000', NULL, NULL, 't', NULL, NULL, 1543190400, 1543190400, NULL, NULL, NULL, NULL, 1543223924, NULL, NULL, NULL, '4', '0', NULL, 'stuff_photo/20181127054026142.jpg', NULL, NULL, NULL, '0', NULL, 'admin', 1543297228, NULL);
INSERT INTO `t_hum_stuff` VALUES (19, 'test3', NULL, NULL, NULL, 'F', '1993-04-20', 't', 't', '非农业', '330327199704031715', 'tttttt', NULL, '13210107876', NULL, '843611554@qq.com', '0', NULL, NULL, NULL, 1542153600, NULL, '1', '8000', NULL, NULL, 't', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1543280043, NULL, NULL, NULL, '13', '1', NULL, 'stuff_photo/20181128011900187.jpg', NULL, NULL, NULL, '0', NULL, 'admin', 1543367941, NULL);
INSERT INTO `t_hum_stuff` VALUES (20, 'addtest', NULL, NULL, NULL, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1547697210, NULL, NULL, NULL, '6', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, 'admin', 1547697210, NULL);

-- ----------------------------
-- Table structure for t_package
-- ----------------------------
DROP TABLE IF EXISTS `t_package`;
CREATE TABLE `t_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `box_size` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operateman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `singal_weight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quality_man` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quality_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packtype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装箱类型，MES系统流程装箱01,02手动无流程装箱',
  `pnote` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `pstate` int(11) NULL DEFAULT NULL COMMENT '-3代表尾箱拼箱后继续拼箱，原单据作废，-1代表该单据作废，1代表审核,3代表已入库',
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_package
-- ----------------------------
INSERT INTO `t_package` VALUES (57, 'M201805220014', NULL, NULL, '0', NULL, '0', '', '', NULL, NULL, -1, 'df', 1526960136);
INSERT INTO `t_package` VALUES (58, 'M201805220018', NULL, NULL, '0', NULL, '0', '', '', NULL, NULL, -1, 'df', 1526968308);
INSERT INTO `t_package` VALUES (59, 'M201805230002', NULL, NULL, '25', NULL, '300', '', '', NULL, '52747 Housing RH MCA SBJ', 1, 'admin', 1527562459);
INSERT INTO `t_package` VALUES (60, 'M201805230003', '123', '321', '25*30', NULL, '20/30', '', '', NULL, 'test', 1, 'admin', 1527562474);
INSERT INTO `t_package` VALUES (61, 'M201805240002', 'PO342575', '1234565', '121', NULL, '11', NULL, NULL, NULL, 'sadfgsdf', NULL, 'df', 1527134519);
INSERT INTO `t_package` VALUES (62, 'M201805240002', 'PO342575', '1234565', '12', NULL, '11', NULL, NULL, NULL, 'sadfgsdf', 1, 'df', 1527134544);
INSERT INTO `t_package` VALUES (63, 'M201805240004', 'PO342575', '256398', '20*30M', NULL, '25/30 kgs', NULL, NULL, NULL, 'hif cost mile', -1, 'df', 1527134716);
INSERT INTO `t_package` VALUES (64, 'M201805240006', 'PO342575', '2563258', '12*30M', NULL, '25/30 kgs', NULL, NULL, NULL, '517 Housing RH MCA SBJ 517 Housing RH MCA SBJ 517 Housing RH MCA SBJ 517 Housing RH MCA SBJ', 1, 'df', 1527138281);
INSERT INTO `t_package` VALUES (65, 'M201805240008', 'PO342575', '2536985', '12*20M', NULL, '25/30 kgs', NULL, NULL, NULL, '517895 Housing MAC San Juan Capistrano 517895 Housing MAC San Juan Capistrano 517895 Housing MAC San Juan Capistrano', -1, 'df', 1527138834);
INSERT INTO `t_package` VALUES (66, 'M201805240010', 'PO342575', '565128152', '12*6M', NULL, '30/35 kgs', NULL, NULL, NULL, 'MAC 51758 San Juan Capistrano', 1, 'df', 1527139935);
INSERT INTO `t_package` VALUES (67, 'M201805240013', 'PO342575', '787878787', '120*20CM', NULL, '30/35 kgs', NULL, NULL, NULL, 'MAC Housing San Juan Capistrano', -1, 'df', 1527141449);
INSERT INTO `t_package` VALUES (68, 'M201805240015', '5503000827', '', '', NULL, '', NULL, NULL, NULL, 'MAC Housing San Juan Capistrano/Address: Los Angles', 0, 'df', 1527142260);
INSERT INTO `t_package` VALUES (69, 'M201805250001', '5503000827', '234', '', NULL, '30/35 kgs', NULL, NULL, NULL, 'MAC Housing San Juan Capistrano/Address: Los Angles', 0, 'admin', 1527559851);
INSERT INTO `t_package` VALUES (70, 'M201805290002', 'PO342575', '787878787', '20*30 cm', NULL, '30/35 kgs', NULL, NULL, NULL, 'Address: Los Angles/MAC Housing San Juan Capistrano', 1, 'df', 1527573727);
INSERT INTO `t_package` VALUES (71, 'M201805310001', 'PO342575', '787878787', '12', NULL, '30', NULL, NULL, NULL, 'Address: Los Angles/MAC Housing San Juan Capistrano', 1, 'df', 1527754829);
INSERT INTO `t_package` VALUES (72, 'M201805310004', 'PO342575', '787878787', '12', NULL, '37', NULL, NULL, NULL, 'Address: Los Angles/MAC Housing San Juan Capistrano', 1, 'df', 1527755135);
INSERT INTO `t_package` VALUES (73, 'M201806010005', '5503000827', '234545765', '20', NULL, '70', NULL, NULL, NULL, 'Address: Los Angles', -1, 'df', 1527825561);
INSERT INTO `t_package` VALUES (74, 'M201806010006', 'PO342575', '787878787', '12', NULL, '30', NULL, NULL, NULL, 'Address: Los Angles/MAC Housing San Juan Capistrano', -1, 'df', 1527832745);
INSERT INTO `t_package` VALUES (75, '01201806010007', 'PO342575', '787878787', '23', NULL, '44', NULL, NULL, NULL, 'MAC Housing San Juan Capistrano', 1, 'admin', 1527832938);
INSERT INTO `t_package` VALUES (76, '01201806040001_324', '5503000827', '2344565467', '234', 'df', '456', NULL, NULL, NULL, 'Address: Los Angles', 1, 'df', 1528078544);
INSERT INTO `t_package` VALUES (77, '01201806040002', '234454523', '11212', '23', 'df', NULL, NULL, NULL, NULL, NULL, 1, 'df', NULL);
INSERT INTO `t_package` VALUES (78, '01201806040003', '2344545232', '112122', '233', 'df', '', '', '', NULL, '', 1, 'df', NULL);
INSERT INTO `t_package` VALUES (79, '01201806040001', '5503000827', NULL, '234', 'df', '456', NULL, NULL, NULL, 'Address: Los Angles', 1, 'df', 1532932379);
INSERT INTO `t_package` VALUES (80, '01201807300003_885', '5503000827', NULL, NULL, 'df', NULL, NULL, NULL, NULL, 'Address: Los Angles', 1, 'df', 1532932854);
INSERT INTO `t_package` VALUES (81, '01201807300003', 'PO342575', '787878787', '23', 'df', '22', NULL, NULL, NULL, 'Address: Los Angles/MAC Housing San Juan Capistrano', -1, 'df', 1532932928);
INSERT INTO `t_package` VALUES (201, '01201811090094', '1', NULL, '1', NULL, '1', NULL, NULL, NULL, '　　　　├──管件车间', -1, NULL, 1542269931);
INSERT INTO `t_package` VALUES (207, '01201811120003', 'test', NULL, 't', NULL, 't', NULL, NULL, NULL, '　　　　├──机加工车间', -1, NULL, 1542414620);
INSERT INTO `t_package` VALUES (208, '01201811130002', '1', NULL, '1', NULL, '1', NULL, NULL, NULL, '　　　　├──铸锻车间', -1, NULL, 1542081486);
INSERT INTO `t_package` VALUES (209, '01201811160004', 'Dd', NULL, '1', NULL, '1', NULL, NULL, NULL, '　　　　├──模具车间', 0, NULL, 1543022965);
INSERT INTO `t_package` VALUES (210, '01201811190003', '11', NULL, '31', NULL, '12', NULL, NULL, NULL, 'test', 1, NULL, 1542598221);
INSERT INTO `t_package` VALUES (211, '01201811190037', 'DDD', NULL, 't', NULL, 't', NULL, NULL, NULL, 't', 1, NULL, 1542609749);
INSERT INTO `t_package` VALUES (212, '01201812040010', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1543888632);
INSERT INTO `t_package` VALUES (213, '01201812040011', 'tt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1543888649);
INSERT INTO `t_package` VALUES (214, '01201812040015', 'ccc', NULL, 'ccc', NULL, 'cc', NULL, NULL, NULL, 'ccc', 0, NULL, 1543890898);
INSERT INTO `t_package` VALUES (215, '01201812040023', 'dd', '2018070300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1543891662);

-- ----------------------------
-- Table structure for t_package_det
-- ----------------------------
DROP TABLE IF EXISTS `t_package_det`;
CREATE TABLE `t_package_det`  (
  `pdet_id` int(11) NOT NULL AUTO_INCREMENT,
  `pack_id` int(11) NULL DEFAULT NULL,
  `exec_qrcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `print_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品编号',
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `pstyle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `stove_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字头',
  `box_num` int(11) NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pdet_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_package_det
-- ----------------------------
INSERT INTO `t_package_det` VALUES (81, 57, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', NULL, NULL, 200, 1526960136, '');
INSERT INTO `t_package_det` VALUES (82, 57, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', NULL, NULL, 60, 1526960136, '');
INSERT INTO `t_package_det` VALUES (83, 57, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', NULL, NULL, 120, 1526960136, '');
INSERT INTO `t_package_det` VALUES (84, 57, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', NULL, NULL, 55, 1526960136, '');
INSERT INTO `t_package_det` VALUES (85, 58, '15226355715807', '5949', 'D1030013', 'A0036877-中心距2mm', 'Φ32×88mm', '123123', NULL, NULL, 60, 1526968308, '');
INSERT INTO `t_package_det` VALUES (86, 58, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', NULL, NULL, 30, 1526968308, '');
INSERT INTO `t_package_det` VALUES (90, 62, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 100, 1527134544, '');
INSERT INTO `t_package_det` VALUES (91, 63, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 120, 1527134716, '');
INSERT INTO `t_package_det` VALUES (92, 63, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 120, 1527134716, '');
INSERT INTO `t_package_det` VALUES (93, 63, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 120, 1527134716, '');
INSERT INTO `t_package_det` VALUES (94, 64, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 50, 1527138281, '');
INSERT INTO `t_package_det` VALUES (95, 64, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 50, 1527138281, '');
INSERT INTO `t_package_det` VALUES (96, 64, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 50, 1527138281, '');
INSERT INTO `t_package_det` VALUES (97, 65, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 30, 1527138834, '');
INSERT INTO `t_package_det` VALUES (98, 66, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 31, 1527139935, '');
INSERT INTO `t_package_det` VALUES (99, 66, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 26, 1527139935, '');
INSERT INTO `t_package_det` VALUES (100, 66, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 43, 1527139935, '');
INSERT INTO `t_package_det` VALUES (101, 66, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 44, 1527139935, '');
INSERT INTO `t_package_det` VALUES (102, 67, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 24, 1527141449, '');
INSERT INTO `t_package_det` VALUES (103, 67, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 30, 1527141449, '');
INSERT INTO `t_package_det` VALUES (104, 67, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 40, 1527141449, '');
INSERT INTO `t_package_det` VALUES (105, 68, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 20, 1527142260, '');
INSERT INTO `t_package_det` VALUES (106, 68, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 10, 1527142260, '');
INSERT INTO `t_package_det` VALUES (107, 69, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 10, 1527213488, '');
INSERT INTO `t_package_det` VALUES (108, 69, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', NULL, 30, 1527213488, '');
INSERT INTO `t_package_det` VALUES (109, 70, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', NULL, 114, 1527573727, 'df');
INSERT INTO `t_package_det` VALUES (110, 70, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', NULL, 26, 1527573727, 'df');
INSERT INTO `t_package_det` VALUES (111, 71, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'tk', 106, 1527754830, 'df');
INSERT INTO `t_package_det` VALUES (112, 71, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', 'GB', 2, 1527754830, 'df');
INSERT INTO `t_package_det` VALUES (113, 72, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'tt', 44, 1527755135, 'df');
INSERT INTO `t_package_det` VALUES (114, 72, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'yy', 22, 1527755135, 'df');
INSERT INTO `t_package_det` VALUES (115, 72, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', 'ww', 11, 1527755135, 'df');
INSERT INTO `t_package_det` VALUES (116, 73, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'Tk', 30, 1527825562, 'df');
INSERT INTO `t_package_det` VALUES (117, 74, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', '102', 30, 1527832745, 'df');
INSERT INTO `t_package_det` VALUES (118, 74, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', '20', 30, 1527832745, 'df');
INSERT INTO `t_package_det` VALUES (119, 75, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', '15', 30, 1527832917, 'df');
INSERT INTO `t_package_det` VALUES (120, 75, '15227299092599', '6103', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', '15', 102, 1527832917, 'df');
INSERT INTO `t_package_det` VALUES (121, 76, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'TT', 114, 1528078544, 'df');
INSERT INTO `t_package_det` VALUES (122, 77, '15227257886417', '6319', 'D1290003', 'A0027275', '12', '2232', '2222', 'GB', 1000, NULL, 'df');
INSERT INTO `t_package_det` VALUES (123, 77, '15227257886417', '6319', 'D1290003', 'A0027275', '12', '2232', '2222', 'GB', 15, NULL, 'df');
INSERT INTO `t_package_det` VALUES (124, 79, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'TT', 114, 1532932379, 'df');
INSERT INTO `t_package_det` VALUES (125, 79, '15227257886417', '6319', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706388xx', NULL, NULL, 100, 1532932379, 'df');
INSERT INTO `t_package_det` VALUES (126, 80, '15227257886417', '6319', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706388xx', '026523521', 'tj', 10, 1532932854, 'df');
INSERT INTO `t_package_det` VALUES (127, 80, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'tj', 100, 1532932854, 'df');
INSERT INTO `t_package_det` VALUES (128, 81, '15227257886417', '6319', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706388xx', '026523521', 'tj', 10, 1532932928, 'df');
INSERT INTO `t_package_det` VALUES (129, 81, '15227299092599', '6103', 'D1290003', 'A0027275', 'Φ32×69mm', 'e21706368xx', '7770', 'tj', 100, 1532932928, 'df');
INSERT INTO `t_package_det` VALUES (130, 81, '15227326924514', '6517', 'D3290036', 'A0048859', 'Φ32×90mm', '7212487', '20180501', 'HB', 20, 1532932928, 'df');
INSERT INTO `t_package_det` VALUES (240, 207, NULL, NULL, 'PA001', 'PA12359.01', '', NULL, NULL, NULL, 2, 1520307848, 'admin');
INSERT INTO `t_package_det` VALUES (241, 207, NULL, NULL, 'D1410005', '192568.3', 'Φ30x35mm/Φ22x122mm（一坯两件）', NULL, NULL, NULL, 22, 1524616397, 'yangkai');
INSERT INTO `t_package_det` VALUES (242, 208, NULL, NULL, 'D1290002', 'A0027274', 'Φ30×78mm', NULL, NULL, NULL, 3, 1524548455, 'yangkai');
INSERT INTO `t_package_det` VALUES (243, 209, NULL, NULL, 'D1290002', 'A0027274', 'Φ30×78mm', NULL, NULL, NULL, 132, 1524548455, 'yangkai');
INSERT INTO `t_package_det` VALUES (244, 210, NULL, NULL, 'D1290002', 'A0027274', 'Φ30×78mm', NULL, NULL, NULL, 333, 1524548455, 'yangkai');
INSERT INTO `t_package_det` VALUES (245, 210, NULL, NULL, '3323', '控制臂', '1212', NULL, NULL, NULL, 12, 0, NULL);
INSERT INTO `t_package_det` VALUES (246, 211, NULL, NULL, '3323', '控制臂', '1212', NULL, NULL, NULL, 333, 0, NULL);
INSERT INTO `t_package_det` VALUES (247, 211, NULL, NULL, 'D1290003', 'A0027275', 'Φ32×69mm', NULL, NULL, NULL, 123, 1524548506, 'yangkai');
INSERT INTO `t_package_det` VALUES (248, 212, NULL, NULL, 'D1290002', 'A0027274', 'Φ30×78mm', NULL, NULL, NULL, 22, 1524548455, 'yangkai');
INSERT INTO `t_package_det` VALUES (249, 213, NULL, NULL, 'D1290003', 'A0027275', 'Φ32×69mm', NULL, NULL, NULL, 22, 1524548506, 'yangkai');
INSERT INTO `t_package_det` VALUES (250, 213, NULL, NULL, '3323', '控制臂', '1212', NULL, NULL, NULL, 33, 0, NULL);
INSERT INTO `t_package_det` VALUES (251, 214, NULL, NULL, 'D1030014', 'A0036878-中心距2mm', 'Φ32×88mm', NULL, NULL, NULL, 11, 1524548257, 'yangkai');
INSERT INTO `t_package_det` VALUES (252, 215, NULL, NULL, '3323', '控制臂', '1212', NULL, NULL, NULL, 3, 0, NULL);

-- ----------------------------
-- Table structure for t_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_role`;
CREATE TABLE `t_permission_role`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of t_permission_role
-- ----------------------------
INSERT INTO `t_permission_role` VALUES (1, 1);
INSERT INTO `t_permission_role` VALUES (1, 2);
INSERT INTO `t_permission_role` VALUES (1, 6);
INSERT INTO `t_permission_role` VALUES (1, 8);
INSERT INTO `t_permission_role` VALUES (1, 9);
INSERT INTO `t_permission_role` VALUES (1, 12);
INSERT INTO `t_permission_role` VALUES (2, 1);
INSERT INTO `t_permission_role` VALUES (2, 2);
INSERT INTO `t_permission_role` VALUES (2, 6);
INSERT INTO `t_permission_role` VALUES (3, 1);
INSERT INTO `t_permission_role` VALUES (3, 2);
INSERT INTO `t_permission_role` VALUES (3, 6);
INSERT INTO `t_permission_role` VALUES (4, 1);
INSERT INTO `t_permission_role` VALUES (4, 2);
INSERT INTO `t_permission_role` VALUES (4, 6);
INSERT INTO `t_permission_role` VALUES (5, 1);
INSERT INTO `t_permission_role` VALUES (5, 2);
INSERT INTO `t_permission_role` VALUES (5, 8);
INSERT INTO `t_permission_role` VALUES (5, 14);
INSERT INTO `t_permission_role` VALUES (6, 1);
INSERT INTO `t_permission_role` VALUES (6, 2);
INSERT INTO `t_permission_role` VALUES (6, 9);
INSERT INTO `t_permission_role` VALUES (6, 12);
INSERT INTO `t_permission_role` VALUES (7, 1);
INSERT INTO `t_permission_role` VALUES (7, 2);
INSERT INTO `t_permission_role` VALUES (7, 9);
INSERT INTO `t_permission_role` VALUES (7, 12);
INSERT INTO `t_permission_role` VALUES (8, 1);
INSERT INTO `t_permission_role` VALUES (8, 2);
INSERT INTO `t_permission_role` VALUES (8, 9);
INSERT INTO `t_permission_role` VALUES (8, 12);
INSERT INTO `t_permission_role` VALUES (9, 1);
INSERT INTO `t_permission_role` VALUES (9, 2);
INSERT INTO `t_permission_role` VALUES (9, 9);
INSERT INTO `t_permission_role` VALUES (9, 12);
INSERT INTO `t_permission_role` VALUES (10, 1);
INSERT INTO `t_permission_role` VALUES (10, 2);
INSERT INTO `t_permission_role` VALUES (10, 9);
INSERT INTO `t_permission_role` VALUES (10, 12);
INSERT INTO `t_permission_role` VALUES (11, 1);
INSERT INTO `t_permission_role` VALUES (11, 2);
INSERT INTO `t_permission_role` VALUES (11, 9);
INSERT INTO `t_permission_role` VALUES (11, 12);
INSERT INTO `t_permission_role` VALUES (12, 1);
INSERT INTO `t_permission_role` VALUES (12, 2);
INSERT INTO `t_permission_role` VALUES (12, 9);
INSERT INTO `t_permission_role` VALUES (12, 12);
INSERT INTO `t_permission_role` VALUES (13, 1);
INSERT INTO `t_permission_role` VALUES (13, 2);
INSERT INTO `t_permission_role` VALUES (13, 9);
INSERT INTO `t_permission_role` VALUES (13, 12);
INSERT INTO `t_permission_role` VALUES (14, 1);
INSERT INTO `t_permission_role` VALUES (14, 2);
INSERT INTO `t_permission_role` VALUES (14, 10);
INSERT INTO `t_permission_role` VALUES (14, 12);
INSERT INTO `t_permission_role` VALUES (15, 1);
INSERT INTO `t_permission_role` VALUES (15, 2);
INSERT INTO `t_permission_role` VALUES (15, 10);
INSERT INTO `t_permission_role` VALUES (17, 1);
INSERT INTO `t_permission_role` VALUES (17, 2);
INSERT INTO `t_permission_role` VALUES (17, 10);
INSERT INTO `t_permission_role` VALUES (18, 1);
INSERT INTO `t_permission_role` VALUES (18, 2);
INSERT INTO `t_permission_role` VALUES (18, 10);
INSERT INTO `t_permission_role` VALUES (19, 1);
INSERT INTO `t_permission_role` VALUES (19, 2);
INSERT INTO `t_permission_role` VALUES (19, 10);
INSERT INTO `t_permission_role` VALUES (19, 12);
INSERT INTO `t_permission_role` VALUES (20, 1);
INSERT INTO `t_permission_role` VALUES (20, 2);
INSERT INTO `t_permission_role` VALUES (20, 10);
INSERT INTO `t_permission_role` VALUES (20, 12);
INSERT INTO `t_permission_role` VALUES (21, 1);
INSERT INTO `t_permission_role` VALUES (21, 2);
INSERT INTO `t_permission_role` VALUES (21, 10);
INSERT INTO `t_permission_role` VALUES (21, 12);
INSERT INTO `t_permission_role` VALUES (22, 1);
INSERT INTO `t_permission_role` VALUES (22, 2);
INSERT INTO `t_permission_role` VALUES (22, 10);
INSERT INTO `t_permission_role` VALUES (22, 12);
INSERT INTO `t_permission_role` VALUES (30, 17);
INSERT INTO `t_permission_role` VALUES (31, 17);
INSERT INTO `t_permission_role` VALUES (1022, 1);
INSERT INTO `t_permission_role` VALUES (1022, 2);
INSERT INTO `t_permission_role` VALUES (1022, 10);
INSERT INTO `t_permission_role` VALUES (1023, 1);
INSERT INTO `t_permission_role` VALUES (1023, 2);
INSERT INTO `t_permission_role` VALUES (1023, 10);
INSERT INTO `t_permission_role` VALUES (1024, 1);
INSERT INTO `t_permission_role` VALUES (1024, 2);
INSERT INTO `t_permission_role` VALUES (1024, 10);
INSERT INTO `t_permission_role` VALUES (1025, 1);
INSERT INTO `t_permission_role` VALUES (1025, 2);
INSERT INTO `t_permission_role` VALUES (1025, 10);
INSERT INTO `t_permission_role` VALUES (1026, 1);
INSERT INTO `t_permission_role` VALUES (1026, 2);
INSERT INTO `t_permission_role` VALUES (1026, 10);
INSERT INTO `t_permission_role` VALUES (1027, 1);
INSERT INTO `t_permission_role` VALUES (1027, 8);
INSERT INTO `t_permission_role` VALUES (1028, 1);
INSERT INTO `t_permission_role` VALUES (1028, 9);
INSERT INTO `t_permission_role` VALUES (1028, 11);
INSERT INTO `t_permission_role` VALUES (1028, 12);
INSERT INTO `t_permission_role` VALUES (1029, 1);
INSERT INTO `t_permission_role` VALUES (1029, 9);
INSERT INTO `t_permission_role` VALUES (1029, 10);
INSERT INTO `t_permission_role` VALUES (1029, 11);
INSERT INTO `t_permission_role` VALUES (1029, 12);
INSERT INTO `t_permission_role` VALUES (1029, 13);
INSERT INTO `t_permission_role` VALUES (1030, 4);
INSERT INTO `t_permission_role` VALUES (1031, 4);
INSERT INTO `t_permission_role` VALUES (1032, 4);
INSERT INTO `t_permission_role` VALUES (1033, 5);
INSERT INTO `t_permission_role` VALUES (1034, 4);
INSERT INTO `t_permission_role` VALUES (1035, 1);
INSERT INTO `t_permission_role` VALUES (1035, 12);
INSERT INTO `t_permission_role` VALUES (1036, 1);
INSERT INTO `t_permission_role` VALUES (1036, 12);
INSERT INTO `t_permission_role` VALUES (1037, 1);
INSERT INTO `t_permission_role` VALUES (1037, 12);
INSERT INTO `t_permission_role` VALUES (1038, 1);
INSERT INTO `t_permission_role` VALUES (1038, 11);
INSERT INTO `t_permission_role` VALUES (1039, 1);
INSERT INTO `t_permission_role` VALUES (1039, 11);
INSERT INTO `t_permission_role` VALUES (1040, 1);
INSERT INTO `t_permission_role` VALUES (1040, 10);
INSERT INTO `t_permission_role` VALUES (1040, 11);
INSERT INTO `t_permission_role` VALUES (1040, 12);
INSERT INTO `t_permission_role` VALUES (1040, 13);
INSERT INTO `t_permission_role` VALUES (1041, 1);
INSERT INTO `t_permission_role` VALUES (1041, 10);
INSERT INTO `t_permission_role` VALUES (1041, 11);
INSERT INTO `t_permission_role` VALUES (1041, 12);
INSERT INTO `t_permission_role` VALUES (1042, 1);
INSERT INTO `t_permission_role` VALUES (1042, 11);
INSERT INTO `t_permission_role` VALUES (1043, 1);
INSERT INTO `t_permission_role` VALUES (1043, 12);
INSERT INTO `t_permission_role` VALUES (1044, 1);
INSERT INTO `t_permission_role` VALUES (1044, 8);
INSERT INTO `t_permission_role` VALUES (1045, 1);
INSERT INTO `t_permission_role` VALUES (1045, 14);
INSERT INTO `t_permission_role` VALUES (1046, 1);
INSERT INTO `t_permission_role` VALUES (1047, 4);
INSERT INTO `t_permission_role` VALUES (1048, 1);
INSERT INTO `t_permission_role` VALUES (1049, 17);
INSERT INTO `t_permission_role` VALUES (1050, 17);
INSERT INTO `t_permission_role` VALUES (1051, 17);
INSERT INTO `t_permission_role` VALUES (1052, 17);
INSERT INTO `t_permission_role` VALUES (1053, 17);
INSERT INTO `t_permission_role` VALUES (1054, 17);
INSERT INTO `t_permission_role` VALUES (1055, 17);
INSERT INTO `t_permission_role` VALUES (1056, 17);
INSERT INTO `t_permission_role` VALUES (1057, 17);
INSERT INTO `t_permission_role` VALUES (1058, 17);
INSERT INTO `t_permission_role` VALUES (1059, 1);
INSERT INTO `t_permission_role` VALUES (1060, 1);
INSERT INTO `t_permission_role` VALUES (1061, 1);
INSERT INTO `t_permission_role` VALUES (1062, 1);
INSERT INTO `t_permission_role` VALUES (1063, 1);
INSERT INTO `t_permission_role` VALUES (1064, 1);
INSERT INTO `t_permission_role` VALUES (1065, 1);
INSERT INTO `t_permission_role` VALUES (1066, 1);

-- ----------------------------
-- Table structure for t_permissions
-- ----------------------------
DROP TABLE IF EXISTS `t_permissions`;
CREATE TABLE `t_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `parent_id` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `menu_route` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '路由名称',
  `menu_model` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'model名',
  `menu_control` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '控制器名',
  `menu_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `menu_order` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '顺序',
  `menu_iconindex` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图标序号',
  `menu_used` bit(1) NULL DEFAULT NULL COMMENT '是否有效',
  `ismenu` bit(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1067 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permissions
-- ----------------------------
INSERT INTO `t_permissions` VALUES (1, 'shortcut', '常用操作', '', 00000000000, '', '', '', 'sys', 00000000000, 'fa fa-fw fa-clipboard', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (2, 'planadd', '添加计划', '', 00000000001, 'admin/plan/create', '', '', 'sys', 00000000001, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (3, 'planlist', '计划列表', '', 00000000001, 'admin/plan', '', '', 'sys', 00000000002, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (4, 'plancheck', '计划审核', '', 00000000001, 'admin/planchecklist', '', '', 'sys', 00000000003, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (5, 'planexec', '计划执行', '', 00000000001, 'admin/planexec', '', '', 'sys', 00000000004, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (6, 'productadd', '添加产品', '', 00000000001, 'admin/product/create', '', '', 'sys', 00000000007, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (7, 'productlist', '产品列表', '', 00000000001, 'admin/product', '', '', 'sys', 00000000008, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (8, 'productcheck', '产品审核', '', 00000000001, 'admin/products/checklist', '', '', 'sys', 00000000009, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (9, 'categoryadd', '添加分类', '', 00000000001, 'admin/category/create', '', '', 'sys', 00000000010, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (10, 'categorylist', '全部分类', '', 00000000001, 'admin/category', '', '', 'sys', 00000000011, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (11, 'artlist', '工艺管理', '', 00000000001, 'admin/art', '', '', 'sys', 00000000012, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (13, 'attachment', '图纸管理', '', 00000000001, 'admin/attachment', '', '', 'sys', 00000000014, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (15, 'system', '系统设置', '', 00000000000, '', '', '', 'sys', 00000000006, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (14, 'basic', '基础设置', '', 00000000000, '', '', '', 'sys', 00000000007, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (17, 'departadd', '添加部门', '', 00000000014, 'admin/depart/create', '', '', 'sys', 00000000002, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (18, 'departlist', '部门列表', '', 00000000014, 'admin/depart', '', '', 'sys', 00000000003, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (19, 'workcenteradd', '添加工作中心', '', 00000000014, 'admin/workcenter/create', '', '', 'sys', 00000000004, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (20, 'workcenterlist', '工作中心列表', '', 00000000014, 'admin/workcenter', '', '', 'sys', 00000000005, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (21, 'dictadd', '添加词典', '', 00000000014, 'admin/dict/create', '', '', 'sys', 00000000006, 'fa fa-fw fa-list-alt', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (22, 'dictlist', '词典列表', '', 00000000014, 'admin/dict', '', '', 'sys', 00000000007, 'fa fa-fw fa-book', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (12, 'artdetlist', '工序管理', '', 00000000001, 'admin/artwork', '', '', 'sys', 00000000013, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1022, 'rolelist', '角色管理', NULL, 00000000015, 'admin/role', NULL, NULL, 'sys', 00000000001, 'fa fa-fw fa-link', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1023, 'permissionlist', '权限管理', NULL, 00000000015, 'admin/permission', NULL, NULL, 'sys', 00000000002, 'fa fa-fw fa-link', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1024, 'userlist', '系统用户管理', '', 00000000015, 'admin/user', NULL, NULL, 'sys', 00000000003, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1025, 'username', '普通用户管理', NULL, 00000000014, 'admin/username', NULL, NULL, 'sys', 00000000008, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1026, 'company', '公司管理', NULL, 00000000014, 'admin/company', NULL, NULL, 'sys', 00000000009, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1027, 'print_list', '打印日志', NULL, 00000000001, 'admin/printit', NULL, NULL, 'sys', 00000000006, 'fa fa-fw fa-link', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1028, 'productshow', '产品信息', NULL, 00000001029, 'admin/productshow', NULL, NULL, 'sys', 00000000012, 'fa fa-fw fa-link', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1029, 'search', '系统查询', '', 00000000000, '', '', '', 'sys', 00000000005, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1030, 'CCurPlan', '计划信息', '', 00000000000, 'admin/productshow', NULL, NULL, 'shop', 00000000201, 'fa fa-fw fa-link', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1031, 'CAddProduction', '产量录入', '', 00000000000, '', NULL, NULL, 'shop', 00000000202, '', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1032, 'CHistory', '历史记录', '', 00000000000, '', NULL, NULL, 'shop', 00000000203, '', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1033, 'CModelDoc', '模具资料', '', 00000000000, '', NULL, NULL, 'shop', 00000000204, '', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1035, 'pmanage', '生产管理', '', 00000000000, '', '', '', 'sys', 00000000002, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1036, 'operate_mod', '员工数据修改', '', 00000001035, 'admin/operater', '', '', 'sys', 00000000001, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1037, 'quality_mod', '质检数据修改', '', 00000001035, 'admin/quality', '', '', 'sys', 00000000002, 'fa fa-fw fa-list-ul', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1034, 'CPackage', '产品包装', '', 00000000000, '', '', '', 'shop', 00000000205, '', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1038, 'planexec_list', '生产进度查询', '', 00000001029, 'admin/planexec_list', '', '', 'sys', 00000000011, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1039, 'planloss', '生产损耗查询', '', 00000001029, 'admin/planloss', '', '', 'sys', 00000000006, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1040, 'searchoperater', '操作人员记录', '', 00000001029, 'admin/searchoperater', '', '', 'sys', 00000000007, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1041, 'searchquality', '质检人员记录', '', 00000001029, 'admin/searchquality', '', '', 'sys', 00000000008, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1042, 'personsum', '计件数量统计', '', 00000001029, 'admin/personsum', '', '', 'sys', 00000000008, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1043, 'checkart', '工艺审核', '', 00000001035, 'admin/checkart', '', '', 'sys', 00000000008, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1044, 'exec_check', '执行审核', '', 00000000001, 'admin/planexec_check', '', '', 'sys', 00000000005, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1045, 'exec_rm', '生产退料', '', 00000001035, 'admin/planexec_rm', '', '', 'sys', 00000000009, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1046, 'product_artdet', '生产工序查询', '', 00000001029, 'admin/product_artdet', '', '', 'sys', 00000000009, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1047, 'CPackagePrint', '拼箱历史', '', 00000000000, '', '', '', 'shop', 00000000206, '', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1048, 'plan_package', '拼箱管理', '', 00000001035, 'admin/package', '', '', 'sys', 00000000009, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1049, 'AQualityOpt', '质检管理', NULL, 00000000030, 'PlanInfo', NULL, NULL, 'app', 00000000301, 'image/03.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1050, 'AProductInfo', '产品信息', NULL, 00000000030, 'ProductInfo', NULL, NULL, 'app', 00000000303, 'image/04.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1051, 'AQuality_Rec', '质检记录', NULL, 00000000030, 'Quality_Rec', NULL, NULL, 'app', 00000000302, 'image/05.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1052, 'ARepaireOpt', '维修管理', NULL, 00000000030, 'RepaireOpt', NULL, NULL, 'app', 00000000304, 'image/06.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1053, 'ARepaireRec', '维修记录', NULL, 00000000030, 'RepaireRec', NULL, NULL, 'app', 00000000305, 'image/07.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1054, 'AStockIn', '入库操作', NULL, 00000000030, 'StockIn', NULL, NULL, 'app', 00000000306, 'image/01.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1055, 'AStockOut', '出库操作', NULL, 00000000030, 'StockOut', NULL, NULL, 'app', 00000000307, 'image/02.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (30, 'AManageApp', '业务操作', NULL, 00000000000, 'ManageApp', NULL, NULL, 'app', 00000000300, NULL, b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (31, 'AReportList', '查询报表', NULL, 00000000000, 'ReportList', NULL, NULL, 'app', 00000000400, NULL, b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1056, 'ARepaireSearch', '维修查询', NULL, 00000000031, 'RepaireSearch', NULL, NULL, 'app', 00000000401, 'image/08.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1057, 'AOutPutSearch', '每日产量', NULL, 00000000031, 'OutPutSearch', NULL, NULL, 'app', 00000000402, 'image/09.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1058, 'AArtSearch', '工艺查询', NULL, 00000000031, 'ArtSearch', NULL, NULL, 'app', 00000000403, 'image/10.png', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1059, 'pendingpack', '包装查询', NULL, 00000001029, 'admin/packsum', NULL, NULL, 'sys', 00000000010, 'fa fa-fw fa-cog', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1060, 'template', '短信模板', NULL, 00000000014, 'admin/template', NULL, NULL, 'sys', 00000000010, 'fa fa-fw fa-book', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1061, 'truckweight', '车辆称重', '', 00000001035, 'admin/truckweight', '', '', 'sys', 00000000010, 'fa fa-fw fa-book', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1062, 'packagelist', '拼箱追溯', NULL, 00000001029, 'admin/packagelist', NULL, NULL, 'sys', 00000000010, 'fa fa-fw fa-book', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1063, 'custserv', '客服系统', NULL, 00000001035, 'admin/custserv', NULL, NULL, 'sys', 00000000012, 'fa fa-fw fa-book', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1064, 'assist_index', '外协执行', '', 00000000001, 'admin/assist_index', '', '', 'sys', 00000000014, 'fa fa-fw fa-book', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1065, 'customer', '客户管理', '', 00000000014, 'admin/customer', '', '', 'sys', 00000000011, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);
INSERT INTO `t_permissions` VALUES (1066, 'patition_check', '分箱审核', '', 00000001035, 'admin/patition_check', '', '', 'sys', 00000000011, 'fa fa-fw fa-plus-square', b'1', b'1', NULL, NULL);

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划名称',
  `plan_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划条码',
  `plan_date` int(11) NOT NULL COMMENT '计划日期',
  `plan_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划类别',
  `plan_dept_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '计划班产',
  `shopid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属车间',
  `order_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '订单数量',
  `order_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单重量',
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `material_require` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '材料要求',
  `delivery_date` int(11) NULL DEFAULT NULL COMMENT '交付日期',
  `plan_order` int(11) NULL DEFAULT NULL COMMENT '计划优先级排序',
  `pnote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `source_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源单号',
  `source_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源单据类型',
  `source_artdet_id` int(11) NULL DEFAULT NULL COMMENT '来源单据所在工序',
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  `pstate` int(1) NULL DEFAULT 0 COMMENT '状态',
  `finishdate` int(11) NULL DEFAULT NULL COMMENT '完成日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_plan
-- ----------------------------
INSERT INTO `t_plan` VALUES (8, '锻造车间4月份计划', '15222069272270', 1522540800, '01', 2500, '4', 25000, 0.00, '5503000827', NULL, 37650, 'C35*32', 1546400218, NULL, 'Address: Los Angles', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (9, '锻造车间4月份计划', '15222072097601', 1542243144, '01', 2500, '4', 25000, 0.00, '5503000827', NULL, 37643, 'C35*32', 1524096000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (10, '锻造车间4月份计划', '15222094061050', 1523491200, '01', 2500, '4', 38000, 0.00, '5503000827', NULL, 37638, 'C35*32', 1527724800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (11, '锻造车间4月份计划', '15222095506501', 1524182400, '03', 2500, '4', 38000, 0.00, '5503000827', NULL, 37639, 'C35*32', 1527724800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (12, '锻造车间4月份计划', '15222097208074', 1542243144, '03', 2500, '4', 32000, 0.00, 'PO342575', '787878787', 37637, 'C45   直径32*80', 1525305600, NULL, 'MAC Housing San Juan Capistrano', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (13, '锻造车间4月份计划', '15222098189572', 1523232000, '01', 2500, '4', 29000, 0.00, 'PO342575', '6666666', 37636, 'C45   直径32*80', 1525305600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (14, '锻造车间4月份计划', '15222099021120', 1542243144, '03', 2500, '4', 6000, 0.00, '5503000827', NULL, 37638, 'C35*32', 1525305600, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (15, '锻造车间4月份计划', '15222099845509', 1524700800, '03', 2500, '4', 18000, 0.00, '5503000827', NULL, 37639, 'C35*32', 1525305600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (16, '锻造车间4月份计划', '15222100639405', 1524787200, NULL, 2500, NULL, 32000, 0.00, 'PO342575', '3755555', 37637, 'C45   直径32*80', 1527724800, NULL, ' ', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (17, '1', '15222189235045', 1522281600, NULL, 0, NULL, 1000, 0.00, '1100', NULL, 37636, '', 0, NULL, '', NULL, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `t_plan` VALUES (22, 'testtest80523', '15270609371707', 1542328519, NULL, 3020, NULL, 30000, 0.00, '332223156', 'df2343234', 37664, '', 1530230400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (24, '计划123', '15276454833286', 1542328519, NULL, 1000, NULL, 900, 200.00, '9991', '8882', 37681, '精钢', 1527724800, NULL, '尽快交货', NULL, NULL, NULL, 'admin', 1527645483, 1, NULL);
INSERT INTO `t_plan` VALUES (25, 'test', '15330156952831', 1532995200, NULL, 1000, '4', 111111, 1234.00, '123321', '123', 37638, NULL, 1533686400, NULL, NULL, NULL, NULL, NULL, 'admin', 1533015695, 0, NULL);
INSERT INTO `t_plan` VALUES (26, 'test123', '15330160808828', 1542328519, NULL, 9000, '4', 8000, 7000.00, '9999', '8888', 37640, NULL, 1533772800, NULL, NULL, NULL, NULL, NULL, 'admin', 1533016080, 1, NULL);
INSERT INTO `t_plan` VALUES (27, 'hello world', '15360269892597', 1536019200, '01', 123, '4', 123, 123.00, '11111', '123', 37667, NULL, 1538265600, NULL, NULL, NULL, NULL, NULL, 'admin', 1536026989, 1, NULL);
INSERT INTO `t_plan` VALUES (28, 'hello world', '15360270188633', 1536019200, '01', 123, '4', 123, 123.00, '11111', '123', 37664, NULL, 1538265600, NULL, NULL, NULL, NULL, NULL, 'admin', 1536027018, 0, NULL);
INSERT INTO `t_plan` VALUES (29, 'hello world', '15360272292684', 1542328519, '01', 123, '4', 123, 123.00, '11111', '123', 37664, NULL, 1538265600, NULL, NULL, NULL, NULL, NULL, 'admin', 1536027229, 0, NULL);
INSERT INTO `t_plan` VALUES (30, '123', '15360280247185', 1536019200, '01', 123, '4', NULL, NULL, NULL, NULL, 37640, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'admin', 1536028024, 0, NULL);
INSERT INTO `t_plan` VALUES (31, '23234', '15360285438199', 1536019200, '01', 111, '4', NULL, NULL, '344', NULL, 37636, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'admin', 1536028543, 1, NULL);
INSERT INTO `t_plan` VALUES (32, '66666', '15360287085556', 1536019200, '03', 123, '5', 2222, NULL, '222333', '444555', 37666, NULL, 1538265600, NULL, NULL, NULL, NULL, NULL, 'admin', 1536028708, 0, NULL);
INSERT INTO `t_plan` VALUES (213, '2018-10-19外协返工计划', '15399416084477', 1539907200, '04', 12, '4', NULL, NULL, NULL, NULL, 37637, '11', 1543276800, NULL, NULL, '18201810170001', '01', 189, 'admin', 1539941608, 0, NULL);
INSERT INTO `t_plan` VALUES (214, '2018-10-19外协返工计划', '15399416444618', 1539907200, '04', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, 1541721600, NULL, NULL, '18201810160103', '01', NULL, 'admin', 1539941644, 0, NULL);
INSERT INTO `t_plan` VALUES (216, '2018-10-22外协返工计划', '15401702966083', 1542328519, '04', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18201810160102', '01', NULL, 'admin', 1540170296, 1, NULL);
INSERT INTO `t_plan` VALUES (230, '2018-10-22外协返工计划', '15401716338772', 1540171633, '04', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18201810160100', '01', NULL, 'admin', 1540171633, -1, NULL);
INSERT INTO `t_plan` VALUES (231, '2018-10-22外协返工计划', '15401769512927', 1540176951, '04', 39, '4', NULL, NULL, NULL, NULL, 37637, NULL, NULL, NULL, NULL, '18201810150015', '01', 189, 'admin', 1540176951, -1, NULL);
INSERT INTO `t_plan` VALUES (232, '2018-10-26外协返工计划', '15405369061865', 1540536906, '04', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18201810160096', '01', NULL, 'admin', 1540536906, -1, NULL);
INSERT INTO `t_plan` VALUES (233, '2018-10-31外协返工计划', '15409768924190', 1540976892, '04', NULL, '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18201810160094', '01', NULL, 'admin', 1540976892, 1, NULL);
INSERT INTO `t_plan` VALUES (234, 'test1', '15222099845510', 1542328519, '03', 1000, '4', 8000, 1.00, '1', '444555', 37636, NULL, 1542528519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (235, 'test2', '15222099845511', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (236, 'test3', '15222099845512', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (237, 'test4', '15222099845513', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (238, 'test3', '15222099845514', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (239, 'test3', '15222099845515', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (240, 'test3', '15222099845516', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (241, 'test3', '15222099845517', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (242, 'test3', '15222099845518', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (243, 'test3', '15222099845519', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (244, 'test3', '15222099845520', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1542528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `t_plan` VALUES (245, 'test3', '15222099845521', 1542028519, '03', 1000, '4', 7000, 1.00, '1', '444555', 37636, NULL, 1562528000, NULL, 't', NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for t_plan_add_material
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_add_material`;
CREATE TABLE `t_plan_add_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划编码',
  `add_material_num` int(11) NOT NULL COMMENT '加料数量',
  `state` int(11) NOT NULL COMMENT '1：正常   0：作废',
  `moddate` int(11) NULL DEFAULT NULL,
  `modman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_plan_add_material
-- ----------------------------
INSERT INTO `t_plan_add_material` VALUES (1, '15222099845521', 100, 1, 1547622580, 'admin');
INSERT INTO `t_plan_add_material` VALUES (2, '15222099845521', 200, 1, 1547624144, 'admin');
INSERT INTO `t_plan_add_material` VALUES (3, '15222099845521', 32, 1, 1547624539, 'admin');
INSERT INTO `t_plan_add_material` VALUES (4, '15222099845518', 500, 1, 1547625617, 'admin');
INSERT INTO `t_plan_add_material` VALUES (5, '15222069272270', 2500, 1, 1547625724, 'admin');
INSERT INTO `t_plan_add_material` VALUES (6, '15222099845518', 100, 0, 1547626270, 'admin');
INSERT INTO `t_plan_add_material` VALUES (7, '15222099845518', 100, 1, 1547626249, 'admin');
INSERT INTO `t_plan_add_material` VALUES (8, '15222099845518', 50, 1, 1547626282, 'admin');

-- ----------------------------
-- Table structure for t_plan_exec
-- ----------------------------
DROP TABLE IF EXISTS `t_plan_exec`;
CREATE TABLE `t_plan_exec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exec_qrcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划条码',
  `plan_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `exec_order` int(11) NULL DEFAULT NULL,
  `exec_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类型01生产执行，02，外协执行',
  `cust_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外协厂商id',
  `cust_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `art_id` int(11) NULL DEFAULT NULL COMMENT '工艺编号',
  `art_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工艺名称',
  `plate_weight` double NULL DEFAULT NULL COMMENT '托盘重量',
  `gross_weight` double NULL DEFAULT NULL COMMENT '毛重',
  `material_num` int(11) NULL DEFAULT NULL COMMENT '材料数量',
  `exec_date` int(11) NULL DEFAULT NULL COMMENT '计划日期',
  `stove_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pnote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `pstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  `finishdate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 320 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_plan_exec
-- ----------------------------
INSERT INTO `t_plan_exec` VALUES (316, '15470815094430', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 4000, 1547081509, NULL, '半成品', NULL, 'admin', 1547081509, NULL);
INSERT INTO `t_plan_exec` VALUES (315, '15470815098369', NULL, NULL, 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 40, 1547081509, NULL, '半成品', NULL, 'admin', 1547081509, NULL);
INSERT INTO `t_plan_exec` VALUES (314, '15470815098915', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 40, 1547081509, NULL, NULL, NULL, 'admin', 1547081509, NULL);
INSERT INTO `t_plan_exec` VALUES (313, '15468333025510', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 200, 1546833302, NULL, '半成品', NULL, 'admin', 1546833302, NULL);
INSERT INTO `t_plan_exec` VALUES (312, '15468333028601', NULL, NULL, 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 2, 1546833302, NULL, '半成品', NULL, 'admin', 1546833302, NULL);
INSERT INTO `t_plan_exec` VALUES (311, '15468333021109', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 2, 1546833302, NULL, NULL, NULL, 'admin', 1546833302, NULL);
INSERT INTO `t_plan_exec` VALUES (310, '15468283879130', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 300, 1546828387, NULL, '半成品', NULL, 'admin', 1546828387, NULL);
INSERT INTO `t_plan_exec` VALUES (309, '15468283879678', NULL, NULL, 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 3, 1546828387, NULL, '半成品', NULL, 'admin', 1546828387, NULL);
INSERT INTO `t_plan_exec` VALUES (308, '15468283878278', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 3, 1546828387, NULL, NULL, NULL, 'admin', 1546828387, NULL);
INSERT INTO `t_plan_exec` VALUES (307, '15468276635331', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 20, 1546827663, NULL, '半成品', NULL, 'admin', 1546827663, NULL);
INSERT INTO `t_plan_exec` VALUES (306, '15468276633886', NULL, NULL, 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 10, 1546827663, NULL, '半成品', NULL, 'admin', 1546827663, NULL);
INSERT INTO `t_plan_exec` VALUES (305, '15468276633139', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 10, 1546827663, NULL, NULL, NULL, 'admin', 1546827663, NULL);
INSERT INTO `t_plan_exec` VALUES (303, '15468238398483', '15222069272270', '锻造车间4月份计划', 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 20, 1546823839, NULL, 'Address: Los Angles', NULL, 'admin', 1546823839, NULL);
INSERT INTO `t_plan_exec` VALUES (304, '15468238393384', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 2000, 1546823839, NULL, '半成品', NULL, 'admin', 1546823839, NULL);
INSERT INTO `t_plan_exec` VALUES (302, '15468238399205', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 20, 1546823839, NULL, NULL, NULL, 'admin', 1546823839, NULL);
INSERT INTO `t_plan_exec` VALUES (292, '15465882957503', '15222069272270', '锻造车间4月份计划', 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 11, 1546588295, NULL, 'Address: Los Angles', NULL, 'admin', 1546588295, NULL);
INSERT INTO `t_plan_exec` VALUES (291, '15465882955051', '15222099845520', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 11, 1546588295, NULL, NULL, NULL, 'admin', 1546588295, NULL);
INSERT INTO `t_plan_exec` VALUES (290, '15465882888583', '15222099845520', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 11, 1546588288, NULL, NULL, NULL, 'admin', 1546588288, NULL);
INSERT INTO `t_plan_exec` VALUES (288, '15465852258549', '15222069272270', '锻造车间4月份计划', 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 50, 1546585225, NULL, 'Address: Los Angles', NULL, 'admin', 1546585225, NULL);
INSERT INTO `t_plan_exec` VALUES (289, '15465852251790', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 2500, 1546585225, NULL, '半成品', NULL, 'admin', 1546585225, NULL);
INSERT INTO `t_plan_exec` VALUES (287, '15465852256385', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 25, 1546585225, NULL, NULL, NULL, 'admin', 1546585225, NULL);
INSERT INTO `t_plan_exec` VALUES (285, '15465847032398', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 20000, 1546584703, NULL, '半成品', NULL, 'admin', 1546584703, NULL);
INSERT INTO `t_plan_exec` VALUES (286, '15465852216756', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 25, 1546585221, NULL, NULL, NULL, 'admin', 1546585221, NULL);
INSERT INTO `t_plan_exec` VALUES (284, '15465847037754', '15222069272270', '锻造车间4月份计划', 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 20, 1546584703, NULL, 'Address: Los Angles', NULL, 'admin', 1546584703, NULL);
INSERT INTO `t_plan_exec` VALUES (283, '15465847032379', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 200, 1546584703, NULL, NULL, NULL, 'admin', 1546584703, NULL);
INSERT INTO `t_plan_exec` VALUES (281, '15465846082847', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 3, 1546584608, NULL, NULL, NULL, 'admin', 1546584608, NULL);
INSERT INTO `t_plan_exec` VALUES (282, '15465846991172', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 200, 1546584699, NULL, NULL, NULL, 'admin', 1546584699, NULL);
INSERT INTO `t_plan_exec` VALUES (280, '15465845964482', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 3, 1546584596, NULL, NULL, NULL, 'admin', 1546584596, NULL);
INSERT INTO `t_plan_exec` VALUES (279, '15465845864542', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 3, 1546584586, NULL, NULL, NULL, 'admin', 1546584586, NULL);
INSERT INTO `t_plan_exec` VALUES (278, '15465845391448', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 100, 1546584539, NULL, '半成品', NULL, 'admin', 1546584539, NULL);
INSERT INTO `t_plan_exec` VALUES (276, '15465845397790', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 1, 1546584539, NULL, NULL, NULL, 'admin', 1546584539, NULL);
INSERT INTO `t_plan_exec` VALUES (277, '15465845396230', '15222069272270', '锻造车间4月份计划', 37650, 'A0038288', NULL, NULL, NULL, NULL, 43, 'A00287、288作业指导书', NULL, NULL, 1, 1546584539, NULL, 'Address: Los Angles', NULL, 'admin', 1546584539, NULL);
INSERT INTO `t_plan_exec` VALUES (273, '15465843868367', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 55, 1546584386, NULL, NULL, NULL, 'admin', 1546584386, NULL);
INSERT INTO `t_plan_exec` VALUES (274, '15465844678801', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 55, 1546584467, NULL, NULL, NULL, 'admin', 1546584467, NULL);
INSERT INTO `t_plan_exec` VALUES (275, '15465844835929', '15222099845521', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 55, 1546584483, NULL, NULL, NULL, 'admin', 1546584483, NULL);
INSERT INTO `t_plan_exec` VALUES (317, '15476176188898', '15222099845520', 'test3', 37636, 'A0048858', NULL, NULL, NULL, NULL, 13, 'A858.859作业指导书', NULL, NULL, 10, 1547617618, NULL, NULL, NULL, 'admin', 1547617618, NULL);
INSERT INTO `t_plan_exec` VALUES (318, '15476176181510', NULL, NULL, 37627, 'PA12359.01', NULL, NULL, NULL, NULL, 5, 'PA001作业指导书', NULL, NULL, 50, 1547617618, NULL, '半成品', NULL, 'admin', 1547617618, NULL);
INSERT INTO `t_plan_exec` VALUES (319, '15476176181012', NULL, NULL, 37628, 'PA12A109.00', NULL, NULL, NULL, NULL, 6, 'PA002作业指导书', NULL, NULL, 20, 1547617618, NULL, '半成品', NULL, 'admin', 1547617618, NULL);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编码',
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类',
  `en_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `pmodel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `pstyle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `art_id` int(11) NULL DEFAULT NULL COMMENT '工艺id',
  `unit_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名',
  `exchange_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '供应商',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '描述',
  `net_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '净重',
  `photo_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `gross_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '毛重',
  `art_provider` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工艺提供者',
  `main_customer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要供应商',
  `material` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custom_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '海关编码',
  `qr_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条码',
  `pnote` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `pstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Pstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '3代表已绑定车型',
  `company_id` int(11) NULL DEFAULT NULL,
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37685 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (37640, 'D1290001', 'A0027273', '1', '', 'Q/MDS-B-T-06-TRW-005', 'Φ32×69mm', 15, '001', NULL, 0.00, 0.00, 0.32, '', 0.44, '', NULL, 'C35', '', '', '', NULL, '1', NULL, 'yangkai', 1524548433);
INSERT INTO `t_product` VALUES (37639, 'D1030014', 'A0036878-中心距2mm', '1', '', 'Q/MDS-B-T-06-TRW-003', 'Φ32×88mm', 20, '001', NULL, 0.00, 0.00, 0.39, '', 0.56, '', NULL, '', '', '', '', NULL, '1', NULL, 'yangkai', 1524548257);
INSERT INTO `t_product` VALUES (37606, '3323', '控制臂', '1', '', 'M123', '1212', 3, '', NULL, 0.00, 0.00, 0.00, '', 0.00, '', NULL, NULL, '', '', '<p>test23<br/></p>', NULL, '1', NULL, NULL, 0);
INSERT INTO `t_product` VALUES (37641, 'D1290002', 'A0027274', '1', '', 'Q/MDS-B-T-06-TRW-006', 'Φ30×78mm', 15, '001', NULL, 0.00, 0.00, 0.32, '', 0.44, '', NULL, 'C35', '', '', '', NULL, '1', NULL, 'yangkai', 1524548455);
INSERT INTO `t_product` VALUES (37642, 'D1290003', 'A0027275', '1', '', 'Q/MDS-B-T-06-TRW-007', 'Φ32×69mm', 15, '001', NULL, 0.00, 0.00, 0.32, '', 0.44, '', NULL, 'C35', '', '', '', NULL, '1', NULL, 'yangkai', 1524548506);
INSERT INTO `t_product` VALUES (37636, 'D1290035', 'A0048858', '1', '', 'Q/MDS-B-T-06-TRW-001', 'Φ32×90mm', 13, '001', NULL, 0.00, 0.00, 0.41, '', 0.57, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548195);
INSERT INTO `t_product` VALUES (37637, 'D3290036', 'A0048859', '1', '', 'Q/MDS-B-T-06-TRW-002', 'Φ32×90mm', 13, '001', NULL, 0.00, 0.00, 0.41, '', 0.53, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548237);
INSERT INTO `t_product` VALUES (37638, 'D1030013', 'A0036877-中心距2mm', '1', '', 'Q/MDS-B-T-06-TRW-004', 'Φ32×88mm', 20, '001', NULL, 0.00, 0.00, 0.40, '', 0.56, '', NULL, 'C35R', '', '', '', NULL, '1', NULL, 'yangkai', 1524548302);
INSERT INTO `t_product` VALUES (37627, 'PA001', 'PA12359.01', '1', '', '', '', 5, '001', NULL, 0.00, 0.00, 0.49, '', 1.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520307848);
INSERT INTO `t_product` VALUES (37628, 'PA002', 'PA12A109.00', '1', '', '', '', 6, '001', NULL, 0.00, 0.00, 0.43, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520307837);
INSERT INTO `t_product` VALUES (37629, 'PA003', 'PA12276.00', '1', '', '', '', 7, '001', NULL, 0.00, 0.00, 0.57, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520307823);
INSERT INTO `t_product` VALUES (37630, 'PA004', 'PA12277.00', '1', '', '', '', 7, '001', NULL, 0.00, 0.00, 0.57, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520307812);
INSERT INTO `t_product` VALUES (37631, 'PA005', 'PA12373.01', '1', '', '', '', 8, '001', NULL, 0.00, 0.00, 0.50, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520307794);
INSERT INTO `t_product` VALUES (37632, 'PA006', 'PA12283.00', '1', '', '', '', 9, '001', NULL, 0.00, 0.00, 1.05, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520307775);
INSERT INTO `t_product` VALUES (37633, 'PA007', 'PA12284.00', '1', '', '', '', 9, '001', NULL, 0.00, 0.00, 1.05, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520317373);
INSERT INTO `t_product` VALUES (37634, 'PA008', 'PA12270.00', '1', '', '', '', 11, '001', NULL, 0.00, 0.00, 0.62, '', 0.00, '', NULL, '', '', '', '', NULL, '1', NULL, 'admin', 1520471791);
INSERT INTO `t_product` VALUES (37635, 'PA009', 'PA12271.00', '1', '', '', '', 11, '001', NULL, 0.00, 0.00, 0.62, '', 0.00, '', NULL, '', '', '', NULL, NULL, '1', NULL, 'admin', 1520487328);
INSERT INTO `t_product` VALUES (37643, 'D1290004', 'A0027276', '1', '', 'Q/MDS-B-T-06-TRW-008', 'Φ30×78mm', 15, '001', NULL, 0.00, 0.00, 0.32, '', 0.44, '', NULL, 'C35', '', '', '', NULL, '1', NULL, 'yangkai', 1524548467);
INSERT INTO `t_product` VALUES (37652, 'D1410012', '306720.2', '1', '', 'Q/MDS-B-T-06-SPA-10', 'Φ22x67mm', 30, '001', NULL, 0.00, 0.00, 0.11, '', 0.20, '', NULL, '16MnCr5', '', '', '', NULL, '0', NULL, 'lvchunai', 1524290060);
INSERT INTO `t_product` VALUES (37668, 'D1410002', '189131.4', '1', '', 'Q/MDS-B-T-06-SPA-02', 'Φ32x58mm', 44, '001', NULL, 0.00, 0.00, 0.23, '', 0.37, '', NULL, '', '', '', '', NULL, '0', NULL, 'yangkai', 1524616325);
INSERT INTO `t_product` VALUES (37669, 'D1410001', '192376.4', '1', '', 'Q/MDS-B-T-06-SPA-01', 'Φ35x77mm', 44, '001', NULL, 0.00, 0.00, 0.35, '', 0.58, '', NULL, '', '', '', NULL, NULL, '0', NULL, 'yangkai', 1524616302);
INSERT INTO `t_product` VALUES (37647, 'D1410015', '325835.0', '1', '', 'Q/MDS-B-T-06-SPA-13', 'Φ34×70mm', 29, '001', NULL, 0.00, 0.00, 0.33, '', 0.50, '', NULL, '16MnCr5', '', '', '', NULL, '0', NULL, 'lvchunai', 1524294216);
INSERT INTO `t_product` VALUES (37648, 'D1290024', 'A0038287', '1', '', 'Q/MDS-B-T-06-TRW-009', 'Φ36×85mm', 43, '001', NULL, 0.00, 0.00, 0.46, '', 0.68, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548621);
INSERT INTO `t_product` VALUES (37650, 'D1290023', 'A0038288', '1', '', 'Q/MDS-B-T-06-TRW-010', 'Φ36×85mm', 43, '001', NULL, 0.00, 0.00, 0.46, '', 0.68, '', NULL, 'C45', '', '', NULL, NULL, '1', NULL, 'yangkai', 1524548594);
INSERT INTO `t_product` VALUES (37651, 'D1410014', '800039.0', '1', '', 'Q/MDS-B-T-06-SPA-12', 'Φ34x64mm', 24, '001', NULL, 0.00, 0.00, 0.33, '', 0.46, '', NULL, '16MnCr5 ', '', '', '', NULL, '0', NULL, 'lvchunai', 1524293481);
INSERT INTO `t_product` VALUES (37653, 'D1410010', '192303.1', '1', '', 'Q/MDS-B-T-06-SPA-05', 'Φ35x 61mm', 31, '001', NULL, 0.00, 0.00, 0.30, '', 0.46, '', NULL, 'C45', '', '', NULL, NULL, '0', NULL, 'yangkai', 1524616610);
INSERT INTO `t_product` VALUES (37654, 'D1410009', '325842.0', '1', '', 'Q/MDS-B-T-06-SPA-07', 'Φ55x138mm', 32, '001', NULL, 0.00, 0.00, 1.97, '', 2.57, '', NULL, '42CrMo4', '', '', '', NULL, '0', NULL, 'yangkai', 1524616656);
INSERT INTO `t_product` VALUES (37655, 'D1410008', 'HMN4720552505', '1', '', 'Q/MDS-B-T-06-SPA-08', 'Φ55x130mm', 33, '001', NULL, 0.00, 0.00, 1.75, '', 2.42, '', NULL, 'C45', '', '', NULL, NULL, '0', NULL, 'yangkai', 1524616727);
INSERT INTO `t_product` VALUES (37656, 'D1410006', '325808.0', '1', '', 'Q/MDS-B-T-06-SPA-09', 'Φ22x96mm', 34, '001', NULL, 0.00, 0.00, 0.19, '', 0.29, '', NULL, '16MnCr5', '', '', NULL, NULL, '0', NULL, 'yangkai', 1524616759);
INSERT INTO `t_product` VALUES (37657, 'D3290029', 'A0047433', '1', '', 'Q/MDS-B-T-06-TRW-011', 'Φ30×127mm', 35, '001', NULL, 0.00, 0.00, 0.46, '', 0.70, '', NULL, 'C35', '', '', NULL, NULL, '1', NULL, 'yangkai', 1524548699);
INSERT INTO `t_product` VALUES (37658, 'D1410011', '325908.0', '1', '', 'Q/MDS-B-T-06-SPA-11', 'Φ22x180mm （一坯两件）', 36, '001', NULL, 0.00, 0.00, 0.15, '', 0.54, '', NULL, '16MnCr5', '', '', '', NULL, '1', NULL, 'yangkai', 1524616968);
INSERT INTO `t_product` VALUES (37659, 'D3290030', 'A0047434', '1', '', 'Q/MDS-B-T-06-TRW-012', 'Φ32×111mm', 35, '001', NULL, 0.00, 0.00, 0.46, '', 0.70, '', NULL, 'C35', '', '', NULL, NULL, '1', NULL, 'yangkai', 1524548732);
INSERT INTO `t_product` VALUES (37660, 'D1410013', '306721.3', '1', '', 'Q/MDS-B-T-06-SPA-06', 'Φ22x73mm', 37, '001', NULL, 0.00, 0.00, 0.15, '', 0.22, '', NULL, '16MnCr5', '', '', '', NULL, '0', NULL, 'yangkai', 1524616686);
INSERT INTO `t_product` VALUES (37661, 'D3290037', 'A0056455', '1', '', 'Q/MDS-B-T-06-TRW-013', 'Φ36×85mm', 39, '001', NULL, 0.00, 0.00, 0.48, '', 0.68, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548807);
INSERT INTO `t_product` VALUES (37662, 'D3290031', 'A0051045', '1', '', 'Q/MDS-B-T-06-TRW-014', 'Φ36×193mm', 40, '001', NULL, 0.00, 0.00, 1.17, '', 1.54, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548893);
INSERT INTO `t_product` VALUES (37663, 'D3290032', 'A0051046', '1', '', 'Q/MDS-B-T-06-TRW-015', 'Φ36×193mm', 40, '001', NULL, 0.00, 0.00, 1.17, '', 1.54, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548956);
INSERT INTO `t_product` VALUES (37664, 'D1030012', 'A0037984', '1', '', 'Q/MDS-B-T-06-TRW-016', 'Φ32×110mm/Φ30×125mm', 41, '001', NULL, 0.00, 0.00, 0.41, '', 0.69, '', NULL, 'C35', '', '', '', NULL, '1', NULL, 'yangkai', 1524548964);
INSERT INTO `t_product` VALUES (37665, 'D1030011', 'A0037985', '1', '', 'Q/MDS-B-T-06-TRW-017', 'Φ32×110mm/Φ30×125mm', 41, '001', NULL, 0.00, 0.00, 0.41, '', 0.69, '', NULL, 'C45', '', '', '', NULL, '1', NULL, 'yangkai', 1524548969);
INSERT INTO `t_product` VALUES (37666, 'D1290025', 'A0041460', '1', '', 'Q/MDS-B-T-06-TRW-018', 'Φ35×58mm', 42, '001', NULL, 0.00, 0.00, 0.33, '', 0.44, '', NULL, '30MnVS6', '', '', '', NULL, '1', NULL, 'yangkai', 1524548986);
INSERT INTO `t_product` VALUES (37667, 'D1290026', 'A0041461', '1', '', 'Q/MDS-B-T-06-TRW-019', 'Φ35×58mm', 42, '001', NULL, 0.00, 0.00, 0.33, '', 0.44, '', NULL, '30MnVS6', '', '', NULL, NULL, '1', NULL, 'yangkai', 1524548999);
INSERT INTO `t_product` VALUES (37670, 'D1410003', '192478.2', '1', '', 'Q/MDS-B-T-06-SPA-03', 'Φ18x160mm/Φ18x160mm（一坯两件）/Φ18x239mm（程控锤 一坯三件）', 45, '001', NULL, 0.00, 0.00, 0.10, '', 0.32, '', NULL, '', '', '', '', NULL, '0', NULL, 'yangkai', 1524616356);
INSERT INTO `t_product` VALUES (37671, 'D1410005', '192568.3', '1', '', 'Q/MDS-B-T-06-SPA-04', 'Φ30x35mm/Φ22x122mm（一坯两件）', 45, '001', NULL, 0.00, 0.00, 0.09, '', 0.19, '', NULL, '', '', '', '', NULL, '0', NULL, 'yangkai', 1524616397);
INSERT INTO `t_product` VALUES (37672, 'D1290007', 'HOY211A', '1', '', 'Q/MDS-B-T-06-THK-03', 'Φ30x106mm', 47, '001', NULL, 0.00, 0.00, 0.45, '', 0.59, '', NULL, 'S45C', '', '', '', NULL, '1', NULL, 'lvchunai', 1524625907);
INSERT INTO `t_product` VALUES (37673, 'D1290008', 'HOY212A', '1', '', 'Q/MDS-B-T-06-THK-04', 'Φ30x106mm', 47, '001', NULL, 0.00, 0.00, 0.45, '', 0.59, '', NULL, 'S45C', '', '', NULL, NULL, '1', NULL, 'lvchunai', 1524626023);
INSERT INTO `t_product` VALUES (37674, 'D1290005', 'HOY194A', '1', '', '', 'Φ30x83mm', 47, '001', NULL, 0.00, 0.00, 0.33, '', 0.46, '', NULL, 'S45C', '', '', NULL, NULL, '1', NULL, 'lvchunai', 1524633046);
INSERT INTO `t_product` VALUES (37675, 'D1290006', 'HOY195A', '1', '', '', 'Φ30x83mm', 47, '001', NULL, 0.00, 0.00, 0.33, '', 0.46, '', NULL, 'S45C', '', '', NULL, NULL, '1', NULL, 'lvchunai', 1524633162);
INSERT INTO `t_product` VALUES (37676, 'D1290010', 'HOY219A', '1', NULL, 'Q/MDS-B-T-06-THK-05', 'Φ30x100mm', 44, '001', NULL, 0.00, 0.00, 0.41, '', 0.55, NULL, NULL, 'S45C', NULL, NULL, '', NULL, '0', NULL, 'admin', 1537858969);
INSERT INTO `t_product` VALUES (37677, 'D1290009', 'HOY220A', '1', '', 'Q/MDS-B-T-06-THK-06', 'Φ30x100mm', 47, '001', NULL, 0.00, 0.00, 0.41, '', 0.55, '', NULL, 'S45C', '', '', NULL, NULL, '0', NULL, 'lvchunai', 1524634818);
INSERT INTO `t_product` VALUES (37679, 'D1290014', 'HOY141A', '1', '', 'Q/MDS-B-T-06-THK-07', 'Φ35x104mm', 47, '001', NULL, 0.00, 0.00, 0.59, NULL, 0.79, '', NULL, 'S45C', '', '', NULL, NULL, '0', NULL, 'lvchunai', 1524636294);
INSERT INTO `t_product` VALUES (37680, 'D1290013', 'HOY142A', '1', '', 'Q/MDS-B-T-06-THK-08', 'Φ35x104mm', 47, '001', NULL, 0.00, 0.00, 0.59, NULL, 0.79, '', NULL, 'S45C', '', '', NULL, NULL, '0', NULL, 'lvchunai', 1524636381);
INSERT INTO `t_product` VALUES (37681, ' D1290031', 'HOY198A', '1', '', 'Q/MDS-B-T-06-THK-21', 'Φ30x90mm', 47, '001', NULL, 0.00, 0.00, 0.36, NULL, 0.50, '', NULL, 'S45C', '', '', NULL, NULL, '1', NULL, 'lvchunai', 1524637322);
INSERT INTO `t_product` VALUES (37682, 'D1290032', 'HOY199A', '1', '', 'Q/MDS-B-T-06-THK-22', 'Φ32x80mm', 47, '001', NULL, 0.00, 0.00, 0.36, NULL, 0.50, '', NULL, 'S45C', '', '', NULL, NULL, '1', NULL, 'lvchunai', 1524637484);
INSERT INTO `t_product` VALUES (37683, 'C0001', '测试产品', '1', 'ceshichanpin', 'we77611', 'BC22214', 30, '001', NULL, 99.00, 9.00, 12.00, NULL, 15.00, '提供者1', NULL, '精钢1', NULL, NULL, '<p>测试产品<br/></p>', NULL, '0', NULL, 'admin', 1541140935);
INSERT INTO `t_product` VALUES (37684, '炸酱面', '201809300210', '24', NULL, NULL, NULL, 31, '002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '112', NULL, NULL, NULL, NULL, '0', NULL, 'admin', 1541142661);

-- ----------------------------
-- Table structure for t_repair_alert_type
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_alert_type`;
CREATE TABLE `t_repair_alert_type`  (
  `atd_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据字典类别',
  `alert_typedet` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '明细分类名',
  `modman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`atd_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_alert_type
-- ----------------------------
INSERT INTO `t_repair_alert_type` VALUES (1, '01', '震动', 'admin', 1545791503);
INSERT INTO `t_repair_alert_type` VALUES (2, '01', '异响', 'admin', 1545789911);
INSERT INTO `t_repair_alert_type` VALUES (3, '01', '断电', 'admin', 1547168155);

-- ----------------------------
-- Table structure for t_repair_contact
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_contact`;
CREATE TABLE `t_repair_contact`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alert_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修类型',
  `alert_typedet` int(11) NULL DEFAULT 0,
  `depart` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责车间',
  `section` int(11) NULL DEFAULT 0 COMMENT '区域',
  `contact_type` int(11) NULL DEFAULT NULL COMMENT '0:短信  1：短信+电话',
  `device` int(11) NULL DEFAULT 0 COMMENT '设备',
  `user2_id` int(11) NULL DEFAULT NULL COMMENT '人员id取自user2表',
  `work_date` int(11) NULL DEFAULT NULL COMMENT '日期',
  `start_work` time(0) NULL DEFAULT NULL COMMENT '值班开始时间',
  `end_work` time(0) NULL DEFAULT NULL COMMENT '值班结束时间',
  `moddate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `modman` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_contact
-- ----------------------------
INSERT INTO `t_repair_contact` VALUES (1, '01', 0, '4', 201, NULL, 0, 18, NULL, '08:00:22', '14:00:00', '1542935105', 'admin');
INSERT INTO `t_repair_contact` VALUES (2, '01', 0, '4', 2, NULL, 0, 18, 1547308800, '08:00:00', '19:00:00', '1547176398', 'admin');
INSERT INTO `t_repair_contact` VALUES (16, '02', 0, '6', 1, NULL, 0, 18, NULL, '20:00:00', '22:00:00', '1542851920', 'admin');
INSERT INTO `t_repair_contact` VALUES (7, '02', 0, '6', 1, NULL, 0, 18, NULL, '17:00:00', '20:00:00', '1542705413', 'admin');
INSERT INTO `t_repair_contact` VALUES (8, '03', 0, '4', 2, NULL, 0, 18, NULL, '08:00:00', '12:00:00', '1542705413', 'admin');
INSERT INTO `t_repair_contact` VALUES (11, '01', 0, '4', 1, NULL, 0, 18, 1547136000, '09:00:00', '18:00:00', '1547176364', 'admin');
INSERT INTO `t_repair_contact` VALUES (12, '01', 0, '5', 1, NULL, 0, 18, NULL, '08:00:00', '21:00:00', '1542705413', 'admin');
INSERT INTO `t_repair_contact` VALUES (14, '01', 0, '13', 2, NULL, 0, 18, NULL, '21:00:00', '05:00:00', '1542705413', 'admin');
INSERT INTO `t_repair_contact` VALUES (15, '01', 0, '13', 1, NULL, 0, 18, NULL, '14:00:00', '16:00:00', '1542705413', 'admin');
INSERT INTO `t_repair_contact` VALUES (18, '01', 0, '13', 2, NULL, 0, 18, NULL, '08:00:00', '17:00:00', '1542852554', 'admin');
INSERT INTO `t_repair_contact` VALUES (20, '01', 0, '13', 1, NULL, 0, 18, 1547222400, '08:00:00', '19:00:00', '1547176170', 'admin');
INSERT INTO `t_repair_contact` VALUES (21, '01', NULL, '5', NULL, NULL, NULL, 18, 2476800, '21:00:00', '00:00:00', '1547704078', 'admin');
INSERT INTO `t_repair_contact` VALUES (24, '01', 1, '6', 9, 0, 20, 68, 1547654400, '13:48:24', '13:50:24', '1547704115', 'admin');
INSERT INTO `t_repair_contact` VALUES (23, '02', 0, '4', 2, 1, 6, 69, 1547481600, '10:09:09', '10:09:11', '1547518154', 'admin');
INSERT INTO `t_repair_contact` VALUES (25, '01', 1, '6', 9, 0, 20, 68, 1547740800, '13:48:24', '13:50:24', '1547704115', 'admin');
INSERT INTO `t_repair_contact` VALUES (26, '01', 1, '6', 9, 0, 20, 68, 1547827200, '13:48:24', '13:50:24', '1547704115', 'admin');
INSERT INTO `t_repair_contact` VALUES (27, '01', 1, '6', 9, 0, 20, 68, 1548864000, '13:48:24', '13:50:24', '1547704130', 'admin');

-- ----------------------------
-- Table structure for t_repair_history
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_history`;
CREATE TABLE `t_repair_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修单号',
  `repairman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修人',
  `billstate` int(11) NULL DEFAULT NULL COMMENT '单据状态，主要用于记录发送通知时单据的状态',
  `pstate` int(11) NULL DEFAULT NULL COMMENT '状态0未发送，3已发送',
  `func_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板编号',
  `vstate` int(11) NULL DEFAULT NULL COMMENT '语音状态0未发送，3已发送',
  `CallId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回执单号',
  `moddate` int(11) NULL DEFAULT NULL COMMENT '修改日期',
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` int(11) NULL DEFAULT NULL,
  `createman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_history
-- ----------------------------
INSERT INTO `t_repair_history` VALUES (1, '19201811160033', 'df', NULL, 3, 'AndonAlert', NULL, NULL, NULL, NULL, NULL, 'df');
INSERT INTO `t_repair_history` VALUES (2, '19201811160033', 'dd', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'df');
INSERT INTO `t_repair_history` VALUES (3, '19201811160033', 'test', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'df');
INSERT INTO `t_repair_history` VALUES (4, '19201812120017', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581142, 'df', 1544581142, 'df');
INSERT INTO `t_repair_history` VALUES (5, '19201812120017', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581142, 'df', 1544581142, 'df');
INSERT INTO `t_repair_history` VALUES (6, '19201812120017', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581142, 'df', 1544581142, 'df');
INSERT INTO `t_repair_history` VALUES (7, '19201812120017', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581142, 'df', 1544581142, 'df');
INSERT INTO `t_repair_history` VALUES (8, '19201812120017', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581142, 'df', 1544581142, 'df');
INSERT INTO `t_repair_history` VALUES (9, '19201812120018', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581361, 'df', 1544581361, 'df');
INSERT INTO `t_repair_history` VALUES (10, '19201812120019', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581403, 'df', 1544581403, 'df');
INSERT INTO `t_repair_history` VALUES (11, '19201812120020', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581438, 'df', 1544581438, 'df');
INSERT INTO `t_repair_history` VALUES (12, '19201812120021', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581455, 'df', 1544581455, 'df');
INSERT INTO `t_repair_history` VALUES (13, '19201812120022', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581476, 'df', 1544581476, 'df');
INSERT INTO `t_repair_history` VALUES (14, '19201812120023', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581491, 'df', 1544581491, 'df');
INSERT INTO `t_repair_history` VALUES (15, '19201812120024', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581513, 'df', 1544581513, 'df');
INSERT INTO `t_repair_history` VALUES (16, '19201812120025', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581536, 'df', 1544581536, 'df');
INSERT INTO `t_repair_history` VALUES (17, '19201812120026', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581562, 'df', 1544581562, 'df');
INSERT INTO `t_repair_history` VALUES (18, '19201812120027', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581581, 'df', 1544581581, 'df');
INSERT INTO `t_repair_history` VALUES (19, '19201812120028', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581663, 'df', 1544581663, 'df');
INSERT INTO `t_repair_history` VALUES (20, '19201812120029', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581688, 'df', 1544581688, 'df');
INSERT INTO `t_repair_history` VALUES (21, '19201812120030', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581705, 'df', 1544581705, 'df');
INSERT INTO `t_repair_history` VALUES (22, '19201812120031', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581735, 'df', 1544581735, 'df');
INSERT INTO `t_repair_history` VALUES (23, '19201812120032', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581909, 'df', 1544581909, 'df');
INSERT INTO `t_repair_history` VALUES (24, '19201812120033', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544581941, 'df', 1544581941, 'df');
INSERT INTO `t_repair_history` VALUES (25, '19201812120034', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544586840, 'df', 1544586840, 'df');
INSERT INTO `t_repair_history` VALUES (26, '19201812120034', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544586840, 'df', 1544586840, 'df');
INSERT INTO `t_repair_history` VALUES (27, '19201812120034', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544586840, 'df', 1544586840, 'df');
INSERT INTO `t_repair_history` VALUES (28, '19201812120034', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544586840, 'df', 1544586840, 'df');
INSERT INTO `t_repair_history` VALUES (29, '19201812120035', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587190, 'df', 1544587190, 'df');
INSERT INTO `t_repair_history` VALUES (30, '19201812120035', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587190, 'df', 1544587190, 'df');
INSERT INTO `t_repair_history` VALUES (31, '19201812120035', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587190, 'df', 1544587190, 'df');
INSERT INTO `t_repair_history` VALUES (32, '19201812120035', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587190, 'df', 1544587190, 'df');
INSERT INTO `t_repair_history` VALUES (33, '19201812120036', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587233, 'df', 1544587233, 'df');
INSERT INTO `t_repair_history` VALUES (34, '19201812120036', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587233, 'df', 1544587233, 'df');
INSERT INTO `t_repair_history` VALUES (35, '19201812120036', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587233, 'df', 1544587233, 'df');
INSERT INTO `t_repair_history` VALUES (36, '19201812120036', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587233, 'df', 1544587233, 'df');
INSERT INTO `t_repair_history` VALUES (37, '19201812120037', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587250, 'df', 1544587250, 'df');
INSERT INTO `t_repair_history` VALUES (38, '19201812120038', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587309, 'df', 1544587309, 'df');
INSERT INTO `t_repair_history` VALUES (39, '19201812120038', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587309, 'df', 1544587309, 'df');
INSERT INTO `t_repair_history` VALUES (40, '19201812120038', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587310, 'df', 1544587310, 'df');
INSERT INTO `t_repair_history` VALUES (41, '19201812120038', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544587310, 'df', 1544587310, 'df');
INSERT INTO `t_repair_history` VALUES (42, '19201812120039', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592049, 'df', 1544592049, 'df');
INSERT INTO `t_repair_history` VALUES (43, '19201812120039', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592049, 'df', 1544592049, 'df');
INSERT INTO `t_repair_history` VALUES (44, '19201812120039', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592049, 'df', 1544592049, 'df');
INSERT INTO `t_repair_history` VALUES (45, '19201812120039', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592049, 'df', 1544592049, 'df');
INSERT INTO `t_repair_history` VALUES (46, '19201812120040', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592102, 'df', 1544592102, 'df');
INSERT INTO `t_repair_history` VALUES (47, '19201812120041', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592339, 'df', 1544592339, 'df');
INSERT INTO `t_repair_history` VALUES (48, '19201812120041', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592339, 'df', 1544592339, 'df');
INSERT INTO `t_repair_history` VALUES (49, '19201812120041', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592339, 'df', 1544592339, 'df');
INSERT INTO `t_repair_history` VALUES (50, '19201812120041', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592339, 'df', 1544592339, 'df');
INSERT INTO `t_repair_history` VALUES (51, '19201812120042', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592415, 'df', 1544592415, 'df');
INSERT INTO `t_repair_history` VALUES (52, '19201812120042', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592415, 'df', 1544592415, 'df');
INSERT INTO `t_repair_history` VALUES (53, '19201812120042', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592415, 'df', 1544592415, 'df');
INSERT INTO `t_repair_history` VALUES (54, '19201812120042', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592415, 'df', 1544592415, 'df');
INSERT INTO `t_repair_history` VALUES (55, '19201812120043', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592735, 'df', 1544592735, 'df');
INSERT INTO `t_repair_history` VALUES (56, '19201812120043', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592735, 'df', 1544592735, 'df');
INSERT INTO `t_repair_history` VALUES (57, '19201812120043', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592735, 'df', 1544592735, 'df');
INSERT INTO `t_repair_history` VALUES (58, '19201812120043', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592735, 'df', 1544592735, 'df');
INSERT INTO `t_repair_history` VALUES (59, '19201812120044', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544592770, 'df', 1544592770, 'df');
INSERT INTO `t_repair_history` VALUES (60, '19201812120044', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592770, 'df', 1544592770, 'df');
INSERT INTO `t_repair_history` VALUES (61, '19201812120044', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592770, 'df', 1544592770, 'df');
INSERT INTO `t_repair_history` VALUES (62, '19201812120044', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592770, 'df', 1544592770, 'df');
INSERT INTO `t_repair_history` VALUES (63, '19201812120045', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544592788, 'df', 1544592788, 'df');
INSERT INTO `t_repair_history` VALUES (64, '19201812120045', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592788, 'df', 1544592788, 'df');
INSERT INTO `t_repair_history` VALUES (65, '19201812120045', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592788, 'df', 1544592788, 'df');
INSERT INTO `t_repair_history` VALUES (66, '19201812120045', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592788, 'df', 1544592788, 'df');
INSERT INTO `t_repair_history` VALUES (67, '19201812120046', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544592816, 'df', 1544592816, 'df');
INSERT INTO `t_repair_history` VALUES (68, '19201812120046', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592816, 'df', 1544592816, 'df');
INSERT INTO `t_repair_history` VALUES (69, '19201812120046', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592816, 'df', 1544592816, 'df');
INSERT INTO `t_repair_history` VALUES (70, '19201812120046', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544592816, 'df', 1544592816, 'df');
INSERT INTO `t_repair_history` VALUES (71, '19201812120047', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544593116, 'df', 1544593116, 'df');
INSERT INTO `t_repair_history` VALUES (72, '19201812120047', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544593116, 'df', 1544593116, 'df');
INSERT INTO `t_repair_history` VALUES (73, '19201812120047', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544593116, 'df', 1544593116, 'df');
INSERT INTO `t_repair_history` VALUES (74, '19201812120047', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544593117, 'df', 1544593117, 'df');
INSERT INTO `t_repair_history` VALUES (75, '19201812120048', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544594915, 'df', 1544594915, 'df');
INSERT INTO `t_repair_history` VALUES (76, '19201812120048', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544594915, 'df', 1544594915, 'df');
INSERT INTO `t_repair_history` VALUES (77, '19201812120048', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544594915, 'df', 1544594915, 'df');
INSERT INTO `t_repair_history` VALUES (78, '19201812120048', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544594915, 'df', 1544594915, 'df');
INSERT INTO `t_repair_history` VALUES (79, '19201812120049', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544596478, 'df', 1544596478, 'df');
INSERT INTO `t_repair_history` VALUES (80, '19201812120049', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544596478, 'df', 1544596478, 'df');
INSERT INTO `t_repair_history` VALUES (81, '19201812120049', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544596478, 'df', 1544596478, 'df');
INSERT INTO `t_repair_history` VALUES (82, '19201812120049', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544596478, 'df', 1544596478, 'df');
INSERT INTO `t_repair_history` VALUES (83, '19201812120050', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544596861, 'df', 1544596861, 'df');
INSERT INTO `t_repair_history` VALUES (84, '19201812120050', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544596861, 'df', 1544596861, 'df');
INSERT INTO `t_repair_history` VALUES (85, '19201812120050', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544596861, 'df', 1544596861, 'df');
INSERT INTO `t_repair_history` VALUES (86, '19201812120050', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544596861, 'df', 1544596861, 'df');
INSERT INTO `t_repair_history` VALUES (87, '19201812120051', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544597115, 'df', 1544597115, 'df');
INSERT INTO `t_repair_history` VALUES (88, '19201812120051', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597115, 'df', 1544597115, 'df');
INSERT INTO `t_repair_history` VALUES (89, '19201812120051', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597115, 'df', 1544597115, 'df');
INSERT INTO `t_repair_history` VALUES (90, '19201812120051', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597115, 'df', 1544597115, 'df');
INSERT INTO `t_repair_history` VALUES (91, '19201812120052', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544597179, 'df', 1544597179, 'df');
INSERT INTO `t_repair_history` VALUES (92, '19201812120052', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597179, 'df', 1544597179, 'df');
INSERT INTO `t_repair_history` VALUES (93, '19201812120052', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597179, 'df', 1544597179, 'df');
INSERT INTO `t_repair_history` VALUES (94, '19201812120052', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597179, 'df', 1544597179, 'df');
INSERT INTO `t_repair_history` VALUES (95, '19201812120053', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544597499, 'df', 1544597499, 'df');
INSERT INTO `t_repair_history` VALUES (96, '19201812120053', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597499, 'df', 1544597499, 'df');
INSERT INTO `t_repair_history` VALUES (97, '19201812120053', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597499, 'df', 1544597499, 'df');
INSERT INTO `t_repair_history` VALUES (98, '19201812120053', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597499, 'df', 1544597499, 'df');
INSERT INTO `t_repair_history` VALUES (99, '19201812120054', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544597960, 'df', 1544597960, 'df');
INSERT INTO `t_repair_history` VALUES (100, '19201812120054', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597960, 'df', 1544597960, 'df');
INSERT INTO `t_repair_history` VALUES (101, '19201812120054', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597960, 'df', 1544597960, 'df');
INSERT INTO `t_repair_history` VALUES (102, '19201812120054', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544597960, 'df', 1544597960, 'df');
INSERT INTO `t_repair_history` VALUES (103, '19201812120055', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544598157, 'df', 1544598157, 'df');
INSERT INTO `t_repair_history` VALUES (104, '19201812120055', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544598157, 'df', 1544598157, 'df');
INSERT INTO `t_repair_history` VALUES (105, '19201812120055', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544598157, 'df', 1544598157, 'df');
INSERT INTO `t_repair_history` VALUES (106, '19201812120055', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544598157, 'df', 1544598157, 'df');
INSERT INTO `t_repair_history` VALUES (107, '19201812120056', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544598252, 'df', 1544598252, 'df');
INSERT INTO `t_repair_history` VALUES (108, '19201812120056', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544598252, 'df', 1544598252, 'df');
INSERT INTO `t_repair_history` VALUES (109, '19201812120056', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544598252, 'df', 1544598252, 'df');
INSERT INTO `t_repair_history` VALUES (110, '19201812120056', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544598252, 'df', 1544598252, 'df');
INSERT INTO `t_repair_history` VALUES (111, '19201812130001', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544667351, 'df', 1544667351, 'df');
INSERT INTO `t_repair_history` VALUES (112, '19201812130001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544667351, 'df', 1544667351, 'df');
INSERT INTO `t_repair_history` VALUES (113, '19201812130001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544667351, 'df', 1544667351, 'df');
INSERT INTO `t_repair_history` VALUES (114, '19201812130001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544667351, 'df', 1544667351, 'df');
INSERT INTO `t_repair_history` VALUES (115, '19201812130002', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544669808, 'df', 1544669808, 'df');
INSERT INTO `t_repair_history` VALUES (116, '19201812130002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544669808, 'df', 1544669808, 'df');
INSERT INTO `t_repair_history` VALUES (117, '19201812130002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544669808, 'df', 1544669808, 'df');
INSERT INTO `t_repair_history` VALUES (118, '19201812130002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544669808, 'df', 1544669808, 'df');
INSERT INTO `t_repair_history` VALUES (119, '19201812130003', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544670174, 'df', 1544670174, 'df');
INSERT INTO `t_repair_history` VALUES (120, '19201812130003', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544670174, 'df', 1544670174, 'df');
INSERT INTO `t_repair_history` VALUES (121, '19201812130003', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544670174, 'df', 1544670174, 'df');
INSERT INTO `t_repair_history` VALUES (122, '19201812130003', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544670174, 'df', 1544670174, 'df');
INSERT INTO `t_repair_history` VALUES (123, '19201812140001', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544773166, 'df', 1544773166, 'df');
INSERT INTO `t_repair_history` VALUES (124, '19201812140001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544773166, 'df', 1544773166, 'df');
INSERT INTO `t_repair_history` VALUES (125, '19201812140001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544773166, 'df', 1544773166, 'df');
INSERT INTO `t_repair_history` VALUES (126, '19201812140001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544773166, 'df', 1544773166, 'df');
INSERT INTO `t_repair_history` VALUES (127, '19201812140002', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1544774135, 'df', 1544774135, 'df');
INSERT INTO `t_repair_history` VALUES (128, '19201812140002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544774135, 'df', 1544774135, 'df');
INSERT INTO `t_repair_history` VALUES (129, '19201812140002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544774135, 'df', 1544774135, 'df');
INSERT INTO `t_repair_history` VALUES (130, '19201812140002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1544774135, 'df', 1544774135, 'df');
INSERT INTO `t_repair_history` VALUES (131, '19201812190001', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1545180274, 'df', 1545180274, 'df');
INSERT INTO `t_repair_history` VALUES (132, '19201812190001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545180274, 'df', 1545180274, 'df');
INSERT INTO `t_repair_history` VALUES (133, '19201812190001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545180274, 'df', 1545180274, 'df');
INSERT INTO `t_repair_history` VALUES (134, '19201812190001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545180274, 'df', 1545180274, 'df');
INSERT INTO `t_repair_history` VALUES (135, '19201812190002', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1545208317, 'df', 1545208317, 'df');
INSERT INTO `t_repair_history` VALUES (136, '19201812190002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545208317, 'df', 1545208317, 'df');
INSERT INTO `t_repair_history` VALUES (137, '19201812190002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545208317, 'df', 1545208317, 'df');
INSERT INTO `t_repair_history` VALUES (138, '19201812190002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545208317, 'df', 1545208317, 'df');
INSERT INTO `t_repair_history` VALUES (139, '19201812190003', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1545208415, 'df', 1545208415, 'df');
INSERT INTO `t_repair_history` VALUES (140, '19201812190003', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545208415, 'df', 1545208415, 'df');
INSERT INTO `t_repair_history` VALUES (141, '19201812190003', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545208415, 'df', 1545208415, 'df');
INSERT INTO `t_repair_history` VALUES (142, '19201812190003', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545208415, 'df', 1545208415, 'df');
INSERT INTO `t_repair_history` VALUES (143, '19201812200001', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1545277534, 'df', 1545277534, 'df');
INSERT INTO `t_repair_history` VALUES (144, '19201812200001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545277534, 'df', 1545277534, 'df');
INSERT INTO `t_repair_history` VALUES (145, '19201812200001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545277534, 'df', 1545277534, 'df');
INSERT INTO `t_repair_history` VALUES (146, '19201812200001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545277534, 'df', 1545277534, 'df');
INSERT INTO `t_repair_history` VALUES (147, '19201812250001', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1545706494, 'df', 1545706494, 'df');
INSERT INTO `t_repair_history` VALUES (148, '19201812250001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545706494, 'df', 1545706494, 'df');
INSERT INTO `t_repair_history` VALUES (149, '19201812250001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545706494, 'df', 1545706494, 'df');
INSERT INTO `t_repair_history` VALUES (150, '19201812250001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545706494, 'df', 1545706494, 'df');
INSERT INTO `t_repair_history` VALUES (151, '19201812250002', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1545706615, 'df', 1545706615, 'df');
INSERT INTO `t_repair_history` VALUES (152, '19201812250002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545706615, 'df', 1545706615, 'df');
INSERT INTO `t_repair_history` VALUES (153, '19201812250002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545706615, 'df', 1545706615, 'df');
INSERT INTO `t_repair_history` VALUES (154, '19201812250002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1545706615, 'df', 1545706615, 'df');
INSERT INTO `t_repair_history` VALUES (155, '19201812290016', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1546074714, 'df', 1546074714, 'df');
INSERT INTO `t_repair_history` VALUES (156, '19201901020007', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1546397070, 'df', 1546397070, 'df');
INSERT INTO `t_repair_history` VALUES (157, '19201901080001', 'df', NULL, 0, 'AndonAlert', NULL, NULL, 1546910324, 'df', 1546910324, 'df');
INSERT INTO `t_repair_history` VALUES (158, '19201901080002', 'df', NULL, 0, 'AndonAlert', NULL, NULL, 1546910424, 'df', 1546910424, 'df');
INSERT INTO `t_repair_history` VALUES (159, '19201901080002', 'test', NULL, 0, 'AndonAlert', NULL, NULL, 1546910424, 'df', 1546910424, 'df');
INSERT INTO `t_repair_history` VALUES (160, '19201901080003', 'df', NULL, 0, 'AndonAlert', NULL, NULL, 1546913390, 'df', 1546913390, 'df');
INSERT INTO `t_repair_history` VALUES (161, '19201901080003', 'test', NULL, 0, 'AndonAlert', NULL, NULL, 1546913390, 'df', 1546913390, 'df');
INSERT INTO `t_repair_history` VALUES (162, '19201901080004', 'df', NULL, 0, 'AndonAlert', NULL, NULL, 1546913422, 'df', 1546913422, 'df');
INSERT INTO `t_repair_history` VALUES (163, '19201901080004', 'test', NULL, 0, 'AndonAlert', NULL, NULL, 1546913422, 'df', 1546913422, 'df');
INSERT INTO `t_repair_history` VALUES (164, '19201901080005', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1546914386, 'df', 1546914386, 'df');
INSERT INTO `t_repair_history` VALUES (165, '19201901080005', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1546914386, 'df', 1546914386, 'df');
INSERT INTO `t_repair_history` VALUES (166, '19201901080007', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1546914700, 'df', 1546914700, 'df');
INSERT INTO `t_repair_history` VALUES (167, '19201901080007', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1546914700, 'df', 1546914700, 'df');
INSERT INTO `t_repair_history` VALUES (168, '19201901090001', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1547000708, 'df', 1547000708, 'df');
INSERT INTO `t_repair_history` VALUES (169, '19201901090001', 'test', NULL, 3, 'AndonAlert', 3, '115387312600^102191832600', 1547000708, 'df', 1547000708, 'df');
INSERT INTO `t_repair_history` VALUES (170, '19201901090002', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1547005690, 'df', 1547005690, 'df');
INSERT INTO `t_repair_history` VALUES (171, '19201901090002', 'test', NULL, 3, 'AndonAlert', NULL, NULL, 1547005690, 'df', 1547005690, 'df');
INSERT INTO `t_repair_history` VALUES (172, '19201901110010', 'df', NULL, 3, 'AndonAlert', NULL, NULL, 1547185991, 'df', 1547185991, 'df');

-- ----------------------------
-- Table structure for t_repair_item
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_item`;
CREATE TABLE `t_repair_item`  (
  `R_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修单号',
  `sect_code` int(11) NULL DEFAULT NULL COMMENT '维修编号',
  `device_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修名称',
  `Item_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题类型',
  `item_typedet` int(11) NULL DEFAULT NULL COMMENT '明细分类',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '所属车间',
  `rep_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `rep_contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维修联系人',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdescription` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `pstate` int(11) NULL DEFAULT NULL COMMENT '0提交状态、1维修人签到状态，4用户已评价',
  `moddate` int(11) NULL DEFAULT NULL,
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` int(11) NULL DEFAULT NULL COMMENT '创建日期',
  `createman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `check_lat` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度',
  `check_lng` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度',
  `check_device` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到设备编号',
  `check_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到描述',
  `check_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到图片',
  `checkdate` int(11) NULL DEFAULT NULL COMMENT '签到时间',
  `checkman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到人',
  `review_star` int(10) NULL DEFAULT NULL COMMENT '评价星级',
  `review_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评价内容',
  `reviewdate` int(11) NULL DEFAULT NULL COMMENT '评价时间',
  `reviewman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_settle` int(5) NULL DEFAULT NULL COMMENT '是否解决评价人用',
  `settle_state` int(11) NULL DEFAULT 0 COMMENT '处理状态(维修人用）默认0,1签到，3已处理',
  `pendingstate` int(11) NULL DEFAULT NULL COMMENT '搁置状态0默认，1搁置',
  `howlong` int(11) NULL DEFAULT NULL COMMENT '搁置时长',
  `pendnote` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '搁置备注',
  `pendman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搁置人',
  `penddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`R_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_item
-- ----------------------------
INSERT INTO `t_repair_item` VALUES (1, '19201811160006', 1, 'df', NULL, 1, 1, '18605327981', 'df', NULL, NULL, 0, 1542349117, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (2, '19201812130002', 1, '33333', NULL, 666, 3, '18605327988', 'df', NULL, NULL, -1, 1543999045, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (3, '19201812130001', 1, 'yyyyyy', NULL, 1, 2, '3333333333', 'df', NULL, NULL, -1, 1543910140, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, 4, '22', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (4, '19201811160004', 1, 'pppppppp', NULL, 1, 2, '3333333333', 'df333', NULL, NULL, 0, 1542352835, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (5, '192018111600055', 1, 'we are', NULL, 1, 2, '3333333333', 'df333', NULL, NULL, 0, 1542352902, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (6, '192018111600064', 1, 'we are', NULL, 1, 2, '3333333333', 'df333', NULL, NULL, 0, 1542352949, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (7, '19201811160055', 1, 'link me', NULL, 1, 2, '3333333333', 'df333', NULL, NULL, 0, 1542354223, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (8, '19201811160033', 1, '3', '01', 1, 2, '3333333333', 'df333', NULL, NULL, 0, 1543998439, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, 5, 'df', 1544150200, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (9, '19201811300008', 1, '3', '01', 1, NULL, NULL, 'df', NULL, '', 0, 1544063388, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, 5, NULL, 1544158321, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (10, '19201811300009', 1, '2', '01', 2, NULL, NULL, 'df', NULL, '', 4, 1544063403, 'df', NULL, 'df', NULL, NULL, '511', '1', NULL, 1546593454, 'df', 5, NULL, 1544158445, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (11, '19201811300010', 1, '2', '01', 2, NULL, NULL, 'df', 'app_files/032018113000041.png', '', 4, 1543998802, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, 5, NULL, 1544158500, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (12, '19201811300011', 1, '2', '01', 3, NULL, NULL, 'df', 'app_files/032018113000044.png', '', 3, 1543998796, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, 5, NULL, 1544157512, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (13, '19201811300012', 1, NULL, '01', NULL, NULL, NULL, 'df', 'app_files/032018113000045.png', 'dfdf', 4, 1543558918, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, 5, NULL, 1544158519, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (14, '19201811300013', 1, '0', '01', 0, NULL, NULL, 'df', 'app_files/032018113000046.png', 'df123', 3, 1543998776, 'df', NULL, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (15, '19201812120002', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580034, 'df', 1544580034, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (16, '19201812120003', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580164, 'df', 1544580164, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (17, '19201812120004', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580207, 'df', 1544580207, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (18, '19201812120005', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580262, 'df', 1544580262, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (19, '19201812120006', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580302, 'df', 1544580302, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (20, '19201812120007', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580397, 'df', 1544580397, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (21, '19201812120008', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580413, 'df', 1544580413, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (22, '19201812120009', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580445, 'df', 1544580445, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (23, '19201812120010', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580470, 'df', 1544580470, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (24, '19201812120011', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580527, 'df', 1544580527, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (25, '19201812120012', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580626, 'df', 1544580626, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (26, '19201812120013', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580691, 'df', 1544580691, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (27, '19201812120014', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580702, 'df', 1544580702, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (28, '19201812120015', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580957, 'df', 1544580957, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (29, '19201812120016', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544580978, 'df', 1544580978, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (30, '19201812120017', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581142, 'df', 1544581142, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (31, '19201812120018', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581361, 'df', 1544581361, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (32, '19201812120019', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581402, 'df', 1544581402, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (33, '19201812120020', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581438, 'df', 1544581438, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (34, '19201812120021', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581455, 'df', 1544581455, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (35, '19201812120022', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581476, 'df', 1544581476, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (36, '19201812120023', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581491, 'df', 1544581491, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (37, '19201812120024', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581513, 'df', 1544581513, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (38, '19201812120025', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581536, 'df', 1544581536, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (39, '19201812120026', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581562, 'df', 1544581562, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (40, '19201812120027', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581581, 'df', 1544581581, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (41, '19201812120028', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581663, 'df', 1544581663, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (42, '19201812120029', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581688, 'df', 1544581688, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (43, '19201812120030', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581705, 'df', 1544581705, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (44, '19201812120031', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581735, 'df', 1544581735, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (45, '19201812120032', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581909, 'df', 1544581909, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (46, '19201812120033', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544581941, 'df', 1544581941, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (47, '19201812120034', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544586840, 'df', 1544586840, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (48, '19201812120035', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544587190, 'df', 1544587190, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (49, '19201812120036', 1, '0', '01', 0, NULL, NULL, NULL, NULL, 'test', 0, 1544587233, 'df', 1544587233, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (50, '19201812120037', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544587250, 'df', 1544587250, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (51, '19201812120038', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544587309, 'df', 1544587309, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (52, '19201812120039', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544592049, 'df', 1544592049, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (53, '19201812120040', 201, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544592102, 'df', 1544592102, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (54, '19201812120041', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544592339, 'df', 1544592339, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (55, '19201812120042', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544592415, 'df', 1544592415, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (56, '19201812120043', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1544592735, 'df', 1544592735, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (57, '19201812120044', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', -1, 1545371234, 'df', 1544592770, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (58, '19201812120045', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544592788, 'df', 1544592788, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (59, '19201812120046', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544592816, 'df', 1544592816, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (60, '19201812120047', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544593116, 'df', 1544593116, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (61, '19201812120048', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544594915, 'df', 1544594915, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (62, '19201812120049', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544596478, 'df', 1544596478, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (63, '19201812120050', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -1, 1545371031, 'df', 1544596861, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (64, '19201812120051', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544597115, 'df', 1544597115, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (65, '19201812120052', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544597179, 'df', 1544597179, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (66, '19201812120053', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544597499, 'df', 1544597499, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (67, '19201812120054', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544597960, 'df', 1544597960, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (68, '19201812120055', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544598157, 'df', 1544598157, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (69, '19201812120056', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544598252, 'df', 1544598252, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (70, '19201812130001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544667351, 'df', 1544667351, 'df', 36.094972, 120.462280, '5687', 'gdjs', NULL, 1546593454, 'df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (71, '19201812130002', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -1, 1545371019, 'df', 1544669808, 'df', 0.000000, 0.000000, '668', NULL, 'app_files/032018121900012.jpg', 1546593454, 'df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (72, '19201812130003', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1544670174, 'df', 1544670174, 'df', 0.000000, 0.000000, '565', NULL, 'app_files/032018121900011.jpg', 1546593454, 'df', 5, NULL, 1545369798, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (73, '19201812140001', 1, '0', '01', 0, NULL, NULL, NULL, 'app_files/032018121400001.png', '', 1, 1544773166, 'df', 1544773166, 'df', 0.000000, 0.000000, '123', NULL, 'app_files/032018122100007.png', 1546593454, 'df', 5, 'yyyy', 1545369787, 'df', 1, 1, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (74, '19201812140002', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 3, 1544774135, 'df', 1544774135, 'df', 0.000000, 0.000000, 'bxjskf', NULL, 'app_files/032018122100004.jpg', 1546693454, 'df', 5, NULL, 1545369587, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (75, '19201812190001', 1, '2', '01', 1, NULL, NULL, NULL, 'app_files/032018121900001.jpg', '', 4, 1545180273, 'df', 1545180273, 'df', 0.000000, 0.000000, '56-889', NULL, 'app_files/032018122100006.jpg', 1546583454, 'df', 5, NULL, 1545373853, 'df', 1, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (76, '19201812190002', 1, '0', '01', 0, NULL, NULL, NULL, 'app_files/-1.jpg', 'test', -1, 1545370317, 'df', 1545208317, 'df', 0.000000, 0.000000, 'uio', NULL, 'app_files/032018122100002.jpg', 1546593454, 'df', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (77, '19201812190003', 1, '0', '01', 0, NULL, NULL, NULL, 'app_files/-1.jpg', '机器震动！', 1, 1545208415, 'df', 1545208415, 'df', 0.000000, 0.000000, '456', NULL, 'app_files/032018122100009.png', 1546593454, 'df', 5, 'test', 1545371001, 'df', 1, 1, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (78, '19201812200001', 1, '0', '01', 0, NULL, NULL, NULL, 'app_files/032018122000003.jpg', '', 1, 1545277534, 'df', 1545277534, 'df', 36.094972, 120.462280, '123', NULL, 'app_files/032018122100008.png', 1546593454, 'df', 5, 'test', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (79, '19201812250001', 1, '1', '01', 0, NULL, NULL, NULL, 'app_files/032018122500001.jpg', 'test', 0, 1545706494, 'df', 1545706494, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (80, '19201812250002', 1, '1', '01', 1, NULL, NULL, NULL, 'app_files/032018122500002.jpg', '', 0, 1545706615, 'df', 1545706615, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (81, '19201812290001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546069350, 'df', 1546069350, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (82, '19201812290002', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1546069635, 'df', 1546069635, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (83, '19201812290003', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1546073210, 'df', 1546073210, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (84, '19201812290004', 1, '3', '01', 1, NULL, NULL, NULL, NULL, '', 0, 1546073232, 'df', 1546073232, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (85, '19201812290005', 1, NULL, '01', NULL, NULL, NULL, NULL, NULL, '', 0, 1546073257, 'df', 1546073257, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (86, '19201812290006', 1, NULL, '01', NULL, NULL, NULL, NULL, NULL, '', 0, 1546073282, 'df', 1546073282, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (87, '19201812290007', 1, NULL, '01', NULL, NULL, NULL, NULL, NULL, '', 0, 1546074262, 'df', 1546074262, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (88, '19201812290008', 1, NULL, '01', NULL, NULL, NULL, NULL, NULL, '', 0, 1546074382, 'df', 1546074382, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (89, '19201812290009', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074394, 'df', 1546074394, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (90, '19201812290010', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074430, 'df', 1546074430, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (91, '19201812290011', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074526, 'df', 1546074526, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (92, '19201812290012', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074626, 'df', 1546074626, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (93, '19201812290013', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074640, 'df', 1546074640, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (94, '19201812290014', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074664, 'df', 1546074664, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (95, '19201812290015', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074678, 'df', 1546074678, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (96, '19201812290016', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546074714, 'df', 1546074714, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (97, '19201901020001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546396580, 'df', 1546396580, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (98, '19201901020002', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546396634, 'df', 1546396634, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (99, '19201901020003', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546396647, 'df', 1546396647, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (100, '19201901020004', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546396707, 'df', 1546396707, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (101, '19201901020005', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546396882, 'df', 1546396882, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (102, '19201901020006', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -3, 1546396931, 'df', 1546396931, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 40, 'tttt', 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (103, '19201901020007', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -3, 1546397070, 'df', 1546397070, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 20, 'test', 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (104, '19201901080001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546910324, 'df', 1546910324, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (105, '19201901080002', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546910424, 'df', 1546910424, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (106, '19201901080003', 1, '0', '01', 0, NULL, NULL, NULL, NULL, 'hello', 0, 1546913390, 'df', 1546913390, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (107, '19201901080004', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1546913422, 'df', 1546913422, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (108, '19201901080005', 1, '0', '01', 0, NULL, NULL, NULL, NULL, 'uuuuu', 0, 1546914386, 'df', 1546914386, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (109, '19201901080006', 1, '0', '01', 1, NULL, NULL, NULL, NULL, '000', -3, 1546914674, 'df', 1546914674, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 30, NULL, 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (110, '19201901080007', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -3, 1546914700, 'df', 1546914700, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 20, 'test', 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (111, '19201901090001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -3, 1547000708, 'df', 1547000708, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 30, NULL, 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (112, '19201901090002', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', -3, 1547005690, 'df', 1547005690, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 20, NULL, 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (113, '19201901110001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '体育活动', 0, 1547178176, 'df', 1547178176, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (114, '19201901110002', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547178583, 'df', 1547178583, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (115, '19201901110003', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547178800, 'df', 1547178800, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (116, '19201901110004', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547178824, 'df', 1547178824, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (117, '19201901110005', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547179218, 'df', 1547179218, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (118, '19201901110006', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547184383, 'df', 1547184383, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (119, '19201901110007', 1, '0', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547185324, 'df', 1547185324, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (120, '19201901110008', 1, '3', '01', 0, NULL, NULL, NULL, NULL, '', 0, 1547185396, 'df', 1547185396, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (121, '19201901110009', 1, '3', '01', 4, NULL, NULL, NULL, NULL, '', 0, 1547185475, 'df', 1547185475, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (122, '19201901110010', 1, '1', '01', 0, NULL, NULL, NULL, NULL, '未知问题', -3, 1547185991, 'df', 1547185991, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 20, NULL, 'df', 1546583454);
INSERT INTO `t_repair_item` VALUES (123, '19201901110011', 1, '0', '02', 0, NULL, NULL, NULL, NULL, '', 0, 1547193343, 'df', 1547193343, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (124, '19201901150001', 1, '0', '01', 0, NULL, NULL, NULL, NULL, 'ttt', 0, 1547513832, 'df', 1547513832, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1546583454);
INSERT INTO `t_repair_item` VALUES (125, '19201901150002', 1, '1', '01', 0, NULL, NULL, NULL, NULL, '', -3, 1547513856, 'df', 1547513856, 'df', NULL, NULL, NULL, NULL, NULL, 1546593454, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 20, NULL, 'df', 1546583454);

-- ----------------------------
-- Table structure for t_repair_log
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_log`;
CREATE TABLE `t_repair_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cur_state` int(11) NULL DEFAULT NULL COMMENT '当前单据状态，参考repair_item表中的pstate状态',
  `ptype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sms是短信，vms是电话',
  `return_state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送状态或电话拨打状态',
  `return_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_log
-- ----------------------------
INSERT INTO `t_repair_log` VALUES (1, '19201901080007', -3, 'vms', 'ok', '115392083187^102196593187', 1547100620, 'df');
INSERT INTO `t_repair_log` VALUES (2, '19201901080007', -3, 'vms', 'ok', '115391683934^102196193934', 1547100669, 'df');
INSERT INTO `t_repair_log` VALUES (3, '19201901080007', -3, 'vms', 'ok', '115392073319^102196583319', 1547100793, 'df');
INSERT INTO `t_repair_log` VALUES (4, '19201901080007', -3, 'vms', 'ok', '115392003416^102196513416', 1547100902, 'df');
INSERT INTO `t_repair_log` VALUES (5, '19201901080007', -3, 'vms', 'ok', '115392033625^102196543625', 1547101051, 'df');
INSERT INTO `t_repair_log` VALUES (6, '19201901080007', -3, 'vms', 'ok', '115391754053^102196264053', 1547101069, 'df');
INSERT INTO `t_repair_log` VALUES (7, '19201901080007', -3, 'vms', 'ok', '115392143393^102196653393', 1547101123, 'df');
INSERT INTO `t_repair_log` VALUES (8, '19201901080007', -3, 'sms', 'ok', '292216347101122039^0', 1547101123, 'df');
INSERT INTO `t_repair_log` VALUES (9, '19201901080006', -3, 'vms', 'ok', '115392383833^102196883833', 1547106450, 'df');
INSERT INTO `t_repair_log` VALUES (10, '19201901080006', -3, 'sms', 'ok', '351321947106450421^0', 1547106451, 'df');
INSERT INTO `t_repair_log` VALUES (11, '19201901110010', -3, 'vms', 'ok', '115396593597^102201063597', 1547187453, 'df');
INSERT INTO `t_repair_log` VALUES (12, '19201901110010', -3, 'sms', 'ok', '799710047187453931^0', 1547187453, 'df');
INSERT INTO `t_repair_log` VALUES (13, '19201901150002', -3, 'vms', 'ok', '115411459608^102215889608', 1547513894, 'df');
INSERT INTO `t_repair_log` VALUES (14, '19201901150002', -3, 'sms', 'ok', '823300547513895901^0', 1547513895, 'df');

-- ----------------------------
-- Table structure for t_repair_settle
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_settle`;
CREATE TABLE `t_repair_settle`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修单号',
  `alert_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常类型',
  `alert_typedet` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常明细分类',
  `rep_settle` int(11) NULL DEFAULT NULL COMMENT '是否解决',
  `rep_note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `moddate` int(11) NULL DEFAULT NULL,
  `modman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operateman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `createdate` int(11) NULL DEFAULT NULL,
  `createman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_settle
-- ----------------------------
INSERT INTO `t_repair_settle` VALUES (1, '19201811300009', '511', '1', NULL, 'df', 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (2, '19201812140002', '511', '1', NULL, 'df', 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (3, '19201812140001', '01', '0', 0, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (4, '19201812130003', NULL, NULL, 0, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (5, '19201812130002', '01', '1', -1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (6, '19201812130001', '01', '1', -1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (7, '19201812140002', '01', '1', -1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (8, '19201812140001', '01', '3', 0, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (9, '19201812190001', '01', '0', -1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (10, '19201812200001', '01', '0', -1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (11, '19201812140001', '01', '0', 1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (12, '19201812140001', '01', '1', 1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');
INSERT INTO `t_repair_settle` VALUES (14, '19201812200001', '01', '1', 1, NULL, 1546693454, 'df', 'df', 1546693454, 'df');

-- ----------------------------
-- Table structure for t_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_role_user`;
CREATE TABLE `t_role_user`  (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_user_role_id_foreign`(`role_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of t_role_user
-- ----------------------------
INSERT INTO `t_role_user` VALUES (1, 1);
INSERT INTO `t_role_user` VALUES (2, 6);
INSERT INTO `t_role_user` VALUES (3, 6);
INSERT INTO `t_role_user` VALUES (4, 10);
INSERT INTO `t_role_user` VALUES (5, 8);
INSERT INTO `t_role_user` VALUES (6, 8);
INSERT INTO `t_role_user` VALUES (7, 12);
INSERT INTO `t_role_user` VALUES (8, 1);
INSERT INTO `t_role_user` VALUES (8, 2);
INSERT INTO `t_role_user` VALUES (8, 3);
INSERT INTO `t_role_user` VALUES (8, 4);
INSERT INTO `t_role_user` VALUES (8, 5);
INSERT INTO `t_role_user` VALUES (8, 6);
INSERT INTO `t_role_user` VALUES (8, 7);
INSERT INTO `t_role_user` VALUES (8, 8);
INSERT INTO `t_role_user` VALUES (8, 9);
INSERT INTO `t_role_user` VALUES (9, 11);
INSERT INTO `t_role_user` VALUES (10, 11);
INSERT INTO `t_role_user` VALUES (11, 9);
INSERT INTO `t_role_user` VALUES (12, 1);

-- ----------------------------
-- Table structure for t_roles
-- ----------------------------
DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_roles
-- ----------------------------
INSERT INTO `t_roles` VALUES (1, 'admin', '管理员', NULL, NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (2, 'operate', '操作员', NULL, NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (3, 'sale', '销售1', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (4, 'shop_operate', '车间操作员', NULL, NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (5, 'model_operate', '模具操作员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (6, 'plan_admin', '计划管理员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (7, 'quality_control', '质检操作员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (8, 'exec_operate', '执行计划管理员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (9, 'art_operate', '工艺操作员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (10, 'backup_manage', '后台管理员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (11, 'system_browse', '系统查看', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (12, 'art_manage', '工艺管理员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (13, 'shop_leader', '车间班长', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (14, 'material_operate', '材料操作员', '', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (15, 'ceshi', 'ceshi', 'ceshi', NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (16, 'AQuality', 'APP质检管理', NULL, NULL, NULL, NULL);
INSERT INTO `t_roles` VALUES (17, 'APPAll', 'APP管理员', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_section
-- ----------------------------
DROP TABLE IF EXISTS `t_section`;
CREATE TABLE `t_section`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_id` int(11) NULL DEFAULT NULL COMMENT '车间id取自depart表',
  `sect_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `modman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moddate` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_section
-- ----------------------------
INSERT INTO `t_section` VALUES (1, 4, '东300线', 'df', 1543280043);
INSERT INTO `t_section` VALUES (2, 4, '西300线', 'df', 1543280043);
INSERT INTO `t_section` VALUES (4, 4, '北300线', 'admin', 1543280043);
INSERT INTO `t_section` VALUES (5, 5, '东300线', 'df', 1543280043);
INSERT INTO `t_section` VALUES (6, 5, '东400线', 'df', 1543280043);
INSERT INTO `t_section` VALUES (7, 5, '北300线', 'df', NULL);
INSERT INTO `t_section` VALUES (8, 6, '研磨', 'df', NULL);
INSERT INTO `t_section` VALUES (9, 6, '西500线', 'df', NULL);
INSERT INTO `t_section` VALUES (10, 6, '东200线', 'admin', NULL);
INSERT INTO `t_section` VALUES (11, 4, '东300线', 'df', NULL);
INSERT INTO `t_section` VALUES (12, 4, '西200线', 'admin', NULL);
INSERT INTO `t_section` VALUES (13, 4, '研磨', 'admin', 1543308161);
INSERT INTO `t_section` VALUES (15, 4, '测试区域15', 'admin', 1543308148);
INSERT INTO `t_section` VALUES (16, 4, 'tt', 'admin', 1543366460);
INSERT INTO `t_section` VALUES (17, 5, 'testadd', 'admin', 1543801829);

-- ----------------------------
-- Table structure for t_sms_mobile
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_mobile`;
CREATE TABLE `t_sms_mobile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temp_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `hum_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sms_mobile
-- ----------------------------
INSERT INTO `t_sms_mobile` VALUES (5, 2, '17806273685', '测试用户999');
INSERT INTO `t_sms_mobile` VALUES (23, 2, '13121548745', 'test745');
INSERT INTO `t_sms_mobile` VALUES (7, 2, '15489456472', '测试用户4');
INSERT INTO `t_sms_mobile` VALUES (17, 1, '17869851254', 'test1254');
INSERT INTO `t_sms_mobile` VALUES (9, 1, '13541254873', '测试用户6');
INSERT INTO `t_sms_mobile` VALUES (12, 2, '13210107877', 'add1');
INSERT INTO `t_sms_mobile` VALUES (13, 2, '13210107578', 'add2');
INSERT INTO `t_sms_mobile` VALUES (22, 2, '13210107777', 'test777');
INSERT INTO `t_sms_mobile` VALUES (19, 1, '13259487513', 'test2');

-- ----------------------------
-- Table structure for t_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_template`;
CREATE TABLE `t_sms_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temp_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信平台模板编号',
  `temp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名',
  `func_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制函数名',
  `pnote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `moddate` int(11) NULL DEFAULT NULL,
  `modman` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sms_template
-- ----------------------------
INSERT INTO `t_sms_template` VALUES (1, 'SMS_141605517', '锻压工序短信监控', 'VerManufactureData', NULL, NULL, NULL);
INSERT INTO `t_sms_template` VALUES (2, 'SMS_144795186', '外协计划未关联称重单预警', 'VerAssistWeight', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_stock_inout
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_inout`;
CREATE TABLE `t_stock_inout`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `si_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单号',
  `cust_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `sbtd_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转入单类型(101:工厂计划执行单；102:工厂销售订单;104:工厂采购订单;111德胜利库存单;112:工厂采购收货单;113:工厂销售发货单)',
  `pack_bill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼箱单号',
  `si_inno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转入单号',
  `oper_id` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型(系统:101采购收货;103采购退货;102;销售发货104销售退货;105调拨入库;106调拨出库;107德胜利入库；108德胜利出库)其它见单据类型设置表',
  `si_way` int(11) NOT NULL COMMENT '库存操作方向（+1入库/-1出库）',
  `si_date` int(11) NOT NULL COMMENT '日期',
  `Stor_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库编码',
  `modman` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `moddate` int(11) NOT NULL,
  `si_checkman` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `si_checkdate` int(11) NULL DEFAULT NULL,
  `si_state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单据状态(缺省01未审核)',
  `si_monthstat` bit(1) NULL DEFAULT NULL COMMENT '月结标志',
  `si_ispayed` bit(1) NULL DEFAULT NULL COMMENT '付款(开票)标志|确定\'采购收货\'中已开发票的单据',
  `si_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `si_YM` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月结月份',
  `si_IsPrint` bit(1) NULL DEFAULT NULL COMMENT '打印标志位(0,未打印;1,已打印)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_inout
-- ----------------------------
INSERT INTO `t_stock_inout` VALUES (1, '158689556325', NULL, '101', NULL, '15141889118956/16', '107', 1, 1514188849, NULL, 'df', 1514188849, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (2, '158689556326', NULL, '101', NULL, '15141889118956/1701', '107', 1, 1514188849, NULL, 'df', 1514188849, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (3, '05201807300009', NULL, '111', NULL, '6851326554', '107', 1, 1532922258, '01', 'df', 1532922258, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (4, '05201807300010', NULL, '111', NULL, '6851326554', '107', 1, 1532922330, '01', 'df', 1532922330, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (5, '05201807300011', NULL, '111', NULL, '6851326554', '107', 1, 1532922543, '01', 'df', 1532922543, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (6, '05201807300012', NULL, '111', NULL, '6851326554', '107', 1, 1532922589, '01', 'df', 1532922589, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (7, '05201807300013', NULL, '111', NULL, '6851326554', '107', 1, 1532923077, '01', 'df', 1532923077, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (8, '05201807300014', NULL, '111', NULL, '6851326554', '107', 1, 1532923099, '01', 'df', 1532923099, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (9, '05201807300015', NULL, '111', '55665653362', '6851326554', '107', 1, 1532929635, '01', 'df', 1532929635, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (10, '05201807300016', NULL, '111', '55665653362', '6851326554', '107', 1, 1532941610, NULL, 'df', 1532941610, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (18, '05201811150002', '2018070300', NULL, NULL, NULL, '104', 1, 1542847558, NULL, 'admin', 1542847558, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (17, '05201811150001', '6', NULL, NULL, NULL, '7', -1, 1542242692, NULL, 'admin', 1542242692, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (16, '05201811140006', '2018070500', NULL, NULL, NULL, '10', -1, 1542167505, NULL, 'admin', 1542167505, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (19, '05201811150003', '99', NULL, NULL, NULL, '10', -1, 1542242809, NULL, 'admin', 1542242809, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (20, '05201811150006', '2018070300', NULL, NULL, NULL, '2', -1, 1542242830, NULL, 'admin', 1542242830, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (21, '05201811150008', '6', NULL, NULL, NULL, '1', 1, 1542243034, NULL, 'admin', 1542243034, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (22, '05201811150010', '6', NULL, NULL, NULL, '10', -1, 1542243339, NULL, 'admin', 1542243339, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (23, '05201811150012', '6', NULL, NULL, NULL, '2', -1, 1542248252, NULL, 'admin', 1542248252, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (24, '05201811150014', '6', NULL, NULL, NULL, '10', -1, 1542248317, NULL, 'admin', 1542248317, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (25, '05201811150016', '32121', NULL, NULL, NULL, '9', 1, 1542248387, NULL, 'admin', 1542248387, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (26, '05201811160001', '6', NULL, NULL, NULL, '101', 1, 1542332542, NULL, 'admin', 1542332542, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (27, '05201811190048', '2018070500', NULL, NULL, NULL, '10', -1, 1542594197, NULL, 'admin', 1542594197, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (28, '05201811190079', '2018070500', NULL, NULL, NULL, '9', 1, 1542597388, NULL, 'admin', 1542597388, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (29, '05201811190086', '2018070500', NULL, NULL, NULL, '8', 1, 1542610958, NULL, 'admin', 1542610958, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (30, '05201812130002', '2018070500', NULL, NULL, NULL, '9', 1, 1544408994, NULL, 'admin', 1544408994, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (31, '05201901070001', '2018070500', NULL, NULL, NULL, '105', 1, 1546843637, NULL, 'admin', 1546843637, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (32, '05201901160001', '2018070300', NULL, NULL, NULL, '105', 1, 1547599247, NULL, 'admin', 1547599247, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inout` VALUES (33, '05201901160004', '2018070500', NULL, NULL, NULL, '10', -1, 1547599523, NULL, 'admin', 1547599523, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_stock_inoutdet
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_inoutdet`;
CREATE TABLE `t_stock_inoutdet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `si_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单号主键',
  `pd_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '物料编码',
  `sid_batcode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `pl_code` enum('00','01') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '00' COMMENT '产品等级编码(系统默认00为正品01次品)',
  `stor_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid_num` decimal(18, 4) NOT NULL COMMENT '数量',
  `salverID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '托盘号',
  `sid_pricetax` decimal(18, 4) NULL DEFAULT NULL COMMENT '含税单价(采购收货)',
  `sid_moneytax` decimal(18, 4) NULL DEFAULT NULL COMMENT '含税金额',
  `sid_balnum` decimal(18, 4) NULL DEFAULT NULL COMMENT '结算数量(balance:结算)',
  `sid_pricecost` decimal(18, 4) NULL DEFAULT NULL COMMENT '出/入库成本单价(出库计算、冲负库存计算、采购收货，销售退货入库时计算)',
  `sid_moneycost` decimal(18, 4) NULL DEFAULT NULL COMMENT '成本金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_inoutdet
-- ----------------------------
INSERT INTO `t_stock_inoutdet` VALUES (1, '158689556325', '37606', '01', '00', '01', 150.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (2, '158689556325', '37606', '02', '00', '02', 200.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (3, '158689556326', '37608', '01', '00', '01', 300.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (4, '158689556326', '37608', '02', '00', '02', 230.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (5, '158689556326', '37608', '03', '01', '01', 30.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (6, '05201807300009', '15227326924514', '6517', '00', '0102006', 300.0000, NULL, 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (7, '05201807300010', '15227326924514', '6517', '00', '0102006', 300.0000, NULL, 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (8, '05201807300010', '15227326924513', '6512', '00', '0102002', 120.0000, NULL, 12.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (9, '05201807300012', '15227326924514', '6517', '00', '0102006', 300.0000, NULL, 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (10, '05201807300012', '15227326924513', '6512', '00', '0102002', 120.0000, NULL, 12.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (11, '05201807300013', '15227326924514', '6517', '00', '0102006', 300.0000, NULL, 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (12, '05201807300014', '15227326924514', '6517', '00', '0102006', 300.0000, NULL, 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (13, '05201807300014', '15227326924513', '6512', '00', '0102002', 120.0000, NULL, 12.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (14, '05201807300015', '15227326924514', '6517', '00', '0102006', 300.0000, NULL, 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (15, '05201807300015', '15227326924513', '6512', '00', '0102002', 120.0000, NULL, 12.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (16, '05201807300016', '15227326924514', '6517', '00', '100', 300.0000, '10052', 22.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (17, '05201807300016', '15227326924513', '6512', '00', '100', 120.0000, '10052', 12.0000, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (18, '05201811140006', 'PA001', NULL, '00', '11', 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (19, '05201811140006', 'D1030014', NULL, '00', '10', 333.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (20, '05201811150001', '3323', NULL, '00', '11', 211.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (21, '05201811150002', 'D1410001', NULL, '00', '13', 23.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (22, '05201811150003', 'D1030014', NULL, '00', '17', 1.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (23, '05201811150006', 'PA002', NULL, '00', '13', 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (24, '05201811150008', 'D1290002', NULL, '00', '10', 33.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (25, '05201811150010', 'D3290036', NULL, '00', '11', 33.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (26, '05201811150012', 'D1290003', NULL, '00', '13', 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (27, '05201811150014', '3323', NULL, '00', '13', 222.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (28, '05201811150016', 'D1290035', NULL, '00', '15', 2.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (29, '05201811160001', 'D1030014', NULL, '00', '10', 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (30, '05201811190048', 'D1290002', NULL, '00', '11', 5.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (31, '05201811190079', 'D1290002', NULL, '00', '15', 33.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (32, '05201811190086', 'D1290006', NULL, '00', '15', 1.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (33, '05201812130002', 'D1030014', NULL, '00', '16', 12.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (34, '05201901070001', 'D1290003', NULL, '00', '15', 3.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (35, '05201901160001', 'D1030014', NULL, '00', '17', 123.0000, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_stock_inoutdet` VALUES (36, '05201901160004', 'D1290013', NULL, '00', '16', 2.0000, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_stock_operate
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_operate`;
CREATE TABLE `t_stock_operate`  (
  `Oper_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `Oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库存操作名称',
  `Oper_way` int(11) NOT NULL COMMENT '库存操作方向（+/-）',
  `oper_sys` bit(1) NOT NULL COMMENT '是否为系统功能',
  `Oper_warranted` bit(1) NOT NULL COMMENT '是否产生凭证',
  `Oper_usable` bit(1) NOT NULL COMMENT '是否可用',
  `Oper_description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存操作类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_operate
-- ----------------------------
INSERT INTO `t_stock_operate` VALUES ('1', '调入单', 1, b'1', b'1', b'1', '');
INSERT INTO `t_stock_operate` VALUES ('2', '调出单', -1, b'1', b'1', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('3', '销售订单', -1, b'0', b'1', b'0', '已作废');
INSERT INTO `t_stock_operate` VALUES ('4', '采购订单', 1, b'0', b'1', b'0', '已作废');
INSERT INTO `t_stock_operate` VALUES ('5', '销售退货', 1, b'0', b'1', b'0', '已作废');
INSERT INTO `t_stock_operate` VALUES ('6', '采购退货', -1, b'0', b'1', b'0', '已作废');
INSERT INTO `t_stock_operate` VALUES ('7', '生产领用', -1, b'1', b'1', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('8', '生产退回', 1, b'1', b'1', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('9', '产成品入库', 1, b'1', b'1', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('10', '产成品返工', -1, b'0', b'1', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('11', '入库单冲回', -1, b'0', b'1', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('101', '采购入库单', 1, b'1', b'1', b'1', '系统类型');
INSERT INTO `t_stock_operate` VALUES ('102', '销售出库单', -1, b'1', b'1', b'1', '系统类型');
INSERT INTO `t_stock_operate` VALUES ('103', '采购退货出库单', -1, b'1', b'1', b'1', '系统类型');
INSERT INTO `t_stock_operate` VALUES ('104', '销售退货入库单', 1, b'1', b'1', b'1', '系统类型');
INSERT INTO `t_stock_operate` VALUES ('105', '调拨入库', 1, b'1', b'1', b'1', '系统类型');
INSERT INTO `t_stock_operate` VALUES ('106', '调拨出库', -1, b'1', b'1', b'1', '系统类型');
INSERT INTO `t_stock_operate` VALUES ('311', '测试入库', 1, b'0', b'0', b'1', 'NULL');
INSERT INTO `t_stock_operate` VALUES ('312', '调试出库', -1, b'0', b'0', b'1', 'NULL');

-- ----------------------------
-- Table structure for t_stock_storage
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_storage`;
CREATE TABLE `t_stock_storage`  (
  `Stor_id` int(11) NOT NULL AUTO_INCREMENT,
  `Stor_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '仓库编号',
  `Stor_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `Sp_ParentNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父仓库编号',
  `Sp_GetNo` int(11) NULL DEFAULT NULL COMMENT '物流取货号',
  `st_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型编码',
  `ss_code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态编码',
  `Stor_L` int(11) NULL DEFAULT NULL COMMENT '长',
  `Stor_W` int(11) NULL DEFAULT NULL COMMENT '宽',
  `Stor_H` int(11) NULL DEFAULT NULL COMMENT '高',
  `Stor_capability` int(11) NULL DEFAULT NULL COMMENT '容量',
  `Stor_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `Stor_tempe` int(11) NULL DEFAULT NULL COMMENT '温度',
  `Stor_humidity` int(11) NULL DEFAULT NULL COMMENT '湿度',
  `Stor_position` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `Stor_depart` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `Stor_tel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stor_fax` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stor_usable` bit(1) NOT NULL COMMENT '是否可用',
  `Stor_manager` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库管员',
  `Stor_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Stor_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_storage
-- ----------------------------
INSERT INTO `t_stock_storage` VALUES (1, '01', '1号库', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (2, '02', '2号库', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (3, '03', '3号库', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (4, '04', '1行', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (5, '05', '2行', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (6, '06', '3行', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (7, '07', '1行', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (8, '08', '2行', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (9, '09', '1行', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (10, '10', '1列', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (11, '11', '2列', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (12, '12', '3列', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (13, '13', '1列', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (14, '14', '1列', '6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (15, '15', '1列', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (16, '16', '1列', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);
INSERT INTO `t_stock_storage` VALUES (17, '17', '1列', '9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL);

-- ----------------------------
-- Table structure for t_sys_autocode
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_autocode`;
CREATE TABLE `t_sys_autocode`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `Frm_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RecValue` int(11) NULL DEFAULT NULL,
  `KeyField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀',
  `Slave_Code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_bit` tinyint(1) NULL DEFAULT NULL COMMENT '是否递增(1:递增0:非递增带日期例如：ba090116001)',
  `AddValue` int(11) NULL DEFAULT NULL,
  `zerolen` int(11) NULL DEFAULT NULL,
  `lastdate` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_autocode
-- ----------------------------
INSERT INTO `t_sys_autocode` VALUES (1, 'CPackage', 2, '1', '', '01', 'Ymd', 0, 1, 4, '20181227');
INSERT INTO `t_sys_autocode` VALUES (2, 'appimage', 12, '1', NULL, '03', 'Ymd', 0, 1, 5, '20180729');
INSERT INTO `t_sys_autocode` VALUES (3, 'truckweight', 1, '1', NULL, '04', 'Ymd', 0, 1, 3, '20180810');
INSERT INTO `t_sys_autocode` VALUES (4, 'Jstockno', 5, '1', NULL, '05', 'Ymd', 0, 1, 4, '20190116');
INSERT INTO `t_sys_autocode` VALUES (5, 'custserv', 2, '1', NULL, '06', 'Ymd', 0, 1, 3, '20180830');
INSERT INTO `t_sys_autocode` VALUES (6, 'Assistmanu', 2, '1', NULL, '07', 'Ymd', 0, 1, 3, '20181008');
INSERT INTO `t_sys_autocode` VALUES (7, 'patitonbox', 2, '1', NULL, '18', 'Ymd', 0, 1, 4, '20181017');
INSERT INTO `t_sys_autocode` VALUES (9, 'material_box', 2, '1', NULL, '1', 'Y', 0, 1, 4, '20181227');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '//用户名',
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '//密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_namecn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `depart` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `company_id` int(11) NULL DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'eyJpdiI6Iklxb1IwNHFWU1ZVblJzNGp2bjdJcXc9PSIsInZhbHVlIjoiUlRrWDNxOVVRYWRwblN2Nk5RSGdqZz09IiwibWFjIjoiM2U3ZWMwOWRhODY3ZTJjZDFkOTBkNGMzZDBiYWMzYjVmMzYyMzFhMGYxYWE0MTNkZTE1M2I2YzcxMjMzYTM3YSJ9', 'pilishen@df.com', '管理员', '4', '%', NULL, NULL, NULL, 6);
INSERT INTO `t_user` VALUES (2, 'liusg', 'eyJpdiI6InZmQkR5azZZeVNGQmt2Znl4QTRXYVE9PSIsInZhbHVlIjoiRXp4aXhxUzFpWGl4RU1NWVNET3lKdz09IiwibWFjIjoiZmJhNTUwZGE2N2E2NTU4YmNhOTA1MDM2ZjI3NzI0OTE5MmU4Y2E3YTJhYWQzNmRjNjZhOWZiNTVkYjhlYTE0ZiJ9', 'df@df.com', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (3, 'liusg1', 'eyJpdiI6InJmQmdOZGVLalRLTzI0WDR3NEVDbGc9PSIsInZhbHVlIjoialpVbGhCT0pzY0UxUDh0bXNrd0FDQT09IiwibWFjIjoiYzkwMjM5YWE5NDY0ODBlYmFjZGIyMmZlMzYwYmUyNmE3MTEwOTdiYjZiMjUxYjcwYjFmNmI2MjNiNzlkYmUyMyJ9', 'lsg@qdmds.com', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (4, 'wangfq', 'eyJpdiI6InJmQmdOZGVLalRLTzI0WDR3NEVDbGc9PSIsInZhbHVlIjoialpVbGhCT0pzY0UxUDh0bXNrd0FDQT09IiwibWFjIjoiYzkwMjM5YWE5NDY0ODBlYmFjZGIyMmZlMzYwYmUyNmE3MTEwOTdiYjZiMjUxYjcwYjFmNmI2MjNiNzlkYmUyMyJ9', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (5, 'jiangcn', 'eyJpdiI6InBJWFc0N2lVOVF5QkFDY2c4Ykt2Z1E9PSIsInZhbHVlIjoiTXFzSFR0K09oa1E5c1wvYWcrbk9SOWc9PSIsIm1hYyI6ImZmZmZiMTczNzRjZWY0OGZkN2YwYTIwM2RkOTYzNDliYjY5MDdkNmE0NWJlNDhmZGI5ZDQ0M2ExNDQ1MzI5NWIifQ==', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (6, 'list', 'eyJpdiI6Ikp4VFk4RXRHaGxWRHVyTUVBcjBaZVE9PSIsInZhbHVlIjoiUWc4ZmNhVWp3T2l5UmZTK1hQckFPUT09IiwibWFjIjoiNTM0ZjBlMWMyNDMxMjBmYWUxYTNiNGFjZDlhZWQ3MjM2YTg4MjYxNzFkNjNlYjBjZGEyMWUwNTE0NmQ2NDMyNiJ9', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (7, 'yangkai', 'eyJpdiI6IituNklzSEo1MHRCcG5mUURlVVpJSWc9PSIsInZhbHVlIjoid1pld3dnQjkxblpSXC9TazBYWVEyU3c9PSIsIm1hYyI6IjNlZWZkNzExNWM3ZDM3YmJhMWMxZmFjYzI1MmFmM2NmNGFhYWVhYzQ4NWY4MTc1ZjNmMmIwMjM0NTMwNDQ2MjAifQ==', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (8, 'shanshichao', 'eyJpdiI6ImxPOXRUczIyclNoajRcL3drMEE3b3h3PT0iLCJ2YWx1ZSI6ImlKVlkwTnZveEN0dGdaSm02Q3Z5aVE9PSIsIm1hYyI6ImQ5YjNkM2I2ZjRjMWNjNWVlYTZjMDg5MjE2NTU0N2U1OWJjMTZmODU1Y2EwNmExY2JkODEwOTg4Y2MxNDVjODcifQ==', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (9, 'quyusheng', 'eyJpdiI6ImVPWG5TbG1BSnBEMk54ZHpYOUw4NUE9PSIsInZhbHVlIjoiRFJXUGJLaUk0eWNwMFNrTEEyWUx6Zz09IiwibWFjIjoiMzdlNzZmMTNjN2I3YmUyOTAyMGNhZWNiODFlOTMwOWUwMGM3M2MxMDhkNmUyN2I2NzEwYTZhNzlkZDU4NWM2NiJ9', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (10, 'lumeng', 'eyJpdiI6InNCRmdtMUlBaEJKeFNtV09USXB3VHc9PSIsInZhbHVlIjoib2VtRDBKT2IxbGZrTXhWNkdvUThqUT09IiwibWFjIjoiMjhiODkyZWFmZDRmMGE0MmRhMGQ0YTM2ODRjYjA1ZDE0ZGVjNDc4NzE0MmY0ZmJlOTVlYWRkM2ViZDM0MjRkNyJ9', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (11, 'lvchunai', 'eyJpdiI6Imx3SzZsbENxOXpHNE9CeUNcL3dYMktnPT0iLCJ2YWx1ZSI6Ims0enBvNmlHWGdYcXZpUGdFVyt4SmhIaTJNXC9UWk5WM3RMdmtSVVNpRUdnPSIsIm1hYyI6IjQyM2FiMjgyYWY2NGUzNDkxNzIxNjRiMDY4M2UyZmZlMzcyNjFkMGNlMDdjNmVkNmZiYmI2Y2M4MDBiMGMwNmEifQ==', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (12, 'wangshan', 'eyJpdiI6IlZmQjFNWWFoUU9ENXE2TFBybUpvelE9PSIsInZhbHVlIjoiRllCNWxyQ3Q4MlwvckRsMFRLeXNQQlE9PSIsIm1hYyI6ImYxNzQ1MDY2NGRlMDc4ZTkzMzU0NTUyYjgzNDRiNmRhODEwNzFkY2VhZWRhYzM2NGQ2ZDJmNjI4ZGYzNDI5ZDgifQ==', '', NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (14, 'wangsuchen', 'eyJpdiI6IlwvWmpWRDlralFwRDEzMEZjbVNUQlBnPT0iLCJ2YWx1ZSI6Imp6TlJGZHpaOGlHTzFKMWJYSTZcL2hRPT0iLCJtYWMiOiIxMGJkMGYxOTc5NjJlMTBjODUyODc3ZDU0NWU1Zjc5NWNhNmQyMjgwZGZjYWIzOTliY2FiMmYwYTU2NTM2MDE5In0=', NULL, NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (15, 'wang234', 'eyJpdiI6Ijhub1d4bHpJUXNKZnBhVVZOYkxObWc9PSIsInZhbHVlIjoiXC9LT29oNkFPUXVPT29KVmltOXpJVnc9PSIsIm1hYyI6IjQxOWRjNTYzYjk5ZDIwYzEwYTAwYTM2YjNlNmZkNzI5NGU2ZjE3ZDljM2I5MzQyYTkxNzc0YWRlMzcyMjdkN2EifQ==', NULL, NULL, NULL, '%', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (16, 'asdf', 'eyJpdiI6IlM1enMxTXR3Q1BxXC85QVdNWDlrMCtRPT0iLCJ2YWx1ZSI6InBTQmdkN3lqb0sxV3RFWElMQjRMTXc9PSIsIm1hYyI6IjczZDc5M2EyYzA1OWUxZDY4NGEyOTcxNGI4NDE3ZmY3YTI3NzEwNzAyMjVjNmNlOGE5NWJkZjM5Y2NhNmRjNjAifQ==', NULL, '测试', '4', '01', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (17, 'asdfew', 'eyJpdiI6Ijl1elwvTW9xWTZUNUk1OFJWUnFEZWlnPT0iLCJ2YWx1ZSI6Ikt6WXIxT1RsUW04SlZMb0Y2NWVVeWc9PSIsIm1hYyI6ImQ3MTdjODRhYWEwMzkxNzQzNmYzYTc2NTBiZDQ2NzMzZjViOGM2NWQ4MjI4N2ZjYzg4ZDU0NDJmMzM0MWRmYmEifQ==', NULL, 'df', '4', NULL, NULL, 1537446204, 1537446204, NULL);

-- ----------------------------
-- Table structure for t_user2
-- ----------------------------
DROP TABLE IF EXISTS `t_user2`;
CREATE TABLE `t_user2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//用户名',
  `cn_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '//密码',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '//所属公司',
  `shopid` int(11) NULL DEFAULT NULL,
  `wc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '//工作中心',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `isgroup` tinyint(1) NULL DEFAULT NULL,
  `salary_cal` int(11) NULL DEFAULT NULL COMMENT '工资系数表id',
  `shop_role` tinyint(4) NULL DEFAULT 0 COMMENT '0组员用户，1登录用户',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `pstate` tinyint(4) NULL DEFAULT 1 COMMENT '用户状态0删除1启用',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `Stf_Id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 291 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user2
-- ----------------------------
INSERT INTO `t_user2` VALUES (54, '23', '测试23', '333333', '$2y$10$5nEeLZZw54G12Oi5YJV29O3diYVfYu82A4wXYPGsddqUUNoAqGzXW', '2', 4, '2', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, 1);
INSERT INTO `t_user2` VALUES (18, 'df', '测试df', '111111', '$2y$10$TBS3kuC/vEe7JvJEZpLloef/rWgxXttGyO0NFNvI64Cz4TMPogFz2', '2', 4, '2', '', NULL, 0, NULL, 1, 'app_files/032018113000029.png', 1, NULL, NULL, 2);
INSERT INTO `t_user2` VALUES (62, '11', '测试11', '111111', '$2y$10$iDW2YOamKIBYZHm3ZRROrun2BgReRAfeVl.xt4gLQd3LfjoRPlyd6', '2', 5, '2', '', NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 3);
INSERT INTO `t_user2` VALUES (68, '1009', '耿平', '000000', '$2y$10$HS3tInnc5c9nmE6D1OZeIel4zlKnQz3x9rJB4NXwgLcYfBBtDlmL6', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 4);
INSERT INTO `t_user2` VALUES (64, '3002', '王晓', '111111', '$2y$10$kCEWmfAQSFCDM/tGoCSPjuyNLiCdcs8vjXNxuPwE.qdQq//2Wxfs2', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 0, NULL, NULL, 6);
INSERT INTO `t_user2` VALUES (65, '1003', '李四', '333333', '$2y$10$SIrMX8os/RyR7i2cc51dOeJ9INDZVGRjuN9s0OBXUG0mOMFPpCYLS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, 8);
INSERT INTO `t_user2` VALUES (66, '1012', '韩志成', '111111', '$2y$10$EKtKmWqTjWBc5X4amLMYFuznlWn6jPa7QXkQs1rqWdYGISwTFOB0S', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 0, NULL, NULL, 9);
INSERT INTO `t_user2` VALUES (67, '1001', '江崇宁', '000000', '$2y$10$Oi4bGyvPQMv3XYWcWAyoI.caerMo4/QE90ue8uGx76yo3jeLx90.K', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 10);
INSERT INTO `t_user2` VALUES (69, '1100', '张海玉', '000000', '$2y$10$0v81VYr3gTwCsnqYE9mYIe2YrEqt.MTkbwGP3ObY1unB.xZuLj9Si', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 11);
INSERT INTO `t_user2` VALUES (70, '1101', '陈永岗', '000000', '$2y$10$FtVJrF0RVrb2/qmcGxPeV.MOGVP.Prh.K6YUxQmlqwghaL.RMbMVS', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 12);
INSERT INTO `t_user2` VALUES (71, '1102', '解维德', '000000', '$2y$10$schGNkZEuvGZLi.RcMWcdOTAw.UlmbJRZ6Efmftl8c1AcblFfN/7y', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 13);
INSERT INTO `t_user2` VALUES (72, '1103', '韩继红', '000000', '$2y$10$eMQksbXDNaPEI216V.cOA.5AzoBhIqociIfYeCLbM3l1/Enwa05sq', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 14);
INSERT INTO `t_user2` VALUES (73, '1104', '王至卫', '000000', '$2y$10$LqrE7RmMTViywDB/b4vC3.W6Pum1E1WncDmONA2kLQbWFm3IK1I26', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 15);
INSERT INTO `t_user2` VALUES (74, '1105', '柏艳龙', '000000', '$2y$10$KZ9fdLSIuCE62tS/3qQOWuHZ4sWPIYKaZxwqw4iTBjn38W7yx4G4W', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 16);
INSERT INTO `t_user2` VALUES (75, '1106', '樊勇', '000000', '$2y$10$07X6VSsj13O6tefX/NJSieyJQTMst4on1d/1x/cjIxzZIK759B.P.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 17);
INSERT INTO `t_user2` VALUES (76, '1107', '管鑫', '000000', '$2y$10$76OT0PhU6uYTzKqUlskFiOdjzBaVyYTimrk3tL25wxi55so8dsw1G', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 18);
INSERT INTO `t_user2` VALUES (77, '1108', '于佰春', '000000', '$2y$10$JvSmxW4oKSFiLGh6pKS5.us.p5r4lVzFBHZ26BB.XDKS9fFtU2UDC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 19);
INSERT INTO `t_user2` VALUES (78, '1109', '张振喜', '000000', '$2y$10$GrukpIDErvxjAXrBlUKiFe8ZtWsbioQOVGboyjlnwDVziTe1GDY4a', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (79, '1110', '孙世欣', '000000', '$2y$10$BqaslfBYpUYcImiYbmdwsOrcgW9GrhHECYmGuS1z.9eWVNDsHFP3.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (80, '1111', '刘世彬', '000000', '$2y$10$YMma2NjK3QSA.LFE.qmwh.Tfqta0R61I1U1ZPFUC0gGjVawpSYKk2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (81, '1112', '姜云宝', '000000', '$2y$10$Tecocq7IeF5OgCFGfh.8e.EYfKIIEqB8KJYWrmtTO6ZyhIfh6/72u', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (82, '1113', '孙帅先', '000000', '$2y$10$egYcIGROTIMSHaqEJn2fUe0ba.8ktC8FKDah/EbB/N.MojHIFqQge', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (83, '1114', '张俊奇', '000000', '$2y$10$98oe2dYF5gqvPiEWzhsCY..r6tpsjj8210BVIjmG3E7za/MY3daaW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (84, '1115', '赵鹏', '000000', '$2y$10$acp6E.vVSp70lilyg/9hSuYXDQA4LC2aChcZBH2BuUE8Q0rMdm32m', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (85, '1116', '毕旭东', '000000', '$2y$10$eIo7KWUCtaJDAM7ShF70Kei0QEda3dpW3b2mkc0M7kHoGwYY4K18q', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (86, '1117', '孙清友', '000000', '$2y$10$uKRmHxFJ6Uqvns0RuU9E9OJJY9E2qHXEPrJf/SbAXCeqzzjQ3euRW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (87, '1118', '唐亚军', '000000', '$2y$10$NYdHMKfUaJNpeV6m.Y6eZeo3bJbneaCmS8oUjk6eodJp7rSzoliTG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (88, '1119', '卢立伟', '000000', '$2y$10$WPmsEduP6YM6RIYYf0gOS.ltZZcI00.Fb0GoZDnYenZcKVNkWizwO', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (89, '1120', '任尚振', '000000', '$2y$10$zvrXWLvHMBsxiBEfQ0tv/OYvLfSJ9wfP3Yx4MFb8.nkbVsRmlywSG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (90, '1121', '李吉强', '000000', '$2y$10$HYnaNASi4dh8Bzs6NzkVjeqdxagRXFPl5amfuzpXFaMJZoja1puN2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (91, '1122', '李春富', '000000', '$2y$10$uomr94IdnUbwXOisM/gEGuwXuDcjszCXumKhD0baekgnumck1m53S', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (92, '1123', '卢福宁', '000000', '$2y$10$ae/3v4E0octkE7j4NF26sOOjbn1I6GSAKdfuLA0Xic/JnQXICwiHO', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (93, '1124', '刁伟东', '000000', '$2y$10$B69cTwtwRcDU2rWO7UPUPO2bVIzQPhmLOO39cafu.IB6CUTEXEOBe', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (94, '1125', '张玉本', '000000', '$2y$10$/EsZEZEQh2RvvLX3.3r3n.bRzENXgo2SM/iV30knvMU5AImB/rz7C', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (95, '1126', '李友生', '000000', '$2y$10$fSNKhJV.sUEhvfgc/Dt3GuEDuByzU6Jty47yuOJKQ0K6aTOsFpu46', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (96, '1127', '张鹏传', '000000', '$2y$10$LWW3evNzBio.DLwCbqMLKecl9TS.3yhD1J6x6dWo5XwtUZEnfn5cG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (97, '1128', '王至照', '000000', '$2y$10$rXznyB6BYhfdvlsGQaPpSOaSt3dxkpxi4evFc3U/qm/jhTYVzeXcu', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (98, '1129', '王新成', '000000', '$2y$10$/VBUlx53pjJrsEpUlHncCecBRyWMvRuW9gpQ1kUc2Wjzd.n3HrWVm', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (99, '1130', '陈吉秀', '000000', '$2y$10$HOG3zg39uNWklFiGCKCSoO.63zE27325HBHJeKQFxmqQmkvHJDasG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (100, '1131', '仲志杰', '000000', '$2y$10$u5H4ZVXwWNvrufViPHIOCuBkovzLH1PkbnDSodWxAT3APAR9VwzQy', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (101, '1132', '孙正龙', '000000', '$2y$10$tmp5M02BULiUrxe2RU./9ud3/DQ5IUcVf5Dbshxozws0CCkK0oM9W', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (102, '1133', '郝秀凤', '000000', '$2y$10$M39yRycZwBhIZivHugkiGOELvNVBcSLU5gmDqTa5zA3Ye9E6vEcNa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (103, '1134', '李保尚', '000000', '$2y$10$hVVaMnrWrOJv.XfWlscGr.M5xCCVstEFdnhk/TLj4J4iB1dF9GZHO', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (104, '1135', '解维星', '000000', '$2y$10$oSPLT096judri1ZfeX2u4eoi4sp/L6dX/ULhuZKHxWbLhCji0/zZa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (105, '1136', '王洪福', '000000', '$2y$10$VuatzEZlkbDsfsc1rbX7CuS3HvoZ/S3sH8f81ASCIfQTEWxg9B.7i', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (106, '1137', '张彦生', '000000', '$2y$10$9XVc.4e3BEAdqmegGPqqKOqDFQ5uQGRWgeluT/NBmja2n78VL5qzW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (107, '1138', '刘光泉', '000000', '$2y$10$.5RJBDIZ.gDxdhML9XB04OrOztDGsWRStb7.XRvAtpz8QbZSS2tKS', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (108, '1139', '陈士海', '000000', '$2y$10$/uQ8YqDrUAsNKS/mP8DuheSTl61gLi5TlXT8fbfCEbiFZEYjhgT.W', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (109, '1140', '张元根', '000000', '$2y$10$ZFKA1yv2lN/RVVcmYg3E2OMNlr9CA9HCKKwFIhc4tL0b/nstWHKiW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (110, '1141', '顾德鑫', '000000', '$2y$10$0BU8K5YyoogUqJA5AvM0reRfVYCZ.bsBQteL9Oln3ZvV4IL1LqEbK', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (111, '1142', '王征臣', '000000', '$2y$10$Ws.pQ2aoeEdSJT9UVo0UjOCDolUhXYxWl80P12SCqzf34r.1k9HXW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (112, '1143', '陈万春', '000000', '$2y$10$DURG0DGKpalyyZPAWbGw..QnhT4ApeJpperwMRfg5fZeJB6VUd93u', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (113, '1144', '刘元辉', '000000', '$2y$10$OhfbflWGv3lFwbWzMr/Ue.nrVMRrqmZrZ7YPMDJjYyef3l.ksJ3DS', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (114, '1145', '杨福军', '000000', '$2y$10$ce4931x.8ezopgIfwRl.IeF/5Q1gz065ROPcrQqy1XRkhrg5Pr5p6', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (115, '1146', '冯宝', '000000', '$2y$10$MFvBw6N/USVmdn3eq7236Oo6k1Vl.YbxTMq3.FEd6S3RrwywRlepa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (116, '1147', '范进安', '000000', '$2y$10$ARPQnho.Hw2a/YPMRxnXl.ZDMeu0a.hijDb/pGz7IIu/SAN22id0G', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (117, '1148', '周锡壮', '000000', '$2y$10$NfsDwns29zijOqKGlZmWKOgpp6phATee0NCVli6.HaeItEGtBfI3K', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (118, '1149', '刘山', '000000', '$2y$10$MXA3a9G/r00i9tgvLJ7bN.4xDbAwDN5AbhWbtuecRaq3CiR/xCu2G', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (119, '1150', '王俭福', '000000', '$2y$10$JxOdHs8yTuKbDeDWzflXn.KvreqFDsoiRclB5L1v8q.Xk7Y4X8QcC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (120, '1151', '张红红', '000000', '$2y$10$yXZzYB0awJE//FBAtuWjY.LrE.pQmVleZVJ1mFzDE3XYrTecNWKOC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (121, '1152', '王志道', '000000', '$2y$10$s7IJhGZrr.YBJ9Mo.iYUdOnX4p3Y6Li0YF3TPtoWdf8Omd/GGU2pa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (122, '1153', '李建刚', '000000', '$2y$10$O09a8yVO4O5l2nx3q3lE0evTGTeyUctTCFH4VKyOis3eIzpZCNKae', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (123, '1409', '刘仁苹', '111111', '$2y$10$NC0MtBb0gCSFlU1M2qd//eIG0na2YUuNHrIEy9U5PuFSJUP8iQjJ.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (124, '1155', '刘世功', '000000', '$2y$10$S/S7xVtbyWND3DsopUnCa.TEvuRkJ95S.VlqCJJLalqT5.72vy6qi', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (125, '1156', '张瑞奎', '000000', '$2y$10$B86janFzxECuLe/UjPjMQu08OF3Ntezw.3G.Bx0N9hNXw4MQk7PgG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (126, '1157', '江崇亮', '000000', '$2y$10$ZCoS6qyEIve9Ot6rqJTZaeIR.Mmr5JhEykmBZ9mMRf./yX/TmQofy', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (127, '1158', '王悦豪', '000000', '$2y$10$OLgKWY/HTzO2AM6Pqj7O0ez2chskTjle9qomLhxegxGYEJMAYNU9K', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (128, '1160', '丁求刚', '000000', '$2y$10$IriA5T9w97kSxRtxULlLt.yFao1X9z/RKmCC9U6Mrz1mEgsQBXaG.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (129, '1161', '鲍加勋', '000000', '$2y$10$VyOlFN3WC.EA53iC7DLkgebG2SE3PnwKPrXe.XbJRwjS0umRjcJYC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (130, '1162', '王美荣', '000000', '$2y$10$I9n/PP6svjnJdRcbv0r6AOHd7oLWTgDx5tv0hJ6oQIJYdX/X5wT5W', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (131, '1163', '解秋本', '11111111', '$2y$10$eAA85MWbZ7Iii1TFYhv4KOZreRPdIdyR50/ZbrUQ6EVPE6tjZNyBa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (132, '1164', '回小强', '000000', '$2y$10$qUBjIzbIl60aCUIxYo5dou/sBb.PNpswiO73AlXJJiZTZzXC7KGPO', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (133, '1165', '马付干', '000000', '$2y$10$XOkB7OlcGtM6bbQMsZnhN.9g9nEUEHlMXp.nfWbSsWuSYzwIvKwxa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (134, '1166', '周克明', '000000', '$2y$10$bLRvuJw0mYNjttWmJfv7M.1YcXc1XauI0uA2oq8KTI8eBtFPc2J9q', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (135, '1167', '宋文业', '000000', '$2y$10$zt2EpOLGtGKsL.vS7Dl0oeIEPa.q/QIvii0Z1az.xQO4FxriCc1P2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (136, '1168', '唐德春', '000000', '$2y$10$o49k6YOBF4MkloMa2klpfuDki4j4yrq6T8wo2W/HaF5mDln9wytGa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (137, '1169', '张俊伟', '000000', '$2y$10$MZDOxRLIRpoXWym5a.6LROsYSkEUFzxlULo182YzO.G8/irSpVLv2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (138, '1170', '韩乃彬', '000000', '$2y$10$oXhpzuC.BpTuRcjBgruYhOyPYcbzGxTf4IobPBsTLTVbjjVFd/mPa', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (139, '1171', '孙萱勤', '000000', '$2y$10$dpdpKVnIWvBeeeEt1wrAHeArH7JawdjnDxv6ae1Aus8qtC3LpoBDm', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (140, '1172', '孙丽丽', '000000', '$2y$10$c5/yCDte1jbA233c62ze1eaHAUmyA4fJ7ENu5mhhC9/Or0jrkNiam', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (141, '1173', '李爱斌', '000000', '$2y$10$xlN4nL11g4Uo4O5WOpjPWORLEqcg1S6cGG.DIisohE04rmRG13fry', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (142, '1174', '李视瑞', '000000', '$2y$10$rfXTKrBvOPIdCd8FZinxnuW/xEIXfmAETsJYVCtBP.ZhVv8P1liwS', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (143, '1175', '孙西来', '000000', '$2y$10$RKvLcHoaX9gjNJwDOzTjzuSrz65RYZIU191MRqzIp.fO.U9BRgPsu', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (144, '1176', '孙安昌', '000000', '$2y$10$s5NaRJgVRlAz58QJNm6LJOQnPs.qruYEVf4n0OOSeT6x7/aWUMiiG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (145, '1177', '耿平', '000000', '$2y$10$alJLEt3upym546Nh.qBXNuFy0rM2QGvb4loOhi4dl3FRwDYd/GlnG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (146, '1178', '韩志成', '000000', '$2y$10$lm9BTOCQPdGoCtErvSh/tupvpeQZfyrSqIPmgdyZJUMwJWjW0I24.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (147, '1179', '张永训', '000000', '$2y$10$Mqv8jAy6muI4lnNdNuzxUuXKEyHPKh8G9QyAjgf7aSzQ8QahUdBjy', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (148, '1180', '纪新亮', '000000', '$2y$10$qXRAcEHFJcynEMADLhmbP.6qxK8GyFegFnv/VK7XRZ9a4UtWPf6Ty', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (149, '1181', '周丰国', '000000', '$2y$10$yt9.rDMLuR4JFlBSrgWP.u74pEnqbloktHDfj1unVucToj1SnXOk.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (150, '1182', '邢文君', '000000', '$2y$10$MqLHRjxDgcOgYJSCl.80GOYCzqfDv7Ibn32zKZXaev5R49Q3OjObm', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (151, '1183', '王恩祥', '000000', '$2y$10$WeRuVG7wl1arVzP3qWAWnOM02wYpFNvG8tXSaCdI/TsorYryiTI2K', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (152, '1184', '杜延国', '000000', '$2y$10$S8Pj1WVWZT1n5oGbSgXFLezv2ICuKJuLFu8m2cXrzrbXd4YdeCmq6', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (153, '1185', '徐中华', '000000', '$2y$10$Y6YRFZMc3k96ptpzjhksau5n1XLTzSD31YahD/E9IBsldtFLuCGta', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (154, '1186', '江志秋', '000000', '$2y$10$EB.ayRIulro/KknGdUEzEerhqh4Kx4TwNVX9CRpuj9QJSgV67J.b2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (155, '1187', '国云波', '000000', '$2y$10$CGkGPXrVxfbGJQ/oEDzvsOseVII4VJ2QKbsEIeMiq7C1IcPEtJySu', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (156, '1188', '张宝深', '000000', '$2y$10$bOr8T9gM9HFZwuIYCWAy8usZETQ7Ha8kVvLV77LA7IPNES6wRQ7OC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (157, '1189', '李世通', '000000', '$2y$10$lA0J5g6gX3V2fVILfhCp/.YVnLo.UJdADFyFgTUmsKxOVyz8u6b0K', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (158, '1190', '张深革', '000000', '$2y$10$ysq.yZt4b2P0KDNBM.Xooeqw8fuOLi9OvRfSTBnGIc.N.8VBqXnHe', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (159, '1191', '王伟曾', '000000', '$2y$10$HZsUfnk.JrtkEWF.2I6Vjet1GTx5Su3HOtmyeSIzJrbUPzwIgZW9q', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (160, '1192', '江崇宁', '000000', '$2y$10$MdGNjT6dj603kqrWmzK9zexT74jv0x91Bnr0x.qWRe4hdigTJq0jK', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (161, '3001', '东300线', '888888', '$2y$10$kvBtx0xxUwgHmAWqsOsedeqqIENUsokZ2sl1VCK79DUY2.xgW/psy', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (162, '3003', '西300线', '888888', '$2y$10$WQual3D6RKVgBKXOoJnTg.XGW8E9Kq.WrYsOMA5BjK.aPUfXfic6a', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (163, '1193', '张海艳', '000000', '$2y$10$Y2BBJFG7yU7DKoyeQQn6x.fqRQBdLa/ecmo3xgndNEGi2c1nanwZK', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (164, '1194', '辛娜', '000000', '$2y$10$rB/fZgCXs7zXFPPvmcuYFu7s0lgc0t2ggsU0Zi9uhSdqfIF0J5Hoy', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (165, '1195', '付金凤', '000000', '$2y$10$zAtFA/Th1Dq5NBKGZ9FuPeaIgdioozuGVbBuKb5F0deD4yYlEBxRq', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (166, '1196', '秦亚红', '000000', '$2y$10$vO7s1i41r26ih5l/4aaf7OSwLY4TvUlpB6TWb8b2CBGcZTCrtvgWO', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (167, '1197', '孙晓堃', '000000', '$2y$10$rtDoXmHCXuUWG2b4vogJGOI32ZO7QKX/o32uBCMVgFBu7AfbIgVeu', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (168, '1198', '赵雪红', '000000', '$2y$10$6aFz5CRlu4HuAJ.pgdVP5OP3Zt.m.OL5u21mMM83jwjNKJVPXLgDe', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (169, '1199', '宋金娟', '000000', '$2y$10$mr/hU5CYOnn/mDJr0pkj3ek3RcVsemFcCTZvUTm5mgCLTTWOmiZNG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (170, '1200', '李春梅', '000000', '$2y$10$93WUpPzzllP7OD1MfWce.O1ZuJ36hh4gFPVGw.3r8CydTZOO58dXG', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (171, '1201', '隋喜兰', '000000', '$2y$10$bM/yW3DpkpcAZwU5gHBrqOiU/V6zuC8OK74fi5YcqLXHrrgvJKIVu', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (172, '1202', '马艳', '000000', '$2y$10$DC9iFm0YbEeBuTRUPAAN/uEtDidvXjmZuC8q/EAXXklOb2bQ7Ouf.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (173, '3004', '磁粉探伤', '000000', '$2y$10$niOGXq0N2lPK79BvSb/ny.peFwdea48rjAOOuu6/HVtAHXMfUxo0C', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (174, '1203', '李珊珊', '000000', '$2y$10$vLK3EQZ2ddKLjoSPtc4PYejgaImwNZDbyvrQRjEVwsl0jXhyt3YDG', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (175, '1204', '张运红', '000000', '$2y$10$izypGRa5RfrQScOUOJAwfeARYf4AOmR7OluK3y/7YOLuC.QPjbGKm', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (176, '1205', '孔令梅', '000000', '$2y$10$pI4LZxsb2xwmzXbG8d09eOfwm/XTICvbWkYOeXEFOIg6y3jeBtWla', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (177, '1206', '张英花', '000000', '$2y$10$tQF4ohX4PHF57JcVtZtUU.xwEG5P/IxoIHFvYVXQ2Sc7/NBLg1zy2', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (179, '1208', '张守理', '000000', '$2y$10$YNxBsQuow8i.sYBGCbpHGeHrech2uIqUQZTHDqiWj/Hm/UDHZ7MpW', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (180, '1209', '黄华', '000000', '$2y$10$cZZv0uKksCBgLdC.oOefgeW.axQLMgkUAd2W8RwzQTJVOp/auYb9K', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (181, '1210', '李祥君', '000000', '$2y$10$Z0BbcYkmJ.uILVrA7EpYRe5TpMsCbG/RZqZR40MaG9eF2pkMvye4i', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (182, '1212', '祝雪芳', '000000', '$2y$10$ADt8Wh./I9QzTH.AfQBiregIf4LpIg7dc7lmaJAOQxoFH7IQFUAgG', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (183, '1213', '李青梅', '000000', '$2y$10$TWSy14v/UpW5FnfVEEEpteCybOAZ80XK.jbvVbD46Oc21iwD5yKGO', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (184, '3005', '选别', '000000', '$2y$10$.ta0AgU7Qi2Slu0HuhF6BuxxguS8/Y7iWDvWgYHle/45toxJn9C6i', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (185, '1214', '任广信', '000000', '$2y$10$HgwVkdH/JjAo7j/9gUUn2OcPxwQcgQRm1fZ80W40KsLf/0/Gbv/5.', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (186, '1216', '李红松', '000000', '$2y$10$TrrVxmBYiBvV39dJVkrvneX2/9vSjBdP7Vsto6YolElMZS3WMk4LK', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (187, '1217', '马继全', '000000', '$2y$10$LYRPb8vBRlE4AtnEYQ3ine2gOGraGY/T9WY.NKbuo.J0ZTKx/Rz8K', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (188, '1218', '江银世', '000000', '$2y$10$9SAjvLtfEgv6ihLmCqX0NOboDVr33Ybroq2KG/dRYMeZfo2/9XZY2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (189, '1219', '谢清治', '000000', '$2y$10$blDcq8J7Yu2ZBbtamAEFR.r0/MM5ZGMICRBx5llnFTQcPA4XR1qJW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (190, '1220', '于德宇', '000000', '$2y$10$mSCMwW5No0wHUOcNaIEP/e/KmJHFiZ4cTvtCqa.n0vBLEsiha5uCy', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (191, '1221', '史伟剑', '000000', '$2y$10$XzOJyagksZWLulY0EqdCU.0qz3CGCbOrxv5pFYwJN3TChIZijY0FW', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (192, '1222', '付玉强', '000000', '$2y$10$BPUNRY4YWuY/zLreGBcI7efjyZPMNiQqpYLjjqy7O2dFnYx3ig0C6', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (193, '1223', '江正世', '000000', '$2y$10$0jjOOZl1vJxOLrWZDXcTVembx68F8DgN4b/M7J1LzrGWw8zte/X4e', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (194, '1224', '江洪范', '000000', '$2y$10$gAvVc//Qb01FxtAjNP3JqerJ7k0UpwFzFM8S1vdIZvr5o6rxewRMi', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (195, '3006', '热处理', '000000', '$2y$10$zrrZanYTTXUB9Niev9dgtOptVzA5G6fMGlm6auiI.R9DCUSfYMEJ2', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (196, '1225', '屠国庆', '000000', '$2y$10$E8o3fjEJEXTrF8lovbQ9sOOjaupc/fef/t85KGljiK8QE40PkTdoO', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (197, '1226', '于敦刚', '000000', '$2y$10$m5wqqeEJA0GwiP9ObjPyOO5aQQl/7fb4MwuXSHI2KRrMa/B//BXQ2', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (198, '1227', '张昆杰', '000000', '$2y$10$FmFwAKNYpA3WCfRJ9QSlA.TmDjA5HQZ30KZRI5UnDHjQ.4T9L2Ji.', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (199, '1228', '张刚', '000000', '$2y$10$P4Z5zGcaEu1Fed2DTM1K/.Od3hBdtYKH80k4MTfCZOZ/k54/eApIq', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (200, '1229', '李存青', '000000', '$2y$10$UsJymVT9dCzEeQB2CU7PKe10bUHiyuxEPE8OMtj2cymPLKwpY1DxW', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (201, '1230', '赵跃超', '000000', '$2y$10$gwJpZDkAbfC7JFZ32P/st.k6HXSjOcCkiyUsZxeSJPWF2fvTwJ/7m', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (202, '1231', '高伟', '000000', '$2y$10$aT5KrmexGZvgoYX2AmOx8u1SccM9scJP2j836C5vTQVH.0lnDgnJu', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (203, '1232', '张满平', '000000', '$2y$10$sGmgAZM/JnDIUyk79rhZNOUWoquVQF0OpmljgMcNc4/L.0KpMIqbG', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (204, '1233', '陈军', '000000', '$2y$10$rUeNb.LhqCiTiCv.KnM2o.X3Hl9C0RvYujcXtH/oIklvbKepQkQZK', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (205, '1234', '代占平', '000000', '$2y$10$1WvoqDbC9kYYRQOhm5FBf.0P58lGo0.cEXHDBopbzQ/P50w6rFVJC', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (206, '1235', '时建强', '000000', '$2y$10$0p58TAn8/2mBtk3ON16a.O8CZMf.K3D5aIoXMlCGtBIs3PYYEXnUC', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (207, '1236', '张艳', '000000', '$2y$10$ozgadNJkeM3ErR5JeNV1yuKOmaeolvnrW50omHF9cNKl0RFNJnDM2', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (208, '1237', '杜宝装', '000000', '$2y$10$KsBr.GW3XWnr6BG3CP3WGubf4tqFpVH6jP3p0vmicgFDMC/wlErvq', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (209, '1238', '王振星', '000000', '$2y$10$iO2DP.drnGyWC5MNvxcV1e0/OblofoamRiYJOdLbTcc95xXEMa/au', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (210, '1239', '王发兵', '000000', '$2y$10$.jE67DLnzmcLkZlli0PhMebUkdUh0BF6d4v9oAduda5G7IolbfRfS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (211, '1240', '王显生', '000000', '$2y$10$lNQNAe04j2LaxHbKWm9h9.vG5KzJt7TeDCDfd1Ngw6NHJq4/MsNqC', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (212, '1241', '李长路', '000000', '$2y$10$vVvuI0tJpgIiNtb0q1sFVu1kHbaDbywBt64HFe/1EHF0GjStbt8Hm', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (213, '1242', '桑树波', '000000', '$2y$10$ulx3ZULL7T6zlus0HOUpL.GmJ1n6R6S4Qm8bohqOnxWUdnzOewxGy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (214, '1243', '王启后', '000000', '$2y$10$m0HJqvc3GhmsKbM77m/j6uPHZqWjLP9GtOu13nM4waeRR/A5kHEMS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (215, '1244', '于忠银', '000000', '$2y$10$/e.a4iUA4gv9Rxut1GZoZeS9M7Ev14KJAi89wFUVPXwcxilIPtTX2', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (216, '1245', '王振星', '000000', '$2y$10$vSsE/vC.VjrkzGz328knsO6rNoMF6uaW2h1ApHawVyCZIT.luYtE6', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (217, '1246', '卜凡士', '000000', '$2y$10$dr0ybiCqoT5Vzj1eBiKxqutMNYelU0B1.RgTZI6jIRTMTTN41vZ.O', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (218, '1247', '秦振海', '000000', '$2y$10$L7C9xRQSsMcJ2Wce4BYU9e/xdbXnemiGU2jtiqcl25w.ub7BdMQ0S', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (219, '1248', '徐加今', '000000', '$2y$10$awIRp4a3.vMR2FjGvNM73OxltzjJLaW1Hdp/HSdc6s0iD1m6VY9ty', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (220, '1249', '林长明', '000000', '$2y$10$sfEuuQyhvZOkGNb.jajOO.4AEWOjTOm0BfgMSukAoZ6j9sa4uHx2m', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (221, '1250', '杜睦恒', '000000', '$2y$10$T5Mr1hO0uTGB5elCpD90S.JTphpdIwrbB3nib/B9lRXVjDbSfUfKW', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (222, '1251', '秦学', '000000', '$2y$10$r8.Q6f9mEozYxVfTOdkFfevxAMwqYlJo5CuI5VMyyd5h4/c2GLPMy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (223, '1252', '宋学双', '000000', '$2y$10$fgoDz7TRuVDBmoeNfBs76e0MuzSZyC4BkgqlK4Ita5ynwoWTadBW.', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (224, '1253', '王宝军', '000000', '$2y$10$MYth12FIes7gE.pqWcUfnup0bWXIUIWd.iMrYH5O5qqDrYfPe0t9q', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (225, '1254', '陈建东', '000000', '$2y$10$817/7kTx7D6ynjfz6LSS4uLhpVSQAQ72CD7.WwhanoudebyoN4.aG', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (226, '1255', '王米审', '000000', '$2y$10$8ht8uFDDKbaAm9c9.q/oWOH6Zi8M6KVEfkSeesyzp3qEkd1s.rz7q', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (227, '1256', '江圣志', '000000', '$2y$10$42NgBaQlGg3g7P34uZUzeeUr/DlsVOX3M5YYvBggI.iw0A13GMX.a', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (228, '1257', '王乃汤', '000000', '$2y$10$uSK69B3JvwPaAl0d7rYgvuHy3dBafRj.wFMK.0LRtZt6.A6ot6gVy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (229, '1258', '李秋敏', '000000', '$2y$10$za1JFrz9Wei9TbZ1j8H1RuKeOEcAVAZl1sXYXtGbB5fSYZgJI9WjO', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (230, '1259', '江春明', '000000', '$2y$10$xSacwPXPjWwHYYAhzgQT8.1AGMO1n4lLPJ8wsRzI/RDbM4ZKaMufu', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (231, '1260', '阮晓燕', '000000', '$2y$10$SzJBe65zksF7PLDI3WrKUejL3wOOavBiGLoF7JxQ1NmMFJkLCxchS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (232, '1261', '高永华', '000000', '$2y$10$JGADy0I8/3NUBlAw8IstfOzrK8L9D0e2ROxJRaoE99IxBaDLSsQAS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (233, '1262', '于立胜', '000000', '$2y$10$e6ZHW4lYXkmpKZFp3eITOerIVDIQF6P/lqpQpd/vI5m7uP5e8vSza', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (234, '1263', '张方林', '000000', '$2y$10$KJKw0BXCeTo.k7nfXjuvKOuk1HiBkjOG41QBchsvX2D/ZSwpUSkOy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (235, '1264', '赵洪杰', '000000', '$2y$10$zE.h62FdrqOFJkDW1Oj0o.07E2AVQRzFVQdGJ982mxD.LZHTVxaQy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (236, '1265', '王学亮', '518518', '$2y$10$OrgIWJ4Fb332vbxCEJI5z.ot8fD5m/ATNtQXW.FBFIwxR1LwURk1O', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (237, '1266', '于海滨', '000000', '$2y$10$DWibxg8FmDGeRteifCfT.uxHj9VsVAXUP2DxgMfHCg.ooxMMSFsq6', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (238, '1267', '杜德强', '000000', '$2y$10$9Mx3jQa9eMP6x4912jiNZOJq1RcfR.sJcINiPjqH5QZjM6vFtEPqi', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (239, '1277', '孙安昌', '000000', '$2y$10$Py37h/XzwtjLfLGiAKYkWubQ/IlvNAcvaK68NMZFFHNU5M0pg9N0q', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (240, '1278', '杜延国', '000000', '$2y$10$m88yXKLktiAtOWg/6sGaDOM.PkTHL6hLraxpJ97bOnukry5iozBPm', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (241, '1279', '孙清波', '000000', '$2y$10$bsKWYhG7fBAqWEcWKo9hGujqZhli3obCEd5tekXboeZWbgSXgb.LO', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (242, '1280', '李珊珊', '000000', '$2y$10$pHw3LcdRTjXwEcxUQhrwie3uwYz02JjiMeGJvIj9dpeQe.I0sxCjq', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (243, '1281', '质量部', '000000', '$2y$10$zarGst9.dsTxDTeLPf581uC4ybx46rQoY3tNlLTaNGWUy9fkzP4gm', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (244, '1283', '江胜锐', '000000', '$2y$10$P7tm/it4aJgAMMD4sTgmVuidlM4tZ.H8WqdxgcKeUS0z8gxt1S34O', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (245, '1284', '李鹏德', '000000', '$2y$10$xbCSe38sufBRqAFvdZp9PesoU7FKWXbnIG0UM66cMFpn4xlhdg3hq', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (246, '1285', '袁亚楠', '000000', '$2y$10$yMn/sbm3QUpPL.xaJAuMnedTIPj1mrGI4ygWh7eBYH3cS2MCA4fYS', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (247, '1286', '张士明', '000000', '$2y$10$KDdLMVZQunlH8TQRrrDl8.WtZ9F7W2lhO0f04KGDoCTu4MsgXjtvC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (248, '1287', '刘世杉', '000000', '$2y$10$cVcG0G9u2cfHHmO5yENId.MsTKDtf5cjU6kIrbe3p2VmmjctrWBKW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (249, '1288', '李国强', '000000', '$2y$10$rhbXEcNFYWQKh8B5YxvxrukzwUzZM7ZtH1L3E4Ti2ZDT/OGGDkxZC', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (250, '1289', '姜贵田', '000000', '$2y$10$tgDNSWkG4z6k5bG8DsClQuK4kYMTavMegBkoXLAcGcPDRoTwV.Mo2', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (251, '1290', '硬度分选', '000000', '$2y$10$X2re9kw98rhSII56mudtguVv3vqAGGLHeZVeoEtYkD93AusEgBc22', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (252, '1291', '余温热处理', '000000', '$2y$10$jWlo.UJC8z4iav1T1JrQeOOWF7X9vv0qmwTtrlfqa5k5TyAwhWJAa', '2', 4, '10', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (253, '1292', '于忠银', '123456', '$2y$10$VDj/RnI8nkwUH0nD5A6uveatKniMHVyjdl.wOBMx/ZuwUedZNuYeS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (254, '1293', '王振星', '123456', '$2y$10$lZcegC8RPW4GnYNchhbrqumnbOdlkh5U5Vo5FhaiKZekooLobGWR6', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (255, '1294', '王启后', '123456', '$2y$10$MRPTrkP9mWFWVe07jKqNkeIsw0OxAVE1Yp5ldFSeKQTgEUP1jPV06', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (256, '1295', '卜凡士', '123456', '$2y$10$suHKTwWmSFuYjBN4TuTi4OC8OVO9icznw5AUsSWZQEwJPZFUHjYny', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (257, '1296', '秦振洲', '123456', '$2y$10$UnIFn/d7xTBbcXmGUJ0Aue96LcGKGOaMEw9UkATKg0rcaPLpJUoYy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (258, '1297', '徐加珍', '123456', '$2y$10$CUCczwdUYavLCfbyo9xOquiDJc.XbwFeot9BlrPnc4k9sH/sNXQ6W', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (259, '1298', '林长明', '123456', '$2y$10$4LSm6Wde8bFa0y5RJYP94OrBARRivLDVEzlmlIc3CEAxUQGnnSvZ6', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (260, '1400', '张静', '000000', '$2y$10$p0iprElBbFvGkfjyWd6N3uOtwvLvr2mzccBGgdgsNP5yBxODI4w7a', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (261, '1401', '金成英', '000000', '$2y$10$C.WF2PUe/4PN8cHQl4Ef.udZOA7KQEsGDUHj9bHZ12M/qR07PFh2u', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (262, '1402', '江秀丽', '000000', '$2y$10$nyUPE2lPhJz1MW/oSV9Gt.VB4RS5gZ/iQ7UgrgRilAD1B36brPyOW', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (263, '1403', '王娟', '000000', '$2y$10$1mMj0eEeknTGZBI4ny6wgeCQDi2nzNMyOZ93RZ0MZon5YglBuiUAy', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (264, '1404', '刘海云', '000000', '$2y$10$hXdOhIGiPLMpW9Z6ZvotA.Wtmg87tMzGOsRjNty12VIhEcA6B.B1S', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (265, '1405', '刘焕玲', '000000', '$2y$10$ncIDH.tge.5drrmOYuSDVe1EISQVVZTqrqx04ns11mGAfWkRIkyoS', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (266, '1406', '赫晓霞', '000000', '$2y$10$7n9XvB0HFCQexEYIs3V/3O/RQnHnn2lGmMXJIoGJTmZW97eABmk9C', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (267, '1407', '张媛媛', '000000', '$2y$10$8yq4QPKtZ.y7l7cxKkOoreewo3GzigtsrTwNhaJGiYhPIULF9hpii', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (268, '1408', '刘美连', '000000', '$2y$10$ksnIVFhGNnQ8pjX9jhsUE.cFOFCVYhMakF3B0TflDPUIwz9K4dFH6', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (269, '1409', '刘仁苹', '000000', '$2y$10$g.cSgeUivy5LjPu6q3xb5.4m9bpLKCEadAPKRpiOgPb3ov2PqOzbW', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (270, '1410', '桑春红', '000000', '$2y$10$0R7NcddDF1DSzGsbH.0DbuGaJpdYkFXtz.prIie94ArpoQEHuuRE6', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (271, '1411', '刘彦梅', '000000', '$2y$10$kASXvNGm6upinM9C2JKHC.R92fTVUn9cDqLYWH0/meYMmQ0Qdbgk2', '2', 4, '10', '', NULL, 0, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (272, '1412', '贺莎莎', '000000', '$2y$10$FRvjAHW3p6Eobqp27.dWsOQCNmMvnungUHi3DT1TKVUIX0vCG20e6', '2', 4, '10', '', NULL, 0, NULL, 0, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (273, 'ceshi', '测试1', '111111', '$2y$10$Ljw/Tb5thGPqrVUZEliGK.2yrYAb5mwh2pEkGhZk.Ojor9QwtnjeC', '2', 6, '2', '', NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (277, 'qqqqq', NULL, '$2y$10$XPRIAKcKZ39cIOnbrYknAevQ673uffGGfJqnwJhdUTFgHSiypuVae', '$2y$10$ujN7.D0V5YgqZ0EbYRwlfeiA83i/UP43BrjoqrkrrkUZXkUwQh/5G', NULL, NULL, NULL, 'qqqqq@qq.com', NULL, NULL, NULL, 0, NULL, 1, '2018-06-01 08:38:33', '2018-06-01 08:38:33', NULL);
INSERT INTO `t_user2` VALUES (280, 'df1', '丁峰', '111111', '$2y$10$hWP9P21uOkt7WW/krri2xugYPGwdVwPidi18wHiO7sBZ.6DutWtCO', '2', 4, '2', 'df1@qq.com', NULL, 0, NULL, 0, NULL, 1, '2018-06-01 14:33:10', '2018-06-01 14:33:10', NULL);
INSERT INTO `t_user2` VALUES (283, 'lisi', NULL, NULL, '$2y$10$v7uD/.tGaslaTj1AC0O7TOuJyEhKCCu6Wy.KWjrnlXTtFAGhn3Cgu', NULL, NULL, NULL, 'lisi@qq.com', NULL, NULL, NULL, 0, NULL, 1, '2018-06-04 02:51:22', '2018-06-04 02:51:22', NULL);
INSERT INTO `t_user2` VALUES (282, 'wangsan', NULL, NULL, '$2y$10$cK7zu2Qx583dohTDFuWpAeMXKPi0Zj4oMfKuRG0BhiX9d30lHT43y', NULL, NULL, NULL, 'wangsan@qq.com', NULL, NULL, NULL, 0, NULL, 1, '2018-06-02 08:17:15', '2018-06-02 08:17:15', NULL);
INSERT INTO `t_user2` VALUES (285, '10666', NULL, '111111', '$2y$10$WRhUsVbiXe.fpQ708pj8n.cFC.pd9d1lfzboFHuUSTI/p1JEwxlrG', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, 1, '2018-06-04 04:42:48', '2018-06-04 04:42:48', NULL);
INSERT INTO `t_user2` VALUES (286, '3800', 'group1', '111111', '$2y$10$sjXr.Nk34/cwv/sJ3RNg9.kAYaYnTEmeprloe3W.tisyXdtq23kW6', NULL, 4, '6', NULL, NULL, 1, NULL, 1, NULL, 1, '2018-06-29 02:16:59', '2018-06-29 02:16:59', NULL);
INSERT INTO `t_user2` VALUES (287, 'comuser', NULL, NULL, '$2y$10$9Ig8aAQxltFVxRDcjX6QtuAFcHecjxYKkgO6hOZLQHhBCdthnjFYi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, '2018-08-15 03:35:08', '2018-08-15 03:35:08', NULL);
INSERT INTO `t_user2` VALUES (288, 'asdf3', '地方大幅度', '111111', '$2y$10$AsJ0At5amWzoOH15.DfJxOQplFzA0Ec8MmfxQYifYX49mhc0HINFO', '2', 4, '2', NULL, NULL, 0, NULL, 1, NULL, 0, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (289, 'uuu', 'uuu', '111111', '$2y$10$vNHeq5UcQP1FKDOS5YP/g.MzTgYRIVDHLgp18rvvv0dUFFu6TthdW', '2', 6, '6', NULL, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, NULL);
INSERT INTO `t_user2` VALUES (290, '59989301', '测试名2', '59989301', '$2y$10$U4J5BJPq4NCQDpJCpSmzl.sCodbP.pNCke4HZ.mh.Y/z1/XVDb3ZW', '3', 13, '6', NULL, NULL, 0, NULL, 0, NULL, 1, NULL, NULL, 2);

-- ----------------------------
-- Table structure for t_workcenter
-- ----------------------------
DROP TABLE IF EXISTS `t_workcenter`;
CREATE TABLE `t_workcenter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wc_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作中心编号',
  `wc_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `dpt_id` int(11) NOT NULL COMMENT '所属车间',
  `per_persons` int(11) NULL DEFAULT NULL,
  `daily_cycle` int(11) NULL DEFAULT NULL COMMENT '每日班次',
  `cycle_time` decimal(10, 0) NULL DEFAULT NULL COMMENT '每班时数',
  `cycle_devices` int(11) NULL DEFAULT NULL COMMENT '每班设备数',
  `efficiency` decimal(10, 0) NULL DEFAULT NULL COMMENT '效率',
  `descript` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cost_mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本核算标志',
  `cost_center` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成本中心选择',
  `distribute_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用分摊方式',
  `produce_fee` decimal(10, 0) NULL DEFAULT NULL COMMENT '加工费',
  `fix_fee` decimal(10, 0) NULL DEFAULT NULL COMMENT '固定费',
  `mechine_fee` decimal(10, 0) NULL DEFAULT NULL COMMENT '机器损耗费用',
  `float_fee` decimal(10, 0) NULL DEFAULT NULL COMMENT '变动费用',
  `time_rate` decimal(10, 0) NULL DEFAULT NULL COMMENT '工时费率',
  `extra_rate` decimal(10, 0) NULL DEFAULT NULL COMMENT '加班工时费率',
  `calculate_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '计时/计件单价',
  `wc_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司编号',
  `pstate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_workcenter
-- ----------------------------
INSERT INTO `t_workcenter` VALUES (2, '001', '锻压1线', 4, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '1');
INSERT INTO `t_workcenter` VALUES (6, '555', '锻压3线', 4, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '1');
INSERT INTO `t_workcenter` VALUES (7, '066', '管件600', 6, 0, 0, 0, 0, 0, '<p>test<br/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '1');
INSERT INTO `t_workcenter` VALUES (8, '123', '200抛丸机', 6, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '1');
INSERT INTO `t_workcenter` VALUES (10, '100', '300线', 6, NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '-1');
INSERT INTO `t_workcenter` VALUES (11, '666', '铸锻1', 4, 10, 2, 4, 3, 90, '<p>铸锻1<br/></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 0, '-1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'test2', '666');
INSERT INTO `user` VALUES (14, 'ad', '111111');
INSERT INTO `user` VALUES (4, 'test4 ', '888');
INSERT INTO `user` VALUES (5, 'test5', '555');
INSERT INTO `user` VALUES (13, 'aaa', '111111');

SET FOREIGN_KEY_CHECKS = 1;
