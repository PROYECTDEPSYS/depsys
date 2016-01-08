-- MySQL dump 10.16  Distrib 10.1.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: depsys
-- ------------------------------------------------------
-- Server version	10.1.10-MariaDB-log

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
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `idcampaign` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `name` varchar(30) DEFAULT NULL COMMENT 'Nombre del registro',
  `shortname` varchar(20) DEFAULT NULL COMMENT 'Nombre corto del registro',
  `active` tinyint(1) DEFAULT NULL COMMENT 'Condición de activo e inactivo',
  PRIMARY KEY (`idcampaign`),
  KEY `campaign_name_IDX` (`name`),
  KEY `campaign_idcampaign_IDX` (`idcampaign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Conjunto de estrategias para llegar a un fin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `idservice` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `idcampaign` int(11) DEFAULT NULL COMMENT 'Relación con la tabla principal',
  `name` varchar(30) DEFAULT NULL COMMENT 'Nombre del registro',
  `descrypt` varchar(200) DEFAULT NULL COMMENT 'Descripción del registro',
  `type` varchar(30) DEFAULT NULL COMMENT 'Tipo del registro',
  PRIMARY KEY (`idservice`),
  KEY `service_idservice_IDX` (`idservice`),
  KEY `service_idcampaign_IDX` (`idcampaign`),
  KEY `service_name_IDX` (`name`),
  CONSTRAINT `service_campaign_FK` FOREIGN KEY (`idcampaign`) REFERENCES `campaign` (`idcampaign`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Conjunto de actividades que cumplen un fin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `idsystem` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `idservice` int(11) DEFAULT NULL COMMENT 'Relación con la tabla de servicio',
  `name` varchar(30) DEFAULT NULL COMMENT 'Nombre del registro',
  `shortname` varchar(20) DEFAULT NULL COMMENT 'Abreviación del registro',
  `descrypt` varchar(200) DEFAULT NULL COMMENT 'Descripción del registro',
  PRIMARY KEY (`idsystem`),
  KEY `system_idsystem_IDX` (`idsystem`),
  KEY `system_idservice_IDX` (`idservice`),
  KEY `system_shortname_IDX` (`shortname`),
  CONSTRAINT `system_service_FK` FOREIGN KEY (`idservice`) REFERENCES `service` (`idservice`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Conjunto de herramientas que utilizan los servicios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systool`
--

DROP TABLE IF EXISTS `systool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systool` (
  `idsystool` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `idsystem` int(11) DEFAULT NULL COMMENT 'Relación con el sistema',
  `code` varchar(10) DEFAULT NULL COMMENT 'Codigo del registro',
  `shortname` varchar(20) DEFAULT NULL COMMENT 'Abreviación del registro',
  PRIMARY KEY (`idsystool`),
  KEY `systool_idsystool_IDX` (`idsystool`),
  KEY `systool_idsystem_IDX` (`idsystem`),
  KEY `systool_code_IDX` (`code`),
  KEY `systool_shortname_IDX` (`shortname`),
  CONSTRAINT `systool_system_FK` FOREIGN KEY (`idsystem`) REFERENCES `system` (`idsystem`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realiza la relación de las herramientas con el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systool`
--

LOCK TABLES `systool` WRITE;
/*!40000 ALTER TABLE `systool` DISABLE KEYS */;
/*!40000 ALTER TABLE `systool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool` (
  `idtool` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `idtypetool` int(11) DEFAULT NULL COMMENT 'Relación con los tipos',
  `idsystool` int(11) DEFAULT NULL COMMENT 'Relación con el sistema',
  `date` date DEFAULT NULL COMMENT 'Fecha de creación',
  `time` time DEFAULT NULL COMMENT 'Hora de creación',
  PRIMARY KEY (`idtool`),
  KEY `tool_systool_FK` (`idsystool`),
  KEY `tool_typetool_FK` (`idtypetool`),
  CONSTRAINT `tool_systool_FK` FOREIGN KEY (`idsystool`) REFERENCES `systool` (`idsystool`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tool_typetool_FK` FOREIGN KEY (`idtypetool`) REFERENCES `typetool` (`idtypetool`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla relacional';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typetool`
--

DROP TABLE IF EXISTS `typetool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typetool` (
  `idtypetool` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `typetool` varchar(30) DEFAULT NULL COMMENT 'Tipo de herramienta',
  `descrypt` varchar(200) DEFAULT NULL COMMENT 'Descripción del registro',
  PRIMARY KEY (`idtypetool`),
  KEY `typetool_idtypetool_IDX` (`idtypetool`),
  KEY `typetool_typetool_IDX` (`typetool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de control para la creacion de herramientas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typetool`
--

LOCK TABLES `typetool` WRITE;
/*!40000 ALTER TABLE `typetool` DISABLE KEYS */;
/*!40000 ALTER TABLE `typetool` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08  9:56:10
