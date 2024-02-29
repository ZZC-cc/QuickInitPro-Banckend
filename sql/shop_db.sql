/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : shop_db

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2023-12-10 18:36:03
*/

USE `schoolResourcems`;

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`
(
    `id`           bigint(20)     NOT NULL AUTO_INCREMENT COMMENT '订单明细ID',
    `orderId`      bigint(20)     NOT NULL COMMENT '订单ID（外键关联订单主表）',
    `productId`    bigint(20)     NOT NULL COMMENT '商品ID（外键关联商品表）',
    `count`        int(11)        NOT NULL COMMENT '商品数量',
    `total`        double(10, 2)  NOT NULL COMMENT '小计金额',
    `productName`  varchar(256)   NOT NULL COMMENT '商品名称',
    `productPrice` decimal(10, 2) NOT NULL COMMENT '商品价格',
    `productImage` varchar(255)   NOT NULL COMMENT '商品图片路径',
    PRIMARY KEY (`id`),
    KEY `orderId` (`orderId`),
    KEY `productId` (`productId`),
    CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
    CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1733796193737437188
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item`
VALUES ('1733380948296470530', '1733380948229361666', '1731314359040516097', '6', '5999.94', '佩恩坤', '999.99',
        'https://pic3.zhimg.com/80/v2-b7443a0b33d2a68a5174f5c4c2229f36_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733380948296470531', '1733380948229361666', '1731313928390352897', '2', '2599.98', '美国坤长', '1299.99',
        'https://pic2.zhimg.com/80/v2-de9bcc0cca5f34dceded94e288ad3239_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733380948296470532', '1733380948229361666', '1731315105714708482', '4', '2399.96', '小坤迪', '599.99',
        'https://pic3.zhimg.com/80/v2-13540d2afec1335b45f9f0c1f998b74e_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733380948296470533', '1733380948229361666', '1731312219450548225', '3', '1589.97', '波风水坤', '529.99',
        'https://pic3.zhimg.com/80/v2-97faf15d76dc006c111dc7ba7069c9b2_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733380948296470534', '1733380948229361666', '1731279485311176705', '3', '4799.97', '绿巨坤', '1599.99',
        'https://pic4.zhimg.com/80/v2-90c8017b4f30e6ab9df1661fc7bf86ef_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733388572295434241', '1733388572232519681', '1731314912239853570', '3', '2399.97', '痞老坤', '799.99',
        'https://pic1.zhimg.com/80/v2-64bd7ebf640fce85f1c698e0fabdbbd0_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733388572295434242', '1733388572232519681', '1731313488059736066', '5', '799.95', '海绵坤坤', '159.99',
        'https://pic1.zhimg.com/80/v2-5462014e90d25acd91e1f59f85263a74_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733388572295434243', '1733388572232519681', '1731315293187514370', '4', '1999.96', '珊坤', '499.99',
        'https://pic4.zhimg.com/80/v2-1f1dacebbddee4f6fb5ca1f8d7cd848b_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733388572295434244', '1733388572232519681', '1731314128534151169', '5', '349.95', '泡芙坤老师', '69.99',
        'https://pic2.zhimg.com/80/v2-0bff7671e0183759f6382695fd77da05_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733397664883806211', '1733397664883806210', '1731314359040516097', '4', '3999.96', '佩恩坤', '999.99',
        'https://pic3.zhimg.com/80/v2-b7443a0b33d2a68a5174f5c4c2229f36_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733397664883806212', '1733397664883806210', '1731314665933545473', '3', '1499.97', '电玩小坤', '499.99',
        'https://pic4.zhimg.com/80/v2-2ff5434ae860680ca48aaad994bbb39f_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733397664883806213', '1733397664883806210', '1731251975273893889', '8', '15111.04', '鸡娃子', '1888.88',
        'https://pic1.zhimg.com/80/v2-7a890ccf3c912be16c031b4de5887490_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733397664950915074', '1733397664883806210', '1731251994462834689', '3', '2666.64', '可达坤', '888.88',
        'https://pic3.zhimg.com/80/v2-9316ef095e41984b67d1b477d47ce22e_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075621826562', '1733511075621826561', '1733503292088315906', '1', '999.99', '大大坤', '999.99',
        'https://pic3.zhimg.com/80/v2-0f63c75fcb9b04366c4e8ff3979f093a_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075621826563', '1733511075621826561', '1733492068692848641', '1', '299.99', '小小坤', '299.99',
        'https://pic2.zhimg.com/80/v2-6a53d3f4d847654b5442a8ff4a1ad7c5_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075621826564', '1733511075621826561', '1733503393863102465', '1', '599.99', '开心超坤', '599.99',
        'https://pic3.zhimg.com/80/v2-a9c3d69a9de1c0ee57024f770d6f854e_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075621826565', '1733511075621826561', '1733502619510697985', '1', '699.99', '花心超坤', '699.99',
        'https://pic1.zhimg.com/80/v2-b6a0ad9d243e76ff7670ab1b6ba6a1fc_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075684741121', '1733511075621826561', '1733502155742310402', '1', '699.99', '甜心超坤', '699.99',
        'https://pic1.zhimg.com/80/v2-397c4d7e62560b683ba6861d49487b84_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075684741122', '1733511075621826561', '1733493933530738689', '1', '399.99', '粗心超坤', '399.99',
        'https://pic2.zhimg.com/80/v2-5984ca4b18d5c93db82f369bfe180691_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733511075684741123', '1733511075621826561', '1733493830258585602', '1', '699.99', '小心超坤', '699.99',
        'https://pic3.zhimg.com/80/v2-104af5a86f119d0856156970f1cfca3e_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260172079106', '1733521260109164545', '1733490494683803650', '1', '799.99', '大娃坤', '799.99',
        'https://pic2.zhimg.com/80/v2-88ec6f8c6d3305122664dd18a28730e5_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260172079107', '1733521260109164545', '1733495280485330945', '1', '799.99', '二娃坤', '799.99',
        'https://pic1.zhimg.com/80/v2-e8306269e7a293c5f44fa715238d60e4_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260172079108', '1733521260109164545', '1733487037843304450', '1', '599.99', '三娃坤', '599.99',
        'https://pic1.zhimg.com/80/v2-739e48aa5bc157efdf321db714072f2c_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260172079109', '1733521260109164545', '1733488660544024578', '1', '499.99', '水娃坤', '499.99',
        'https://pic3.zhimg.com/80/v2-f5831c96080ae4cd2f38ac993c72f042_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260172079110', '1733521260109164545', '1733488928065122305', '1', '599.99', '火娃坤', '599.99',
        'https://pic1.zhimg.com/80/v2-358d433a65d882209649af02566296e4_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260239187970', '1733521260109164545', '1733491188459433985', '1', '349.99', '六娃坤', '349.99',
        'https://pic2.zhimg.com/80/v2-a4d1738c8ba9499047a3b223a7257f65_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260239187971', '1733521260109164545', '1733487849478877185', '1', '399.99', '七娃坤', '399.99',
        'https://pic4.zhimg.com/80/v2-7dab10442cd02ecd6ad227fc3f671c1b_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733521260239187972', '1733521260109164545', '1733487282689994753', '1', '899.99', '爷爷坤', '899.99',
        'https://pic1.zhimg.com/80/v2-58818a983f4d4ea0f46468fd7178a860_1440w.webp');
