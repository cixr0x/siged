-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: siged
-- ------------------------------------------------------
-- Server version	5.6.22

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
-- Table structure for table `actualizacion`
--

DROP TABLE IF EXISTS `actualizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actualizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `texto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `peticion_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_actualizacion_peticion_1` (`peticion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualizacion`
--

LOCK TABLES `actualizacion` WRITE;
/*!40000 ALTER TABLE `actualizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `actualizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peticion`
--

DROP TABLE IF EXISTS `peticion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peticion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creador_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `responsable_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechacreado` datetime DEFAULT NULL,
  `fechaasignado` datetime DEFAULT NULL,
  `fechacerrado` datetime DEFAULT NULL,
  `prioridad` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_peticion_creador_2` (`creador_username`),
  KEY `ix_peticion_responsable_3` (`responsable_username`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peticion`
--

LOCK TABLES `peticion` WRITE;
/*!40000 ALTER TABLE `peticion` DISABLE KEYS */;
INSERT INTO `peticion` VALUES (1,'a','a','inical','cix',NULL,'2015-01-12 17:13:53',NULL,NULL,NULL),(2,'b','b','inical','cix',NULL,'2015-01-12 17:51:45',NULL,NULL,'media'),(3,'Laminas para Dona Lucha','Dona Lucha necesita laminas porque tiene goteras','inical','cix',NULL,'2015-01-12 17:52:18',NULL,NULL,'media'),(4,'Laminas para Dona Lucha','Dona Lucha necesita laminas porque tiene goteras','inical','cix',NULL,'2015-01-12 17:52:18',NULL,NULL,'media'),(5,'c','c','inical','cix',NULL,'2015-01-12 18:15:39',NULL,NULL,'baja'),(6,'d','d','inical','cix',NULL,'2015-01-12 18:15:45',NULL,NULL,'baja'),(7,'e','e','inical','cix',NULL,'2015-01-12 18:15:48',NULL,NULL,'baja'),(8,'f','f','inical','cix',NULL,'2015-01-12 18:15:52',NULL,NULL,'baja');
/*!40000 ALTER TABLE `peticion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_evolutions`
--

DROP TABLE IF EXISTS `play_evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play_evolutions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `apply_script` text COLLATE utf8_unicode_ci,
  `revert_script` text COLLATE utf8_unicode_ci,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_problem` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_evolutions`
--

LOCK TABLES `play_evolutions` WRITE;
/*!40000 ALTER TABLE `play_evolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `play_evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES ('admin','Administrador'),('captura','Capturista');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('cix','Roberto','Rojas','a1a1a1','a@a.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rol`
--

DROP TABLE IF EXISTS `user_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rol` (
  `user_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rol_codigo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_username`,`rol_codigo`),
  KEY `fk_user_rol_rol_02` (`rol_codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rol`
--

LOCK TABLES `user_rol` WRITE;
/*!40000 ALTER TABLE `user_rol` DISABLE KEYS */;
INSERT INTO `user_rol` VALUES ('cix','admin'),('cix','captura');
/*!40000 ALTER TABLE `user_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-12 18:27:39
