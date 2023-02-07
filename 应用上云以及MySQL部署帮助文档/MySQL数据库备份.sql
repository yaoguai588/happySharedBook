/*
MySQL Backup
Database: book
Backup Time: 2022-06-25 18:14:44
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `book`.`admin`;
DROP TABLE IF EXISTS `book`.`book`;
DROP TABLE IF EXISTS `book`.`br`;
DROP TABLE IF EXISTS `book`.`cpress`;
DROP TABLE IF EXISTS `book`.`shop`;
DROP TABLE IF EXISTS `book`.`user`;
DROP PROCEDURE IF EXISTS `book`.`totalSearch`;
DROP PROCEDURE IF EXISTS `book`.`userBorrow`;
DROP PROCEDURE IF EXISTS `book`.`userShop`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `aname` varchar(10) DEFAULT NULL,
  `apassword` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `adminid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL,
  `bname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bCid` int(11) NOT NULL,
  `bclass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bwriter` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bbrief` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bprice` decimal(10,2) DEFAULT NULL,
  `btotal` int(11) DEFAULT NULL,
  `bmargin` int(11) DEFAULT NULL,
  PRIMARY KEY (`bid`,`bCid`) USING BTREE,
  UNIQUE KEY `bid_2` (`bid`),
  KEY `BCid` (`bCid`),
  KEY `Bid` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `br` (
  `brid` int(11) NOT NULL AUTO_INCREMENT,
  `borrowdate` date DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `bookid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`brid`) USING BTREE,
  KEY `bookid` (`bookid`),
  KEY `userid` (`userid`),
  CONSTRAINT `br_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `br_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
CREATE TABLE `cpress` (
  `Cid` int(11) NOT NULL,
  `Cname` varchar(20) NOT NULL,
  `Caddress` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Cid`),
  UNIQUE KEY `F_cid` (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `shop` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sbookid` int(11) DEFAULT NULL,
  `suserid` int(11) DEFAULT NULL,
  `shoptime` date DEFAULT NULL,
  `shopnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `sbookid` (`sbookid`),
  KEY `suserid` (`suserid`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`sbookid`) REFERENCES `book` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`suserid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(10) DEFAULT NULL,
  `upassword` varchar(10) DEFAULT NULL,
  `ugender` varchar(10) DEFAULT NULL,
  `ucollage` varchar(20) DEFAULT NULL,
  `umajor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `F_uid` (`uid`),
  CONSTRAINT `Gender_check` CHECK ((`ugender` in (_utf8mb3'男',_utf8mb3'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE DEFINER=`root`@`localhost` PROCEDURE `totalSearch`(IN `stime` datetime,IN `dtime` datetime)
BEGIN
	SELECT book.bname,br.number as borrownum,shop.shopnum as buynum
	FROM book,br,shop 
	WHERE book.bid=br.bookid AND br.bookid=shop.sbookid 
	AND (br.borrowdate BETWEEN stime AND dtime) 
	AND (shop.shoptime BETWEEN stime AND dtime);
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userBorrow`(IN `id` int)
BEGIN
	SELECT `user`.uname as uname,book.bname as bname,br.number 
	FROM `user`,br,book
	WHERE `user`.uid=id AND br.userid=`user`.uid AND br.bookid=book.Bid;
END;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userShop`(IN `id` int)
BEGIN
	SELECT `user`.uname,book.bname,shop.shopnum as number 
	FROM `user`,shop,book
	WHERE `user`.uid=id AND shop.suserid=`user`.uid AND shop.sbookid=book.Bid;
END;
BEGIN;
LOCK TABLES `book`.`admin` WRITE;
DELETE FROM `book`.`admin`;
INSERT INTO `book`.`admin` (`aid`,`aname`,`apassword`) VALUES (1, '11', '111'),(1001, '小刚', '1001');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `book`.`book` WRITE;
DELETE FROM `book`.`book`;
INSERT INTO `book`.`book` (`bid`,`bname`,`bCid`,`bclass`,`bwriter`,`bbrief`,`bprice`,`btotal`,`bmargin`) VALUES (1, '计算机组成原理', 1, '教育类', '丁伟', '计算机类重要科目图书', 56.00, 850, 781),(2, '线性代数', 3, '教育类', '吴越', '数学课目类重要图书', 28.00, 1000, 960),(3, '杀死一只知更鸟', 2, '名著类', '小刚', '名著类书目', 46.00, 300, 254),(4, '百年孤独', 4, '名著类', '马尔克斯', '名著类书目', 43.00, 380, 282),(5, '意林', 3, '期刊类', '林一', '期刊类书目', 28.00, 600, 592),(6, '读者', 4, '期刊类', '喆杜', '期刊类书目', 26.00, 430, 428);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `book`.`br` WRITE;
DELETE FROM `book`.`br`;
INSERT INTO `book`.`br` (`brid`,`borrowdate`,`returndate`,`bookid`,`userid`,`number`) VALUES (16, '2022-06-23', '2022-06-23', 3, 1, 3),(17, '2022-06-23', '2022-06-25', 5, 1, 1),(23, '2022-06-23', '2022-06-23', 1, 1, 20),(24, '2022-06-23', '2022-06-23', 3, 1, 20),(28, '2022-06-25', '2022-06-25', 2, 1, 20),(29, '2022-06-25', '2022-06-25', 5, 1, 2),(30, '2022-06-25', NULL, 5, 13, 3),(31, '2022-06-25', '2022-06-25', 6, 13, 4);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `book`.`cpress` WRITE;
DELETE FROM `book`.`cpress`;
INSERT INTO `book`.`cpress` (`Cid`,`Cname`,`Caddress`) VALUES (1, '清华出版社', '北京市'),(2, '北大出版社', '北京市'),(3, '江大出版社', '江苏省镇江市'),(4, '交大出版社', '上海市'),(5, '机械工业出版社', '江苏省南京市');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `book`.`shop` WRITE;
DELETE FROM `book`.`shop`;
INSERT INTO `book`.`shop` (`sid`,`sbookid`,`suserid`,`shoptime`,`shopnum`) VALUES (2, 3, 1, '2022-06-23', 3),(5, 5, 1, '2022-06-25', 28),(6, 6, 1, '2022-06-25', 4),(7, 6, 13, '2022-06-25', 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `book`.`user` WRITE;
DELETE FROM `book`.`user`;
INSERT INTO `book`.`user` (`uid`,`uname`,`upassword`,`ugender`,`ucollage`,`umajor`) VALUES (1, '郭创', '11', '男', '计算机', '软件'),(13, '阮大泉', '123', '女', '计算机', '软件'),(1001, '邵彦杰', '111', '男', '萨达', '打算');
UNLOCK TABLES;
COMMIT;
