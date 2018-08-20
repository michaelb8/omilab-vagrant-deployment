CREATE DATABASE  IF NOT EXISTS `text` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `text`;

-- ------------------------------------------------------
-- Server version	5.5.44

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
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `text` mediumtext,
  `updated` datetime DEFAULT NULL,
  `elementdefinition_id` bigint(20) DEFAULT NULL,
  `instance_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fppfc020xq45gq2vl4vp6kgpm` (`elementdefinition_id`),
  KEY `FK_dp7x0srv4ro2m4orobqhlay2t` (`instance_id`),
  CONSTRAINT `FK_dp7x0srv4ro2m4orobqhlay2t` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`),
  CONSTRAINT `FK_fppfc020xq45gq2vl4vp6kgpm` FOREIGN KEY (`elementdefinition_id`) REFERENCES `element_definition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `element_definition`
--

DROP TABLE IF EXISTS `element_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_definition`
--

LOCK TABLES `element_definition` WRITE;
/*!40000 ALTER TABLE `element_definition` DISABLE KEYS */;
INSERT INTO `element_definition` VALUES (1,NULL,'Area of Applications','',NULL),(2,NULL,'Abstract','',NULL),(3,NULL,'Details','',NULL);
/*!40000 ALTER TABLE `element_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_pages`
--

DROP TABLE IF EXISTS `elements_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_pages` (
  `pagedefinitions_id` bigint(20) NOT NULL,
  `elementdefinitions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`pagedefinitions_id`,`elementdefinitions_id`),
  KEY `FK_8dujta7vsmrd07bki1h5i8ofl` (`elementdefinitions_id`),
  CONSTRAINT `FK_8dujta7vsmrd07bki1h5i8ofl` FOREIGN KEY (`elementdefinitions_id`) REFERENCES `element_definition` (`id`),
  CONSTRAINT `FK_lbaxe1pjct4x13nv49vfs4v6i` FOREIGN KEY (`pagedefinitions_id`) REFERENCES `page_definition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_pages`
--

LOCK TABLES `elements_pages` WRITE;
/*!40000 ALTER TABLE `elements_pages` DISABLE KEYS */;
INSERT INTO `elements_pages` VALUES (1,1),(1,2),(2,3);
/*!40000 ALTER TABLE `elements_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `psmip` varchar(255) DEFAULT NULL,
  `psmurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `page_definition`
--

DROP TABLE IF EXISTS `page_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_definition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_definition`
--

LOCK TABLES `page_definition` WRITE;
/*!40000 ALTER TABLE `page_definition` DISABLE KEYS */;
INSERT INTO `page_definition` VALUES (1,NULL,'Home','home',NULL),(2,NULL,'Details','details',NULL);
/*!40000 ALTER TABLE `page_definition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