INSERT INTO `order_item`
VALUES ('1733796193737437187', '1733796193737437186', '1731251975273893889', '1', '1888.88', '鸡娃子', '1888.88',
        'https://pic1.zhimg.com/80/v2-7a890ccf3c912be16c031b4de5887490_1440w.webp');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    `userId`       bigint(20) NOT NULL COMMENT '用户ID（外键关联用户表）',
    `orderNumber`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单编号',
    `totalCount`   int(20)    NOT NULL                                           DEFAULT '0',
    `orderStatus`  int(1)     NOT NULL                                           DEFAULT '0' COMMENT '订单状态: 1已下单, 2已支付, 3已发货, 4已完成',
    `payMethod`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '支付方式',
    `totalAmount`  double(10, 2)                                                 DEFAULT NULL COMMENT '订单总金额',
    `userName`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '用户名',
    `phoneNumber`  varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  DEFAULT NULL COMMENT '手机号',
    `address`      text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '用户地址',
    `checkoutTime` datetime   NOT NULL COMMENT '下单时间',
    `payTime`      datetime                                                      DEFAULT NULL COMMENT '支付时间',
    PRIMARY KEY (`id`),
    KEY `userId` (`userId`),
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `notice` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1733796193737437187
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders`
VALUES ('1733380948229361666', '1731230205284265986', 'NO.1702105197386', '18', '1', '微信支付', '17389.82', '小鸡子',
        '13531201154', '中国妈妈省的大鸡市中鸡区小鸡村382号', '2023-12-09 14:59:57', '2023-12-09 15:00:02');
INSERT INTO `orders`
VALUES ('1733388572232519681', '1731230205284265986', 'NO.1702107015092', '17', '1', '微信支付', '5549.83', '小鸡子',
        '13531201154', '中国妈妈省的大鸡市中鸡区小鸡村382号', '2023-12-09 15:30:15', '2023-12-09 15:30:20');
INSERT INTO `orders`
VALUES ('1733397664883806210', '1731230205284265986', 'NO.1702109182945', '18', '1', 'PY支付', '23277.61', '小鸡子',
        '13531201154', '中国妈妈省的大鸡市中鸡区小鸡村382号', '2023-12-09 16:06:23', '2023-12-09 16:06:28');
INSERT INTO `orders`
VALUES ('1733511075621826561', '1733482966231085057', 'NO.1702136222171', '7', '1', '微信支付', '4399.93', '郑梓聪',
        '13531201154', '广东省东莞市寮步镇东莞城市学院学6菜鸟驿站', '2023-12-09 23:37:02', '2023-12-09 23:37:07');
INSERT INTO `orders`
VALUES ('1733521260109164545', '1733482966231085057', 'NO.1702138650347', '8', '1', 'PY支付', '4949.92', '郑梓聪',
        '13531201154', '广东省东莞市寮步镇东莞城市学院学6菜鸟驿站', '2023-12-10 00:17:30', '2023-12-10 00:17:35');
INSERT INTO `orders`
VALUES ('1733796193737437186', '1733482966231085057', 'NO.1702204199630', '1', '1', '微信支付', '1888.88', '郑梓聪',
        '13531201154', '广东省东莞市寮步镇东莞城市学院学6菜鸟驿站', '2023-12-10 18:30:00', '2023-12-10 18:30:05');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`
