-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version	5.6.21

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

# Creating a new database instance called empresabd
CREATE DATABASE empresabd;

# Setting the new database as default
USE empresabd;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `DNome` varchar(45) NOT NULL,
  `DNumero` int(11) NOT NULL,
  `DataInicio` date DEFAULT NULL,
  `SSN_Empregado` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DNumero`),
  KEY `fk1_idx` (`SSN_Empregado`),
  CONSTRAINT `fk3` FOREIGN KEY (`SSN_Empregado`) REFERENCES `empregado` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('Engenharia',1,'2020-05-01',NULL),('Pesquisa',2,'2020-04-02',1),('Produção',3,NULL,1),('RH',4,'2020-05-02',2),('Empacotamento',6,NULL,3);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `SSN_Empregado` bigint(20) NOT NULL,
  `Nome_Dependente` varchar(45) NOT NULL,
  `Sexo` bit(1) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `Parentesco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SSN_Empregado`,`Nome_Dependente`),
  CONSTRAINT `fk6` FOREIGN KEY (`SSN_Empregado`) REFERENCES `empregado` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1,'Joao Jr',NULL,'2015-05-24','Filho'),(1,'Maria Silva',NULL,'2017-09-07','Filho'),(3,'Evelyn Scott',NULL,'1987-03-26','Esposa'),(3,'Natty Scott',NULL,'2013-11-23','Filho');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depto_localizacoes`
--

DROP TABLE IF EXISTS `depto_localizacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depto_localizacoes` (
  `LNumero` int(11) NOT NULL,
  `DLocalizacao` varchar(45) DEFAULT NULL,
  `DNumero_Departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`LNumero`),
  KEY `fk5_idx` (`DNumero_Departamento`),
  CONSTRAINT `fk5` FOREIGN KEY (`DNumero_Departamento`) REFERENCES `departamento` (`DNumero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depto_localizacoes`
--

LOCK TABLES `depto_localizacoes` WRITE;
/*!40000 ALTER TABLE `depto_localizacoes` DISABLE KEYS */;
INSERT INTO `depto_localizacoes` VALUES (1,'Cidade de Pallet',1),(2,'Cidade de Pallet',2),(3,'Cidade de Pallet',3),(4,'SRS',4),(5,'SRS',6);
/*!40000 ALTER TABLE `depto_localizacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empregado` (
  `PNome` varchar(15) NOT NULL,
  `MInicial` char(1) DEFAULT NULL,
  `UNome` varchar(15) NOT NULL,
  `SSN` bigint(20) NOT NULL,
  `DataNasc` date DEFAULT NULL,
  `Endereco` varchar(80) DEFAULT NULL,
  `Sexo` bit(1) DEFAULT NULL,
  `Salario` decimal(10,2) DEFAULT NULL,
  `SSN_Supervisor` bigint(20) DEFAULT NULL,
  `DNumero_Departamento` int(11) DEFAULT '1',
  PRIMARY KEY (`SSN`),
  KEY `fk1` (`SSN_Supervisor`),
  KEY `fk2` (`DNumero_Departamento`),
  CONSTRAINT `fk1` FOREIGN KEY (`SSN_Supervisor`) REFERENCES `empregado` (`SSN`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`DNumero_Departamento`) REFERENCES `departamento` (`DNumero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES ('Joao',NULL,'Silva',1,'1990-02-11','Morumbi, São Paulo',' ',3500.00,NULL,1),('Maria','D','Joaquina',2,'1992-02-11','Rua tan nan nan','\0',1650.00,3,2),('Jason','L','Scott',3,'2001-12-30','Alameda dos Anjos 55, Porto Caribe, Nova York',' ',4000.00,NULL,3),('Kimberly',NULL,'Hart',4,'2002-11-25','Morumbi, São Paulo',NULL,6500.00,1,3),('Joca','D','Rosa',5,NULL,'Morumbi,Sâo Paulo',NULL,1500.00,1,1);
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `PNome` varchar(45) NOT NULL,
  `PNumero` int(11) NOT NULL,
  `PLocalizacao` varchar(45) DEFAULT NULL,
  `DNumero_Departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`PNumero`),
  KEY `fk4_idx` (`DNumero_Departamento`),
  CONSTRAINT `fk4` FOREIGN KEY (`DNumero_Departamento`) REFERENCES `departamento` (`DNumero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES ('Projeto X','1','SRS',1),('Projeto Z','3','Central City',2);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalha_em`
--

DROP TABLE IF EXISTS `trabalha_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalha_em` (
  `SSN_Empregado` bigint(20) NOT NULL,
  `PNumero_Projeto` int(11) NOT NULL,
  `Horas` int(11) NOT NULL,
  PRIMARY KEY (`SSN_Empregado`,`PNumero_Projeto`),
  CONSTRAINT `fk7` FOREIGN KEY (`SSN_Empregado`) REFERENCES `empregado` (`ssn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk8` FOREIGN KEY (`PNumero_Projeto`) REFERENCES `projeto` (`pnumero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalha_em`
--

LOCK TABLES `trabalha_em` WRITE;
/*!40000 ALTER TABLE `trabalha_em` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabalha_em` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-13 14:05:51