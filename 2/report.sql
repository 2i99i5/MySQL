-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.18
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `help_keyword`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--
-- WHERE:  1 limit 100

INSERT INTO `help_keyword` VALUES (225,'(JSON');
INSERT INTO `help_keyword` VALUES (226,'->');
INSERT INTO `help_keyword` VALUES (228,'->>');
INSERT INTO `help_keyword` VALUES (46,'<>');
INSERT INTO `help_keyword` VALUES (622,'ACCOUNT');
INSERT INTO `help_keyword` VALUES (417,'ACTION');
INSERT INTO `help_keyword` VALUES (40,'ADD');
INSERT INTO `help_keyword` VALUES (643,'ADMIN');
INSERT INTO `help_keyword` VALUES (108,'AES_DECRYPT');
INSERT INTO `help_keyword` VALUES (109,'AES_ENCRYPT');
INSERT INTO `help_keyword` VALUES (336,'AFTER');
INSERT INTO `help_keyword` VALUES (95,'AGAINST');
INSERT INTO `help_keyword` VALUES (665,'AGGREGATE');
INSERT INTO `help_keyword` VALUES (337,'ALGORITHM');
INSERT INTO `help_keyword` VALUES (483,'ALL');
INSERT INTO `help_keyword` VALUES (41,'ALTER');
INSERT INTO `help_keyword` VALUES (338,'ANALYZE');
INSERT INTO `help_keyword` VALUES (47,'AND');
INSERT INTO `help_keyword` VALUES (306,'ANY_VALUE');
INSERT INTO `help_keyword` VALUES (418,'ARCHIVE');
INSERT INTO `help_keyword` VALUES (102,'ARRAY');
INSERT INTO `help_keyword` VALUES (484,'AS');
INSERT INTO `help_keyword` VALUES (259,'ASC');
INSERT INTO `help_keyword` VALUES (399,'AT');
INSERT INTO `help_keyword` VALUES (508,'AUTOCOMMIT');
INSERT INTO `help_keyword` VALUES (442,'AUTOEXTEND_SIZE');
INSERT INTO `help_keyword` VALUES (339,'AUTO_INCREMENT');
INSERT INTO `help_keyword` VALUES (340,'AVG_ROW_LENGTH');
INSERT INTO `help_keyword` VALUES (522,'BACKUP');
INSERT INTO `help_keyword` VALUES (536,'BEFORE');
INSERT INTO `help_keyword` VALUES (509,'BEGIN');
INSERT INTO `help_keyword` VALUES (48,'BETWEEN');
INSERT INTO `help_keyword` VALUES (72,'BIGINT');
INSERT INTO `help_keyword` VALUES (104,'BINARY');
INSERT INTO `help_keyword` VALUES (694,'BINLOG');
INSERT INTO `help_keyword` VALUES (307,'BIN_TO_UUID');
INSERT INTO `help_keyword` VALUES (8,'BOOL');
INSERT INTO `help_keyword` VALUES (9,'BOOLEAN');
INSERT INTO `help_keyword` VALUES (62,'BOTH');
INSERT INTO `help_keyword` VALUES (403,'BTREE');
INSERT INTO `help_keyword` VALUES (260,'BY');
INSERT INTO `help_keyword` VALUES (33,'BYTE');
INSERT INTO `help_keyword` VALUES (702,'CACHE');
INSERT INTO `help_keyword` VALUES (450,'CALL');
INSERT INTO `help_keyword` VALUES (283,'CAN_ACCESS_COLUMN');
INSERT INTO `help_keyword` VALUES (284,'CAN_ACCESS_DATABASE');
INSERT INTO `help_keyword` VALUES (285,'CAN_ACCESS_TABLE');
INSERT INTO `help_keyword` VALUES (286,'CAN_ACCESS_VIEW');
INSERT INTO `help_keyword` VALUES (419,'CASCADE');
INSERT INTO `help_keyword` VALUES (53,'CASE');
INSERT INTO `help_keyword` VALUES (602,'CATALOG_NAME');
INSERT INTO `help_keyword` VALUES (75,'CEIL');
INSERT INTO `help_keyword` VALUES (76,'CEILING');
INSERT INTO `help_keyword` VALUES (510,'CHAIN');
INSERT INTO `help_keyword` VALUES (341,'CHANGE');
INSERT INTO `help_keyword` VALUES (542,'CHANNEL');
INSERT INTO `help_keyword` VALUES (34,'CHAR');
INSERT INTO `help_keyword` VALUES (30,'CHARACTER');
INSERT INTO `help_keyword` VALUES (677,'CHARSET');
INSERT INTO `help_keyword` VALUES (342,'CHECK');
INSERT INTO `help_keyword` VALUES (343,'CHECKSUM');
INSERT INTO `help_keyword` VALUES (623,'CIPHER');
INSERT INTO `help_keyword` VALUES (603,'CLASS_ORIGIN');
INSERT INTO `help_keyword` VALUES (644,'CLIENT');
INSERT INTO `help_keyword` VALUES (673,'CLONE');
INSERT INTO `help_keyword` VALUES (456,'CLOSE');
INSERT INTO `help_keyword` VALUES (344,'COALESCE');
INSERT INTO `help_keyword` VALUES (697,'CODE');
INSERT INTO `help_keyword` VALUES (311,'COLLATE');
INSERT INTO `help_keyword` VALUES (679,'COLLATION');
INSERT INTO `help_keyword` VALUES (345,'COLUMN');
INSERT INTO `help_keyword` VALUES (346,'COLUMNS');
INSERT INTO `help_keyword` VALUES (604,'COLUMN_NAME');
INSERT INTO `help_keyword` VALUES (316,'COMMENT');
INSERT INTO `help_keyword` VALUES (511,'COMMIT');
INSERT INTO `help_keyword` VALUES (525,'COMMITTED');
INSERT INTO `help_keyword` VALUES (420,'COMPACT');
INSERT INTO `help_keyword` VALUES (317,'COMPLETION');
INSERT INTO `help_keyword` VALUES (669,'COMPONENT');
INSERT INTO `help_keyword` VALUES (421,'COMPRESSED');
INSERT INTO `help_keyword` VALUES (347,'COMPRESSION');
INSERT INTO `help_keyword` VALUES (470,'CONCURRENT');
INSERT INTO `help_keyword` VALUES (599,'CONDITION');
INSERT INTO `help_keyword` VALUES (348,'CONNECTION');
INSERT INTO `help_keyword` VALUES (512,'CONSISTENT');
INSERT INTO `help_keyword` VALUES (349,'CONSTRAINT');
INSERT INTO `help_keyword` VALUES (605,'CONSTRAINT_CATALOG');
INSERT INTO `help_keyword` VALUES (606,'CONSTRAINT_NAME');
INSERT INTO `help_keyword` VALUES (607,'CONSTRAINT_SCHEMA');
INSERT INTO `help_keyword` VALUES (600,'CONTINUE');
INSERT INTO `help_keyword` VALUES (103,'CONVERT');
INSERT INTO `help_keyword` VALUES (258,'COUNT');
INSERT INTO `help_keyword` VALUES (42,'CREATE');
INSERT INTO `help_keyword` VALUES (256,'CREATE_DH_PARAMETERS');
INSERT INTO `help_keyword` VALUES (501,'CROSS');
INSERT INTO `help_keyword` VALUES (422,'CSV');
INSERT INTO `help_keyword` VALUES (268,'CUME_DIST');
INSERT INTO `help_keyword` VALUES (624,'CURRENT');
INSERT INTO `help_keyword` VALUES (116,'CURRENT_ROLE');
INSERT INTO `help_keyword` VALUES (318,'CURRENT_USER');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-14 15:40:05
