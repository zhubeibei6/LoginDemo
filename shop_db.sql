# SQL Manager 2007 Lite for MySQL 4.4.2.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : shop_db


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `shop_db`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `shop_db`;

#
# Structure for the `t_dingdan` table : 
#

CREATE TABLE `t_dingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `orderid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `xiangqing` varchar(255) DEFAULT NULL,
  `zongjia` double NOT NULL,
  `zt` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8224F8E848E361B6` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `t_fenlei` table : 
#

CREATE TABLE `t_fenlei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deletestatus` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `t_gonggao` table : 
#

CREATE TABLE `t_gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biaoti` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `t_gouwuche` table : 
#

CREATE TABLE `t_gouwuche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `orderid` varchar(255) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK445E3420B7899154` (`productid`),
  KEY `FK445E342048E361B6` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `t_manage` table : 
#

CREATE TABLE `t_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for the `t_product` table : 
#

CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `jiage` double NOT NULL,
  `maoshu` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `xiaoliang` int(11) NOT NULL,
  `fenleiid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC58580497745FA2` (`fenleiid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `t_user` table : 
#

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `deletestatus` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for the `t_dingdan` table  (LIMIT 0,500)
#

INSERT INTO `t_dingdan` (`id`, `createtime`, `deletestatus`, `orderid`, `status`, `xiangqing`, `zongjia`, `zt`, `userid`) VALUES 
  (1,'2017-12-14 15:51:51',0,'151323791','已发货',' 商品名:佩奇的包包，购买数量:3，单价:88.0，￥小计:264.0。\r 商品名:佩奇的衣服，购买数量:1，单价:111.0，￥小计:111.0。\r',375,0,1);
COMMIT;

#
# Data for the `t_fenlei` table  (LIMIT 0,500)
#

INSERT INTO `t_fenlei` (`id`, `deletestatus`, `name`) VALUES 
  (1,0,'包包'),
  (2,0,'衣服'),
  (3,0,'鞋子');
COMMIT;

#
# Data for the `t_gonggao` table  (LIMIT 0,500)
#

INSERT INTO `t_gonggao` (`id`, `biaoti`, `content`, `createtime`, `deletestatus`) VALUES 
  (1,'特别好','小猪佩奇的弟弟是乔治','2017-12-14 15:47:53',0);
COMMIT;

#
# Data for the `t_gouwuche` table  (LIMIT 0,500)
#

INSERT INTO `t_gouwuche` (`id`, `content`, `createtime`, `deletestatus`, `number`, `orderid`, `productid`, `userid`) VALUES 
  (1,NULL,'2017-12-14 15:51:29',1,3,'151323791',1,1),
  (2,NULL,'2017-12-14 15:51:41',1,1,'151323791',2,1),
  (3,NULL,'2017-12-14 15:52:01',0,1,NULL,1,1);
COMMIT;

#
# Data for the `t_manage` table  (LIMIT 0,500)
#

INSERT INTO `t_manage` (`id`, `password`, `username`) VALUES 
  (1,'123','admin');
COMMIT;

#
# Data for the `t_product` table  (LIMIT 0,500)
#

INSERT INTO `t_product` (`id`, `createtime`, `deletestatus`, `imgpath`, `jiage`, `maoshu`, `name`, `xiaoliang`, `fenleiid`) VALUES 
  (1,'2017-12-14 15:49:10',0,'20171214154910.jpg',88,'特别好看','佩奇的包包',3,1),
  (2,'2017-12-14 15:49:35',0,'20171214154935.jpg',111,'真漂亮','佩奇的衣服',1,2),
  (3,'2017-12-14 15:49:56',0,'20171214154956.jpg',999,'超可爱的','佩奇的鞋子',0,3);
COMMIT;

#
# Data for the `t_user` table  (LIMIT 0,500)
#

INSERT INTO `t_user` (`id`, `address`, `createtime`, `deletestatus`, `email`, `password`, `phone`, `sex`, `truename`, `username`) VALUES 
  (1,'北京','2017-12-14 15:51:08',0,'123456@qq.com','123456','12346789565','女','佩奇','佩奇');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;