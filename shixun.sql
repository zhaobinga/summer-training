-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: shixun
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `cid` varchar(45) NOT NULL,
  `tid` varchar(45) NOT NULL,
  `tname` varchar(45) NOT NULL,
  `cname` varchar(45) NOT NULL,
  `des` varchar(45) NOT NULL,
  `homework` varchar(45) DEFAULT '暂无',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('1','1','1','1','1',' '),('499783','94197830','','','',' '),('51823','46954043','1','1','','练习题1-10'),('617243','94197830','555555','cads','cdacds',' '),('626262','46954043','刘老师','JAVA','JAVA','实现一个简单的计算器'),('757512','94197830','dvsa','fasd','vdsaf',' ');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_std`
--

DROP TABLE IF EXISTS `class_std`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_std` (
  `cid` varchar(45) NOT NULL,
  `id` varchar(45) NOT NULL,
  KEY `cid_FK_idx` (`cid`),
  KEY `ID_FK2_idx` (`id`),
  CONSTRAINT `ID_FK2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cid_FK` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_std`
--

LOCK TABLES `class_std` WRITE;
/*!40000 ALTER TABLE `class_std` DISABLE KEYS */;
INSERT INTO `class_std` VALUES ('626262','49211182'),('626262','69073712'),('51823','49211182'),('1','15346954'),('626262','15346954'),('617243','69073712'),('617243','69073712'),('626262','49211182'),('1','49211182'),('1','49211182');
/*!40000 ALTER TABLE `class_std` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `username` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `content` varchar(200) NOT NULL,
  `videoid` varchar(45) NOT NULL,
  KEY `idk_f_idx` (`videoid`),
  CONSTRAINT `idk_f` FOREIGN KEY (`videoid`) REFERENCES `class` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('邱翟老师美美哒','2018-07-21 10:04:27','11','1');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `createcourse`
--

DROP TABLE IF EXISTS `createcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `createcourse` (
  `teacherName` varchar(45) NOT NULL,
  `id` varchar(45) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  `courseId` varchar(45) NOT NULL,
  `courseStyle` varchar(45) NOT NULL,
  `courseDetail` varchar(200) NOT NULL,
  `homework` varchar(45) DEFAULT '暂无'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createcourse`
--

LOCK TABLES `createcourse` WRITE;
/*!40000 ALTER TABLE `createcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `createcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error` (
  `cid` varchar(20) NOT NULL,
  `error` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
INSERT INTO `error` VALUES ('51823','1'),('51823','3'),('626262','1'),('626262','1'),('626262','1'),('626262','1'),('626262','1'),('626262','1'),('626262','1'),('626262','1');
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  KEY `id_fk_idx` (`id`),
  CONSTRAINT `id_fk` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES ('46954043','secret','151','female','secret'),('49211182','secret','secret','male','secret'),('69073712','secret','secret','male','secret'),('42042233','secret','secret','male','secret'),('15346954','secret','secret','male','secret'),('94197830','secret','secret','male','secret');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kejian`
--

DROP TABLE IF EXISTS `kejian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kejian` (
  `cid` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `title` varchar(45) NOT NULL,
  `explain` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kejian`
--

LOCK TABLES `kejian` WRITE;
/*!40000 ALTER TABLE `kejian` DISABLE KEYS */;
INSERT INTO `kejian` VALUES (51823,'success.jsp','节','小结','2018-07-21 11:41:54');
/*!40000 ALTER TABLE `kejian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `cid` varchar(45) NOT NULL,
  `timu` varchar(200) NOT NULL,
  `qa` varchar(45) NOT NULL,
  `qb` varchar(45) NOT NULL,
  `qc` varchar(45) NOT NULL,
  `qd` varchar(45) NOT NULL,
  `right` varchar(500) NOT NULL,
  `explain` varchar(45) NOT NULL,
  KEY `question_id_idx` (`cid`),
  CONSTRAINT `question_id` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('626262','2+2','1','2','3','5','q','1');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `cid` varchar(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  KEY `cid_fk_2_idx` (`cid`),
  KEY `id_fk_3_idx` (`id`),
  CONSTRAINT `cid_fk_2` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_fk_3` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES ('51823','49211182','翔哥男神','1','2018-07-18 14:55:35'),('51823','49211182','翔哥男神','3','2018-07-18 14:57:25'),('626262','49211182','翔哥男神','0','2018-07-20 20:50:41'),('626262','49211182','翔哥男神','0','2018-07-20 20:51:07'),('626262','49211182','翔哥男神','0','2018-07-20 20:51:13'),('626262','49211182','翔哥男神','0','2018-07-20 20:51:18'),('51823','49211182','翔哥男神','3','2018-07-20 20:51:48'),('626262','49211182','翔哥男神','0','2018-07-21 09:26:17'),('626262','49211182','翔哥男神','0','2018-07-21 09:27:16'),('626262','49211182','翔哥男神','0','2018-07-21 10:12:05'),('626262','49211182','翔哥男神','0','2018-07-21 10:27:27');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `id` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a','15346954','aaaaaaaa','student'),('aa','42042233','aaaaaaaa','student'),('邱翟老师美美哒','46954043','12345678','teacher'),('翔哥男神','49211182','12345678','student'),('小哥哥','69073712','12345678','student'),('fadf','94197830','asdfghjkl','teacher');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-21 11:48:59
