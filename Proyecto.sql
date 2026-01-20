-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `tbl_adic_entidad`
--

DROP TABLE IF EXISTS `tbl_adic_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_adic_entidad` (
  `Id_Adic_Entidad` varchar(10) NOT NULL,
  `Dirección` varchar(45) NOT NULL,
  `Numero_Contacto` varchar(10) DEFAULT NULL,
  `Web_site` text,
  `fk_entidad` varchar(10) NOT NULL,
  `Correo` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`Id_Adic_Entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_adic_entidad`
--

LOCK TABLES `tbl_adic_entidad` WRITE;
/*!40000 ALTER TABLE `tbl_adic_entidad` DISABLE KEYS */;
INSERT INTO `tbl_adic_entidad` VALUES ('DDBC-1','Carrera 30 No. 85A-39, Bogotá D.C','3125859581','bomberos.mininterior.gov.co.','DDBC','delegadobomberoscund@gmail.com'),('UAEGRD-1','Av.Américas, Carrera 58 No. 9-05, Bogotá D.C.','749 0000','cundinamarca.gov.co/gestiondelriesgo.','UAEGRD','apoyoemergencias@cundinamarca.gov.co'),('UNGRD-1','Carrera 8 No. 32-16, Bogotá D.C.','3320555','portal.gestiondelriesgo.gov.co.','UNGRD','cdgrd.cundinamarca@gestiondelriesgo.gov.co');
/*!40000 ALTER TABLE `tbl_adic_entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_adic_persona`
--

DROP TABLE IF EXISTS `tbl_adic_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_adic_persona` (
  `Id_Adic_Persona` varchar(20) NOT NULL,
  `Edad` int NOT NULL,
  `Direccion` tinytext NOT NULL,
  `Num_Contact` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `fk_persona` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Adic_Persona`),
  KEY `fk_persona` (`fk_persona`),
  CONSTRAINT `tbl_adic_persona_ibfk_1` FOREIGN KEY (`fk_persona`) REFERENCES `tbl_persona` (`Id_Persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_adic_persona`
--

LOCK TABLES `tbl_adic_persona` WRITE;
/*!40000 ALTER TABLE `tbl_adic_persona` DISABLE KEYS */;
INSERT INTO `tbl_adic_persona` VALUES ('102336985-1',19,'Carrera 56A','3103069568','orjueladaniela07@gmail.com','102336985'),('1025533982-1',22,'Carrera 56A','3103069258','jstrujillos@sanmateo.edu.co','1025533982'),('1025533984-1',21,'Carrera56','3103069586','kdorjuelab@sanmateo.edu.co','1025533984'),('1025533985-1',18,'Carrera 56A','3103069581','danielaorjbal@gmail.com','1025533985'),('1025533986-1',18,'Calle 149B','3103069581','juansetrujillo28@gmail.com','1025533986');
/*!40000 ALTER TABLE `tbl_adic_persona` ENABLE KEYS */;
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
  `Fk_Ciu` varchar(10) DEFAULT NULL,
  `Fk_Tipo_Caso` varchar(10) NOT NULL,
  `Fk_Estado` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Caso_Desastre`),
  KEY `Fk_Usuario` (`Fk_Usuario`),
  KEY `Fk_Desastre` (`Fk_Desastre`),
  KEY `Fk_Dep` (`Fk_Ciu`),
  KEY `Fk_Tipo_Caso` (`Fk_Tipo_Caso`),
  KEY `Fk_Estado` (`Fk_Estado`),
  CONSTRAINT `tbl_caso_ibfk_1` FOREIGN KEY (`Fk_Usuario`) REFERENCES `tbl_usuario` (`Id_usuario`),
  CONSTRAINT `tbl_caso_ibfk_2` FOREIGN KEY (`Fk_Desastre`) REFERENCES `tbl_desastre` (`Id_desastre`),
  CONSTRAINT `tbl_caso_ibfk_3` FOREIGN KEY (`Fk_Ciu`) REFERENCES `tbl_ciudad` (`Id_ciudad`),
  CONSTRAINT `tbl_caso_ibfk_4` FOREIGN KEY (`Fk_Tipo_Caso`) REFERENCES `tbl_tipo_caso` (`Id_caso`),
  CONSTRAINT `tbl_caso_ibfk_5` FOREIGN KEY (`Fk_Estado`) REFERENCES `tbl_estado` (`Id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_caso`
--

LOCK TABLES `tbl_caso` WRITE;
/*!40000 ALTER TABLE `tbl_caso` DISABLE KEYS */;
INSERT INTO `tbl_caso` VALUES (24,'2025-10-10','Hubo un sismo que provocó la caída de algunos artículos en mi casa','Carrera 67A',3,20,'SI-T','CHI','Case','01'),(26,'2025-10-15','Caso de prueba para envío de correos','Calle 45',2,20,'In','ALB','Case','01'),(41,'2025-10-22','Se inundó mi casa','Carrera 67',3,28,'Inund','ANOL','Case','01'),(42,'0205-10-22','Se inundo mi casa por fuertes lluvias, se desbordó el rio y perdí todas mis pertenencias','Carrera 56A 48 78S',5,35,'Inund','JUN','Case','01');
/*!40000 ALTER TABLE `tbl_caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ciudad`
--

DROP TABLE IF EXISTS `tbl_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ciudad` (
  `Id_ciudad` varchar(10) NOT NULL,
  `Nom_Municipio` varchar(20) NOT NULL,
  `Fk_Dep` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_ciudad`),
  KEY `Fk_Dep` (`Fk_Dep`),
  CONSTRAINT `tbl_ciudad_ibfk_1` FOREIGN KEY (`Fk_Dep`) REFERENCES `tbl_departamento` (`Id_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ciudad`
--

LOCK TABLES `tbl_ciudad` WRITE;
/*!40000 ALTER TABLE `tbl_ciudad` DISABLE KEYS */;
INSERT INTO `tbl_ciudad` VALUES ('AGD','Agua de Dios','CUND'),('ALB','Albán','CUND'),('ANA','Anapoima','CUND'),('ANOL','Anolaima','CUND'),('APU','Apulo','CUND'),('ARB','Arbeláez','CUND'),('BEL','Beltrán','CUND'),('BIT','Bituima','CUND'),('BOJ','Bojacá','CUND'),('CAB','Cabrera','CUND'),('CAC','Cachipay','CUND'),('CAJ','Cajicá','CUND'),('CAP','Caparrapí','CUND'),('CAQ','Cáqueza','CUND'),('CAR','Carmen de Carupa','CUND'),('CHA','Chaguaní','CUND'),('CHC','Chocontá','CUND'),('CHI','Chía','CUND'),('CHO','Choachí','CUND'),('CHP','Chipaque','CUND'),('COG','Cogua','CUND'),('COL','El Colegio','CUND'),('COT','Cota','CUND'),('CUC','Cucunubá','CUND'),('FAC','Facatativá','CUND'),('FOM','Fómeque','CUND'),('FOS','Fosca','CUND'),('FUN','Funza','CUND'),('FUQ','Fúquene','CUND'),('FUS','Fusagasugá','CUND'),('GAC','Gachalá','CUND'),('GAM','Gama','CUND'),('GAN','Gachancipá','CUND'),('GAT','Gachetá','CUND'),('GIR','Girardot','CUND'),('GRA','Granada','CUND'),('GUA','Guachetá','CUND'),('GUD','Guaduas','CUND'),('GUQ','Guataquí','CUND'),('GUS','Guasca','CUND'),('GUSI','Guayabal de Síquima','CUND'),('GUT','Gutiérrez','CUND'),('GUV','Guatavita','CUND'),('GUY','Guayabetal','CUND'),('JER','Jerusalén','CUND'),('JUN','Junín','CUND'),('LAC','La Calera','CUND'),('LAM','La Mesa','CUND'),('LAP','La Palma','CUND'),('LEN','Lenguazaque','CUND'),('LPE','La Peña','CUND'),('LVE','La Vega','CUND'),('MAC','Machetá','CUND'),('MAD','Madrid','CUND'),('MAN','Manta','CUND'),('MED','Medina','CUND'),('MOS','Mosquera','CUND'),('NAR','Nariño','CUND'),('NEM','Nemocón','CUND'),('NIL','Nilo','CUND'),('NIM','Nimaima','CUND'),('NOC','Nocaima','CUND'),('PAC','Pacho','CUND'),('PAI','Paime','CUND'),('PAN','Pandi','CUND'),('PAR','Paratebueno','CUND'),('PAS','Pasca','CUND'),('PEN','El Peñón','CUND'),('PSA','Puerto Salgar','CUND'),('PUL','Pulí','CUND'),('QET','Quetame','CUND'),('QUE','Quebradanegra','CUND'),('QUI','Quipile','CUND'),('RIC','Ricaurte','CUND'),('ROS','El Rosal','CUND'),('SAS','Sasaima','CUND'),('SAT','San Antonio','CUND'),('SBE','San Bernardo','CUND'),('SCY','San Cayetano','CUND'),('SES','Sesquilé','CUND'),('SFR','San Francisco','CUND'),('SIB','Sibaté','CUND'),('SIL','Silvania','CUND'),('SIM','Simijaca','CUND'),('SJR','San Juan de Rioseco','CUND'),('SOA','Soacha','CUND'),('SOP','Sopó','CUND'),('SUB','Subachoque','CUND'),('SUE','Suesca','CUND'),('SUP','Supatá','CUND'),('SUS','Susa','CUND'),('SUT','Sutatausa','CUND'),('TAB','Tabio','CUND'),('TAU','Tausa','CUND'),('TCP','Tocancipá','CUND'),('TEN','Tenjo','CUND'),('TIB','Tibacuy','CUND'),('TIR','Tibirita','CUND'),('TNA','Tena','CUND'),('TOC','Tocaima','CUND'),('TOP','Topaipí','CUND'),('UBA','Ubalá','CUND'),('UBQ','Ubaque','CUND'),('UBT','Ubaté','CUND'),('UNE','Une','CUND'),('UTI','Útica','CUND'),('VEN','Venecia','CUND'),('VER','Vergara','CUND'),('VGO','Villagómez','CUND'),('VIA','Vianí','CUND'),('VIL','Villeta','CUND'),('VIO','Viotá','CUND'),('VPN','Villapinzón','CUND'),('YAC','Yacopí','CUND'),('ZIPA','Zipaquirá','CUND'),('ZIPC','Zipacón','CUND');
/*!40000 ALTER TABLE `tbl_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_departamento`
--

DROP TABLE IF EXISTS `tbl_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_departamento` (
  `Id_dep` varchar(10) NOT NULL,
  `Nom_departamento` varchar(15) NOT NULL,
  PRIMARY KEY (`Id_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_departamento`
--

LOCK TABLES `tbl_departamento` WRITE;
/*!40000 ALTER TABLE `tbl_departamento` DISABLE KEYS */;
INSERT INTO `tbl_departamento` VALUES ('CUND','Cundinamarca');
/*!40000 ALTER TABLE `tbl_departamento` ENABLE KEYS */;
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
  `fk_entidad` varchar(10) DEFAULT NULL,
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
INSERT INTO `tbl_desastre` VALUES ('In','Incendio','A','DDBC'),('Inund','Inundación','B','UAEGRD'),('SI-T','Sismo-temblor','D','UNGRD'),('Ter','Terremoto','A','UNGRD');
/*!40000 ALTER TABLE `tbl_desastre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_entidad`
--

DROP TABLE IF EXISTS `tbl_entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_entidad` (
  `Id_entidad` varchar(10) NOT NULL,
  `Nombre_Entidad` text NOT NULL,
  `Descripción` text NOT NULL,
  PRIMARY KEY (`Id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_entidad`
--

LOCK TABLES `tbl_entidad` WRITE;
/*!40000 ALTER TABLE `tbl_entidad` DISABLE KEYS */;
INSERT INTO `tbl_entidad` VALUES ('DDBC','Delegación Departamental de Bomberos de Cundinamarca','Entidad departamental que lidera la extinción y control de incendios forestales y estructurales en Cundinamarca, coordinando con bomberos municipales y la UAEGRD para respuestas rápidas.'),('UAEGRD','Unidad Administrativa Especial para la Gestión del Riesgo de Desastres de Cundinamarca','Unidad departamental encargada de la atención inmediata a inundaciones, incluyendo evacuaciones, distribución de ayudas y mitigación de riesgos hídricos en ríos y quebradas de Cundinamarca. Coordina con IDEAM para pronósticos.'),('UNGRD','Coordinador Departamental de Gestión del Riesgo','Apoyo nacional para eventos sísmicos mayores, enfocada en recursos federales y planes de contingencia para Cundinamarca');
/*!40000 ALTER TABLE `tbl_entidad` ENABLE KEYS */;
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
INSERT INTO `tbl_estado` VALUES ('00','Inactivo'),('01','Activo'),('P','pendiente');
/*!40000 ALTER TABLE `tbl_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_num_caso`
--

DROP TABLE IF EXISTS `tbl_num_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_num_caso` (
  `Id_num_caso` int unsigned NOT NULL AUTO_INCREMENT,
  `Radicado` varchar(20) DEFAULT NULL,
  `Fk_Caso` int unsigned NOT NULL,
  PRIMARY KEY (`Id_num_caso`),
  KEY `Fk_Caso` (`Fk_Caso`),
  CONSTRAINT `tbl_num_caso_ibfk_1` FOREIGN KEY (`Fk_Caso`) REFERENCES `tbl_caso` (`Id_Caso_Desastre`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_num_caso`
--

LOCK TABLES `tbl_num_caso` WRITE;
/*!40000 ALTER TABLE `tbl_num_caso` DISABLE KEYS */;
INSERT INTO `tbl_num_caso` VALUES (33,NULL,41),(34,NULL,42);
/*!40000 ALTER TABLE `tbl_num_caso` ENABLE KEYS */;
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
INSERT INTO `tbl_persona` VALUES ('102336985','Karoll','','Daniela','','CC','2006-04-21',34),('1025533982','Karen','Daniela','Reyes','','CC','2003-04-15',35),('1025533984','Nerea','Lizeth','Trujillo','De Orjuela','CC','2006-01-06',28),('1025533985','Karoll','Daniela','Orjuela','Ballesteros','CC','2007-04-14',19),('1025533986','Juan','Sebastian','Trujillo ','Sanchez','CC','2004-08-28',20);
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
-- Table structure for table `tbl_rol`
--

DROP TABLE IF EXISTS `tbl_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_rol` (
  `id_rol` varchar(10) NOT NULL,
  `Rol` varchar(15) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rol`
--

LOCK TABLES `tbl_rol` WRITE;
/*!40000 ALTER TABLE `tbl_rol` DISABLE KEYS */;
INSERT INTO `tbl_rol` VALUES ('Admin','Administrador'),('User','Usuario');
/*!40000 ALTER TABLE `tbl_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ticket`
--

DROP TABLE IF EXISTS `tbl_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ticket` (
  `Id_Ticket` int unsigned NOT NULL AUTO_INCREMENT,
  `Descripción` text NOT NULL,
  `fk_usuario` int unsigned NOT NULL,
  `fk_tipo_caso` varchar(10) NOT NULL,
  `Fk_Estado` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Ticket`),
  KEY `fk_usuario` (`fk_usuario`),
  KEY `fk_tipo_caso` (`fk_tipo_caso`),
  KEY `Fk_Estado` (`Fk_Estado`),
  CONSTRAINT `tbl_ticket_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `tbl_usuario` (`Id_usuario`),
  CONSTRAINT `tbl_ticket_ibfk_2` FOREIGN KEY (`fk_tipo_caso`) REFERENCES `tbl_tipo_caso` (`Id_caso`),
  CONSTRAINT `tbl_ticket_ibfk_3` FOREIGN KEY (`Fk_Estado`) REFERENCES `tbl_estado` (`Id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket`
--

LOCK TABLES `tbl_ticket` WRITE;
/*!40000 ALTER TABLE `tbl_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_caso`
--

DROP TABLE IF EXISTS `tbl_tipo_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_caso` (
  `Id_caso` varchar(10) NOT NULL,
  `Tipo_Caso` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_caso`
--

LOCK TABLES `tbl_tipo_caso` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_caso` DISABLE KEYS */;
INSERT INTO `tbl_tipo_caso` VALUES ('Case','Caso Desastre Natural'),('Ticket','Ticket de Mesa de Ayuda');
/*!40000 ALTER TABLE `tbl_tipo_caso` ENABLE KEYS */;
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
  `Nombre` varchar(10) NOT NULL,
  `Contrasena` varchar(15) DEFAULT NULL,
  `fk_rol` varchar(10) NOT NULL,
  `fk_estado` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_usuario`),
  UNIQUE KEY `Nombre` (`Nombre`),
  KEY `fk_rol` (`fk_rol`),
  KEY `fk_estado` (`fk_estado`),
  CONSTRAINT `tbl_usuario_ibfk_1` FOREIGN KEY (`fk_rol`) REFERENCES `tbl_rol` (`id_rol`),
  CONSTRAINT `tbl_usuario_ibfk_2` FOREIGN KEY (`fk_estado`) REFERENCES `tbl_estado` (`Id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (19,'Karito','!:D?5GWJt@','Admin','01'),(20,'Sebas','Cuenta1*','User','01'),(28,'Nerea1','Cuenta1*','User','01'),(34,'karita','Cuenta2*','User','01'),(35,'karen','Cuenta2*','User','01');
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-22 12:51:12
