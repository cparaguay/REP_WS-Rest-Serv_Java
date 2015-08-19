/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.5-m15-log : Database - bd_medikid
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_medikid` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bd_medikid`;

/*Table structure for table `tb_apoderado` */

DROP TABLE IF EXISTS `tb_apoderado`;

CREATE TABLE `tb_apoderado` (
  `idapoderado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apepaterno` varchar(50) NOT NULL,
  `apematerno` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `fechanac` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `iddistrito` int(11) unsigned NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idapoderado`),
  KEY `fk_tb_apoderado_idestado` (`idestado`),
  KEY `fk_tb_apoderado_iddistrito` (`iddistrito`),
  CONSTRAINT `fk_tb_apoderado_iddistrito` FOREIGN KEY (`iddistrito`) REFERENCES `tb_distrito` (`iddistrito`),
  CONSTRAINT `fk_tb_apoderado_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `tb_apoderado` */

insert  into `tb_apoderado`(`idapoderado`,`dni`,`nombres`,`apepaterno`,`apematerno`,`correo`,`telefono`,`fechanac`,`sexo`,`iddistrito`,`direccion`,`idestado`) values (1,'12345678','Juan Carlos','Sulca','Rivera','jcarlos20@gmail.com','','1970-01-01','',43,'Las Lomas 325',1),(2,'32456234','Manuel','Salazar','Lopez','msalazar20@gmail.com','132456783','1980-01-01','M',23,'Frutales 123',1),(3,'23453212','Simon','Valdez','Soto','shuaman2080@gmail.com','12344556','1970-01-01','M',22,'Calle Flores 123',1),(4,'12345674','Abelardo','Gallardo','Baldeon','agallardo2080@gmail.com','12345612','1990-12-11','M',1,'Portales 321',1),(5,'22233123','Clotilde','Palermo','Suarez','pclotilde@gmail.com','222323323','1973-12-11','F',41,'Fortaleza 325',1),(6,'32323323','Miriam','Noa','Lume','mnoa2080@gmail.com','345678456','1970-01-01','F',15,'Konoha 325',1),(7,'22234567','Julia','Rabanal','Ramirez','jrabanal2080@gmail.com','22134567','1979-12-11','F',39,'Los jilgueritow 325',1),(8,'33345678','Elias','Alfaro','Cumba','ealfaro2080@gmail.com','22345672','1986-01-01','M',20,'Siempre Viva 325',1),(23,'12345678','Bryan','Meza','Valencia','cristhianp00@gmail.com','12345678','1992-12-12','M',1,'las lomas',1);

/*Table structure for table `tb_apoderadopaciente` */

DROP TABLE IF EXISTS `tb_apoderadopaciente`;

CREATE TABLE `tb_apoderadopaciente` (
  `idapoderado` int(10) unsigned NOT NULL,
  `idpaciente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idapoderado`,`idpaciente`),
  KEY `tb_apoderadopaciente_idpaciente` (`idpaciente`),
  CONSTRAINT `fk_tb_apoderadopaciente_idapoderado` FOREIGN KEY (`idapoderado`) REFERENCES `tb_apoderado` (`idapoderado`),
  CONSTRAINT `tb_apoderadopaciente_idpaciente` FOREIGN KEY (`idpaciente`) REFERENCES `tb_paciente` (`idpaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_apoderadopaciente` */

/*Table structure for table `tb_apoderadousuario` */

DROP TABLE IF EXISTS `tb_apoderadousuario`;

CREATE TABLE `tb_apoderadousuario` (
  `idapoderado` int(10) unsigned NOT NULL,
  `clave` varchar(100) NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  KEY `fk_tb_apoderadousuario_idapoderado` (`idapoderado`),
  KEY `fk_tb_apoderadousuario_idestado` (`idestado`),
  CONSTRAINT `fk_tb_apoderadousuario_idapoderado` FOREIGN KEY (`idapoderado`) REFERENCES `tb_apoderado` (`idapoderado`),
  CONSTRAINT `fk_tb_apoderadousuario_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_apoderadousuario` */

insert  into `tb_apoderadousuario`(`idapoderado`,`clave`,`idestado`) values (1,'123',1),(23,'58dd6a2007612607e3b2f8a695efca7fda7e6487',1);

/*Table structure for table `tb_cargo` */

DROP TABLE IF EXISTS `tb_cargo`;

CREATE TABLE `tb_cargo` (
  `idcargo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cargo` varchar(50) NOT NULL,
  `idrol` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcargo`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `idrol` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `tb_cargo` */

insert  into `tb_cargo`(`idcargo`,`cargo`,`idrol`) values (1,'Administrador',1),(2,'Doctor',2),(3,'Recepcionista',3),(4,'Personal de limpieza',4),(5,'Asistente',4);

/*Table structure for table `tb_citamedica` */

DROP TABLE IF EXISTS `tb_citamedica`;

CREATE TABLE `tb_citamedica` (
  `idcitamedica` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idpaciente` int(10) unsigned NOT NULL,
  `idrecepcionista` int(10) unsigned NOT NULL,
  `idmedico` int(10) unsigned NOT NULL,
  `fechacitacreada` datetime NOT NULL,
  `fechainiciocita` datetime NOT NULL,
  `fechafincita` datetime NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `idtipocita` int(10) unsigned NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcitamedica`),
  KEY `fk_tb_citamedica_idpaciente` (`idpaciente`),
  KEY `fk_tb_citamedica_idempleado` (`idrecepcionista`),
  KEY `fk_tb_citamedica_idestado` (`idestado`),
  KEY `fk_tb_citamedica_idtipo` (`idtipocita`),
  KEY `112` (`idmedico`),
  CONSTRAINT `112` FOREIGN KEY (`idmedico`) REFERENCES `tb_empleado` (`idempleado`),
  CONSTRAINT `fk_tb_citamedica_idempleado` FOREIGN KEY (`idrecepcionista`) REFERENCES `tb_empleado` (`idempleado`),
  CONSTRAINT `fk_tb_citamedica_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`),
  CONSTRAINT `fk_tb_citamedica_idpaciente` FOREIGN KEY (`idpaciente`) REFERENCES `tb_paciente` (`idpaciente`),
  CONSTRAINT `fk_tb_citamedica_idtipo` FOREIGN KEY (`idtipocita`) REFERENCES `tb_tipo` (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `tb_citamedica` */

insert  into `tb_citamedica`(`idcitamedica`,`idpaciente`,`idrecepcionista`,`idmedico`,`fechacitacreada`,`fechainiciocita`,`fechafincita`,`motivo`,`idtipocita`,`idestado`) values (12,11,1,7,'2015-07-16 00:00:00','2015-07-16 15:45:00','2015-07-16 15:59:00','Trastonro Bibolar',9,5),(15,12,10,7,'2015-07-16 00:00:00','2015-07-16 15:00:00','2015-07-16 15:15:00','Delirios nocturnos',9,4),(16,13,10,7,'2015-07-16 00:00:00','2015-07-16 15:30:00','2015-07-16 15:45:00','Convulsiones',9,4),(22,11,1,7,'2015-07-16 00:00:00','2015-07-16 16:00:00','2015-07-16 16:15:00','Holis',9,4),(23,15,10,18,'2015-07-16 00:00:00','2015-07-16 10:00:00','2015-07-16 10:15:00','Taquicardia',9,5);

/*Table structure for table `tb_clase` */

DROP TABLE IF EXISTS `tb_clase`;

CREATE TABLE `tb_clase` (
  `idclase` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idrclase` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`idclase`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

/*Data for the table `tb_clase` */

insert  into `tb_clase`(`idclase`,`idrclase`,`nombre`,`descripcion`,`orden`) values (1,0,'Sistemas','Entidades del Sistema',1),(10,1,'Entidades','Entidades del Negocio',1),(11,1,'Tipos','Tipos para las entidades',1),(100,10,'EstadoClase','Estado para las clases comunes',1),(101,10,'EstadoCita','Estado para citas',1),(102,10,'EstadoConsultorio','Estado para el consultorio',1),(103,10,'EstadoDia','Estados para los dia',1),(104,10,'EstadoAsistente','Estado para la Asistente',1),(200,11,'tipoSangre','Tipos de Sangre',1),(201,11,'tipoCita','Tipo de Cita',1);

/*Table structure for table `tb_clinicaafiliada` */

DROP TABLE IF EXISTS `tb_clinicaafiliada`;

CREATE TABLE `tb_clinicaafiliada` (
  `idclinica` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clinica` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`idclinica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_clinicaafiliada` */

/*Table structure for table `tb_consultorio` */

DROP TABLE IF EXISTS `tb_consultorio`;

CREATE TABLE `tb_consultorio` (
  `idconsultorio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `idespecialidad` int(10) unsigned NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idconsultorio`),
  KEY `idconsultorio` (`idconsultorio`),
  KEY `fk_tb_consultorio_idespecialidad` (`idespecialidad`),
  KEY `fk_tb_consultorio_idestado` (`idestado`),
  CONSTRAINT `fk_tb_consultorio_idespecialidad` FOREIGN KEY (`idespecialidad`) REFERENCES `tb_especialidad` (`idespecialidad`),
  CONSTRAINT `fk_tb_consultorio_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tb_consultorio` */

insert  into `tb_consultorio`(`idconsultorio`,`descripcion`,`ubicacion`,`idespecialidad`,`idestado`) values (7,'Consultorio de odontologia','1er Piso, Habitacion 102',2,1),(8,'Consultorio de Psicologia','1er Piso, Habitacion 101',1,1),(11,'Consultorio de cardiologia','1er Piso, Habitacion 109',3,1);

/*Table structure for table `tb_consultoriomedico` */

DROP TABLE IF EXISTS `tb_consultoriomedico`;

CREATE TABLE `tb_consultoriomedico` (
  `idconsultorio` int(10) unsigned NOT NULL,
  `idmedico` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmedico`),
  KEY `fk_tb_medicoconsultorio_idconsultorio` (`idconsultorio`),
  CONSTRAINT `fk_tb_consultoriomedico_idconsultorio` FOREIGN KEY (`idconsultorio`) REFERENCES `tb_consultorio` (`idconsultorio`),
  CONSTRAINT `fk_tb_consultoriomedico_idempleado` FOREIGN KEY (`idmedico`) REFERENCES `tb_empleado` (`idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_consultoriomedico` */

insert  into `tb_consultoriomedico`(`idconsultorio`,`idmedico`) values (7,5),(7,9),(8,3),(8,7),(11,18);

/*Table structure for table `tb_detalleatencion` */

DROP TABLE IF EXISTS `tb_detalleatencion`;

CREATE TABLE `tb_detalleatencion` (
  `idhistoriamedica` int(10) unsigned NOT NULL,
  `idmedico` int(10) unsigned NOT NULL,
  `fechaatencion` datetime NOT NULL,
  `diagnostico` varchar(100) NOT NULL,
  `receta` varchar(100) NOT NULL,
  `alergias` varchar(100) DEFAULT NULL,
  `idatencion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idhistoriamedica`,`idmedico`,`idatencion`),
  KEY `fas` (`idmedico`),
  KEY `idatencion` (`idatencion`),
  CONSTRAINT `fk_tb_detalleatencion_idempleado` FOREIGN KEY (`idmedico`) REFERENCES `tb_empleado` (`idempleado`),
  CONSTRAINT `fk_tb_detalleatencion_idhistoriaclinica` FOREIGN KEY (`idhistoriamedica`) REFERENCES `tb_historiaclininca` (`idhistoriamedica`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tb_detalleatencion` */

insert  into `tb_detalleatencion`(`idhistoriamedica`,`idmedico`,`fechaatencion`,`diagnostico`,`receta`,`alergias`,`idatencion`) values (7,7,'2015-07-16 00:00:00','BiPolar','Valium','No Posee',5),(7,7,'2015-07-16 00:00:00','pos esta feo','Focusin','Java',6),(11,7,'2015-07-16 00:00:00','Traumatismo','Panadol','No Posee',2),(12,7,'2015-07-16 00:00:00','Contusiones Leves','Bismutol','No Posee',3),(13,7,'2015-07-16 00:00:00','Gripe Cronica','Ampisilina','No Posee',4),(14,18,'2015-07-16 00:00:00','Todo es mental','Focusin','No posee',7);

/*Table structure for table `tb_dia` */

DROP TABLE IF EXISTS `tb_dia`;

CREATE TABLE `tb_dia` (
  `iddia` int(10) unsigned NOT NULL,
  `dia` varchar(50) NOT NULL,
  PRIMARY KEY (`iddia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_dia` */

/*Table structure for table `tb_distrito` */

DROP TABLE IF EXISTS `tb_distrito`;

CREATE TABLE `tb_distrito` (
  `iddistrito` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `distrito` varchar(100) NOT NULL,
  PRIMARY KEY (`iddistrito`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `tb_distrito` */

insert  into `tb_distrito`(`iddistrito`,`distrito`) values (1,'Cercado'),(2,'Ancon'),(3,'Ate'),(4,'Barranco'),(5,'Brena'),(6,'Carabayllo'),(7,'Comas'),(8,'Chaclacayo'),(9,'Chorrillos'),(10,'El Agustino'),(11,'Jesus Maria'),(12,'La Molina'),(13,'La Victoria'),(14,'Lince'),(15,'Lurigancho'),(16,'Lurin'),(17,'Magdalena'),(18,'Miraflores'),(19,'Pachacamac'),(20,'Pucusana'),(21,'Pueblo Libre'),(22,'Puente Piedra'),(23,'Punta Negra'),(24,'Punta Hermosa'),(25,'Rimac'),(26,'San Bartolo'),(27,'San Isidro'),(28,'Independencia'),(29,'San Juan De Miraflores'),(30,'San Luis'),(31,'San Martin De Porres'),(32,'San Miguel'),(33,'Santiago De Surco'),(34,'Surquillo'),(35,'Villa Maria Del Triunfo'),(36,'San Juan De Lurigancho'),(37,'Santa Maria Del Mar'),(38,'Santa Rosa'),(39,'Los Olivos'),(40,'Cieneguilla'),(41,'San Borja'),(42,'Villa El Salvador'),(43,'Santa Anita');

/*Table structure for table `tb_empleado` */

DROP TABLE IF EXISTS `tb_empleado`;

CREATE TABLE `tb_empleado` (
  `idempleado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apepaterno` varchar(50) NOT NULL,
  `apematerno` varchar(50) NOT NULL,
  `fechanac` date NOT NULL,
  `telefono` char(9) NOT NULL,
  `iddistrito` int(11) unsigned NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `idcargo` int(10) unsigned NOT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `idestado` int(10) unsigned NOT NULL,
  `idasistente` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_tb_empleado_idestado` (`idestado`),
  KEY `fk_tb_empleado_tb_cargo` (`idcargo`),
  KEY `fk_tb_empleado_tb_distrito` (`iddistrito`),
  KEY `fk_tb_empleado_idempleado` (`idasistente`),
  CONSTRAINT `fk_tb_empleado_idcargo` FOREIGN KEY (`idcargo`) REFERENCES `tb_cargo` (`idcargo`),
  CONSTRAINT `fk_tb_empleado_iddistrito` FOREIGN KEY (`iddistrito`) REFERENCES `tb_distrito` (`iddistrito`),
  CONSTRAINT `fk_tb_empleado_idempleado` FOREIGN KEY (`idasistente`) REFERENCES `tb_empleado` (`idempleado`),
  CONSTRAINT `fk_tb_empleado_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `tb_empleado` */

insert  into `tb_empleado`(`idempleado`,`dni`,`nombres`,`apepaterno`,`apematerno`,`fechanac`,`telefono`,`iddistrito`,`direccion`,`email`,`sexo`,`idcargo`,`cv`,`foto`,`idestado`,`idasistente`) values (1,'23223234','Angel David','Revilla','Paler','1980-01-01','12345678',32,'Las Vegas 325','adavid321@gmail.com','M',1,NULL,'/medikidfile/fotoEmpleado/23223234.jpg',1,NULL),(2,'65659090','Mileth','Figueroa','Ovalle','1990-12-12','090987783',7,'Las malvinas 123','cristhianp00@gmail.com','F',5,'/medikidfile/cvEmpleado/65659090.docx','/medikidfile/fotoEmpleado/65659090.jpg',3,NULL),(3,'65657898','Elmer','Roman','Salaz','1990-12-12','3628951',4,'Los Nogales 325','cristhianp00@gmail.com','M',2,'/medikidfile/cvEmpleado/65657898.docx','/medikidfile/fotoEmpleado/65657898.jpg',1,2),(4,'43456767','Sasha','Grey','Luna','1990-12-12','3628951',4,'Laguna azul 123','cristhianp00@gmail.com','M',5,'/medikidfile/cvEmpleado/43456767.docx','/medikidfile/fotoEmpleado/43456767.jpg',3,NULL),(5,'43434567','Fredy','Gallardo','Montano','1990-12-12','3628951',29,'Las Vegas 325','cristhianp00@gmail.com','M',2,'/medikidfile/cvEmpleado/43434567.docx','/medikidfile/fotoEmpleado/43434567.jpg',1,4),(6,'43445678','Maricruz','Andia','Rojas','1990-12-12','3628951',39,'Navarrete 123','cristhianp00@gmail.com','M',5,'/medikidfile/cvEmpleado/43445678.docx','/medikidfile/fotoEmpleado/43445678.jpg',3,NULL),(7,'32345672','Miguel','Ibarra','Sanchez','1990-12-12','3628951',32,'Los angeles 123','cristhianp00@gmail.com','M',2,'/medikidfile/cvEmpleado/32345672.docx','/medikidfile/fotoEmpleado/32345672.jpg',1,6),(8,'44567890','Rebeca','Linares','Solorza','1990-12-12','3628951',5,'Laguna azul 123','cristhianp00@gmail.com','M',5,'/medikidfile/cvEmpleado/445678909.docx','/medikidfile/fotoEmpleado/445678909.jpg',3,NULL),(9,'32343459','Mauricio','Herrera','Huallaga','1990-12-12','3628951',1,'Nuevos Horizontes 123','cristhianp00@gmail.com','M',2,'/medikidfile/cvEmpleado/32343459.docx','/medikidfile/fotoEmpleado/32343459.jpg',1,8),(10,'32345678','Kristhina','Marie','Serratos','1990-12-12','3628951',18,'Nueva luna 123','cristhianp00@gmail.com','F',3,'/medikidfile/cvEmpleado/32345678.docx','/medikidfile/fotoEmpleado/32345678.jpg',1,NULL),(18,'34567876','Luisa','Lawles','Galvez','1990-12-12','345656787',1,'Laguna azul 123','cristhianp00@gmail.com','F',2,'/medikidfile/cvEmpleado/34567876.docx','/medikidfile/fotoEmpleado/34567876.jpg',1,8);

/*Table structure for table `tb_especialidad` */

DROP TABLE IF EXISTS `tb_especialidad`;

CREATE TABLE `tb_especialidad` (
  `idespecialidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(100) NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idespecialidad`),
  KEY `fk_tb_especialidad_idestado` (`idestado`),
  CONSTRAINT `fk_tb_especialidad_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tb_especialidad` */

insert  into `tb_especialidad`(`idespecialidad`,`especialidad`,`idestado`) values (1,'Psicologo',1),(2,'Odontologo',1),(3,'Cardiologo',1),(4,'Nutricionista',1),(5,'Oftalmologo',1),(6,'Dermatologo',1),(8,'Podologo',1);

/*Table structure for table `tb_estado` */

DROP TABLE IF EXISTS `tb_estado`;

CREATE TABLE `tb_estado` (
  `idestado` int(10) unsigned NOT NULL,
  `idclase` int(10) unsigned NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`idestado`),
  KEY `fk_tb_estado_idclase` (`idclase`),
  CONSTRAINT `fk_tb_estado_idclase` FOREIGN KEY (`idclase`) REFERENCES `tb_clase` (`idclase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_estado` */

insert  into `tb_estado`(`idestado`,`idclase`,`descripcion`,`orden`) values (0,101,'No Atendido',2),(1,100,'Activo',1),(2,100,'Inactivo',0),(3,100,'Asignado',2),(4,101,'Pendiente',0),(5,101,'Atendido',1);

/*Table structure for table `tb_historiaclininca` */

DROP TABLE IF EXISTS `tb_historiaclininca`;

CREATE TABLE `tb_historiaclininca` (
  `idhistoriamedica` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idpaciente` int(10) unsigned NOT NULL,
  `antecedentes` varchar(500) DEFAULT NULL,
  `idtiposangre` int(10) unsigned NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idhistoriamedica`),
  KEY `ff` (`idpaciente`),
  KEY `_idtiposangre` (`idtiposangre`),
  CONSTRAINT `_idtiposangre` FOREIGN KEY (`idtiposangre`) REFERENCES `tb_tipo` (`idtipo`),
  CONSTRAINT `ff` FOREIGN KEY (`idpaciente`) REFERENCES `tb_paciente` (`idpaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tb_historiaclininca` */

insert  into `tb_historiaclininca`(`idhistoriamedica`,`fechacreacion`,`idpaciente`,`antecedentes`,`idtiposangre`,`idestado`) values (7,'2015-07-16 05:02:12',11,'No posee',2,1),(11,'2015-07-16 05:02:12',14,'Tuberculosis',5,1),(12,'2015-07-16 05:02:12',12,'Sida',5,1),(13,'2015-07-16 05:02:12',13,'Sifilis',5,1),(14,'2015-07-16 20:29:55',15,'No posee',1,1);

/*Table structure for table `tb_horarioempleado` */

DROP TABLE IF EXISTS `tb_horarioempleado`;

CREATE TABLE `tb_horarioempleado` (
  `idhorarioempleado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idmedico` int(10) unsigned NOT NULL,
  `iddia` int(10) unsigned NOT NULL,
  `horainicio` time NOT NULL,
  `horafin` time NOT NULL,
  PRIMARY KEY (`idhorarioempleado`,`idmedico`,`iddia`),
  KEY `fk_tb_horarioempleado_idempleado` (`idmedico`),
  CONSTRAINT `fk_tb_horarioempleado_idempleado` FOREIGN KEY (`idmedico`) REFERENCES `tb_empleado` (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tb_horarioempleado` */

insert  into `tb_horarioempleado`(`idhorarioempleado`,`idmedico`,`iddia`,`horainicio`,`horafin`) values (1,3,1,'09:00:00','17:00:00'),(2,3,2,'09:00:00','12:00:00'),(3,3,5,'09:00:00','12:00:00'),(4,5,1,'09:00:00','10:00:00'),(5,5,2,'10:00:00','12:00:00'),(6,5,3,'09:00:00','12:00:00'),(7,7,2,'09:00:00','12:00:00'),(8,7,4,'15:00:00','18:00:00'),(9,7,3,'09:00:00','12:00:00'),(10,9,2,'09:00:00','12:00:00'),(11,9,4,'09:00:00','12:00:00'),(12,9,6,'09:00:00','12:00:00'),(22,18,1,'09:00:00','14:00:00'),(23,18,4,'09:00:00','11:00:00'),(24,18,6,'09:00:00','17:00:00');

/*Table structure for table `tb_medicoespecialidad` */

DROP TABLE IF EXISTS `tb_medicoespecialidad`;

CREATE TABLE `tb_medicoespecialidad` (
  `idmedico` int(10) unsigned NOT NULL,
  `idespecialidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmedico`),
  KEY `dd` (`idespecialidad`),
  CONSTRAINT `fk_tb_medicoespecialidad_idempleado` FOREIGN KEY (`idmedico`) REFERENCES `tb_empleado` (`idempleado`),
  CONSTRAINT `fk_tb_medicoespecialidad_idespecialidad` FOREIGN KEY (`idespecialidad`) REFERENCES `tb_especialidad` (`idespecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_medicoespecialidad` */

insert  into `tb_medicoespecialidad`(`idmedico`,`idespecialidad`) values (3,1),(7,1),(5,2),(9,2),(18,3);

/*Table structure for table `tb_paciente` */

DROP TABLE IF EXISTS `tb_paciente`;

CREATE TABLE `tb_paciente` (
  `idpaciente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idapoderado` int(10) unsigned NOT NULL,
  `foto` varchar(100) NOT NULL,
  `dni` char(8) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apepaterno` varchar(50) NOT NULL,
  `apematerno` varchar(50) NOT NULL,
  `fechanac` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `idestado` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idpaciente`),
  KEY `fk_tb_paciente_idestado` (`idestado`),
  CONSTRAINT `fk_tb_paciente_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `tb_paciente` */

insert  into `tb_paciente`(`idpaciente`,`idapoderado`,`foto`,`dni`,`nombres`,`apepaterno`,`apematerno`,`fechanac`,`sexo`,`idestado`) values (11,1,'/medikidfile/fotoPaciente/23453234.jpg','23453234','Eliza','Sulca','Gamboa','2010-12-12','M',1),(12,2,'/medikidfile/fotoPaciente/23245678.jpg','23245678','Pedro','Sulca','Gamboa','2010-12-12','M',1),(13,2,'/medikidfile/fotoPaciente/34345643.jpg','34345643','Gabriela','Salazar','Bella','2010-12-12','M',1),(14,6,'/medikidfile/fotoPaciente/56767654.jpg','56767654','Sebastian','Noa','Guerra','2010-12-12','M',1),(15,23,'/medikidfile/fotoPaciente/66666666.jpg','66666666','Luis','Yactacko','Meza','2010-12-12','M',1);

/*Table structure for table `tb_pacientederivado` */

DROP TABLE IF EXISTS `tb_pacientederivado`;

CREATE TABLE `tb_pacientederivado` (
  `idpaciente` int(10) unsigned NOT NULL,
  `idclinica` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idpaciente`,`idclinica`),
  KEY `fk_tb_pacientederivado_idclinica` (`idclinica`),
  CONSTRAINT `fk_tb_pacientederivado_idclinica` FOREIGN KEY (`idclinica`) REFERENCES `tb_clinicaafiliada` (`idclinica`),
  CONSTRAINT `fk_tb_pacientederivado_idpaciente` FOREIGN KEY (`idpaciente`) REFERENCES `tb_paciente` (`idpaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_pacientederivado` */

/*Table structure for table `tb_rol` */

DROP TABLE IF EXISTS `tb_rol`;

CREATE TABLE `tb_rol` (
  `idrol` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tb_rol` */

insert  into `tb_rol`(`idrol`,`rol`) values (1,'Administrador'),(2,'Doctor'),(3,'Recepcionista'),(4,'Miscelaneos');

/*Table structure for table `tb_tipo` */

DROP TABLE IF EXISTS `tb_tipo`;

CREATE TABLE `tb_tipo` (
  `idtipo` int(10) unsigned NOT NULL,
  `idclase` int(10) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `orden` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idtipo`),
  KEY `fk_tb_tipo_idclase` (`idclase`),
  CONSTRAINT `fk_tb_tipo_idclase` FOREIGN KEY (`idclase`) REFERENCES `tb_clase` (`idclase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_tipo` */

insert  into `tb_tipo`(`idtipo`,`idclase`,`nombre`,`orden`) values (1,200,'O+ ',1),(2,200,'A+',2),(3,200,'B+',3),(4,200,'O- ',4),(5,200,'A-',5),(6,200,'AB+',6),(7,200,'B- ',7),(8,200,'AB-',8),(9,201,'Presencial',1);

/*Table structure for table `tb_usuario` */

DROP TABLE IF EXISTS `tb_usuario`;

CREATE TABLE `tb_usuario` (
  `idempleado` int(10) unsigned NOT NULL,
  `usuario` char(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idestado` int(10) unsigned NOT NULL,
  `idrol` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idempleado`),
  KEY `fk_tb_usuario_idestado` (`idestado`),
  KEY `fk_tb_usuario_idrol` (`idrol`),
  CONSTRAINT `fk_tb_usuario_idempleado` FOREIGN KEY (`idempleado`) REFERENCES `tb_empleado` (`idempleado`),
  CONSTRAINT `fk_tb_usuario_idestado` FOREIGN KEY (`idestado`) REFERENCES `tb_estado` (`idestado`),
  CONSTRAINT `fk_tb_usuario_idrol` FOREIGN KEY (`idrol`) REFERENCES `tb_rol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

/*Data for the table `tb_usuario` */

insert  into `tb_usuario`(`idempleado`,`usuario`,`password`,`idestado`,`idrol`) values (1,'adrpang','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,1),(3,'dcrselm','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,2),(5,'dcgmfre','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,2),(7,'dcismig','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,2),(9,'dchhmau','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,2),(10,'rpmskri','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,3),(18,'dclglui','bbbceb358030f74920abad01ec59856738dc91c9',1,2);

/* Function  structure for function  `GenerarNombreUsuario` */

/*!50003 DROP FUNCTION IF EXISTS `GenerarNombreUsuario` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GenerarNombreUsuario`(_idempleado int) RETURNS char(10) CHARSET utf8
begin
    
        DECLARE usuario char(7);
	DECLARE coincidencia char(10);
	Declare intRol int(10);
	declare prfRol char(2);
	DECLARE comodin char(3);
	
	   set intRol=(SELECT idcargo FROM tb_empleado WHERE idempleado=_idempleado);
	   if(intRol = 1) then
	   
	         set prfRol='ad';
	     
	     elseif intRol=2 then
	         
	         SET prfRol='dc';
	      
	      else  
	         SET prfRol='rp';
	      end if;
	     
	   
	   set usuario=lower(
	                    CONCAT( prfRol,
				   (LEFT((SELECT apepaterno FROM tb_empleado WHERE idempleado=_idempleado), 1)),
				   (LEFT((SELECT apematerno FROM tb_empleado WHERE idempleado=_idempleado), 1)),
				   (LEFT((SELECT nombres FROM tb_empleado WHERE idempleado=_idempleado), 3))
				   )
	                   );
	                   
	   set coincidencia=(SELECT usuario from tb_usuario as u where u.usuario=usuario);
	
	if (usuario = coincidencia) then
	  
		  set comodin=CONCAT(ROUND(RAND()*(999)));
		  return concat(usuario,comodin);
	
	else
	
		return usuario;
	end if;
   
end */$$
DELIMITER ;

/* Function  structure for function  `validarHorarioMedico` */

/*!50003 DROP FUNCTION IF EXISTS `validarHorarioMedico` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarHorarioMedico`(
     _idMedico int(10)
    ) RETURNS tinyint(1)
BEGIN
           return false;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_actualizarCitaMedica` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_actualizarCitaMedica` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_actualizarCitaMedica`(
  _idcitamedica INT(10)
  )
BEGIN
    
 UPDATE 
 tb_citamedica
SET
	  idestado=5
WHERE `idcitamedica` = _idcitamedica;
            
							
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_editarApoderado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_editarApoderado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_editarApoderado`(
  _idapoderado INT(10) ,
  _dni CHAR(8) ,
  _nombres VARCHAR(50) ,
  _apepaterno VARCHAR(50) ,
  _apematerno VARCHAR(50) ,
  _correo VARCHAR(100) ,
  _telefono CHAR(9),
  _fechanac DATE ,
  _sexo CHAR(1) ,
  _iddistrito INT(11)  ,
  _direccion VARCHAR(100) 
 )
BEGIN
		UPDATE 
		      tb_apoderado
		SET
		  `dni` = _dni,
		  `nombres` = _nombres,
		  `apepaterno` = _apepaterno,
		  `apematerno` = _apematerno,
		  `correo` =  _correo,
		  `telefono` = _telefono,
		  `fechanac` = _fechanac,
		  `sexo` = _sexo,
		  `iddistrito` = _iddistrito,
		  `direccion` = _direccion
		WHERE idapoderado = _idapoderado;
	
				
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_editarCargo` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_editarCargo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_editarCargo`( _idcargo int(10), _cargo char(50), _idrol int(10)  )
BEGIN
	update `bd_medikid`.`tb_cargo`
	set
	 `cargo`=_cargo,
     `idrol`=_idrol
     where `idcargo`= _idcargo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_editarEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_editarEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_editarEmpleado`(
  _idempleado int(10),
  _dni char(8),
  _nombres varchar(50),
  _apepaterno varchar(50),
  _apematerno varchar(50),
  _fechanac date,
  _telefono varchar(9),
  _iddistrito int(11),
  _direccion varchar(100),
  _email varchar(50),
  _sexo char(1),
  _idcargo int(10),
  _cv VARCHAR(100),
  _foto VARCHAR(100)
 )
BEGIN
    
 UPDATE 
 tb_empleado
SET
	  `idempleado` = _idempleado,
	  `dni` = _dni,
	  `nombres` = _nombres,
	  `apepaterno` = _apepaterno,
	  `apematerno` = _apematerno,
	  `fechanac` = _fechanac,
          `telefono` = _telefono,
          `iddistrito` = _iddistrito,
	  `direccion` = _direccion,
	  `email` = _email,
	  `sexo` = _sexo,
          `idcargo` = _idcargo,
          `cv` = _cv,
	  `foto` = _foto
WHERE `idempleado` = _idempleado;
            
							
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_editarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_editarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_editarPaciente`(
  _idpaciente INT(10),
  _idapoderado INT(10),
  _dni CHAR(8),
  _foto VARCHAR(100),
  _nombres VARCHAR(50),
  _apepaterno VARCHAR(50),
  _apematerno VARCHAR(50),
  _fechanac DATE,
  _sexo CHAR(1)
  )
BEGIN
    
 UPDATE 
 tb_paciente
SET
	  `idapoderado` = _idapoderado,
	  `dni` = _dni,
	  `foto` = _foto,
	  `nombres` = _nombres,
	  `apepaterno` = _apepaterno,
	  `apematerno` = _apematerno,
	  `fechanac` = _fechanac,
	  `sexo` = _sexo
WHERE `idpaciente` = _idpaciente;
            
							
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_eliminarApoderado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_eliminarApoderado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_eliminarApoderado`(_idapoderado int(10))
BEGIN
          	UPDATE 
		      tb_apoderado
		SET
		   idestado=2
		WHERE idapoderado = _idapoderado;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_eliminarCargo` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_eliminarCargo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_eliminarCargo`(_idcargo INT(10))
BEGIN
    
 UPDATE 
 tb_cargo
SET
	  idestado=2
WHERE `idcargo` = _idcargo;
            
							
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_eliminarConsultorio` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_eliminarConsultorio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_eliminarConsultorio`(
     _idconsultorio int(10)
    )
BEGIN
    
    update tb_consultorio
    set idestado=2
    where idconsultorio=_idconsultorio;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_eliminarEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_eliminarEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_eliminarEmpleado`(
  _idempleado INT(10)
  )
BEGIN
    
		 UPDATE 
		          tb_empleado
		 SET
			  idestado=2
		WHERE `idempleado` = _idempleado;
            
							
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_eliminarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_eliminarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_eliminarPaciente`(
  _idpaciente INT(10)
  )
BEGIN
    
 UPDATE 
 tb_paciente
SET
	  idestado=2
WHERE `idpaciente` = _idpaciente;
            
							
    END */$$
DELIMITER ;

/* Procedure structure for procedure `USP_GetAtencionesByPaciente_Mobile` */

/*!50003 DROP PROCEDURE IF EXISTS  `USP_GetAtencionesByPaciente_Mobile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_GetAtencionesByPaciente_Mobile`( _idpaciente int)
begin
SELECT DA.fechaatencion, E.dni as dnimedico,
		CONCAT(E.nombres, ' ', E.apepaterno, ' ', E.apematerno) as nombremedico,
		DA.diagnostico, DA.receta
FROM tb_detalleatencion as DA INNER JOIN tb_historiamedica as HM
ON DA.idhistoriamedica = HM.idhistoriamedica INNER JOIN tb_empleado E
ON DA.idmedico = E.idempleado
WHERE HM.idpaciente = _idpaciente;
END */$$
DELIMITER ;

/* Procedure structure for procedure `USP_GetPacientesByApoderado_Mobile` */

/*!50003 DROP PROCEDURE IF EXISTS  `USP_GetPacientesByApoderado_Mobile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_GetPacientesByApoderado_Mobile`( _idApoderado int)
begin
SELECT p.idpaciente, CONCAT(p.nombres, ' ', p.apepaterno) AS paciente
FROM tb_apoderado AS a INNER JOIN tb_paciente AS p
ON a.idapoderado = p.idapoderado
WHERE a.idapoderado = _idApoderado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarApoderado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarApoderado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarApoderado`(
  _dni char(8) ,
  _nombres varchar(50) ,
  _apepaterno varchar(50) ,
  _apematerno varchar(50) ,
  _correo varchar(100) ,
  _telefono char(9),
  _fechanac date ,
  _sexo char(1) ,
  _iddistrito int(11)  ,
  _direccion varchar(100),
  
  INOUT op_claveGenerada VARCHAR(10)
 )
BEGIN
                        declare v_idapoderado int(10);
	
				insert into tb_apoderado
				 (
				  `idapoderado`,
				  `dni`,
				  `nombres`,
				  `apepaterno`,
				  `apematerno`,
				  `correo`,
				  `telefono`,
				  `fechanac`,
				  `sexo`,
				  `iddistrito`,
				  `direccion`,
				  `idestado`
				) 
				values
				(
				   null,
				  _dni,
				  _nombres,
				  _apepaterno,
				  _apematerno,
				  _correo,
				  _telefono,
				  _fechanac,
				  _sexo,
				  _iddistrito,
				  _direccion,
				   1 
				  ) ;
				  
				  SET v_idapoderado=(SELECT MAX(idapoderado) FROM tb_apoderado);
				  call usp_insertarApoderadoUsuario(v_idapoderado, @salida);
				  
				  set op_claveGenerada=@salida;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarApoderadoUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarApoderadoUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarApoderadoUsuario`(
       _idapoderado int(10),
       inout op_claveGenerada varchar(10)
    )
BEGIN
         DECLARE claveGenerada VARCHAR(10);
         SET claveGenerada=SUBSTRING(MD5(RAND()),-10);
         SET op_claveGenerada=claveGenerada;
    
    INSERT INTO tb_apoderadousuario (idapoderado, clave, idestado) 
									VALUES
									  (
									    _idapoderado,
									    sha1(claveGenerada),
									    1
									  ) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarCargo` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarCargo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarCargo`( _cargo char(50), _idrol int(10)  )
BEGIN
	insert into `bd_medikid`.`tb_cargo` (`idcargo`, `cargo`, `idrol`) 
	values
	  (null, _cargo, _idrol) ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarCita` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarCita` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarCita`(
      	    _idpaciente int(10),
	    _idrecepcionista INT(10),
	    _idmedico INT(10),
	    _fechainiciocita DATETIME ,
	    _fechafincita datetime,
	    _motivo VARCHAR(100)
    )
BEGIN
    
	   INSERT INTO `bd_medikid`.`tb_citamedica`(
	   `idcitamedica`,
	  `idpaciente`,
	  `idrecepcionista`,
	  `idmedico`,
	  `fechacitacreada`,
	  `fechainiciocita`,
	  `fechafincita`,
	  `motivo`,
	  `idtipocita`,
	  `idestado`
	) 
	VALUES
	  (
	     null,
	    _idpaciente,
	    _idrecepcionista,
	    _idmedico,
	     CURDATE(),
	    _fechainiciocita,
	    _fechafincita,
	    _motivo,
	    9,
	    4
	  ) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarConsultorio` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarConsultorio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarConsultorio`(
     _descripcion varchar(100),
     _ubicacion VARCHAR(100),
     _idespecialidad int(10),
     
     inout op_idconsultorio int(10)
    )
BEGIN
    
		    INSERT INTO tb_consultorio
		    (
		    idconsultorio,
		    descripcion,
		    ubicacion,
		    idespecialidad,
		    idestado
		    ) 
		    VALUES
		    (
		    null,
		     _descripcion,
		     _ubicacion,
		    _idespecialidad,
		      1
		    );
		    
		    set op_idconsultorio=(select max(idconsultorio) from tb_consultorio);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarConsultorioMedico` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarConsultorioMedico` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarConsultorioMedico`(
     _idconsultorio int(10),
     _idmedico int(10)
    )
BEGIN
    
    INSERT INTO tb_consultoriomedico
                                   (idconsultorio, idmedico) 
               VALUES
                                  (_idconsultorio, _idmedico) ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarDetalleAtencion` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarDetalleAtencion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarDetalleAtencion`(_idhistoriamedica int(10), _idmedico int(10), _fechaatencion date, _diagnostico varchar(100), _receta varchar(100), _alergias varchar(100))
BEGIN
	DECLARE v_idcitamedica INT(10);
	insert into `bd_medikid`.`tb_detalleatencion` (`idhistoriamedica`, `idmedico`, `fechaatencion`, `diagnostico`, `receta`, `alergias`) 
	values
	  (_idhistoriamedica, _idmedico, _fechaatencion, _diagnostico, _receta, _alergias);
				/* Como carajos selecciono el id de la cita con detalle de atencion para 
                actualizar el e stado xD*/
				/* set v_idcitamedica=(SELECT idcitamedica FROM tb_citamedica);	  
	                Call usp_actualizarCitaMedica(v_idcitamedica); */
	END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarEmpleado`(
  _dni CHAR(8),
  _nombres VARCHAR(50),
  _apepaterno VARCHAR(50),
  _apematerno VARCHAR(50),
  _fechanac DATE,
  _telefono VARCHAR(9),
  _iddistrito INT(11),
  _direccion VARCHAR(100),
  _email VARCHAR(50),
  _sexo CHAR(1),
  _idcargo INT(10),
  _cv VARCHAR(100),
  _foto VARCHAR(100),
  _idasistente int(10),
  
  _idespecialidad int(10),
  
  INOUT op_userNameGenerada VARCHAR(10),
  INOUT op_claveGenerada VARCHAR(10),
  INOUT op_idempleado int(10)  
 )
BEGIN
	DECLARE v_idempleado INT(10);
	Declare v_idrol int(10);
	
				INSERT INTO tb_empleado
				 (
				  `idempleado`,
				  `dni`,
				  `nombres`,
				  `apepaterno`,
				  `apematerno`,
				  `fechanac`,
				  `telefono`,
				  `iddistrito`,
				  `direccion`,
				  `email`,
				  `sexo`,
				  `idcargo`,
				  `cv`,
				  `foto`,
				  `idestado`,
				   idasistente
				) 
				VALUES
				(
				   NULL,
				  _dni,
				  _nombres,
				  _apepaterno,
				  _apematerno,
				  _fechanac,
				  _telefono,
				  _iddistrito,
				  _direccion,
				  _email,
				  _sexo,
				  _idcargo,
				  _cv,
				  _foto,
				   1,
				   _idasistente 
				  );
				  
		                  SET v_idempleado=(SELECT MAX(idempleado) FROM tb_empleado);
				
				  if(_idcargo = 2)then
				  
				  INSERT INTO tb_medicoespecialidad(idmedico, idespecialidad) VALUES (v_idempleado, _idespecialidad);
				  update tb_empleado set
				  idestado=3
				  where idempleado=_idasistente;
				  end if;
				  
				  
				    
				  set v_idrol=(
				                 select 
				                 r.idrol 
				                 From tb_cargo as c inner join tb_rol as r on c.idrol=r.idrol 
				                 where c.idrol=_idcargo
				                );
				  IF (v_idrol = 1 OR v_idrol = 2 OR v_idrol=3) THEN
				  
					  
					   CALL usp_registrarUsuario(v_idempleado, v_idrol, @salidaUsrName, @salidaClave);
					  
					   SET op_userNameGenerada=@salidaUsrName;
					  
					   SET op_claveGenerada=@salidaClave;
				  
				           set op_idempleado=v_idempleado;
				  
				  ELSE
				             set op_userNameGenerada='';
				             SET op_claveGenerada='';
				             SET op_idempleado=0;
				  
				  END IF;
				  
				  IF (v_idrol=4) THEN
				    SET op_idempleado=0;
				   END IF;
				
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarHistoriaClinica` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarHistoriaClinica` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarHistoriaClinica`(
     _idpaciente int(10),
     _antecedentes varchar(100),
     _idtiposangre int(10)
    )
BEGIN
		INSERT INTO tb_historiaclininca
		(
		  idhistoriamedica,
		  fechacreacion,
		  idpaciente,
		  antecedentes,
		  idtiposangre,
		  idestado
		) 
		VALUES
		(
		     null,
		     null,
		     _idpaciente,
		     _antecedentes,
		     _idtiposangre,
		     1
		 );
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_insertarHorarioEmpleado` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_insertarHorarioEmpleado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_insertarHorarioEmpleado`(
     _idmedico int(10),
     _iddia int(10),
     _horainicio time,
     _horafin time
    )
BEGIN
    
	    INSERT INTO `bd_medikid`.`tb_horarioempleado` 
	(
	  `idhorarioempleado`,
	  `idmedico`,
	  `iddia`,
	  `horainicio`,
	  `horafin`
	) 
	VALUES
	  (
	    NULL,
	    _idmedico,
	    _iddia,
	    _horainicio,
	    _horafin
	  );
    END */$$
DELIMITER ;

/* Procedure structure for procedure `USP_LoginApoderado_Mobile` */

/*!50003 DROP PROCEDURE IF EXISTS  `USP_LoginApoderado_Mobile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_LoginApoderado_Mobile`( _email varchar(100), _contrasena varchar(100))
begin
	SELECT A.idapoderado, A.dni,
			CONCAT(A.nombres, ' ', A.apepaterno, ' ', A.apematerno) AS apoderado,
			A.correo, A.telefono, A.fechanac, A.sexo, A.iddistrito, A.direccion
	FROM tb_apoderado A inner join tb_apoderadousuario AU
	ON A.idapoderado = AU.idapoderado
	WHERE A.Correo = _email AND AU.clave = _contrasena;
END */$$
DELIMITER ;

/* Procedure structure for procedure `USP_RegistrarApoderado_Mobile` */

/*!50003 DROP PROCEDURE IF EXISTS  `USP_RegistrarApoderado_Mobile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_RegistrarApoderado_Mobile`( _email varchar(100), _contrasena varchar(100))
begin
	-- Devolvera un mensaje vacÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â­o si la operaciÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â³n es exitosa
	
	DECLARE vMensaje varchar(50);
	DECLARE vIdApoderado int;
	SET vIdApoderado = (SELECT idapoderado FROM tb_apoderado WHERE correo LIKE _email);
	
	IF (vIdApoderado > 0) THEN
		
		INSERT INTO tb_apoderadousuario (idapoderado, clave, idestado)
		VALUES (vIdApoderado, _email, 1);
	
	ELSE
		SET vMensaje = 'No existe un apoderado con ese email';
	END IF;
	
	SELECT vMensaje;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_registrarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_registrarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registrarPaciente`(
  _idapoderado INT(10),
  _dni CHAR(8),
  _foto VARCHAR(100),
  _nombres VARCHAR(50),
  _apepaterno VARCHAR(50),
  _apematerno VARCHAR(50),
  _fechanac DATE,
  _sexo CHAR(1),
  
  _antecedentes varchar(100),
  _idtiposangre int(10)
  )
BEGIN
            DECLARE v_idapoderado INT(10);
            INSERT INTO tb_paciente 
                                  (
				  idpaciente,
				  idapoderado,
				  dni,
				  foto,
				  nombres,
				  apepaterno,
				  apematerno,
				  fechanac,
				  sexo,
				  idestado
	                          ) 
				   VALUES
				  (
				   NULL,
				  _idapoderado,
				  _dni,
				  _foto,
				  _nombres,
				  _apepaterno,
				  _apematerno,
				  _fechanac,
				  _sexo,
				  1
				  );
			set v_idapoderado=(SELECT MAX(idpaciente) FROM tb_paciente);	  
	                Call usp_insertarHistoriaClinica(v_idapoderado, _antecedentes, _idtiposangre);
							  
							  
    END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_registrarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_registrarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registrarUsuario`(
     _idempleado int,
     _idrol int(10),
     
     inout op_userNameGenerada varchar(10),
     INOUT op_claveGenerada varchar(10)
     
    )
BEGIN
         declare claveGenerada varchar(10);
         DECLARE userNameGenerada varchar(10);
         
         set userNameGenerada=GenerarNombreUsuario(_idempleado);
         set claveGenerada=SUBSTRING(MD5(RAND()),-10);
         
         set op_userNameGenerada=userNameGenerada;
         Set op_claveGenerada=claveGenerada;
         
         INSERT INTO tb_usuario VALUES ( _idempleado, userNameGenerada, SHA1(claveGenerada), 1, _idrol);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `USP_ReservarCitaMedica_Mobile` */

/*!50003 DROP PROCEDURE IF EXISTS  `USP_ReservarCitaMedica_Mobile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_ReservarCitaMedica_Mobile`( _idapoderado int,
																						_idpaciente int,
																						_fechainicita datetime,
																						_motivo varchar(100))
begin
	-- Devolvera un mensaje vacÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â­o si la operaciÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â³n es exitosa
	
	DECLARE vMensaje varchar(50);
	DECLARE vInspectorApoderado int;
	DECLARE vInspectorPaciente int;
	DECLARE vFechaFinCita datetime;
		
	SET vFechaFinCita = _fechainicita + INTERVAL 15 MINUTE;
	SET vInspectorApoderado = (SELECT COUNT(*) FROM tb_apoderado WHERE idapoderado = _idapoderado);
	IF (vInspectorApoderado > 0) THEN
		
		SET vInspectorPaciente = (SELECT COUNT(*) FROM tb_paciente WHERE idpaciente = _idpaciente);
		IF (vInspectorPaciente > 0) THEN
			INSERT INTO tb_citamedica (idapoderado, idpaciente, fechacitacreada,
										fechainiciocita, fechafincita, motivo, idtipocita, idestado)
			VALUES (_idapoderado, _idpaciente, CURDATE(), _fechainicita, vFechaFinCita, _motivo, 1, 1);
		ELSE
			SET vMensaje = 'No existe un apoderado enviado';
		END IF;
	ELSE
		SET vMensaje = 'No existe un apoderado enviado';
	END IF;
	
	SELECT vMensaje;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_selecionarCitas` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_selecionarCitas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_selecionarCitas`(_idmedico int(10), _idDia INT(10))
BEGIN
	SELECT 
		c.idcitamedica,
		c.fechainiciocita,
		c.fechafincita,
		p.nombres,
		p.apepaterno,
		p.apematerno,
		e.descripcion
		FROM tb_paciente AS p JOIN tb_citamedica AS c ON p.idpaciente=c.idpaciente
        INNER JOIN tb_horarioempleado he ON he.idmedico=c.idmedico
		JOIN tb_estado AS e ON c.idestado=e.idestado where c.idestado=4 and he.iddia= _idDia and he.idmedico=_idmedico;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `usp_validarLogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `usp_validarLogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_validarLogin`( _usuario char(10), _password varchar(100))
begin
select 
   u.usuario,
   r.rol,
   e.nombres,
   e.idempleado,
   e.apepaterno,
   e.apematerno
from 
tb_usuario as u 
inner join tb_empleado as e on u.idempleado=e.idempleado
inner join tb_rol as r on u.idrol=r.idrol
where u.usuario=_usuario and u.password=_password;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
