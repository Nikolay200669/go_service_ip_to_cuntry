CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `validityip` int(11) DEFAULT NULL,
  `inserted` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'UA','109.87.240.183',10,1506325512),(2,'UA','109.87.240.183',10,1506325531),(3,'UA','109.87.240.183',10,1506325621),(4,'nil','109.87.240.183',10,1506325631),(5,'UA','109.87.240.183',10,1506325641),(6,'nil','109.87.240.183',10,1506325651),(7,'UA','109.87.240.183',10,1506325666),(8,'UA','109.87.240.183',10,1506325838),(9,'nil','109.87.240.183',10,1506325848),(10,'UA','109.87.240.183',10,1506325858),(11,'UA','109.87.240.183',10,1506325925),(12,'UA','109.87.240.183',10,1506325938),(13,'UA','109.87.240.183',10,1506325949),(14,'nil','109.87.240.183',10,1506325960),(15,'UA','109.87.240.183',10,1506325970),(16,'nil','109.87.240.183',10,1506325980),(17,'UA','109.87.240.183',10,1506325990),(18,'UA','109.87.240.183',10,1506326164),(19,'US','8.8.8.8',10,1506326176),(20,'US','8.8.8.8',10,1506326907),(21,'nil','8.8.8.8',10,1506326917),(22,'US','8.8.8.8',10,1506326928),(23,'US','8.8.8.8',10,1506326956),(24,'US','8.8.8.8',10,1506326967),(25,'US','8.8.8.8',10,1506326981),(26,'US','8.8.8.8',10,1506327196),(27,'Pause...','8.8.8.8',10,1506327206),(28,'US','8.8.8.8',10,1506327216),(29,'US','8.8.8.8',10,1506327366),(30,'Pause...','8.8.8.8',10,1506327376),(31,'US','8.8.8.8',10,1506327388),(32,'US','8.8.8.8',10,1506327400),(33,'US','8.8.8.8',10,1506327410),(34,'All services are busy. Pause... 10','8.8.8.8',10,1506327420),(35,'US','8.8.8.8',10,1506327780),(36,'All servers busy. Waiting time approx... 10','8.8.8.8',10,1506327790),(37,'US','8.8.8.8',10,1506327848),(38,'US','8.8.8.8',10,1506327858),(39,'All servers busy. Waiting time approx... 10','8.8.8.8',10,1506327868),(40,'US','8.8.8.8',10,1506327882),(41,'US','8.8.8.8',10,1506328567),(42,'US','8.8.8.8',10,1506329879),(43,'US','8.8.8.8',10,1506332553),(44,'All servers busy. Waiting time approx... 10','8.8.8.8',10,1506332564),(45,'US','8.8.8.8',10,1506332575),(46,'All servers busy. Waiting time approx... 10','8.8.8.8',10,1506332585),(47,'US','8.8.8.8',10,1506332596),(48,'All servers busy. Waiting time approx... 10','8.8.8.8',10,1506332606),(49,'US','8.8.8.8',10,1506332616),(50,'US','8.8.8.8',10,1506336094),(51,'US','8.8.8.8',10,1506336243),(52,'US','8.8.8.8',10,1506336413),(53,'UA','82.144.200.16',10,1506336514),(54,'UA','82.144.200.16',10,1506336909),(55,'UA','82.144.200.16',10,1506336939),(56,'All servers busy. Waiting time approx... 10','216.158.238.186',10,1506336941),(57,'UA','93.78.238.18',10,1506337014),(58,'UA','82.144.200.16',10,1506337562),(59,'UA','91.204.36.6',10,1506337976),(60,'UA','95.47.143.68',10,1506340851),(61,'UA','95.47.143.68',10,1506340957),(62,'UA','46.150.79.150',10,1506341447),(63,'RU','46.17.44.4',10,1506344879),(64,'RU','46.17.44.4',10,1506345192),(65,'UA','82.144.200.16',10,1506348641),(66,'UA','82.144.200.16',10,1506348734),(67,'UA','82.144.200.16',10,1506348913),(68,'DE','128.0.112.11',10,1506348954),(69,'DE','128.0.112.11',10,1506349017),(70,'DE','128.0.112.11',10,1506350567),(71,'DE','128.0.112.11',10,1506350584),(72,'DE','128.0.112.11',10,1506350595),(73,'All servers busy. Waiting time approx... 10','128.0.112.11',10,1506350605),(74,'DE','128.0.112.11',10,1506350816);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL,
  `time_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` VALUES (1,'http://ip-api.com/json/',1506350816),(2,'http://geoip.nekudo.com/api/',1506350605),(3,'http://freegeoip.net/json/',2);
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test'
--

--
-- Dumping routines for database 'test'
--
/*!50003 DROP FUNCTION IF EXISTS `get_country_function` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_country_function`(in_ip VARCHAR(45)) RETURNS varchar(45) CHARSET utf8
BEGIN
	DECLARE out_country varchar(45);
    DECLARE out_validityip int(11);
    DECLARE out_inserted int(10);
    
	SELECT country, validityip, inserted INTO out_country, out_validityip, out_inserted FROM country WHERE ip = in_ip;
    IF validityip > 0 THEN
		IF UNIX_TIMESTAMP() - out_inserted < out_validityip THEN
			DELETE FROM country WHERE ip = in_ip;
			RETURN ('');
		ELSE
			RETURN (out_country);
		END IF;
	ELSE
		RETURN ('');
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_url_function` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_url_function`(range_sec INT) RETURNS varchar(100) CHARSET utf8
BEGIN
	DECLARE out_url varchar(100);
    DECLARE out_time int(10);
    

	SELECT url.url, url.time_at INTO out_url, out_time FROM test.url WHERE UNIX_TIMESTAMP() - url.time_at > range_sec LIMIT 1;
    IF UNIX_TIMESTAMP() - out_time > range_sec THEN
		UPDATE test.url SET url.time_at = UNIX_TIMESTAMP() WHERE url.url = out_url;
	ELSE
		SET out_url = '';
	END IF;
RETURN (out_url);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 17:56:35
