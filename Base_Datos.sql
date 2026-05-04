CREATE DATABASE  IF NOT EXISTS `proyecto_final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_final`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `historical`
--

DROP TABLE IF EXISTS `historical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historical` (
  `Id_historical` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `Fk_usuario` int NOT NULL,
  `Accion` varchar(45) NOT NULL,
  `Descripcion` text NOT NULL,
  `Created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id_historical`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical`
--

LOCK TABLES `historical` WRITE;
/*!40000 ALTER TABLE `historical` DISABLE KEYS */;
INSERT INTO `historical` VALUES (1,'Salvador',39,'CREAR','Nuevo registro de un caso','2026-03-31 14:06:29'),(2,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 18:07:18'),(3,'Salvador',39,'CREAR','Nuevo registro de un caso','2026-03-31 18:11:45'),(4,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 18:22:39'),(5,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 18:37:31'),(6,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 18:57:15'),(7,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 19:10:28'),(8,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 19:11:36'),(9,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 19:26:47'),(10,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 20:15:55'),(11,'Salvador',39,'CREAR','Nuevo registro de un caso','2026-03-31 20:20:34'),(12,'Salvador',39,'ACTUALIZAR/MODIFICAR','Actualización de datos','2026-03-31 20:24:32'),(13,'Salvador',39,'ACTUALIZAR/MODIFICAR','Cambio de contraseña','2026-03-31 20:24:56'),(14,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 20:25:07'),(15,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 20:41:24'),(16,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-03-31 20:55:28'),(17,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-06 20:30:46'),(18,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-07 19:00:39'),(19,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-07 19:10:22'),(20,'Salvador',39,'CREAR','Nuevo registro de un caso','2026-04-07 19:14:24'),(21,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-07 19:32:01'),(22,'Salvador',39,'CREAR','Nuevo registro de un caso','2026-04-07 19:41:03'),(23,'kdorjuelab',41,'CREAR','Creación de un nuevo usuario','2026-04-11 16:29:18'),(24,'Karito2',42,'CREAR','Creación de un nuevo usuario','2026-04-11 16:33:00'),(25,'Karito3',43,'CREAR','Creación de un nuevo usuario','2026-04-11 16:35:40'),(26,'Sarita2',44,'CREAR','Creación de un nuevo usuario','2026-04-11 16:47:17'),(27,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-11 17:29:54'),(28,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-11 17:40:53'),(29,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-11 17:59:03'),(30,'Karoll',45,'CREAR','Creación de un nuevo usuario','2026-04-11 18:30:04'),(31,'jstrujillo',46,'CREAR','Creación de un nuevo usuario','2026-04-13 19:06:42'),(32,'jstrujillo',46,'CREAR','Nuevo registro de un caso','2026-04-13 19:14:04'),(33,'jstrujillo',46,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-13 19:15:51'),(34,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 18:57:51'),(35,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 19:00:21'),(36,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 19:01:31'),(37,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 19:03:47'),(38,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 19:18:35'),(39,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 19:40:21'),(40,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 19:57:10'),(41,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 20:03:28'),(42,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-17 20:07:47'),(43,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-20 19:20:58'),(44,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-20 19:33:40'),(45,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-20 20:04:50'),(46,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-21 18:48:59'),(47,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 18:50:52'),(48,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 18:56:34'),(49,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 19:16:21'),(50,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 19:16:51'),(51,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 19:32:07'),(52,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 19:32:37'),(53,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 19:44:46'),(54,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 20:07:34'),(55,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 20:24:11'),(56,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 20:40:16'),(57,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 21:07:23'),(58,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 21:13:03'),(59,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-22 21:22:34'),(60,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 08:34:53'),(61,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 08:35:14'),(62,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 08:38:24'),(63,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 08:38:59'),(64,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 08:52:06'),(65,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 09:02:28'),(66,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 09:03:57'),(67,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 09:10:23'),(68,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 09:10:45'),(69,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 09:26:57'),(70,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-24 12:57:37'),(71,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 14:27:55'),(72,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 14:43:25'),(73,'Karito',40,'ACTUALIZAR/MODIFICAR','Actualización de datos','2026-04-25 14:43:55'),(74,'Karito',40,'ACTUALIZAR/MODIFICAR','Cambio de contraseña','2026-04-25 14:44:52'),(75,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 14:45:24'),(76,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 15:06:15'),(77,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 15:35:53'),(78,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 16:18:24'),(79,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-25 16:49:19'),(80,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:00:00'),(81,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:18:48'),(82,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:24:50'),(83,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:34:48'),(84,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:47:47'),(85,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:51:30'),(86,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 18:58:07'),(87,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-26 19:04:47'),(88,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-27 18:30:32'),(89,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-27 18:47:07'),(90,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-27 18:59:24'),(91,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-27 19:13:40'),(92,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-27 19:29:09'),(93,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-27 19:44:44'),(94,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-28 19:00:27'),(95,'ifmorenoc',47,'CREAR','Creación de un nuevo usuario','2026-04-28 19:01:18'),(96,'ifmorenoc',47,'CREAR','Nuevo registro de un caso','2026-04-28 19:02:24'),(97,'ifmorenoc',47,'ACTUALIZAR/MODIFICAR','Actualización de datos','2026-04-28 19:08:03'),(98,'ifmorenoc',47,'ACTUALIZAR/MODIFICAR','Actualización de datos','2026-04-28 19:14:37'),(99,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-28 19:22:01'),(100,'lacortesm',47,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-28 19:25:19'),(101,'Alismarti',48,'CREAR','Creación de un nuevo usuario','2026-04-28 19:34:35'),(102,'Alismarti',48,'CREAR','Nuevo registro de un caso','2026-04-28 19:36:12'),(103,'Alismarti',48,'CREAR','Nuevo registro de un caso','2026-04-28 19:37:44'),(104,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-04-28 19:39:59'),(105,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 16:51:08'),(106,'Karito',40,'ENVIAR','Registro de caso enviado a entidad','2026-05-01 16:59:36'),(107,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 17:32:32'),(108,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 17:39:50'),(109,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 17:40:13'),(110,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 18:21:08'),(111,'Karito',40,'ACTUALIZAR/MODIFICAR','Se cambió estado del caso 5 a C','2026-05-01 18:21:24'),(112,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 18:50:58'),(113,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 18:56:22'),(114,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 19:05:33'),(115,'Karito',40,'ACTUALIZAR/MODIFICAR','Se cambió estado del caso 3 a R','2026-05-01 19:08:03'),(116,'Karito',40,'ENVIAR','Registro de caso 7 enviado a entidad','2026-05-01 19:08:15'),(117,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 19:22:28'),(118,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 19:40:55'),(119,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 20:17:27'),(120,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 20:23:55'),(121,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-01 20:25:08'),(122,'Karito',40,'ACTUALIZAR/MODIFICAR','Se cambió estado del caso 6 a P','2026-05-01 20:26:31'),(123,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 10:10:12'),(124,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 10:56:49'),(125,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 11:34:38'),(126,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 42 actualizado por administrador','2026-05-02 11:48:34'),(127,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 42 actualizado por administrador','2026-05-02 11:48:39'),(128,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 42 actualizado por administrador','2026-05-02 11:49:15'),(129,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 11:53:08'),(130,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 42 actualizado por administrador','2026-05-02 11:53:30'),(131,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 42 actualizado por administrador','2026-05-02 11:53:43'),(132,'Karito',40,'ELIMINAR','Usuario 41 desactivado','2026-05-02 11:59:07'),(133,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 47 actualizado por administrador','2026-05-02 11:59:39'),(134,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 47 actualizado por administrador','2026-05-02 11:59:40'),(135,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 47 actualizado por administrador','2026-05-02 11:59:42'),(136,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 47 actualizado por administrador','2026-05-02 11:59:42'),(137,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 47 actualizado por administrador','2026-05-02 11:59:43'),(138,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 12:14:34'),(139,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 42 actualizado por administrador','2026-05-02 12:15:07'),(140,'Karito',40,'ELIMINAR','Usuario 41 desactivado','2026-05-02 12:15:54'),(141,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 14:48:25'),(142,'Karito',40,'ELIMINAR','Usuario 42 desactivado','2026-05-02 14:58:46'),(143,'Karito',40,'ENVIAR','Registro de caso 8 enviado a entidad','2026-05-02 15:02:07'),(144,'Karito',40,'ACTUALIZAR/MODIFICAR','Usuario 47 actualizado por administrador','2026-05-02 15:02:53'),(145,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 15:07:26'),(146,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 15:22:48'),(147,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 15:38:13'),(148,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 15:56:04'),(149,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 16:20:49'),(150,'Karito',40,'GENERAR','Nuevo reporte generado por Karito','2026-05-02 16:27:49'),(151,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 17:29:44'),(152,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 17:31:57'),(153,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 17:50:21'),(154,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 18:15:18'),(155,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 18:31:12'),(156,'Karito',40,'GENERAR','Nuevo reporte generado por Karito','2026-05-02 18:43:48'),(157,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 18:46:47'),(158,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 18:56:18'),(159,'Salvador',39,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 19:31:40'),(160,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-02 19:32:25'),(161,'Karito',40,'INGRESAR','Nuevo ingreso de usuario al aplicativo','2026-05-04 18:46:11');
/*!40000 ALTER TABLE `historical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_caso`
--

DROP TABLE IF EXISTS `tbl_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_caso` (
  `Id_Caso_Desastre` int unsigned NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Descripcion` text,
  `Direccion` varchar(255) DEFAULT NULL,
  `Personas_Afectadas` int NOT NULL,
  `Fk_Usuario` int unsigned NOT NULL,
  `Fk_Desastre` varchar(10) NOT NULL,
  `Fk_Estado` varchar(10) NOT NULL,
  `Fk_Ciu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Caso_Desastre`),
  KEY `Fk_Usuario` (`Fk_Usuario`),
  KEY `Fk_Desastre` (`Fk_Desastre`),
  KEY `Fk_Estado` (`Fk_Estado`),
  KEY `tbl_caso_ibfk_4_idx` (`Fk_Ciu`),
  CONSTRAINT `tbl_caso_ibfk_1` FOREIGN KEY (`Fk_Usuario`) REFERENCES `tbl_usuario` (`Id_usuario`),
  CONSTRAINT `tbl_caso_ibfk_2` FOREIGN KEY (`Fk_Desastre`) REFERENCES `tbl_desastre` (`Id_desastre`),
  CONSTRAINT `tbl_caso_ibfk_3` FOREIGN KEY (`Fk_Estado`) REFERENCES `tbl_estado` (`Id_estado`),
  CONSTRAINT `tbl_caso_ibfk_4` FOREIGN KEY (`Fk_Ciu`) REFERENCES `tbl_municipio` (`Id_municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_caso`
--

LOCK TABLES `tbl_caso` WRITE;
/*!40000 ALTER TABLE `tbl_caso` DISABLE KEYS */;
INSERT INTO `tbl_caso` VALUES (1,'2025-08-15','Fui victima de una inundación en la fecha dada la cuál arrasó con mi casa y provocó grandes daños a mi vivienda, lastimando a los habitantes de la casa y perdiendo mayoría de bienes. ','Carrera 56A#49-29 sur, Barrio Venecia',4,39,'Inund','E','COT'),(2,'2026-02-20','Ejemplo para verificar registro en historical','Carrera 56A#49-29 sur, Barrio Venecia',6,39,'In','E','CAC'),(3,'2025-02-20','Prueba de caso registrado con exito y visualizado en el dashboard principal','Diagonal 49 #76A- 89, Barrio Chicó Norte',9,39,'SI-T','R','CHI'),(4,'2026-04-07','se presentó una inundación','si',25,39,'Inund','C','GAC'),(5,'2026-02-04','Se inundo una casa','Callle',5,39,'Inund','C','SUT'),(6,'2026-04-13','Buenas noches, cordial saludo\r\nNotifico que por motivos de las lluvias recurrentes en la vereda el Caimito en la Calle 15 #132-15 se afectó mi vivienda inundándose y dañando ciertos electrodomésticos, me comunico con ustedes para que me puedan ayudar a gestionar ayuda.','CL 15 #132-15',3,46,'Inund','P','LAM'),(7,'2026-04-28','Se inundo mi casa','Calle 23# 26-8',2,47,'Inund','E','ANA'),(8,'2026-04-28','Se inundo mi casa','Calle 68-8',5,48,'Inund','E','CUC'),(9,'2006-04-28','Se inundo mi casa','Calle 8-95',3,48,'Inund','R','ANA');
/*!40000 ALTER TABLE `tbl_caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_desastre`
--

DROP TABLE IF EXISTS `tbl_desastre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_desastre` (
  `Id_desastre` varchar(10) NOT NULL,
  `Desastre` varchar(20) NOT NULL,
  `fk_prioridad` varchar(10) NOT NULL,
  `Nombre_Entidad` text NOT NULL,
  `Descripcion_Entidad` text NOT NULL,
  `Direccion` varchar(1000) NOT NULL,
  `Numero_Contacto` varchar(10) DEFAULT NULL,
  `Web_site` text,
  `Correo` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`Id_desastre`),
  KEY `fk_prioridad` (`fk_prioridad`),
  CONSTRAINT `tbl_desastre_ibfk_1` FOREIGN KEY (`fk_prioridad`) REFERENCES `tbl_prioridad` (`Id_prioridad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_desastre`
--

LOCK TABLES `tbl_desastre` WRITE;
/*!40000 ALTER TABLE `tbl_desastre` DISABLE KEYS */;
INSERT INTO `tbl_desastre` VALUES ('In','Incendio','A','Delegación Departamental de Bomberos de Cundinamarca','Entidad departamental que lidera la extinción y control de incendios forestales y estructurales en Cundinamarca, coordinando con bomberos municipales y la UAEGRD para respuestas rápidas.','Carrera 30 No. 85A-39, Bogotá D.C','3125859581','bomberos.mininterior.gov.co','delegadobomberoscund@gmail.com'),('Inund','Inundación','B','Unidad Administrativa Especial para la Gestión del Riesgo de Desastres de Cundinamarca','Unidad departamental encargada de la atención inmediata a inundaciones, incluyendo evacuaciones, distribución de ayudas y mitigación de riesgos hídricos en ríos y quebradas de Cundinamarca. Coordina con IDEAM para pronósticos.','Av. Américas, Carrera 58 No. 9-05, Bogotá D.C.','7490000','cundinamarca.gov.co','apoyoemergencias@cundinamarca.gov.co'),('SI-T','Sismo-temblor','D','Coordinador Departamental de Gestión del Riesgo','Apoyo nacional para eventos sísmicos mayores, enfocada en recursos federales y planes de contingencia para Cundinamarca','Carrera 8 No. 32-16, Bogotá D.C.','3320555','gestiondelriesgo.gov.co','cdgrd.cundinamarca@gestiondelriesgo.gov.co');
/*!40000 ALTER TABLE `tbl_desastre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_estado`
--

DROP TABLE IF EXISTS `tbl_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_estado` (
  `Id_estado` varchar(10) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estado`
--

LOCK TABLES `tbl_estado` WRITE;
/*!40000 ALTER TABLE `tbl_estado` DISABLE KEYS */;
INSERT INTO `tbl_estado` VALUES ('00','Inactivo'),('01','Activo'),('C','Cerrado '),('E','Enviado'),('P','Pendiente'),('R','Registrado');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_municipio`
--

DROP TABLE IF EXISTS `tbl_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_municipio` (
  `Id_municipio` varchar(10) NOT NULL,
  `Nom_Municipio` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_municipio`
--

LOCK TABLES `tbl_municipio` WRITE;
/*!40000 ALTER TABLE `tbl_municipio` DISABLE KEYS */;
INSERT INTO `tbl_municipio` VALUES ('AGD','Agua de Dios'),('ALB','Albán'),('ANA','Anapoima'),('ANOL','Anolaima'),('APU','Apulo'),('ARB','Arbeláez'),('BEL','Beltrán'),('BIT','Bituima'),('BOJ','Bojacá'),('CAB','Cabrera'),('CAC','Cachipay'),('CAJ','Cajicá'),('CAP','Caparrapí'),('CAQ','Cáqueza'),('CAR','Carmen de Carupa'),('CHA','Chaguaní'),('CHC','Chocontá'),('CHI','Chía'),('CHO','Choachí'),('CHP','Chipaque'),('COG','Cogua'),('COL','El Colegio'),('COT','Cota'),('CUC','Cucunubá'),('FAC','Facatativá'),('FOM','Fómeque'),('FOS','Fosca'),('FUN','Funza'),('FUQ','Fúquene'),('FUS','Fusagasugá'),('GAC','Gachalá'),('GAM','Gama'),('GAN','Gachancipá'),('GAT','Gachetá'),('GIR','Girardot'),('GRA','Granada'),('GUA','Guachetá'),('GUD','Guaduas'),('GUQ','Guataquí'),('GUS','Guasca'),('GUSI','Guayabal de Síquima'),('GUT','Gutiérrez'),('GUV','Guatavita'),('GUY','Guayabetal'),('JER','Jerusalén'),('JUN','Junín'),('LAC','La Calera'),('LAM','La Mesa'),('LAP','La Palma'),('LEN','Lenguazaque'),('LPE','La Peña'),('LVE','La Vega'),('MAC','Machetá'),('MAD','Madrid'),('MAN','Manta'),('MED','Medina'),('MOS','Mosquera'),('NAR','Nariño'),('NEM','Nemocón'),('NIL','Nilo'),('NIM','Nimaima'),('NOC','Nocaima'),('PAC','Pacho'),('PAI','Paime'),('PAN','Pandi'),('PAR','Paratebueno'),('PAS','Pasca'),('PEN','El Peñón'),('PSA','Puerto Salgar'),('PUL','Pulí'),('QET','Quetame'),('QUE','Quebradanegra'),('QUI','Quipile'),('RIC','Ricaurte'),('ROS','El Rosal'),('SAS','Sasaima'),('SAT','San Antonio'),('SBE','San Bernardo'),('SCY','San Cayetano'),('SES','Sesquilé'),('SFR','San Francisco'),('SIB','Sibaté'),('SIL','Silvania'),('SIM','Simijaca'),('SJR','San Juan de Rioseco'),('SOA','Soacha'),('SOP','Sopó'),('SUB','Subachoque'),('SUE','Suesca'),('SUP','Supatá'),('SUS','Susa'),('SUT','Sutatausa'),('TAB','Tabio'),('TAU','Tausa'),('TCP','Tocancipá'),('TEN','Tenjo'),('TIB','Tibacuy'),('TIR','Tibirita'),('TNA','Tena'),('TOC','Tocaima'),('TOP','Topaipí'),('UBA','Ubalá'),('UBQ','Ubaque'),('UBT','Ubaté'),('UNE','Une'),('UTI','Útica'),('VEN','Venecia'),('VER','Vergara'),('VGO','Villagómez'),('VIA','Vianí'),('VIL','Villeta'),('VIO','Viotá'),('VPN','Villapinzón'),('YAC','Yacopí'),('ZIPA','Zipaquirá'),('ZIPC','Zipacón');
/*!40000 ALTER TABLE `tbl_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_persona`
--

DROP TABLE IF EXISTS `tbl_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_persona` (
  `Id_Persona` varchar(10) NOT NULL,
  `Pri_Nom` varchar(20) NOT NULL,
  `Seg_Nom` varchar(20) NOT NULL,
  `Pri_Ape` varchar(20) NOT NULL,
  `Seg_Ape` varchar(20) NOT NULL,
  `fk_Tipo_documento` varchar(10) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `fk_Usuario` int unsigned NOT NULL,
  `Edad` int NOT NULL,
  `Direccion` tinytext NOT NULL,
  `Num_Contact` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Persona`),
  KEY `fk_Tipo_documento` (`fk_Tipo_documento`),
  KEY `fk_Usuario` (`fk_Usuario`),
  CONSTRAINT `tbl_persona_ibfk_1` FOREIGN KEY (`fk_Tipo_documento`) REFERENCES `tbl_tipo_documento` (`Id_Documento`),
  CONSTRAINT `tbl_persona_ibfk_2` FOREIGN KEY (`fk_Usuario`) REFERENCES `tbl_usuario` (`Id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_persona`
--

LOCK TABLES `tbl_persona` WRITE;
/*!40000 ALTER TABLE `tbl_persona` DISABLE KEYS */;
INSERT INTO `tbl_persona` VALUES ('1021665307','Juan','Sebastian','Trujillo','Sanchez','CC','2004-08-28',46,21,'CL 15 #132-15','3227824460','28juansetrujillo@gmail.com'),('102546789','Sara','','Higuera','','CC','2006-06-02',44,19,'Carrera 56A#49-29 sur','3204224077','juansetrujillo28@gmail.com'),('1025533985','Karoll','Daniela','Orjuela','Ballesteros','CC','2007-04-15',40,18,'Carrera 56A#49-29 sur','3204224077','danielaorjbal@gmail.com'),('1025533986','Karoll','Daniela','Orjuela','Ballesteros','CC','2007-04-15',41,18,'Diagonal 49 #76A- 89, Barrio Chicó Norte','3204224077','kdorjuelab@sanmateo.edu.com'),('1025533988','Karoll','','Orjuela','','CC','2007-04-15',45,18,'Carrera 56A#49-29 sur','3204224077','danielaorjbal@gmai.com'),('1026262113','Luz','','Cortes','','CC','2006-10-06',47,39,'Calle 85-2, interior 2','3108161050','ifmorenoc@sanmateo.edu.co'),('1027336987','Alejandro','','Orjuela','','CC','2006-07-28',42,19,'Carrera 56A#49-29 sur','3103069581','kdorjuelab@sanmateo.edu'),('1027336988','Alejandro','','Orjuela','','CC','2006-07-28',43,19,'Carrera 56A#49-29 sur','3103069581','kdorjuelab@sanmateo.edu.co'),('20686905','Ingrid','','Moreno','','CC','2006-10-06',48,19,'Calle 5-8, Interior 2','3202216546','ferdianith006@gmail.com'),('7279409','Salvador','','Orjuela','Rodriguez','CC','1979-10-24',39,46,'Diagonal 49 #54-9, Barrio Venecia','3204224077','juansetrujillo28@gmai.com');
/*!40000 ALTER TABLE `tbl_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prioridad`
--

DROP TABLE IF EXISTS `tbl_prioridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prioridad` (
  `Id_prioridad` varchar(10) NOT NULL,
  `Prioridad` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_prioridad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prioridad`
--

LOCK TABLES `tbl_prioridad` WRITE;
/*!40000 ALTER TABLE `tbl_prioridad` DISABLE KEYS */;
INSERT INTO `tbl_prioridad` VALUES ('A','Alta'),('B','Moderada'),('C','Media'),('D','Baja');
/*!40000 ALTER TABLE `tbl_prioridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_documento`
--

DROP TABLE IF EXISTS `tbl_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_documento` (
  `Id_Documento` varchar(10) NOT NULL,
  `Tipo_documento` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_Documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_documento`
--

LOCK TABLES `tbl_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_documento` DISABLE KEYS */;
INSERT INTO `tbl_tipo_documento` VALUES ('CC','Cedula Ciudadania'),('CE','Cedula Extranjeria'),('PA','Pasaporte'),('TI','Tarjeta de identidad');
/*!40000 ALTER TABLE `tbl_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `Id_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Contrasena` varchar(300) NOT NULL,
  `Rol` varchar(20) NOT NULL DEFAULT 'User',
  `fk_estado` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_usuario`),
  UNIQUE KEY `Nombre` (`Nombre`),
  KEY `fk_estado` (`fk_estado`),
  CONSTRAINT `tbl_usuario_ibfk_2` FOREIGN KEY (`fk_estado`) REFERENCES `tbl_estado` (`Id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (39,'Salvador','$2b$12$WWn3v46IWOPsPmSAbKChyOJcfy7SUNKLfynn7c1idIkcOLT.0a2JO','User','01'),(40,'Karito','$2b$12$6wE29vRUBj4O1Cq0fbdGUuDKRDRjuuXT4PiR2n70qqfrs149Ny0CK','Admin','01'),(41,'kdorjuelab','$2b$12$9jn/PwFuJKBIXAYM9/yBP.wgZDLRtsjRJ4vhDtSgPAtP9vXSbdqde','User','00'),(42,'Karito1','$2b$12$cS1tNLTA3EmlYGfaL5UqPuRU7K.uZ1Wy8RldK1zrGhbZemYXkF0wC','User','00'),(43,'Karito3','$2b$12$CFMGULfGIZi/hVNg6YWISepbyrOKIpJaNwCV.DJNwAh8CBz3trH.q','User','00'),(44,'Sarita2','$2b$12$0uN0hG46VffCjHbRCK9HfOMThBfZzCtV2ea7S1o1z5oVlVSVwwJJm','User','00'),(45,'Karoll','$2b$12$9BfZQLiyYHLLbhdapctezeeAbt.tBE2uHBQCvqytaLdF6hvaHSxHy','User','00'),(46,'jstrujillo','$2b$12$iJ0W2adb0aI4Dfrc2HtAxua8wwpf/436vsngVghKKvHyQCIgxc6KW','User','00'),(47,'lacortes','$2b$12$yB4sHaqREI5o.RI/CLe9DOXrNYOaWB9VrphIJF7xk9FlLxU5o0bh6','Admin','01'),(48,'Alismarti','$2b$12$G40ZLq0Huo9ap3wqXq2lXetzpKqJ7kUcm2TOq7nu11HUZZVJChYRe','User','01');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_datos_completos_usuarios`
--

DROP TABLE IF EXISTS `vw_datos_completos_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_datos_completos_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_datos_completos_usuarios` AS SELECT 
 1 AS `Documento`,
 1 AS `Nombres`,
 1 AS `Apellidos`,
 1 AS `Id_Usuario`,
 1 AS `Nombre_Usuario`,
 1 AS `Contrasena`,
 1 AS `Rol_Usuario`,
 1 AS `Estado_Usuario`,
 1 AS `Direccion`,
 1 AS `Email`,
 1 AS `Telefono`,
 1 AS `Edad`,
 1 AS `Tipo_Documento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_desastres`
--

DROP TABLE IF EXISTS `vw_desastres`;
/*!50001 DROP VIEW IF EXISTS `vw_desastres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_desastres` AS SELECT 
 1 AS `id_desastre`,
 1 AS `desastre`,
 1 AS `prioridad`,
 1 AS `nombre_entidad`,
 1 AS `descripcion`,
 1 AS `numero_contacto`,
 1 AS `correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usuarios_activos`
--

DROP TABLE IF EXISTS `vw_usuarios_activos`;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usuarios_activos` AS SELECT 
 1 AS `Id_usuario`,
 1 AS `nombre_completo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'proyecto_final'
--

--
-- Dumping routines for database 'proyecto_final'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_cerrados_persona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_cerrados_persona`(p_usuario_id VARCHAR(10)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_cerrados INT;
    SELECT COUNT(*)
    INTO v_cerrados
    FROM tbl_caso c
     WHERE c.Fk_Usuario = p_usuario_id
      AND c.Fk_Estado = 'C';
    RETURN v_cerrados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_cerrados_sistema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_cerrados_sistema`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_cerrados INT;
    SELECT COUNT(*)
    INTO v_cerrados
    FROM tbl_caso c
     WHERE c.Fk_Estado = 'C';
    RETURN v_cerrados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_enviados_persona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_enviados_persona`(p_usuario_id VARCHAR(10)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_enviados INT;
    SELECT COUNT(*)
    INTO v_enviados
    FROM tbl_caso c
	WHERE c.Fk_Usuario = p_usuario_id
      AND c.Fk_Estado = 'E';
    RETURN v_enviados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_enviados_sistema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_enviados_sistema`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_enviados INT;
    SELECT COUNT(*)
    INTO v_enviados
    FROM tbl_caso c
	WHERE c.Fk_Estado = 'E';
    RETURN v_enviados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_incendio_sistema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_incendio_sistema`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM tbl_caso
    WHERE Fk_Desastre = 'In';
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_incendio_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_incendio_usuario`(p_usuario_id INT UNSIGNED) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM tbl_caso
    WHERE Fk_Usuario = p_usuario_id
      AND Fk_Desastre = 'In';
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_inundacion_sistema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_inundacion_sistema`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM tbl_caso
    WHERE Fk_Desastre = 'Inund';
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_inundacion_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_inundacion_usuario`(p_usuario_id INT UNSIGNED) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM tbl_caso
    WHERE Fk_Usuario = p_usuario_id
      AND Fk_Desastre = 'Inund';
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_sismo_sistema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_sismo_sistema`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM tbl_caso
    WHERE Fk_Desastre = 'SI-T';
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_casos_sismo_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_casos_sismo_usuario`(p_usuario_id INT UNSIGNED) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*) INTO v_total
    FROM tbl_caso
    WHERE Fk_Usuario = p_usuario_id
      AND Fk_Desastre = 'SI-T';
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_documento_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_documento_exists`(p_persona_id VARCHAR(10)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_exists BOOLEAN DEFAULT FALSE;
    SELECT EXISTS(SELECT 1 FROM tbl_persona WHERE Id_Persona = p_persona_id) INTO v_exists;
    RETURN v_exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_email_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_email_exists`(p_email VARCHAR(50)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_exists BOOLEAN DEFAULT FALSE;
    SELECT EXISTS(SELECT 1 FROM tbl_persona WHERE Email = p_email) INTO v_exists;
    RETURN v_exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_entidad_correo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_entidad_correo`(p_id_desastre VARCHAR(10)) RETURNS varchar(90) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_correo VARCHAR(90);
    SELECT Correo INTO v_correo
    FROM tbl_desastre
    WHERE Id_desastre = p_id_desastre;
    RETURN v_correo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_persona_id_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_persona_id_by_user`(p_user_id INT UNSIGNED) RETURNS varchar(10) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_persona_id VARCHAR(10);
    SELECT Id_Persona INTO v_persona_id
    FROM tbl_persona
    WHERE fk_Usuario = p_user_id;
    RETURN v_persona_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_user_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_user_email`(p_persona_id VARCHAR(10)) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_email VARCHAR(50);
    SELECT Email INTO v_email
    FROM tbl_persona
    WHERE Id_Persona = p_persona_id;
    RETURN v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_user_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_user_id`(p_username VARCHAR(20)) RETURNS int unsigned
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_user_id INT UNSIGNED;
    SELECT Id_usuario INTO v_user_id
    FROM tbl_usuario
    WHERE Nombre = p_username;
    RETURN v_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_user_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_user_password`(p_user_id INT UNSIGNED) RETURNS varchar(300) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_pass VARCHAR(300);
    SELECT Contrasena INTO v_pass
    FROM tbl_usuario
    WHERE Id_usuario = p_user_id;
    RETURN v_pass;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_user_role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_user_role`(p_username VARCHAR(20)) RETURNS varchar(20) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_rol VARCHAR(20);
    SELECT Rol INTO v_rol
    FROM tbl_usuario
    WHERE Nombre = p_username;
    RETURN v_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_get_user_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_get_user_state`(p_username VARCHAR(20)) RETURNS varchar(10) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_estado VARCHAR(10);
    SELECT fk_estado INTO v_estado
    FROM tbl_usuario
    WHERE Nombre = p_username;
    RETURN v_estado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_casos_persona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_casos_persona`(p_usuario_id VARCHAR(10)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_total INT;
    SELECT COUNT(*)
    INTO v_total
    FROM tbl_caso c
    WHERE c.Fk_Usuario = p_usuario_id;
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_casos_sistema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_casos_sistema`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE v_total INT;
    SELECT COUNT(*)
    INTO v_total
    FROM tbl_caso c;
    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_usuarios`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE v_usuarios INT;
    SELECT COUNT(*)
    INTO v_usuarios
    FROM tbl_usuario u
     WHERE u.Fk_Estado = '01';
    RETURN v_usuarios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_usuarios_inactivos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_usuarios_inactivos`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE v_usuarios INT;
    SELECT COUNT(*)
    INTO v_usuarios
    FROM tbl_usuario u
     WHERE u.Fk_Estado = '00';
    RETURN v_usuarios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_username_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_username_exists`(p_username VARCHAR(20)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_exists BOOLEAN DEFAULT FALSE;
    SELECT EXISTS(SELECT 1 FROM tbl_usuario WHERE Nombre = p_username) INTO v_exists;
    RETURN v_exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_username_exists_excluding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_username_exists_excluding`(
    p_username VARCHAR(20),
    p_exclude_user_id INT UNSIGNED
) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_exists BOOLEAN DEFAULT FALSE;
    SELECT EXISTS(
        SELECT 1 FROM tbl_usuario
        WHERE Nombre = p_username AND Id_usuario != p_exclude_user_id
    ) INTO v_exists;
    RETURN v_exists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_change_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_change_state`(IN p_case_id INT,
    IN p_state VARCHAR(2))
BEGIN
	UPDATE tbl_caso
    SET Fk_Estado = p_state
    WHERE Id_Caso_Desastre = p_case_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_change_user_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_change_user_password`(
    IN p_user_id INT UNSIGNED,
    IN p_new_password VARCHAR(300)
)
    MODIFIES SQL DATA
BEGIN
    UPDATE tbl_usuario
    SET Contrasena = p_new_password
    WHERE Id_usuario = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deactivate_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deactivate_user`(IN p_user_id INT UNSIGNED)
    MODIFIES SQL DATA
BEGIN
    UPDATE tbl_usuario
    SET fk_estado = '00'
    WHERE Id_usuario = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generate_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generate_report`(IN p_fecha_ini DATE, IN p_fecha_fin DATE)
    READS SQL DATA
BEGIN
    SELECT
        c.Id_Caso_Desastre AS id,
        c.Fecha AS fecha,
        c.Descripcion AS descripcion,
        c.Direccion AS direccion,
        c.Personas_Afectadas AS personas_afectadas,
        d.Desastre AS desastre,
        m.Nom_Municipio AS municipio,
        e.Estado AS estado,
        d.Nombre_Entidad AS entidad_encargada,
        u.Id_usuario AS id_usuario,
        u.Nombre AS nombre_usuario,
        CONCAT(p.Pri_Nom, ' ', p.Pri_Ape) AS nombre_completo
    FROM tbl_caso c
    INNER JOIN tbl_desastre d ON c.Fk_Desastre = d.Id_desastre
    INNER JOIN tbl_municipio m ON c.Fk_Ciu = m.Id_municipio
    INNER JOIN tbl_estado e ON c.Fk_Estado = e.Id_estado
    INNER JOIN tbl_usuario u ON c.Fk_Usuario = u.Id_usuario
    INNER JOIN tbl_persona p ON u.Id_usuario = p.fk_Usuario
    WHERE c.Fecha BETWEEN p_fecha_ini AND p_fecha_fin
    ORDER BY c.Fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_cases_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_cases_admin`()
    READS SQL DATA
BEGIN
    SELECT
        c.Id_Caso_Desastre AS id,
        CONCAT(p.Pri_Nom, ' ', p.Pri_Ape) AS nombre_completo,
        p.Email AS email,
        c.Fecha AS fecha,
        d.Desastre AS desastre,
        c.Direccion AS direccion,
        m.Nom_Municipio AS municipio,
        e.Estado AS estado,
        c.Descripcion AS descripcion
    FROM tbl_caso c
    INNER JOIN tbl_desastre d ON c.Fk_Desastre = d.Id_desastre
    INNER JOIN tbl_municipio m ON c.Fk_Ciu = m.Id_municipio
    INNER JOIN tbl_estado e ON c.Fk_Estado = e.Id_estado
    INNER JOIN tbl_usuario u ON c.Fk_Usuario = u.Id_usuario 
    INNER JOIN tbl_persona p ON u.Id_usuario = p.fk_Usuario
    ORDER BY c.Id_Caso_Desastre DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_cases_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_cases_user`(IN p_fk_usuario INT UNSIGNED)
    READS SQL DATA
BEGIN
    SELECT
        c.Id_Caso_Desastre AS id,
        c.Fecha AS fecha,
        c.Descripcion AS descripcion,
        c.Direccion AS direccion,
        c.Personas_Afectadas AS personas_afectadas,
        d.Desastre AS desastre,
        m.Nom_Municipio AS municipio,
        e.Estado AS estado
    FROM tbl_caso c
    INNER JOIN tbl_desastre d ON c.Fk_Desastre = d.Id_desastre
    INNER JOIN tbl_municipio m ON c.Fk_Ciu = m.Id_municipio
    INNER JOIN tbl_estado e ON c.Fk_Estado = e.Id_estado
    WHERE c.Fk_Usuario = p_fk_usuario
    ORDER BY c.Fecha DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_case_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_case_by_id`(IN p_id_caso INT UNSIGNED)
    READS SQL DATA
BEGIN
    SELECT
        c.Id_Caso_Desastre AS id,
        c.Fecha AS fecha,
        c.Descripcion AS descripcion,
        c.Direccion AS direccion,
        c.Personas_Afectadas AS personas_afectadas,
        c.Fk_Desastre AS id_desastre,
        d.Desastre AS desastre,
        m.Nom_Municipio AS municipio,
        e.Estado AS estado,
        p.Prioridad AS prioridad
    FROM tbl_caso c
    INNER JOIN tbl_desastre d ON c.Fk_Desastre = d.Id_desastre
    INNER JOIN tbl_municipio m ON c.Fk_Ciu = m.Id_municipio
    INNER JOIN tbl_estado e ON c.Fk_Estado = e.Id_estado
    INNER JOIN tbl_prioridad p ON d.fk_prioridad = p.Id_prioridad
    WHERE c.Id_Caso_Desastre = p_id_caso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_entidad_by_desastre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_entidad_by_desastre`(IN p_id_desastre VARCHAR(10))
    READS SQL DATA
BEGIN
    SELECT 
        Id_desastre AS id_entidad,
        Nombre_Entidad AS nombre_entidad,
        Correo AS correo
    FROM tbl_desastre
    WHERE Id_desastre = p_id_desastre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_account`(IN p_user_id INT UNSIGNED)
    READS SQL DATA
BEGIN
    SELECT
        p.Id_Persona AS Documento,
        CONCAT(p.Pri_Nom, ' ', IFNULL(p.Seg_Nom, '')) AS Nombres,
        CONCAT(p.Pri_Ape, ' ', IFNULL(p.Seg_Ape, '')) AS Apellidos,
        u.Id_usuario AS Id_Usuario,
        u.Nombre AS Nombre_Usuario,
        u.Contrasena AS Contrasena,
        u.Rol AS Rol_Usuario,
        e.Estado AS Estado_Usuario,
        p.Direccion,
        p.Email,
        p.Num_Contact AS Telefono,
        p.Edad,
        t.Tipo_Documento
    FROM tbl_usuario u
    INNER JOIN tbl_persona p ON p.fk_Usuario = u.Id_usuario
    INNER JOIN tbl_estado e ON e.Id_estado = u.fk_estado
    INNER JOIN tbl_tipo_documento t ON t.Id_Documento = p.fk_Tipo_documento
    WHERE u.Id_usuario = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_activity`(IN p_user_id INT UNSIGNED, IN p_limit INT)
    READS SQL DATA
BEGIN
    SELECT 
        Id_historical,
        username,
        Accion,
        Descripcion,
        Created_at
    FROM historical
    WHERE Fk_usuario = p_user_id
    ORDER BY Created_at DESC
    LIMIT p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_by_case` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_by_case`(IN p_caso_id INT UNSIGNED)
    READS SQL DATA
BEGIN
    SELECT
        p.Id_Persona AS id_persona,
        CONCAT_WS(' ', p.Pri_Nom, p.Seg_Nom, p.Pri_Ape, p.Seg_Ape) AS nombre_completo,
        p.Email AS email,
        p.Num_Contact AS num_contacto
    FROM tbl_caso c
    INNER JOIN tbl_usuario u ON c.Fk_Usuario = u.Id_usuario
    INNER JOIN tbl_persona p ON u.Id_usuario = p.fk_Usuario
    WHERE c.Id_Caso_Desastre = p_caso_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_by_id`(IN p_user_id INT UNSIGNED)
    READS SQL DATA
BEGIN
    SELECT * FROM tbl_usuario WHERE Id_usuario = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_by_name`(IN p_username VARCHAR(20))
    READS SQL DATA
BEGIN
    SELECT Id_usuario, Nombre, Contrasena, Rol, fk_estado
    FROM tbl_usuario
    WHERE Nombre = p_username COLLATE utf8mb4_bin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_case` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_case`(
    IN p_fecha DATE,
    IN p_descripcion TEXT,
    IN p_direccion VARCHAR(255),
    IN p_personas_afectadas INT,
    IN p_fk_usuario INT UNSIGNED,
    IN p_fk_desastre VARCHAR(10),
    IN p_fk_ciu VARCHAR(10),
    IN p_fk_estado VARCHAR(10)
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO tbl_caso (
        Fecha, Descripcion, Direccion, Personas_Afectadas,
        Fk_Usuario, Fk_Desastre, Fk_Ciu, Fk_Estado
    ) VALUES (
        p_fecha, p_descripcion, p_direccion, p_personas_afectadas,
        p_fk_usuario, p_fk_desastre, p_fk_ciu, p_fk_estado
    );
    SELECT LAST_INSERT_ID() AS Id_Caso_Desastre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_user`(
    IN p_username VARCHAR(20),
    IN p_password_hash VARCHAR(300),
    IN p_id_persona VARCHAR(10),
    IN p_pri_nom VARCHAR(20),
    IN p_seg_nom VARCHAR(20),
    IN p_pri_ape VARCHAR(20),
    IN p_seg_ape VARCHAR(20),
    IN p_tipo_doc VARCHAR(10),
    IN p_fecha_nac DATE,
    IN p_edad INT,
    IN p_direccion TINYTEXT,
    IN p_telefono VARCHAR(10),
    IN p_email VARCHAR(50),
    IN p_rol VARCHAR(20),
    IN p_estado VARCHAR(10)
)
    MODIFIES SQL DATA
BEGIN
    DECLARE v_id_usuario INT UNSIGNED;

    INSERT INTO tbl_usuario (Nombre, Contrasena, Rol, fk_estado)
    VALUES (p_username, p_password_hash, p_rol, p_estado);

    SET v_id_usuario = LAST_INSERT_ID();

    INSERT INTO tbl_persona (
        Id_Persona, Pri_Nom, Seg_Nom, Pri_Ape, Seg_Ape,
        fk_Tipo_documento, Fecha_nacimiento, fk_Usuario,
        Edad, Direccion, Num_Contact, Email
    ) VALUES (
        p_id_persona, p_pri_nom, p_seg_nom, p_pri_ape, p_seg_ape,
        p_tipo_doc, p_fecha_nac, v_id_usuario,
        p_edad, p_direccion, p_telefono, p_email
    );

    SELECT v_id_usuario AS Id_Usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_user_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_user_account`(
    IN p_user_id INT UNSIGNED,
    IN p_pri_nom VARCHAR(20),
    IN p_seg_nom VARCHAR(20),
    IN p_pri_ape VARCHAR(20),
    IN p_seg_ape VARCHAR(20),
    IN p_direccion TINYTEXT,
    IN p_email VARCHAR(50),
    IN p_telefono VARCHAR(10),
    IN p_edad INT,
    IN p_username VARCHAR(20)
)
    MODIFIES SQL DATA
BEGIN
    DECLARE v_persona_id VARCHAR(10);
    DECLARE v_pri_nom_cur VARCHAR(20);
    DECLARE v_seg_nom_cur VARCHAR(20);
    DECLARE v_pri_ape_cur VARCHAR(20);
    DECLARE v_seg_ape_cur VARCHAR(20);
    DECLARE v_direccion_cur TINYTEXT;
    DECLARE v_email_cur VARCHAR(50);
    DECLARE v_telefono_cur VARCHAR(10);
    DECLARE v_edad_cur INT;
    DECLARE v_username_cur VARCHAR(20);

    SELECT Id_Persona INTO v_persona_id
    FROM tbl_persona
    WHERE fk_Usuario = p_user_id;

    IF v_persona_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró persona asociada a este usuario';
    END IF;

    SELECT
        Pri_Nom, Seg_Nom, Pri_Ape, Seg_Ape,
        Direccion, Email, Num_Contact, Edad,
        u.Nombre
    INTO
        v_pri_nom_cur, v_seg_nom_cur, v_pri_ape_cur, v_seg_ape_cur,
        v_direccion_cur, v_email_cur, v_telefono_cur, v_edad_cur,
        v_username_cur
    FROM tbl_persona p
    INNER JOIN tbl_usuario u ON u.Id_usuario = p.fk_Usuario
    WHERE p.Id_Persona = v_persona_id;

    SET p_pri_nom = IFNULL(p_pri_nom, v_pri_nom_cur);
    SET p_seg_nom = IFNULL(p_seg_nom, v_seg_nom_cur);
    SET p_pri_ape = IFNULL(p_pri_ape, v_pri_ape_cur);
    SET p_seg_ape = IFNULL(p_seg_ape, v_seg_ape_cur);
    SET p_direccion = IFNULL(p_direccion, v_direccion_cur);
    SET p_email = IFNULL(p_email, v_email_cur);
    SET p_telefono = IFNULL(p_telefono, v_telefono_cur);
    SET p_edad = IFNULL(p_edad, v_edad_cur);
    SET p_username = IFNULL(p_username, v_username_cur);

    UPDATE tbl_usuario
    SET Nombre = p_username
    WHERE Id_usuario = p_user_id;

    UPDATE tbl_persona
    SET Pri_Nom = p_pri_nom,
        Seg_Nom = p_seg_nom,
        Pri_Ape = p_pri_ape,
        Seg_Ape = p_seg_ape,
        Direccion = p_direccion,
        Email = p_email,
        Num_Contact = p_telefono,
        Edad = p_edad
    WHERE Id_Persona = v_persona_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_user_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_user_admin`(
    IN p_user_id INT UNSIGNED,
    IN p_username VARCHAR(20),
    IN p_rol VARCHAR(20)
)
    MODIFIES SQL DATA
BEGIN
    UPDATE tbl_usuario
    SET
        Nombre = COALESCE(p_username, Nombre),
        Rol = COALESCE(p_rol, Rol)
    WHERE Id_usuario = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_datos_completos_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_datos_completos_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_datos_completos_usuarios` AS select `p`.`Id_Persona` AS `Documento`,concat(`p`.`Pri_Nom`,' ',ifnull(`p`.`Seg_Nom`,'')) AS `Nombres`,concat(`p`.`Pri_Ape`,' ',ifnull(`p`.`Seg_Ape`,'')) AS `Apellidos`,`u`.`Id_usuario` AS `Id_Usuario`,`u`.`Nombre` AS `Nombre_Usuario`,`u`.`Contrasena` AS `Contrasena`,`u`.`Rol` AS `Rol_Usuario`,`e`.`Estado` AS `Estado_Usuario`,`p`.`Direccion` AS `Direccion`,`p`.`Email` AS `Email`,`p`.`Num_Contact` AS `Telefono`,`p`.`Edad` AS `Edad`,`t`.`Tipo_documento` AS `Tipo_Documento` from (((`tbl_usuario` `u` join `tbl_persona` `p` on((`p`.`fk_Usuario` = `u`.`Id_usuario`))) join `tbl_estado` `e` on((`e`.`Id_estado` = `u`.`fk_estado`))) join `tbl_tipo_documento` `t` on((`t`.`Id_Documento` = `p`.`fk_Tipo_documento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_desastres`
--

/*!50001 DROP VIEW IF EXISTS `vw_desastres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_desastres` AS select `d`.`Id_desastre` AS `id_desastre`,`d`.`Desastre` AS `desastre`,`p`.`Prioridad` AS `prioridad`,`d`.`Nombre_Entidad` AS `nombre_entidad`,`d`.`Descripcion_Entidad` AS `descripcion`,`d`.`Numero_Contacto` AS `numero_contacto`,`d`.`Correo` AS `correo` from (`tbl_desastre` `d` join `tbl_prioridad` `p` on((`d`.`fk_prioridad` = `p`.`Id_prioridad`))) order by `p`.`Id_prioridad` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuarios_activos`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuarios_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuarios_activos` AS select `tbl_usuario`.`Id_usuario` AS `Id_usuario`,`tbl_usuario`.`Nombre` AS `nombre_completo` from `tbl_usuario` where ((`tbl_usuario`.`fk_estado` = '01') and (`tbl_usuario`.`Rol` = 'User')) order by `tbl_usuario`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 18:53:03