(
    `id`                 bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '商品ID',
    `productName`        varchar(256)                                            NOT NULL COMMENT '商品名称',
    `productDescription` text                                                    NOT NULL COMMENT '商品介绍',
    `productPrice`       double(10, 2)                                           NOT NULL,
    `productTags`        varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标签',
    `stockQuantity`      int(11)                                                 NOT NULL COMMENT '商品库存量',
    `productImage`       varchar(255)                                            NOT NULL,
    `createTime`         datetime                                                NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`         datetime                                                NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1733503686843625475
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product`
VALUES ('1731247631703052290', '坤卡丘',
        '可爱形象，独特设计，是个萌萌的陪伴！电能释放，增添活力，为您的生活注入闪电般的快乐体验', '999.99',
        ' 神奇宝贝联名,热卖商品,Hot,送运费险', '100',
        'https://pic1.zhimg.com/80/v2-bfc23bb862df1b7361d2bc38f56473bc_1440w.webp', '2023-12-03 17:42:55',
        '2023-12-10 00:01:42');
INSERT INTO `product`
VALUES ('1731251975273893889', '鸡娃子',
        '世界上有五种好：早上好、中午好、晚上好、大家好，还有全民制作人们大家好 被识破了，我不装了，我就是IKUN，你们这群小黑让我怎么荔枝?卤出鸡脚了吧！',
        '1888.88', '收藏上千,七天无理由', '100',
        'https://pic1.zhimg.com/80/v2-7a890ccf3c912be16c031b4de5887490_1440w.webp', '2023-12-03 18:00:10',
        '2023-12-10 00:12:02');
INSERT INTO `product`
VALUES ('1731251994462834689', '可达坤',
        '身形稳重，功能强大，是您生活助力的不二之选！智能互动，便捷实用，成就更高效的生活方式', '888.88',
        ' 神奇宝贝联名,送运费险,七天无理由,收藏上千', '999',
        'https://pic3.zhimg.com/80/v2-9316ef095e41984b67d1b477d47ce22e_1440w.webp', '2023-12-03 18:00:15',
        '2023-12-10 00:03:04');
INSERT INTO `product`
VALUES ('1731279485311176705', '绿巨坤', '威猛霸气，力量无穷，是您战胜挑战的利器！神秘力量，引领新时代，成就非凡人生',
        '1599.99', '送运费险,七天无理由', '888',
        'https://pic4.zhimg.com/80/v2-90c8017b4f30e6ab9df1661fc7bf86ef_1440w.webp', '2023-12-03 19:49:29',
        '2023-12-06 21:41:02');
INSERT INTO `product`
VALUES ('1731310396585058305', '路坤',
        '路坤：稳健之选，打造您的旅途伴侣，行路更安心！精湛工艺，时尚设计，让旅行变得更加畅快无阻！', '499.99', '七天无理由',
        '888', 'https://pic2.zhimg.com/80/v2-b399b83ec8b7fce0a674f7bcea00b949_1440w.webp', '2023-12-03 21:52:19',
        '2023-12-04 00:19:07');
INSERT INTO `product`
VALUES ('1731310781257261058', '小坤佩奇', '活泼可爱，陪伴您的小伙伴，带来欢笑无限！精选材质，给您温暖的陪伴与快乐时光！',
        '299.99', '热卖商品,Hot', '777', 'https://pic4.zhimg.com/80/v2-e7776d7562f28493260b153e55fc6f57_1440w.webp',
        '2023-12-03 21:53:51', '2023-12-04 00:16:48');
INSERT INTO `product`
VALUES ('1731310954398130178', '财神坤', '财富之源，招财进宝，助您财源滚滚！金色设计，高贵典雅，为您的生活注入繁荣和好运！',
        '888.88', '七天无理由', '888', 'https://pic1.zhimg.com/80/v2-d346bfecac15bbb6bd11f8860ba27d2c_1440w.webp',
        '2023-12-03 21:54:32', '2023-12-04 00:19:04');
INSERT INTO `product`
VALUES ('1731311302869295106', '菠萝吹坤',
        '清新可爱，伴您欢笑不停！独特造型，轻松愉悦，带给您无尽的欢乐时光，让生活更加多彩！', '199.99', '热卖商品,Hot', '666',
        'https://pic3.zhimg.com/80/v2-cd965096fbaf46f9596bb58c7b09b0fa_1440w.webp', '2023-12-03 21:55:55',
        '2023-12-04 00:16:40');
INSERT INTO `product`
VALUES ('1731311510676086785', '电坤小子', '充满能量，助您打破瓶颈，闪电般进步！独特设计，时尚科技，是您事业成功的助力之选！',
        '599.99', '送运费险,热卖商品', '777',
        'https://pic3.zhimg.com/80/v2-78cf3df798e3fc4237328bfcf0f94d66_1440w.webp', '2023-12-03 21:56:45',
        '2023-12-09 23:47:48');
INSERT INTO `product`
VALUES ('1731311689345048577', '喵坤',
        '萌态十足，是您生活中的甜蜜小伙伴！可爱造型，柔软触感，给您带来温馨和欢笑，成为您的快乐源泉！', '399.99',
        '七天无理由,收藏上千', '888', 'https://pic2.zhimg.com/80/v2-f95c26d326c5dcd9a0846d8efa020791_1440w.webp',
        '2023-12-03 21:57:27', '2023-12-10 00:05:24');
INSERT INTO `product`
VALUES ('1731311915183153154', '愤怒的小坤', '勇猛无畏，是您战胜困难的力量象征！独特设计，彰显个性，助您勇往直前，迎接挑战！',
        '449.99', '热卖商品,送运费险', '777',
        'https://pic3.zhimg.com/80/v2-18cfcdb011a3f18a347b307c5fd36102_1440w.webp', '2023-12-03 21:58:21',
        '2023-12-10 00:00:32');
INSERT INTO `product`
VALUES ('1731312219450548225', '波风水坤', '风起云涌，是您追逐梦想的助力战友！独特风格，时尚潮流，带您驰骋在生活的浪潮中！',
        '529.99', '火影忍者联名,收藏上千', '888',
        'https://pic3.zhimg.com/80/v2-97faf15d76dc006c111dc7ba7069c9b2_1440w.webp', '2023-12-03 21:59:34',
        '2023-12-09 23:51:53');
INSERT INTO `product`
VALUES ('1731312868594589697', '卡卡坤', '激萌可爱，陪你笑对生活！独特设计，色彩缤纷，带来无限欢乐，成为您的开心小伙伴！',
        '369.99', '火影忍者联名,七天无理由,热卖商品', '777',
        'https://pic4.zhimg.com/80/v2-59665e8aefcdb30e41eb127d1dbe8be3_1440w.webp', '2023-12-03 22:02:08',
        '2023-12-09 23:52:27');
INSERT INTO `product`
VALUES ('1731313029244821505', '绵坤', '柔软温暖，是您温馨的拥抱！精选细致材质，触感舒适，陪您度过每一个宁静的时光。',
        '249.99', '送运费险,Hot', '888', 'https://pic4.zhimg.com/80/v2-a41b4779963d03ef198bc660ca6b98bb_1440w.webp',
        '2023-12-03 22:02:47', '2023-12-04 00:17:08');
INSERT INTO `product`
VALUES ('1731313144349106177', '坤小果', '口感鲜美，香气四溢，是您健康美味的选择！新鲜时令，营养丰富，为您的生活添味加彩。',
        '39.99', '七天无理由', '999', 'https://pic4.zhimg.com/80/v2-79647e4c8bdf234c459105e394f37b6b_1440w.webp',
        '2023-12-03 22:03:14', '2023-12-04 00:19:37');
INSERT INTO `product`
VALUES ('1731313269955928066', '漩涡鸣坤', '勇往直前，助你战胜一切困境！独特设计，激发潜能，成就无限可能，开启冒险之旅！',
        '569.99', '火影忍者联名,送运费险,收藏上千', '777',
        'https://pic3.zhimg.com/80/v2-a2746308894359e113bcc205e10314ce_1440w.webp', '2023-12-03 22:03:44',
        '2023-12-09 23:51:41');
INSERT INTO `product`
VALUES ('1731313488059736066', '海绵坤坤', '活力满满，激情四射，为您带来无尽欢笑！柔软材质，可爱造型，是您生活中的欢乐使者。',
        '159.99', '海绵宝宝联名,Hot,收藏上千', '888',
        'https://pic1.zhimg.com/80/v2-5462014e90d25acd91e1f59f85263a74_1440w.webp', '2023-12-03 22:04:36',
        '2023-12-09 23:54:29');
INSERT INTO `product`
VALUES ('1731313679470993410', '李元坤', '英俊潇洒，是您事业成功的招贵之星！才情横溢，气质非凡，引领成功人生的风采。',
        '799.99', '王者荣耀联名,送运费险,热卖商品', '999',
        'https://pic4.zhimg.com/80/v2-753f6cac1a417dc6c7b46c84ceb07233_1440w.webp', '2023-12-03 22:05:22',
        '2023-12-09 23:54:34');
INSERT INTO `product`
VALUES ('1731313928390352897', '美国坤长', '气质非凡，是您事业成功的象征！高大威猛，自信从容，引领精英之路的不二之选。',
        '1299.99', '送运费险,热卖商品', '999',
        'https://pic2.zhimg.com/80/v2-de9bcc0cca5f34dceded94e288ad3239_1440w.webp', '2023-12-03 22:06:21',
        '2023-12-03 22:13:44');
INSERT INTO `product`
VALUES ('1731314128534151169', '泡芙坤老师',
        '甜美可口，犹如甜蜜课堂的指导明灯！精湛烘焙，口感醇香，是您品味生活的甜蜜选择。', '69.99', '海绵宝宝联名,七天无理由',
        '888', 'https://pic2.zhimg.com/80/v2-0bff7671e0183759f6382695fd77da05_1440w.webp', '2023-12-03 22:07:09',
        '2023-12-10 00:02:09');
INSERT INTO `product`
VALUES ('1731314252291284993', '蜡笔小坤', '色彩缤纷，陪伴您创造美丽世界！创意设计，充满童趣，为您的生活增添色彩与欢笑。',
        '149.99', '送运费险,热卖商品', '777',
        'https://pic2.zhimg.com/80/v2-ddda8506476a70fb07ecde015e63db61_1440w.webp', '2023-12-03 22:07:38',
        '2023-12-03 22:13:47');
INSERT INTO `product`
VALUES ('1731314359040516097', '佩恩坤',
        '一袋米抗几楼，力量神秘，领你走向力量之巅！独特设计，神秘气息，助您成就非凡的英勇人生。', '999.99',
        '火影忍者联名,送运费险,热卖商品', '888',
        'https://pic3.zhimg.com/80/v2-b7443a0b33d2a68a5174f5c4c2229f36_1440w.webp', '2023-12-03 22:08:04',
        '2023-12-09 23:52:58');
INSERT INTO `product`
VALUES ('1731314517660704770', '小李坤', '活力满满，带着微笑点缀您的每一天！可爱造型，清新设计，为您带来愉快的生活体验。',
        '299.99', '火影忍者联名,热卖商品,七天无理由', '888',
        'https://pic2.zhimg.com/80/v2-83e1324450cf4e98ebde10f578ae6c71_1440w.webp', '2023-12-03 22:08:41',
        '2023-12-09 23:58:57');
INSERT INTO `product`
VALUES ('1731314665933545473', '电玩小坤',
        '游戏之星，引领你畅游未知的数字世界！时尚设计，科技感十足，助您体验激情无限的游戏时光。', '499.99',
        '王者荣耀联名,送运费险,热卖商品,收藏上千', '777',
        'https://pic4.zhimg.com/80/v2-2ff5434ae860680ca48aaad994bbb39f_1440w.webp', '2023-12-03 22:09:17',
        '2023-12-09 23:47:42');
INSERT INTO `product`
VALUES ('1731314912239853570', '痞老坤', '时尚潮流，散发着独特的痞气魅力！个性设计，张扬不羁，成就属于你的时尚风采。',
        '799.99', '海绵宝宝联名,送运费险,热卖商品', '888',
        'https://pic1.zhimg.com/80/v2-64bd7ebf640fce85f1c698e0fabdbbd0_1440w.webp', '2023-12-03 22:10:16',
        '2023-12-10 00:07:00');
INSERT INTO `product`
VALUES ('1731315105714708482', '小坤迪', '充满活力，让您在音乐的海洋中畅游！独特造型，激发激情，是您音乐旅程的绝佳伙伴。',
        '599.99', '火影忍者联名,热卖商品', '777',
        'https://pic3.zhimg.com/80/v2-13540d2afec1335b45f9f0c1f998b74e_1440w.webp', '2023-12-03 22:11:02',
        '2023-12-09 23:53:20');
INSERT INTO `product`
VALUES ('1731315293187514370', '珊坤', '清新自然，如同清澈的山泉，滋润您的心灵！优雅设计，宁静氛围，为您营造宁静惬意的生活。',
        '499.99', '海绵宝宝联名,送运费险', '888',
        'https://pic4.zhimg.com/80/v2-1f1dacebbddee4f6fb5ca1f8d7cd848b_1440w.webp', '2023-12-03 22:11:46',
        '2023-12-09 23:54:23');
INSERT INTO `product`
VALUES ('1733484735887634433', '穿山坤',
        '穿越障碍，勇往直前，是您攀登人生巅峰的不二之选！独特设计，坚韧耐用，助您征服一切困难！', '699.99',
        '葫芦娃联名,送运费险,热卖商品', '888',
        'https://pic3.zhimg.com/80/v2-31da2d95c8661263f655e3c343e2c9f2_1440w.webp', '2023-12-09 21:52:22',
        '2023-12-10 00:06:34');
INSERT INTO `product`
VALUES ('1733484981560602625', '炭坤郎',
        '深邃内敛，如同炭火般沉稳，是您生活中的低调品味之选！优雅设计，经典氛围，为您打造质感生活。', '899.99',
        '送运费险,热卖商品,Hot,收藏上千', '777',
        'https://pic2.zhimg.com/80/v2-d70e1287e09d30adb74ca0b13b29770d_1440w.webp', '2023-12-09 21:53:20',
        '2023-12-09 21:54:16');
INSERT INTO `product`
VALUES ('1733485134686253057', '杰尼坤',
        '时尚前卫，独具潮流品味，是您展现个性的不可或缺之选！创意设计，张扬个性，助您成为时尚先锋。', '799.99',
        ' 神奇宝贝联名,送运费险,热卖商品,收藏上千', '888',
        'https://pic1.zhimg.com/80/v2-e49cbda13f589bded63fe54e06ecd324_1440w.webp', '2023-12-09 21:53:57',
        '2023-12-10 00:02:52');
INSERT INTO `product`
VALUES ('1733485493450240001', '哆啦坤梦',
        '梦幻可爱，如同梦中仙境，带您漫游奇妙世界！童趣设计，温馨陪伴，为您的生活添上一抹甜蜜。', '349.99',
        '热卖商品,Hot,收藏上千,送运费险', '777',
        'https://pic1.zhimg.com/80/v2-bdf16fe108da6189447135d2fe273258_1440w.webp', '2023-12-09 21:55:22',
        '2023-12-09 21:55:22');
INSERT INTO `product`
VALUES ('1733485720223674369', '玛卡坤卡',
        '源自自然，滋补身心，是您健康生活的最佳伙伴！纯正原料，独特配方，为您带来能量满满的美好生活。', '149.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic1.zhimg.com/80/v2-0b7c6e6bcf82f36b63ad8edee19c48ac_1440w.webp',
        '2023-12-09 21:56:16', '2023-12-09 21:56:16');
INSERT INTO `product`
VALUES ('1733485855599030273', '帅坤',
        '风华绝代，如同流星划破夜空，是您成功路上的耀眼明星！潮流设计，个性独特，为您赢得尊敬与喝彩。', '899.99',
        '热卖商品,Hot,收藏上千,送运费险', '777',
        'https://pic4.zhimg.com/80/v2-a062f079a4225d36a53b182a0f2c54ab_1440w.webp', '2023-12-09 21:56:49',
        '2023-12-09 21:57:01');
INSERT INTO `product`
VALUES ('1733486076634656769', '杀坤特',
        '无敌霸气，如同英雄崛起，是您勇往直前的不朽传奇！独特设计，彰显英雄本色，助您战胜一切困难。', '999.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic1.zhimg.com/80/v2-1923378d72ba1bd0f4de700b945c7bf8_1440w.webp',
        '2023-12-09 21:57:41', '2023-12-09 21:57:41');
INSERT INTO `product`
VALUES ('1733486294281285633', '橙留坤', '清新自然，如同橙子般清香，为您的生活增添一份愉悦与惬意！精致设计，宛如世外桃源。',
        '399.99', '热卖商品,Hot,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-3a82eabdf414d8e87a9822e1d507f84d_1440w.webp', '2023-12-09 21:58:33',
        '2023-12-09 21:58:43');
INSERT INTO `product`
VALUES ('1733486515686010881', '独角紫毛坤',
        '神秘幻想，如同童话世界的仙境，为您带来无尽的梦幻冒险！独特设计，激发奇幻想象，成就您的独特风采。', '699.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic2.zhimg.com/80/v2-3b54f2a7ef8d7f50c539d0905fe3e09d_1440w.webp',
        '2023-12-09 21:59:26', '2023-12-09 21:59:26');
INSERT INTO `product`
VALUES ('1733486679632965633', '旺坤',
        '繁荣昌盛，如同金鸡报晓，为您带来好运连连！吉祥设计，寓意吉祥如意，助您迎接一切好运与成功。', '499.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic4.zhimg.com/80/v2-7c50271891a4ae965f27b8d9ced1a357_1440w.webp',
        '2023-12-09 22:00:05', '2023-12-09 22:00:05');
INSERT INTO `product`
VALUES ('1733487037843304450', '三娃坤', '铜头铁臂、钢筋铁骨、刀枪不入，但怕以柔克刚，且屁股不能挡钝器。', '599.99',
        '葫芦娃联名,热卖商品,Hot,送运费险', '888',
        'https://pic1.zhimg.com/80/v2-739e48aa5bc157efdf321db714072f2c_1440w.webp', '2023-12-09 22:01:31',
        '2023-12-09 23:50:01');
INSERT INTO `product`
VALUES ('1733487173176717313', '小蛙坤',
        '灵动可爱，如同清泉荡漾，为您带来生活中的一抹清新与可爱！童趣设计，陪伴您的美好时光。', '299.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic2.zhimg.com/80/v2-4e7cd94a2ba092c0c2419b3988e9dc49_1440w.webp',
        '2023-12-09 22:02:03', '2023-12-09 22:02:03');
INSERT INTO `product`
VALUES ('1733487282689994753', '爷爷坤',
        '智慧慈祥，如同岁月的见证，为您带来家庭的温馨与和谐！稳重设计，象征着家族的坚实根基。', '899.99',
        '葫芦娃联名,热卖商品,Hot,送运费险', '777',
        'https://pic1.zhimg.com/80/v2-58818a983f4d4ea0f46468fd7178a860_1440w.webp', '2023-12-09 22:02:29',
        '2023-12-09 23:50:40');
INSERT INTO `product`
VALUES ('1733487849478877185', '七娃坤',
        '最小，没多大本领，倍受哥哥们的关爱，有宝葫芦，可以吸入魔法、兵器和妖怪，在第一部刚出世时蒙蔽双眼，十分听从妖精的话，把六位哥哥吸进宝葫芦。',
        '399.99', '葫芦娃联名,热卖商品,Hot,送运费险', '888',
        'https://pic4.zhimg.com/80/v2-7dab10442cd02ecd6ad227fc3f671c1b_1440w.webp', '2023-12-09 22:04:44',
        '2023-12-09 23:50:44');
INSERT INTO `product`
VALUES ('1733488417874178050', '坤二',
        '曾经和哥哥坤大一起保护森林，后来游历人类小镇，之后回到并继续保护丛林，后来森林不再受到砍伐，又继续保护动物，是狗坤岭森林守卫者中的二号人物',
        '299.99', '熊出没联名,热卖商品,Hot,送运费险', '777',
        'https://pic1.zhimg.com/80/v2-92bd580105f7920ab0cbf6a35d699b14_1440w.webp', '2023-12-09 22:07:00',
        '2023-12-10 00:05:53');
INSERT INTO `product`
VALUES ('1733488660544024578', '水娃坤', '隐身术，虚化身体（能穿过透光的物体），来无影去无踪，聪明机灵，最善于偷盗和行动。',
        '499.99', '葫芦娃联名,热卖商品,Hot,送运费险', '888',
        'https://pic3.zhimg.com/80/v2-f5831c96080ae4cd2f38ac993c72f042_1440w.webp', '2023-12-09 22:07:58',
        '2023-12-09 23:49:03');
INSERT INTO `product`
VALUES ('1733488928065122305', '火娃坤', '激情燃烧，如同炽热的烈焰，喷火、吸火、霹雳，但在寒冷环境下体内火力会被逐渐耗尽。',
        '599.99', '葫芦娃联名,热卖商品,Hot,送运费险', '777',
        'https://pic1.zhimg.com/80/v2-358d433a65d882209649af02566296e4_1440w.webp', '2023-12-09 22:09:01',
        '2023-12-09 23:49:07');
INSERT INTO `product`
VALUES ('1733489062547091457', '蜜桃坤',
        '甜美可口，如同夏日的蜜桃，为您带来清新与甜蜜的味蕾享受！甜蜜设计，为您的生活增添一份甜美。', '399.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic1.zhimg.com/80/v2-8b2d0288bbe4f5b62dc8a0fe4fd74238_1440w.webp',
        '2023-12-09 22:09:33', '2023-12-09 22:09:33');
INSERT INTO `product`
VALUES ('1733489226225610753', '高达坤',
        '机械战士，如同未来世界的守护者，为您带来科技与力量的结合！机械设计，展现无限未来可能。', '799.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic3.zhimg.com/80/v2-089fe22b86d4b8ab5394b6d748aad4a2_1440w.webp',
        '2023-12-09 22:10:12', '2023-12-09 22:10:22');
INSERT INTO `product`
VALUES ('1733489724127244290', '坤大',
        '坤大，是动画片《坤出没》系列的主角，是坤兄弟的主心骨，是一头有勇有谋的狗坤，和坤二多次阻挠了光头坤砍伐树木，也多次捉弄光头坤。有时还帮助有困难的光头强和肥波。是坤二的哥哥，坤妈妈的儿子。',
        '899.99', '熊出没联名,热卖商品,Hot,送运费险', '888',
        'https://pic4.zhimg.com/80/v2-f0bed4c40fd7c17db9f8d1d2b88ce3ff_1440w.webp', '2023-12-09 22:12:11',
        '2023-12-10 00:05:50');
INSERT INTO `product`
VALUES ('1733490280992403457', '丁丁坤',
        '丁丁坤（紫色）是个子最高也是最绅士的天线坤坤，到外面散步时，喜欢唱他的丁丁歌。丁丁喜欢跳舞和打滚，最喜欢的东西是一个红色的手提包。他喜欢所有的天线坤坤，但和迪西坤是最好的朋友。',
        '499.99', '热卖商品,Hot,送运费险', '777',
        'https://pic4.zhimg.com/80/v2-458bb6f06c70a24cfd57ba08bcf04193_1440w.webp', '2023-12-09 22:14:24',
        '2023-12-09 22:14:24');
INSERT INTO `product`
VALUES ('1733490494683803650', '大娃坤',
        '刚毅坚定，如同高山巍峨，为您带来坚韧与力量的化身！雄壮设计，彰显大气，让您傲然挺立。', '799.99',
        '葫芦娃联名,热卖商品,Hot,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-88ec6f8c6d3305122664dd18a28730e5_1440w.webp', '2023-12-09 22:15:15',
        '2023-12-09 23:49:21');
INSERT INTO `product`
VALUES ('1733490708299706370', '哈巴坤',
        '欢笑天使，如同开心果般的阳光，为您带来无尽的快乐与幸福！笑容设计，传递正能量，助您开心每一天。', '399.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic3.zhimg.com/80/v2-56a22106f22cf0f166a199631937db0a_1440w.webp',
        '2023-12-09 22:16:06', '2023-12-09 22:36:20');
INSERT INTO `product`
VALUES ('1733491188459433985', '六娃坤', '隐身术，虚化身体（能穿过透光的物体），来无影去无踪，聪明机灵，最善于偷盗和行动。',
        '349.99', '葫芦娃联名,热卖商品,Hot,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-a4d1738c8ba9499047a3b223a7257f65_1440w.webp', '2023-12-09 22:18:00',
        '2023-12-09 23:49:37');
INSERT INTO `product`
VALUES ('1733491405074264065', '唐坤',
        '华丽传奇，如同诗意的古韵，为您带来古典与时尚的完美结合！优雅设计，尽显高贵风采，成就您独特品位。', '899.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic4.zhimg.com/80/v2-4f0dcdc277a2c5638038a295da8d0163_1440w.webp',
        '2023-12-09 22:18:52', '2023-12-09 22:36:22');
INSERT INTO `product`
VALUES ('1733491542714544130', '坤南',
        '阳光海岛，如同度假的心情，为您带来宁静与悠闲的度假体验！海岛设计，让您感受阳光沙滩的温暖。', '599.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic3.zhimg.com/80/v2-79c79d808c2e9546270e9778af213186_1440w.webp',
        '2023-12-09 22:19:25', '2023-12-09 22:36:26');
INSERT INTO `product`
VALUES ('1733491728417353729', '蓝坤',
        '梦幻之境，如同星空般神秘，为您带来无尽的遐想与梦幻之旅！梦幻设计，点亮您的星空梦想。', '699.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic1.zhimg.com/80/v2-6c9262839fee4cdd756f9d826cf03038_1440w.webp',
        '2023-12-09 22:20:09', '2023-12-09 22:20:09');
INSERT INTO `product`
VALUES ('1733491872542027777', '恶霸坤',
        '叛逆不羁，如同独行侠一般，为您带来个性与张扬的独特风采！叛逆设计，助您展现不拘一格的自我。', '499.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic3.zhimg.com/80/v2-87331797e94ab77fd0ed6404cab3c622_1440w.webp',
        '2023-12-09 22:20:43', '2023-12-09 22:36:28');
INSERT INTO `product`
VALUES ('1733491969493364737', '草坤',
        '自然清新，如同草地上的微风，为您带来清新与宁静的自然体验！自然设计，让您感受大自然的怡然。', '399.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic2.zhimg.com/80/v2-d742b696cfc21f84079cbc390887b1f1_1440w.webp',
        '2023-12-09 22:21:06', '2023-12-09 22:36:31');
INSERT INTO `product`
VALUES ('1733492068692848641', '小小坤',
        '可爱天使，如同童话中的小精灵，为您带来无尽的天真与可爱！童趣设计，萌态满满，陪伴您度过美好时光。', '699.99',
        '开心超人联名,热卖商品,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-6a53d3f4d847654b5442a8ff4a1ad7c5_1440w.webp', '2023-12-09 22:21:30',
        '2023-12-09 23:46:17');
INSERT INTO `product`
VALUES ('1733492254093668353', '路坤（邪恶版）',
        '黑暗领主，如同黑夜中的幽灵，为您带来神秘与诡谲的邪恶力量！邪恶设计，让您感受黑暗的诱惑。', '599.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic3.zhimg.com/80/v2-531fe2c328a3116791a73c5b39cd87c2_1440w.webp',
        '2023-12-09 22:22:14', '2023-12-09 22:36:38');
INSERT INTO `product`
VALUES ('1733492585993138178', '娜可坤坤',
        '甜蜜公主，如同童话中的仙境，为您带来梦幻与温馨的童话时光！梦幻设计，让您沉浸在美好的仙境。', '499.99',
        '王者荣耀联名,热卖商品,Hot,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-e04998895579a6dc57a296a7a0f0e6dd_1440w.webp', '2023-12-09 22:23:33',
        '2023-12-09 23:47:08');
INSERT INTO `product`
VALUES ('1733493691989159938', '悲伤坤',
        '忧郁之美，如同哲思中的文人，为您带来深沉与忧伤的内涵之美！文艺设计，让您拥有独特的情感表达。', '599.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic2.zhimg.com/80/v2-22214f25bb5795417857c71ae747b5cd_1440w.webp',
        '2023-12-09 22:27:57', '2023-12-09 22:27:57');
INSERT INTO `product`
VALUES ('1733493830258585602', '小心超坤',
        '守护之心，如同超级英雄，为您带来安全与坚实的保护！超级英雄设计，让您感受守护的力量。', '699.99',
        '开心超人联名,热卖商品,送运费险', '888',
        'https://pic3.zhimg.com/80/v2-104af5a86f119d0856156970f1cfca3e_1440w.webp', '2023-12-09 22:28:30',
        '2023-12-09 23:45:38');
INSERT INTO `product`
VALUES ('1733493933530738689', '粗心超坤',
        '憨厚可爱，如同童话中的小精灵，为您带来天真与可爱的童话时光！童趣设计，让您笑容满满，幸福无边。', '699.99',
        '开心超人联名,热卖商品,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-5984ca4b18d5c93db82f369bfe180691_1440w.webp', '2023-12-09 22:28:55',
        '2023-12-09 23:46:20');
INSERT INTO `product`
VALUES ('1733494052133072898', '坤索',
        '探险家，如同勇敢的冒险家，为您带来无尽的探索与发现之旅！冒险家设计，点燃您勇攀险峰的冒险心。', '799.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic2.zhimg.com/80/v2-0c86628db6415b53f71876b29707d505_1440w.webp',
        '2023-12-09 22:29:23', '2023-12-09 22:36:57');
INSERT INTO `product`
VALUES ('1733495129893040129', '黑坤铠甲',
        '战争之魂，如同铁血战士，为您带来强大的力量与无敌的铁甲！铁甲设计，让您在战场上无往不胜。', '899.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic3.zhimg.com/80/v2-730bbea91b59b21f7ae7f1a4c64f2d16_1440w.webp',
        '2023-12-09 22:33:40', '2023-12-09 22:33:40');
INSERT INTO `product`
VALUES ('1733495280485330945', '二娃坤',
        '火焰之力，如同烈焰战士，为您带来炙热的烈焰与不灭的战斗之魂！烈焰设计，让您战火焚天，战无不胜。', '799.99',
        '葫芦娃联名,热卖商品,Hot,送运费险', '777',
        'https://pic1.zhimg.com/80/v2-e8306269e7a293c5f44fa715238d60e4_1440w.webp', '2023-12-09 22:34:16',
        '2023-12-09 23:49:43');
INSERT INTO `product`
VALUES ('1733495468474036225', '珍珍坤',
        '清新甜美，如同花香般的可人儿，为您带来清新与甜蜜的浪漫之美！浪漫设计，让您沉浸在恋爱的美好。', '699.99',
        '海绵宝宝联名,热卖商品,Hot,送运费险', '888',
        'https://pic3.zhimg.com/80/v2-c7079de61526cc8b055566c3fdaeacc6_1440w.webp', '2023-12-09 22:35:01',
        '2023-12-10 00:04:00');
INSERT INTO `product`
VALUES ('1733495676452794369', '蒙面武坤',
        '神秘英雄，如同夜空中的明星，为您带来神秘与英勇的无敌之力！神秘设计，让您充满神秘的魅力。', '899.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic3.zhimg.com/80/v2-89499732680e74eaa59c6dcc02320fee_1440w.webp',
        '2023-12-09 22:35:50', '2023-12-09 22:37:02');
INSERT INTO `product`
VALUES ('1733501523497119746', '懒坤坤',
        '悠闲慵懒，如同午后的悠然时光，为您带来宁静与悠然的生活之美！悠闲设计，让您尽情享受悠然时光。', '499.99',
        '喜羊羊联名,热卖商品,Hot,送运费险', '888',
        'https://pic3.zhimg.com/80/v2-9f2b099640fd9753b4252cf0fb606df2_1440w.webp', '2023-12-09 22:59:04',
        '2023-12-09 23:58:10');
INSERT INTO `product`
VALUES ('1733501942742970369', '美坤坤',
        '绝美容颜，如同画中仙子，为您带来绝美与仙丽的容颜之美！绝美设计，让您成为众人瞩目的焦点。', '799.99',
        '喜羊羊联名,热卖商品,Hot,送运费险', '777',
        'https://pic3.zhimg.com/80/v2-2f11af3500e61e5dd83df0b2964d81a2_1440w.webp', '2023-12-09 23:00:44',
        '2023-12-09 23:58:24');
INSERT INTO `product`
VALUES ('1733501974502240257', '蝎子坤',
        '毒蝎之力，如同无敌的毒蝎王，为您带来无尽的毒力与坚韧之力！毒蝎设计，让您战无不胜，毫无畏惧。', '899.99',
        '葫芦娃联名,热卖商品,Hot,送运费险', '777',
        'https://pic4.zhimg.com/80/v2-02f3dc229f525ad62865e37a5f1d90d7_1440w.webp', '2023-12-09 23:00:52',
        '2023-12-09 23:49:59');
INSERT INTO `product`
VALUES ('1733502155742310402', '甜心超坤',
        '甜美能量，如同糖果般的可爱，为您带来满满的甜蜜与活力之能！甜心设计，让您充满甜美的能量。', '699.99',
        '开心超人联名,热卖商品,送运费险', '888',
        'https://pic1.zhimg.com/80/v2-397c4d7e62560b683ba6861d49487b84_1440w.webp', '2023-12-09 23:01:35',
        '2023-12-09 23:45:29');
INSERT INTO `product`
VALUES ('1733502348873232385', '蛇坤精',
        '灵动之躯，如同妖娆的蛇精，为您带来灵动与妖娆的神秘之美！蛇精设计，让您散发迷人的妖娆气息。', '799.99',
        '葫芦娃联名,热卖商品,Hot,送运费险', '777',
        'https://pic2.zhimg.com/80/v2-8973abd811495287e5c7d4e976cbb599_1440w.webp', '2023-12-09 23:02:21',
        '2023-12-09 23:49:49');
INSERT INTO `product`
VALUES ('1733502619510697985', '花心超坤',
        '花开花落，如同花仙子一般，为您带来花香与清新的花仙之美！花仙设计，让您成为花海中的花仙子。', '699.99',
        '开心超人联名,热卖商品,送运费险', '888',
        'https://pic1.zhimg.com/80/v2-b6a0ad9d243e76ff7670ab1b6ba6a1fc_1440w.webp', '2023-12-09 23:03:26',
        '2023-12-09 23:45:15');
INSERT INTO `product`
VALUES ('1733502829121040385', '蟹老坤',
        '蟹爪之力，如同海底之王，为您带来强大的蟹爪之力与无尽的权威之势！蟹爪设计，让您统御海底之力。', '899.99',
        '海绵宝宝联名,热卖商品,Hot,送运费险', '777',
        'https://pic3.zhimg.com/80/v2-63f8e9aa704ed01a0074d24fd0cc14f2_1440w.webp', '2023-12-09 23:04:16',
        '2023-12-09 23:56:33');
INSERT INTO `product`
VALUES ('1733503002219966465', '喜坤坤',
        '幸福源泉，如同喜庆的仙女，为您带来幸福与喜庆的仙女之美！喜庆设计，让您充满幸福的仙女气息。', '699.99',
        '喜羊羊联名,热卖商品,Hot,送运费险', '888',
        'https://pic2.zhimg.com/80/v2-233d9fec36c2b7bf9bd9c7245d7bc335_1440w.webp', '2023-12-09 23:04:57',
        '2023-12-09 23:57:47');
INSERT INTO `product`
VALUES ('1733503142724956161', '小黄坤',
        '活力之源，如同阳光般的活力精灵，为您带来阳光与活力的精灵之美！活力设计，让您充满阳光的精灵气息。', '599.99',
        '热卖商品,Hot,送运费险', '888', 'https://pic4.zhimg.com/80/v2-907bb0778834bde29924ff4a3b71f5ef_1440w.webp',
        '2023-12-09 23:05:30', '2023-12-09 23:05:30');
INSERT INTO `product`
VALUES ('1733503292088315906', '大大坤',
        '力量之巅，如同霸气的巨人，为您带来无尽的力量与无敌的巨人之威！巨人设计，让您站在力量之巅。', '699.99',
        '开心超人联名,热卖商品,送运费险', '777',
        'https://pic3.zhimg.com/80/v2-0f63c75fcb9b04366c4e8ff3979f093a_1440w.webp', '2023-12-09 23:06:06',
        '2023-12-09 23:46:27');
INSERT INTO `product`
VALUES ('1733503393863102465', '开心超坤',
        '欢笑之源，如同欢快的小丑，为您带来笑声与欢笑的小丑之趣！小丑设计，让您时刻充满欢笑的快乐气息。', '699.99',
        '开心超人联名,热卖商品,送运费险', '888',
        'https://pic3.zhimg.com/80/v2-a9c3d69a9de1c0ee57024f770d6f854e_1440w.webp', '2023-12-09 23:06:30',
        '2023-12-09 23:46:33');
INSERT INTO `product`
VALUES ('1733503543843024898', '猪坤侠',
        '正义之力，如同战斗的超级英雄，为您带来正义与力量的超级英雄之勇！超级英雄设计，让您成为正义之光。', '799.99',
        '热卖商品,Hot,送运费险', '777', 'https://pic3.zhimg.com/80/v2-b6766ba8e3bb3021cbf8b796fe3d20ee_1440w.webp',
        '2023-12-09 23:07:06', '2023-12-09 23:07:06');
INSERT INTO `product`
VALUES ('1733503686843625474', '灰太坤',
        '沉稳之力，如同坚实的灰石，为您带来稳定与坚实的灰石之力！灰石设计，让您稳如磐石，屹立不倒。', '899.99',
        '喜羊羊联名,热卖商品,送运费险', '777',
        'https://pic4.zhimg.com/80/v2-78ae1c0acf7d645413f456d4c5b8d04b_1440w.webp', '2023-12-09 23:07:40',
        '2023-12-09 23:57:57');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`
(
    `id`         bigint(20)    NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
    `userId`     bigint(20)    NOT NULL COMMENT '用户ID',
    `productId`  bigint(20)    NOT NULL COMMENT '商品ID',
    `quantity`   int(11)       NOT NULL COMMENT '商品数量',
    `amount`     double(10, 2) NOT NULL,
    `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `userId` (`userId`),
    KEY `productId` (`productId`),
    CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `notice` (`id`),
    CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1733792029422710787
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart`
VALUES ('1733404146811596801', '1731230205284265986', '1731313928390352897', '1', '1299.99', '2023-12-09 16:32:08',
        '2023-12-09 16:32:08');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`
(
    `id`           bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `userAccount`  varchar(256) NOT NULL COMMENT '用户账户',
    `userPassword` varchar(512) NOT NULL COMMENT '用户密码',
    `userName`     varchar(256) NOT NULL COMMENT '用户昵称',
    `email`        varchar(255)          DEFAULT NULL COMMENT '用户邮箱',
    `phoneNum`     bigint(11)   NOT NULL COMMENT '用户手机号',
    `address`      text         NOT NULL COMMENT '用户地址',
    `createTime`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`   datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `email` (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1733762111808794627
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice`
VALUES ('1731230205284265986', 'ikun1111', '0c6f0e6d4e12894358ffa129f4a6e71f', '小鸡子', '1433113@163.com',
        '13531201111', '中国妈妈省的大鸡市中鸡区小鸡村382号', '2023-12-03 16:33:40', '2023-12-10 18:35:45');
INSERT INTO `notice`
VALUES ('1733482966231085057', 'zhengzicong', '0e6ee957f4ded2076329d67a5aef2532', '郑梓聪', 'zhengzicong27@163.com',
        '13531201111', '广东省东莞市寮步镇东莞城市学院学6菜鸟驿站', '2023-12-09 21:45:20', '2023-12-10 18:35:41');
INSERT INTO `notice`
VALUES ('1733762111808794626', 'user10086', '3291f2a1f25240a47369c850b6e385ae', '测试用户名', '1433111111@163.com',
        '135111111111', '广东省东莞市寮步镇', '2023-12-10 16:14:33', '2023-12-10 16:14:33');
