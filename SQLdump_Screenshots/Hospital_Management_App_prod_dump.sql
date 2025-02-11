-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: medclinic-mysql-db-server.mysql.database.azure.com    Database: womens_health_db
-- ------------------------------------------------------
-- Server version	8.0.37-azure

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_charge_type`
--

DROP TABLE IF EXISTS `additional_charge_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_charge_type` (
  `additionalChargeTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`additionalChargeTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_charge_type`
--

LOCK TABLES `additional_charge_type` WRITE;
/*!40000 ALTER TABLE `additional_charge_type` DISABLE KEYS */;
INSERT INTO `additional_charge_type` VALUES (1,'Late Cancellation','Charge for cancelling appointment less than 24 hours in advance',50.00),(2,'No-Show Fee','Charge for missing an appointment without prior notice',75.00),(3,'Extended Consultation','Additional time beyond standard consultation',100.00),(4,'Emergency Visit','Urgent appointment outside regular hours',150.00),(5,'Special Equipment Usage','Charge for using specialized medical equipment',200.00),(6,'Late Cancellation','Charge for cancelling appointment less than 24 hours in advance',50.00),(7,'No-Show Fee','Charge for missing an appointment without prior notice',75.00),(8,'Extended Consultation','Additional time beyond standard consultation',100.00),(9,'Emergency Visit','Urgent appointment outside regular hours',150.00),(10,'Special Equipment Usage','Charge for using specialized medical equipment',200.00),(11,'Late Cancellation','Charge for cancelling appointment less than 24 hours in advance',50.00),(12,'No-Show Fee','Charge for missing an appointment without prior notice',75.00),(13,'Extended Consultation','Additional time beyond standard consultation',100.00),(14,'Emergency Visit','Urgent appointment outside regular hours',150.00),(15,'Special Equipment Usage','Charge for using specialized medical equipment',200.00),(16,'Priority Scheduling','Charge for scheduling appointments within 24 hours',100.00),(17,'Consultation Extension','Additional time beyond standard consultation',120.00),(18,'Home Care Visit','Charge for visiting the patient at home',180.00),(19,'Specialist Referral','Fee for referring to a specialist',90.00),(20,'Advanced Diagnostic Tests','Fee for performing advanced diagnostic procedures',300.00);
/*!40000 ALTER TABLE `additional_charge_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressID` int unsigned NOT NULL AUTO_INCREMENT,
  `addrStreet` varchar(100) NOT NULL,
  `addrzip` varchar(10) NOT NULL,
  `addrcity` varchar(50) NOT NULL,
  `addrstate` char(2) NOT NULL,
  PRIMARY KEY (`addressID`),
  UNIQUE KEY `addrStreet` (`addrStreet`,`addrzip`,`addrcity`,`addrstate`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (16,'106 Sixth St','10003','Manhattan','NY'),(21,'111 Elm Street','10004','Queens','NY'),(43,'11103 Cornalee Ct','77407','Richmond','TX'),(2,'123 Elm St','90001','Los Angeles','CA'),(27,'123 Houston Dr','77072','Houston','TX'),(1,'123 Main St','10001','New York','NY'),(6,'123 Maple Blvd','45122','Houston','TX'),(17,'207 Seventh Ave','90003','Santa Monica','CA'),(22,'222 Pine Avenue','90003','Santa Monica','CA'),(38,'2703 Swill Street','77298','Katy','TX'),(36,'2837 Mountain Avenue','66351','Springfield','IL'),(40,'2973 Service Blvd','93864','Houston','TX'),(37,'2975 Cliff Circle','99214','Anchorage','AK'),(18,'308 Eighth Blvd','60603','Evanston','IL'),(4,'321 Pine Rd','77001','Houston','TX'),(23,'333 Cedar Road','60604','Chicago Heights','IL'),(41,'3894 Rough Lane','88733','Cypress','TX'),(45,'405 Epic St','45551','Epic','TX'),(19,'409 Ninth Rd','77003','Sugar Land','TX'),(33,'4111 st','31283189','richmond','va'),(31,'415 Road Rd','55124','Richmond','TX'),(32,'415 St','11234','epic','CA'),(42,'415 Streeet','41524','Sugar Land','TX'),(26,'4156 Epic rd','44512','Dallas','TX'),(28,'420 Epic St','77407','Berg','TX'),(24,'444 Birch Boulevard','77004','Sugar Land','TX'),(35,'4455 Lemon Road','66398','Cypress','TX'),(29,'451 Skibidi Ln','45155','Richmond','TX'),(30,'456 Maple Blvd','45122','Houston','TX'),(20,'510 Tenth Ln','85003','Scottsdale','AZ'),(25,'555 Walnut Lane','85004','Tempe','AZ'),(44,'5767 Lemon St','77899','Houston','TX'),(5,'654 Maple Blvd','85001','Phoenix','AZ'),(3,'789 Oak Ave','60601','Chicago','IL'),(39,'9846 Market Avenue','92355','Houston','TX'),(34,'jsf;a 213','12378','Richmond','TX'),(46,'oij','22','oij','TX');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other','Prefer not to say') NOT NULL,
  `dateOfBirth` date NOT NULL,
  `workPhoneNumber` varchar(15) NOT NULL,
  `workEmail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `personalPhoneNumber` varchar(15) DEFAULT NULL,
  `personalEmail` varchar(100) DEFAULT NULL,
  `officeID` int unsigned DEFAULT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(100) NOT NULL,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addressID` int unsigned DEFAULT NULL,
  `Inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `workEmail` (`workEmail`),
  KEY `fk_admin_address` (`addressID`),
  KEY `fk_admin_office` (`officeID`),
  CONSTRAINT `fk_admin_address` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_admin_office` FOREIGN KEY (`officeID`) REFERENCES `office` (`officeID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Emily','Clark','Female','1980-05-15','2125551111','admin@admin.com','123',NULL,NULL,NULL,1,'system','2024-11-17 19:41:04','system','2024-11-19 06:22:57',1,0),(2,'Michael','Johnson','Male','1975-08-22','3105552222','michael.johnson@health.com','hashedpassword2',NULL,NULL,NULL,2,'system','2024-11-17 19:41:04','system','2024-11-17 19:41:04',2,0),(3,'Sarah','Lee','Female','1990-12-05','3125553333','sarah.lee@medical.com','hashedpassword3',NULL,NULL,NULL,3,'system','2024-11-17 19:41:04','system','2024-11-17 19:41:04',3,0),(4,'David','Kim','Male','1985-03-30','7135554444','david.kim@clinic.com','hashedpassword4',NULL,NULL,NULL,4,'system','2024-11-17 19:41:04','system','2024-11-17 19:41:04',4,0),(5,'Laura','Martinez','Female','1978-07-19','6025555555','laura.martinez@office.com','hashedpassword5',NULL,NULL,NULL,5,'system','2024-11-17 19:41:04','system','2024-11-17 19:41:04',5,0),(6,'Nathan','Harris','Male','1982-09-12','2125551113','nathan.harris@clinic.com','hashedpassword16',NULL,NULL,NULL,6,'system','2024-11-18 00:18:49','system','2024-11-18 00:18:49',6,0),(7,'Olivia','Martinez','Female','1979-04-23','3105552224','olivia.martinez@health.com','hashedpassword17',NULL,NULL,NULL,7,'system','2024-11-18 00:18:49','system','2024-11-18 00:18:49',7,0),(8,'Liam','Garcia','Male','1988-11-05','3125553335','liam.garcia@medical.com','hashedpassword18',NULL,NULL,NULL,8,'system','2024-11-18 00:18:49','system','2024-11-18 00:18:49',8,0),(9,'Sophia','Rodriguez','Female','1992-02-14','7135554446','sophia.rodriguez@clinic.com','hashedpassword19',NULL,NULL,NULL,9,'system','2024-11-18 00:18:49','system','2024-11-18 00:18:49',9,0),(10,'Noah','Wilson','Male','1985-07-30','6025555557','noah.wilson@office.com','hashedpassword20',NULL,NULL,NULL,10,'system','2024-11-18 00:18:49','system','2024-11-18 00:18:49',10,0),(11,'Evelyn','Scott','Female','1983-04-12','7185551113','evelyn.scott@clinic.com','hashedpassword26',NULL,NULL,NULL,11,'system','2024-11-18 00:21:29','system','2024-11-18 00:21:29',11,0),(12,'Daniel','Adams','Male','1979-07-19','3105552224','daniel.adams@health.com','hashedpassword27',NULL,NULL,NULL,12,'system','2024-11-18 00:21:29','system','2024-11-18 00:21:29',12,0),(13,'Madison','Baker','Female','1991-03-05','3125553335','madison.baker@medical.com','hashedpassword28',NULL,NULL,NULL,13,'system','2024-11-18 00:21:29','system','2024-11-18 00:21:29',13,0),(14,'James','Carter','Male','1980-11-23','7135554445','james.carter@clinic.com','hashedpassword29',NULL,NULL,NULL,14,'system','2024-11-18 00:21:29','system','2024-11-18 00:21:29',14,0),(15,'Abigail','Dixon','Female','1985-09-30','6025555556','abigail.dixon@office.com','hashedpassword30',NULL,NULL,NULL,15,'system','2024-11-18 00:21:29','system','2024-11-18 00:21:29',15,0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy` (
  `allergyID` int unsigned NOT NULL AUTO_INCREMENT,
  `allergen` varchar(100) NOT NULL,
  `reaction` varchar(100) NOT NULL,
  `severity` enum('Mild','Moderate','Severe') NOT NULL,
  `notes` text,
  `patientID` int unsigned NOT NULL,
  PRIMARY KEY (`allergyID`),
  KEY `fk_allergy_patient` (`patientID`),
  CONSTRAINT `fk_allergy_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
INSERT INTO `allergy` VALUES (1,'Peanuts','Anaphylaxis','Severe','Must carry epinephrine auto-injector',1),(2,'Dust','Sneezing and congestion','Mild','Use air purifiers at home',2),(3,'Pollen','Itchy eyes','Moderate','Seasonal allergy',3),(4,'Bee Stings','Swelling and pain','Moderate','Avoid outdoor activities during summer',4),(5,'Latex','Skin irritation','Mild','Use latex-free gloves',5),(6,'Shellfish','Anaphylaxis','Severe','Avoid all shellfish products',6),(7,'Mold','Coughing and sneezing','Mild','Use dehumidifiers at home',7),(8,'Cat Dander','Itchy eyes and skin','Moderate','Limit exposure to cats',8),(9,'Dust Mites','Runny nose','Mild','Use dust mite covers on bedding',9),(10,'Gluten','Digestive issues','Moderate','Follow a gluten-free diet',10),(11,'Fish','Hives and itching','Moderate','Avoid all fish products',6),(12,'Bee Stings','Anaphylaxis','Severe','Must carry epinephrine auto-injector',7),(13,'Penicillin','Rash and swelling','Moderate','Use alternative antibiotics',8),(14,'Latex','Anaphylaxis','Severe','Strictly avoid latex products',9),(15,'Shellfish','Gastrointestinal distress','Mild','Limit shellfish intake',10),(17,'Grass','itching','Moderate',NULL,6),(18,'Poison Ivy','Bad','Severe','None',1),(19,'Poison Ivy','Rashing','Moderate','He gets rashes near bushes',17),(20,'Peanuts','Swelling','Moderate',NULL,17),(21,'latex','rash','Moderate',NULL,19),(22,'Latex','Rashes','Moderate',NULL,17),(24,'Latex','rash','Mild',NULL,23),(27,'Latex','rash','Mild',NULL,24),(28,'Penicillin','swelling','Severe',NULL,26),(29,'Latex','rash','Mild',NULL,27),(30,'Penicillin','swelling','Mild',NULL,28),(32,'Penicillin ','swelling','Mild',NULL,29),(34,'Latex','rash','Severe',NULL,32),(36,'Latex','rash','Mild',NULL,33);
/*!40000 ALTER TABLE `allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointmentID` int unsigned NOT NULL AUTO_INCREMENT,
  `appointmentDateTime` datetime NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `status` enum('Scheduled','Completed','Cancelled','Requested','Missed','Request Denied') DEFAULT 'Requested',
  `visitType` enum('Telemedicine (Video)','Over-the-Phone','In-Person','Home Visit') DEFAULT 'In-Person',
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `officeID` int unsigned DEFAULT NULL,
  `serviceID` int unsigned DEFAULT NULL,
  `visitNotesID` int unsigned DEFAULT NULL,
  `approvalID` int unsigned DEFAULT NULL,
  `creationMethod` varchar(50) NOT NULL DEFAULT 'phone',
  PRIMARY KEY (`appointmentID`),
  KEY `fk_appointment_officeID` (`officeID`),
  KEY `fk_appointment_patient` (`patientID`),
  KEY `fk_appointment_service` (`serviceID`),
  KEY `appointment_visitNotes_fk` (`visitNotesID`),
  KEY `fk_appointment_doctor` (`doctorID`),
  KEY `fk_appointment_approval` (`approvalID`),
  CONSTRAINT `appointment_visitNotes_fk` FOREIGN KEY (`visitNotesID`) REFERENCES `visit_notes` (`visitNotesID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_appointment_approval` FOREIGN KEY (`approvalID`) REFERENCES `approval` (`approvalID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_appointment_officeID` FOREIGN KEY (`officeID`) REFERENCES `office` (`officeID`),
  CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_appointment_service` FOREIGN KEY (`serviceID`) REFERENCES `service` (`serviceID`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2024-12-01 09:00:00','Routine checkup','Completed','In-Person',1,1,'2024-11-17 19:41:04','2024-11-19 22:18:59',1,1,11,NULL,'Website'),(2,'2024-12-02 10:30:00','Follow-up on blood test results','Cancelled','Telemedicine (Video)',2,2,'2024-11-17 19:41:04','2024-11-19 22:18:59',2,2,NULL,NULL,'Website'),(3,'2024-12-03 14:00:00','MRI scan for persistent headaches','Completed','In-Person',3,3,'2024-11-17 19:41:04','2024-11-19 22:18:59',3,3,NULL,NULL,'Website'),(4,'2024-12-04 16:15:00','Physical therapy session','Scheduled','Home Visit',4,4,'2024-11-17 19:41:04','2024-11-19 22:18:59',4,4,NULL,NULL,'Website'),(5,'2024-12-05 11:45:00','Vaccination for flu season','Scheduled','Over-the-Phone',5,5,'2024-11-17 19:41:04','2024-11-19 22:18:59',5,5,NULL,NULL,'Website'),(6,'2024-12-06 10:00:00','Speech therapy session','Cancelled','In-Person',6,6,'2024-11-18 00:18:50','2024-11-19 22:18:59',6,1,NULL,NULL,'Website'),(7,'2024-12-07 11:30:00','Diabetes follow-up','Cancelled','Telemedicine (Video)',7,7,'2024-11-18 00:18:50','2024-12-02 09:11:40',7,2,NULL,NULL,'Website'),(8,'2024-12-08 15:00:00','Neurological assessment','Request Denied','In-Person',8,8,'2024-11-18 00:18:50','2024-11-19 22:18:59',8,3,NULL,NULL,'Website'),(9,'2024-12-09 17:45:00','Orthopedic consultation','Scheduled','Home Visit',9,9,'2024-11-18 00:18:50','2024-11-19 22:18:59',9,4,NULL,NULL,'Website'),(10,'2024-12-10 12:15:00','Dermatology appointment','Scheduled','Over-the-Phone',10,10,'2024-11-18 00:18:50','2024-11-19 22:18:59',10,5,NULL,NULL,'Website'),(11,'2024-12-11 10:00:00','Oncology consultation','Cancelled','In-Person',6,6,'2024-11-18 00:23:19','2024-11-19 22:18:59',11,1,NULL,NULL,'Website'),(12,'2024-12-12 11:30:00','Endocrinology follow-up','Cancelled','Telemedicine (Video)',7,7,'2024-11-18 00:23:19','2024-12-02 09:11:56',12,2,NULL,NULL,'Website'),(13,'2024-12-13 15:00:00','Gastrointestinal assessment','Request Denied','In-Person',8,8,'2024-11-18 00:23:19','2024-11-19 06:49:57',13,3,NULL,NULL,'phone'),(14,'2024-12-14 17:45:00','Psychiatry session','Scheduled','Home Visit',9,9,'2024-11-18 00:23:19','2024-11-18 00:23:19',14,4,NULL,NULL,'phone'),(15,'2024-12-15 12:15:00','Radiology imaging','Scheduled','Over-the-Phone',10,10,'2024-11-18 00:23:19','2024-11-18 00:23:19',15,5,NULL,NULL,'phone'),(16,'2024-11-21 09:00:00','','Request Denied','Telemedicine (Video)',1,2,'2024-11-18 04:27:01','2024-11-18 06:35:31',2,2,NULL,16,'phone'),(17,'2024-11-28 09:00:00','','Request Denied','In-Person',1,1,'2024-11-18 04:43:20','2024-11-18 06:35:31',1,1,NULL,NULL,'phone'),(18,'2024-11-21 14:30:00','','Request Denied','Telemedicine (Video)',1,4,'2024-11-18 04:45:08','2024-11-18 06:35:31',4,4,NULL,17,'phone'),(19,'2024-11-21 09:00:00','','Request Denied','Telemedicine (Video)',2,1,'2024-11-18 16:59:08','2024-11-18 17:08:13',1,1,NULL,NULL,'phone'),(20,'2024-11-18 09:00:00','Need help pls','Completed','In-Person',17,1,'2024-11-18 20:47:43','2024-11-18 20:54:17',1,1,12,NULL,'phone'),(21,'2024-11-18 10:00:00','GGS','Cancelled','In-Person',17,2,'2024-11-18 20:48:03','2024-11-20 01:01:35',2,2,NULL,NULL,'phone'),(22,'2024-11-18 12:00:00','nothing','Request Denied','In-Person',17,3,'2024-11-18 20:48:28','2024-11-19 05:30:46',3,3,NULL,NULL,'phone'),(23,'2024-11-18 12:00:00','none','Completed','In-Person',17,1,'2024-11-18 20:57:00','2024-11-18 20:59:54',1,1,13,NULL,'phone'),(24,'2024-11-18 14:30:00','','Completed','In-Person',17,1,'2024-11-18 20:57:16','2024-11-18 21:12:50',1,1,14,NULL,'phone'),(25,'2024-11-18 15:00:00','','Completed','In-Person',17,1,'2024-11-18 21:40:34','2024-11-18 21:43:04',1,1,15,NULL,'phone'),(26,'2024-11-18 11:00:00','ggs','Completed','In-Person',17,1,'2024-11-18 21:45:03','2024-11-18 21:45:52',1,1,16,NULL,'phone'),(27,'2024-11-18 10:30:00','','Completed','In-Person',17,1,'2024-11-18 21:48:14','2024-11-18 21:48:58',1,1,17,NULL,'phone'),(28,'2024-11-18 11:00:00','ggs','Completed','In-Person',1,1,'2024-11-19 00:12:10','2024-11-19 00:22:15',1,1,18,NULL,'phone'),(29,'2024-11-19 09:00:00','ggs','Request Denied','In-Person',17,1,'2024-11-19 04:31:17','2024-11-19 05:22:27',1,1,NULL,NULL,'phone'),(30,'2024-11-19 09:30:00','ggsgs','Request Denied','In-Person',17,1,'2024-11-19 04:31:37','2024-11-19 05:22:27',1,1,NULL,NULL,'phone'),(31,'2024-11-19 11:30:00','','Request Denied','In-Person',17,1,'2024-11-19 04:32:28','2024-11-19 05:22:27',1,1,NULL,NULL,'phone'),(32,'2024-11-19 00:00:00','ghghjshgjshgjsh','Completed','In-Person',17,6,'2024-11-19 04:41:34','2024-11-19 04:49:58',6,1,19,NULL,'phone'),(33,'2024-11-19 00:30:00','Need more drugs!!!!!!!!!','Completed','In-Person',17,6,'2024-11-19 04:52:56','2024-11-19 05:19:25',6,1,20,NULL,'phone'),(34,'2024-11-20 10:00:00','Help me','Cancelled','Over-the-Phone',17,6,'2024-11-19 05:12:29','2024-11-19 05:29:55',6,1,NULL,NULL,'phone'),(35,'2024-11-19 00:00:00','','Cancelled','In-Person',17,1,'2024-11-19 05:40:40','2024-11-19 06:17:26',1,1,NULL,NULL,'phone'),(36,'2024-11-19 00:00:00','ggs','Cancelled','In-Person',17,6,'2024-11-19 05:47:30','2024-11-19 22:01:06',6,1,NULL,NULL,'phone'),(37,'2024-11-19 00:03:00','dhfuahf','Completed','In-Person',17,6,'2024-11-19 05:54:50','2024-11-19 06:13:07',6,1,21,NULL,'phone'),(38,'2024-11-19 09:00:00','help me','Completed','Telemedicine (Video)',17,6,'2024-11-19 06:07:38','2024-11-19 06:45:21',6,1,22,NULL,'phone'),(39,'2024-11-19 00:03:00','I\'ve been having medical issues.','Cancelled','In-Person',17,6,'2024-11-19 05:54:50','2024-11-19 22:01:09',6,1,NULL,NULL,'phone'),(40,'2024-11-19 10:00:00','help me','Cancelled','Over-the-Phone',17,6,'2024-11-19 06:39:27','2024-11-19 06:42:37',6,1,NULL,NULL,'phone'),(41,'2024-11-19 10:00:00','gggg','Scheduled','In-Person',17,6,'2024-11-19 18:48:26','2024-11-19 18:50:02',6,1,NULL,NULL,'phone'),(42,'2024-11-19 09:30:00','gdfsdfs','Scheduled','In-Person',17,6,'2024-11-19 18:48:49','2024-11-19 18:49:59',6,1,NULL,NULL,'phone'),(43,'2024-11-19 11:00:00','Been having some heart issues.','Scheduled','In-Person',17,6,'2024-11-19 18:54:17','2024-11-19 18:55:00',6,1,NULL,NULL,'phone'),(44,'2024-11-21 09:00:00','9 AM ','Request Denied','Telemedicine (Video)',17,6,'2024-11-19 19:09:22','2024-11-19 22:01:27',6,1,NULL,NULL,'phone'),(45,'2024-11-21 09:30:00','help me','Request Denied','Telemedicine (Video)',17,6,'2024-11-19 19:10:12','2024-11-19 22:01:30',6,1,NULL,NULL,'phone'),(46,'2023-12-05 09:00:00','Annual Physical Exam','Completed','In-Person',2,5,'2023-11-20 10:00:00','2023-12-05 12:00:00',5,1,NULL,NULL,'phone'),(47,'2023-12-15 14:30:00','Follow-up Consultation','Completed','Over-the-Phone',3,6,'2023-12-01 11:00:00','2023-12-15 15:30:00',6,2,NULL,NULL,'phone'),(48,'2024-01-10 16:00:00','MRI Scan for back pain','Completed','In-Person',4,7,'2023-12-20 12:00:00','2024-01-10 18:00:00',7,3,NULL,NULL,'phone'),(49,'2024-02-05 09:30:00','Physical Therapy Session','Completed','In-Person',5,8,'2024-01-25 13:00:00','2024-02-05 10:30:00',8,4,NULL,NULL,'phone'),(50,'2024-03-15 11:00:00','Vaccination','Completed','In-Person',6,9,'2024-03-01 14:00:00','2024-03-15 12:00:00',9,5,NULL,NULL,'phone'),(51,'2024-04-20 13:00:00','Ultrasound','Completed','In-Person',7,10,'2024-04-10 10:00:00','2024-04-20 14:30:00',10,6,NULL,NULL,'phone'),(52,'2024-05-15 15:00:00','Dental Cleaning','Completed','In-Person',8,1,'2024-05-01 11:00:00','2024-05-15 16:00:00',1,8,NULL,NULL,'phone'),(53,'2024-06-10 10:30:00','Eye Exam','Completed','In-Person',9,2,'2024-05-25 12:00:00','2024-06-10 11:30:00',2,9,NULL,NULL,'phone'),(54,'2024-07-05 16:00:00','Chiropractic Adjustment','Completed','In-Person',10,3,'2024-06-20 13:00:00','2024-07-05 17:00:00',3,10,NULL,NULL,'phone'),(55,'2024-08-20 14:00:00','Nutrition Consultation','Completed','Over-the-Phone',1,4,'2024-08-05 10:00:00','2024-08-20 15:00:00',4,11,NULL,NULL,'phone'),(56,'2024-09-10 11:30:00','Mental Health Counseling','Completed','Telemedicine (Video)',2,5,'2024-08-25 12:00:00','2024-09-10 12:30:00',5,12,NULL,NULL,'phone'),(57,'2024-10-15 09:00:00','Cardiology Consultation','Completed','In-Person',3,6,'2024-09-30 11:00:00','2024-10-15 10:30:00',6,13,NULL,NULL,'phone'),(58,'2024-11-05 10:00:00','Pediatrics Consultation','Completed','In-Person',4,7,'2024-10-20 13:00:00','2024-11-05 11:00:00',7,14,NULL,NULL,'phone'),(59,'2024-11-18 14:00:00','Dermatology Treatment','Scheduled','In-Person',5,8,'2024-11-01 10:00:00','2024-11-01 10:00:00',8,15,NULL,NULL,'phone'),(60,'2024-11-19 15:00:00','Gynecology Checkup','Completed','In-Person',6,2,'2024-11-05 11:00:00','2024-11-19 22:58:18',9,18,23,NULL,'phone'),(61,'2024-01-15 09:00:00','Annual Checkup','Completed','In-Person',1,1,'2024-01-01 10:00:00','2024-01-15 11:00:00',1,1,NULL,NULL,'phone'),(62,'2024-02-10 10:30:00','Blood Pressure Check','Completed','Over-the-Phone',2,2,'2024-01-25 09:00:00','2024-02-10 11:30:00',2,2,NULL,NULL,'phone'),(63,'2024-03-05 14:00:00','MRI Scan','Completed','In-Person',3,3,'2024-02-20 11:00:00','2024-03-05 16:00:00',3,3,NULL,NULL,'phone'),(64,'2024-04-12 16:30:00','Physical Therapy','Completed','In-Person',4,4,'2024-03-28 13:00:00','2024-04-12 17:30:00',4,4,NULL,NULL,'phone'),(65,'2024-05-20 11:00:00','Flu Vaccination','Completed','In-Person',5,5,'2024-05-05 10:00:00','2024-05-20 12:00:00',5,5,NULL,NULL,'phone'),(66,'2024-06-18 13:00:00','Ultrasound Check','Completed','In-Person',6,6,'2024-06-01 09:00:00','2024-06-18 14:30:00',6,6,NULL,NULL,'phone'),(67,'2024-07-10 15:00:00','X-Ray for Wrist','Completed','In-Person',7,7,'2024-06-25 11:00:00','2024-07-10 16:00:00',7,7,NULL,NULL,'phone'),(68,'2024-08-15 10:30:00','Dental Cleaning','Completed','In-Person',8,8,'2024-08-01 12:00:00','2024-08-15 11:30:00',8,8,NULL,NULL,'phone'),(69,'2024-09-05 16:00:00','Eye Examination','Completed','In-Person',9,9,'2024-08-20 13:00:00','2024-09-05 17:00:00',9,9,NULL,NULL,'phone'),(70,'2024-10-20 14:00:00','Chiropractic Adjustment','Completed','In-Person',10,10,'2024-10-05 10:00:00','2024-10-20 15:00:00',10,10,NULL,NULL,'phone'),(71,'2024-11-15 09:00:00','Nutrition Consultation','Completed','Over-the-Phone',1,1,'2024-11-01 09:00:00','2024-11-15 10:00:00',1,11,NULL,NULL,'phone'),(72,'2024-12-10 11:30:00','Mental Health Session','Completed','Telemedicine (Video)',2,2,'2024-11-25 10:00:00','2024-12-10 12:30:00',2,12,NULL,NULL,'phone'),(73,'2024-12-20 09:00:00','Cardiology Checkup','Completed','In-Person',3,3,'2024-12-05 11:00:00','2024-12-20 10:30:00',3,13,NULL,NULL,'phone'),(74,'2024-12-28 10:00:00','Dermatology Appointment','Completed','In-Person',4,4,'2024-12-10 13:00:00','2024-12-28 11:00:00',4,15,NULL,NULL,'phone'),(75,'2024-12-31 14:00:00','Prenatal Checkup','Completed','In-Person',5,5,'2024-12-15 10:00:00','2024-12-31 15:30:00',5,19,NULL,NULL,'phone'),(82,'2024-11-20 16:30:00','help me','Requested','Over-the-Phone',17,4,'2024-11-19 22:47:33','2024-11-19 22:47:33',4,4,NULL,NULL,'phone'),(83,'2024-11-20 10:00:00','help me','Requested','Telemedicine (Video)',17,6,'2024-11-19 22:49:29','2024-11-19 22:49:29',6,1,NULL,NULL,'phone'),(84,'2024-11-19 17:30:00','Dying need help','Cancelled','Home Visit',17,2,'2024-11-19 23:16:10','2024-11-20 01:01:35',2,1,NULL,NULL,'phone'),(85,'2024-11-28 16:00:00','help','Requested','Over-the-Phone',17,6,'2024-11-19 23:29:43','2024-11-19 23:29:43',6,1,NULL,NULL,'phone'),(86,'2024-11-20 17:30:00','9:30','Cancelled','Over-the-Phone',1,2,'2024-11-19 23:32:57','2024-11-20 00:52:28',6,2,NULL,NULL,'phone'),(87,'2024-11-20 08:30:00','help me 11:30','Requested','In-Person',20,6,'2024-11-19 23:34:22','2024-11-20 00:18:14',6,1,NULL,NULL,'phone'),(88,'2024-11-20 21:30:00','Received blunt trauma.','Completed','In-Person',20,2,'2024-11-19 23:35:22','2024-11-20 00:56:09',2,3,24,NULL,'phone'),(89,'2024-11-20 18:30:00','help me','Cancelled','In-Person',20,2,'2024-11-20 00:49:17','2024-11-20 01:01:35',2,1,NULL,NULL,'phone'),(90,'2025-03-28 21:00:00','hey hot stuff','Requested','Home Visit',20,5,'2024-11-23 01:35:12','2024-11-23 01:35:12',5,1,NULL,NULL,'phone'),(91,'2024-12-03 16:00:00','oijwof','Requested','Telemedicine (Video)',2,6,'2024-12-02 09:13:55','2024-12-02 09:13:55',6,6,NULL,NULL,'phone'),(92,'2024-12-03 15:00:00','i sick','Requested','Telemedicine (Video)',34,6,'2024-12-02 09:23:29','2024-12-02 09:23:29',6,1,NULL,NULL,'phone');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`medclinic_db_admin`@`%`*/ /*!50003 TRIGGER `appointment_status_email_update` AFTER UPDATE ON `appointment` FOR EACH ROW BEGIN
    -- Check appointments where status 'Requested' to 'Scheduled'
    IF OLD.status = 'Requested' AND NEW.status = 'Scheduled' THEN
        INSERT INTO email_queue (appointmentID, patientID, doctorID, emailType)
        VALUES (NEW.appointmentID, NEW.patientID, NEW.doctorID, 'Confirmation');
    -- Check appointments where status 'Scheduled' to 'Cancelled'
    ELSEIF OLD.status = 'Scheduled' AND NEW.status = 'Cancelled' THEN
        INSERT INTO email_queue (appointmentID, patientID, doctorID, emailType)
        VALUES (NEW.appointmentID, NEW.patientID, NEW.doctorID, 'Cancellation');
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `approval`
--

DROP TABLE IF EXISTS `approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval` (
  `approvalID` int unsigned NOT NULL AUTO_INCREMENT,
  `approvalDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Approved','Pending','Rejected') NOT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`approvalID`),
  KEY `fk_approval_doctor` (`doctorID`),
  KEY `fk_approval_patient` (`patientID`),
  CONSTRAINT `fk_approval_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_approval_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval`
--

LOCK TABLES `approval` WRITE;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
INSERT INTO `approval` VALUES (1,'2024-11-17 19:41:04','Approved',1,1),(2,'2024-11-17 19:41:04','Pending',2,2),(3,'2024-11-17 19:41:04','Rejected',3,3),(4,'2024-11-17 19:41:04','Approved',4,4),(5,'2024-11-17 19:41:04','Pending',5,5),(6,'2024-11-18 00:18:50','Approved',6,6),(7,'2024-11-18 00:18:50','Pending',7,7),(8,'2024-11-18 00:18:50','Rejected',8,8),(9,'2024-11-18 00:18:50','Approved',9,9),(10,'2024-11-18 00:18:50','Pending',10,10),(11,'2024-11-18 00:23:24','Approved',6,6),(12,'2024-11-18 00:23:24','Pending',7,7),(13,'2024-11-18 00:23:24','Rejected',8,8),(14,'2024-11-18 00:23:24','Approved',9,9),(15,'2024-11-18 00:23:24','Pending',10,10),(16,'2024-11-18 04:27:00','Pending',1,2),(17,'2024-11-18 04:45:08','Pending',1,4);
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `billID` int unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `dateIssued` datetime DEFAULT CURRENT_TIMESTAMP,
  `dueDate` date NOT NULL,
  `paidAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paidStatus` enum('Paid','Partially Paid','Pending','Overdue') NOT NULL DEFAULT 'Pending',
  `patientID` int unsigned NOT NULL,
  `appointmentID` int unsigned NOT NULL,
  `insuranceID` int unsigned DEFAULT NULL,
  `insuranceCoveredAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `officeID` int unsigned DEFAULT NULL,
  `serviceID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`billID`),
  KEY `fk_bill_appointment` (`appointmentID`),
  KEY `fk_bill_patient` (`patientID`),
  KEY `fk_bill_service` (`serviceID`),
  KEY `fk_officeID` (`officeID`),
  KEY `insuranceID` (`insuranceID`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`insuranceID`) REFERENCES `insurance` (`insuranceID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_bill_appointment` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`appointmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bill_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bill_service` FOREIGN KEY (`serviceID`) REFERENCES `service` (`serviceID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_officeID` FOREIGN KEY (`officeID`) REFERENCES `office` (`officeID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,250.00,'2024-11-17 19:41:05','2024-12-31',200.00,'Paid',1,1,1,200.00,1,1),(2,350.00,'2024-11-17 19:41:05','2024-12-15',150.00,'Partially Paid',2,2,2,150.00,2,2),(3,1200.00,'2024-11-17 19:41:05','2024-12-20',0.00,'Pending',3,3,3,0.00,3,3),(4,100.00,'2024-11-17 19:41:05','2024-12-25',100.00,'Paid',4,4,4,100.00,4,4),(5,75.00,'2024-11-17 19:41:05','2024-12-10',75.00,'Paid',5,5,5,75.00,5,5),(6,250.00,'2024-11-18 00:18:50','2024-12-31',250.00,'Paid',6,6,6,250.00,6,1),(7,400.00,'2024-11-18 00:18:50','2024-12-20',200.00,'Partially Paid',7,7,7,200.00,7,2),(8,1500.00,'2024-11-18 00:18:50','2024-12-25',0.00,'Pending',8,8,8,0.00,8,3),(9,120.00,'2024-11-18 00:18:50','2024-12-30',120.00,'Paid',9,9,9,120.00,9,4),(10,90.00,'2024-11-18 00:18:50','2024-12-15',90.00,'Paid',10,10,10,90.00,10,5),(11,300.00,'2024-11-18 00:23:29','2024-12-31',300.00,'Paid',6,6,6,300.00,11,1),(12,450.00,'2024-11-18 00:23:29','2024-12-20',225.00,'Partially Paid',7,7,7,225.00,12,2),(13,1800.00,'2024-11-18 00:23:29','2024-12-25',0.00,'Pending',8,8,8,0.00,13,3),(14,140.00,'2024-11-18 00:23:29','2024-12-30',140.00,'Paid',9,9,9,140.00,14,4),(15,100.00,'2024-11-18 00:23:29','2024-12-15',100.00,'Paid',10,10,10,100.00,15,5),(16,2550.00,'2024-11-18 13:44:43','2025-11-18',100.00,'Partially Paid',1,10,1,0.00,4,4),(17,650.00,'2024-11-18 20:54:09','2024-12-18',650.00,'Paid',17,20,NULL,0.00,1,1),(18,250.00,'2024-11-18 20:59:39','2024-12-18',250.00,'Paid',17,23,NULL,0.00,1,1),(19,1200.00,'2024-11-18 21:12:43','2024-12-18',1200.00,'Paid',17,24,NULL,0.00,1,1),(20,150.00,'2024-11-18 21:43:01','2024-12-18',150.00,'Paid',17,25,NULL,0.00,1,1),(21,150.00,'2024-11-18 21:45:49','2024-12-18',0.00,'Pending',17,26,NULL,0.00,1,1),(22,200.00,'2024-11-18 21:48:52','2024-12-18',0.00,'Pending',17,27,NULL,0.00,1,1),(23,150.00,'2024-11-19 00:22:06','2024-12-19',0.00,'Pending',1,28,1,0.00,1,1),(24,7150.00,'2024-11-19 04:49:54','2024-12-19',7150.00,'Paid',17,32,NULL,0.00,6,1),(25,5150.00,'2024-11-19 05:19:18','2024-12-19',5150.00,'Paid',17,33,NULL,0.00,6,1),(26,10200.00,'2024-11-19 06:12:58','2024-12-19',10200.00,'Paid',17,37,NULL,0.00,6,1),(27,1650.00,'2024-11-19 06:45:05','2024-12-19',0.00,'Pending',17,38,NULL,0.00,6,1),(28,150.00,'2023-12-05 00:00:00','2024-01-04',150.00,'Paid',2,46,NULL,0.00,5,1),(29,50.00,'2023-12-15 00:00:00','2024-01-14',25.00,'Partially Paid',3,47,NULL,0.00,6,2),(30,1200.00,'2024-01-10 00:00:00','2024-02-09',0.00,'Pending',4,48,NULL,0.00,7,3),(31,100.00,'2024-02-05 00:00:00','2024-03-06',100.00,'Paid',5,49,NULL,0.00,8,4),(32,75.00,'2024-03-15 00:00:00','2024-04-14',0.00,'Overdue',6,50,NULL,0.00,9,5),(33,200.00,'2024-04-20 00:00:00','2024-05-20',100.00,'Partially Paid',7,51,NULL,0.00,10,6),(34,80.00,'2024-05-15 00:00:00','2024-06-14',80.00,'Paid',8,52,NULL,0.00,1,8),(35,120.00,'2024-06-10 00:00:00','2024-07-10',0.00,'Pending',9,53,NULL,0.00,2,9),(36,90.00,'2024-07-05 00:00:00','2024-08-04',90.00,'Paid',10,54,NULL,0.00,3,10),(37,100.00,'2024-08-20 00:00:00','2024-09-19',100.00,'Paid',1,55,NULL,0.00,4,11),(38,150.00,'2024-09-10 00:00:00','2024-10-10',0.00,'Overdue',2,56,NULL,0.00,5,12),(39,180.00,'2024-10-15 00:00:00','2024-11-14',180.00,'Paid',3,57,NULL,0.00,6,13),(40,140.00,'2024-11-05 00:00:00','2024-12-05',0.00,'Pending',4,58,NULL,0.00,7,14),(41,160.00,'2024-11-18 00:00:00','2024-12-18',0.00,'Pending',5,59,NULL,0.00,8,15),(42,1575.00,'2024-11-19 00:00:00','2024-12-19',0.00,'Pending',6,60,NULL,0.00,9,18),(48,2700.00,'2024-11-20 00:56:04','2024-12-20',0.00,'Pending',20,88,NULL,0.00,2,3);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_additional_charge`
--

DROP TABLE IF EXISTS `bill_additional_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_additional_charge` (
  `billAdditionalChargeID` int unsigned NOT NULL AUTO_INCREMENT,
  `billID` int unsigned NOT NULL,
  `additionalChargeTypeID` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`billAdditionalChargeID`),
  KEY `additionalChargeTypeID` (`additionalChargeTypeID`),
  KEY `billID` (`billID`),
  CONSTRAINT `bill_additional_charge_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `bill` (`billID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bill_additional_charge_ibfk_2` FOREIGN KEY (`additionalChargeTypeID`) REFERENCES `additional_charge_type` (`additionalChargeTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_additional_charge`
--

LOCK TABLES `bill_additional_charge` WRITE;
/*!40000 ALTER TABLE `bill_additional_charge` DISABLE KEYS */;
INSERT INTO `bill_additional_charge` VALUES (2,2,2,1,75.00),(3,3,3,2,200.00),(4,4,4,1,150.00),(5,5,5,1,200.00),(6,6,1,1,50.00),(7,7,2,1,75.00),(8,8,3,3,300.00),(9,9,4,1,150.00),(10,10,5,2,400.00),(11,6,6,1,100.00),(12,7,7,1,120.00),(13,8,8,1,180.00),(14,9,9,1,90.00),(15,10,10,1,300.00),(16,1,1,1,50.00),(17,19,1,1,50.00),(18,22,1,1,50.00),(19,26,1,1,50.00),(20,29,1,1,5.00),(21,33,2,1,10.00),(22,38,3,1,15.00);
/*!40000 ALTER TABLE `bill_additional_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_charge`
--

DROP TABLE IF EXISTS `custom_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_charge` (
  `customChargeID` int unsigned NOT NULL AUTO_INCREMENT,
  `billID` int unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customChargeID`),
  KEY `billID` (`billID`),
  CONSTRAINT `custom_charge_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `bill` (`billID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_charge`
--

LOCK TABLES `custom_charge` WRITE;
/*!40000 ALTER TABLE `custom_charge` DISABLE KEYS */;
INSERT INTO `custom_charge` VALUES (2,2,'Extended consultation time',50.00),(3,3,'Use of MRI machine',1200.00),(4,4,'Home visit travel fee',75.00),(5,5,'Additional vaccine dose',25.00),(6,6,'Speech therapy materials',100.00),(7,7,'Additional consultation time',75.00),(8,8,'Extended MRI usage',2400.00),(9,9,'Home visit travel expenses',150.00),(10,10,'Dermatology special treatment',200.00),(11,6,'Oncology lab tests',150.00),(12,7,'Extended endocrinology consultation',120.00),(13,8,'Home care visit equipment',180.00),(14,9,'Specialist referral fee',90.00),(15,10,'Advanced MRI scan',300.00),(16,1,'Medication Fee',50.00),(17,17,'Added medication',500.00),(18,18,'GGS',100.00),(19,19,'Refill Prescription',1000.00),(20,24,'Extra Medication',1000.00),(21,24,'After hours',1500.00),(22,24,'Equipment charge',4500.00),(23,25,'Refill Medication',5000.00),(24,26,'Ugly',10000.00),(25,27,'Refill',1500.00),(26,29,'Extended consultation time',20.00),(27,33,'Use of specialized equipment',50.00),(28,38,'Missed appointment fee',25.00),(29,42,'New medication',1500.00),(30,48,'Head ggjr',1500.00);
/*!40000 ALTER TABLE `custom_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disability`
--

DROP TABLE IF EXISTS `disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disability` (
  `disabilityID` int unsigned NOT NULL AUTO_INCREMENT,
  `disabilityType` varchar(50) NOT NULL,
  `notes` text,
  `patientID` int unsigned NOT NULL,
  PRIMARY KEY (`disabilityID`),
  KEY `fk_disability_patient` (`patientID`),
  CONSTRAINT `fk_disability_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability`
--

LOCK TABLES `disability` WRITE;
/*!40000 ALTER TABLE `disability` DISABLE KEYS */;
INSERT INTO `disability` VALUES (1,'Visual Impairment','Requires special lighting',1),(2,'Hearing Impairment','Uses hearing aids',2),(3,'Mobility Impairment','Uses a wheelchair',3),(4,'Cognitive Impairment','Requires assistance with daily tasks',4),(5,'None',NULL,5),(6,'Speech Impairment','Requires speech therapy',6),(7,'Mobility Impairment','Uses crutches',7),(8,'Visual Impairment','Requires glasses',8),(9,'Hearing Impairment','Uses hearing aids',9),(10,'None',NULL,10),(11,'Mobility Impairment','Uses a walker for mobility',6),(12,'Visual Impairment','Requires contact lenses',7),(13,'Hearing Impairment','Uses cochlear implants',8),(14,'Cognitive Impairment','Requires cognitive therapy',9),(15,'None',NULL,10),(16,'Blind in right eye','Requires glasses.',1),(17,'Broken Leg','Brokel leg skating',17),(18,'Legally Blind','Cant see from the right eye.',17),(19,'Blind in the right eye.','Caused by blunt trauma.',20);
/*!40000 ALTER TABLE `disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorID` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other','Prefer not to say') NOT NULL,
  `dateOfBirth` date NOT NULL,
  `workPhoneNumber` varchar(15) NOT NULL,
  `workEmail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `personalPhoneNumber` varchar(15) DEFAULT NULL,
  `personalEmail` varchar(100) DEFAULT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(100) NOT NULL,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `officeID` int unsigned DEFAULT NULL,
  `addressID` int unsigned DEFAULT NULL,
  `specialtyID` int unsigned DEFAULT NULL,
  `Inactive` tinyint(1) NOT NULL DEFAULT '0',
  `isSpecialist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctorID`),
  UNIQUE KEY `workEmail` (`workEmail`),
  KEY `fk_doctor_address` (`addressID`),
  KEY `fk_doctor_office` (`officeID`),
  KEY `fk_doctor_specialty` (`specialtyID`),
  CONSTRAINT `fk_doctor_address` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_doctor_office` FOREIGN KEY (`officeID`) REFERENCES `office` (`officeID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_doctor_specialty` FOREIGN KEY (`specialtyID`) REFERENCES `specialty` (`specialtyID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Emily','Taylor','Female','1975-06-10','2125556667','emily.taylor@clinic.com','hashedpassword11',NULL,NULL,NULL,'admin1','2024-11-17 19:41:04','admin1','2024-11-19 06:17:26',1,1,1,1,0),(2,'Michael','Anderson','Male','1980-07-20','3105557778','michael.anderson@health.com','123',NULL,NULL,NULL,'admin2','2024-11-17 19:41:04','admin2','2024-11-20 01:01:35',2,2,2,1,1),(3,'Sarah','Thomas','Female','1985-08-30','3125558889','sarah.thomas@medical.com','hashedpassword13',NULL,NULL,NULL,'admin3','2024-11-17 19:41:04','admin3','2024-11-19 05:30:46',3,3,3,1,0),(4,'David','Jackson','Male','1970-09-15','7135559990','david.jackson@clinic.com','hashedpassword14',NULL,NULL,NULL,'admin4','2024-11-17 19:41:04','admin4','2024-11-18 06:26:36',4,4,4,0,1),(5,'Laura','White','Female','1990-10-25','6025550001','laura.white@office.com','hashedpassword15',NULL,NULL,NULL,'admin5','2024-11-17 19:41:04','admin5','2024-11-18 06:26:36',5,5,5,0,1),(6,'Olivia','Green','Female','1978-05-22','2125556668','olivia.green@clinic.com','1234',NULL,NULL,NULL,'admin6','2024-11-18 00:18:50','admin6','2024-11-19 06:24:31',6,6,1,0,1),(7,'William','Hall','Male','1983-09-14','3105557779','william.hall@health.com','hashedpassword27',NULL,NULL,NULL,'admin7','2024-11-18 00:18:50','admin7','2024-11-18 06:26:36',7,7,2,0,0),(8,'Mia','Young','Female','1991-02-28','3125558890','mia.young@medical.com','hashedpassword28',NULL,NULL,NULL,'admin8','2024-11-18 00:18:50','admin8','2024-11-19 06:49:57',8,8,3,1,0),(9,'Benjamin','King','Male','1979-11-11','7135554456','benjamin.king@clinic.com','hashedpassword29',NULL,NULL,NULL,'admin9','2024-11-18 00:18:50','admin9','2024-11-18 06:26:36',9,9,4,0,0),(10,'Charlotte','Wright','Female','1987-07-07','6025550011','charlotte.wright@office.com','hashedpassword30',NULL,NULL,NULL,'admin10','2024-11-18 00:18:50','admin10','2024-11-18 06:26:36',10,10,5,0,0),(11,'Ethan','Evans','Male','1976-05-20','7185556667','ethan.evans@clinic.com','hashedpassword31',NULL,NULL,NULL,'admin11','2024-11-18 00:21:34','admin11','2024-11-18 06:26:36',11,11,6,0,0),(12,'Sophia','Foster','Female','1982-08-15','3105557778','sophia.foster@health.com','hashedpassword32',NULL,NULL,NULL,'admin12','2024-11-18 00:21:34','admin12','2024-11-18 06:26:35',12,12,7,0,0),(13,'Liam','Garcia','Male','1987-02-25','3125558889','liam.garcia@medical.com','hashedpassword33',NULL,NULL,NULL,'admin13','2024-11-18 00:21:34','admin13','2024-11-18 06:26:36',13,13,8,0,0),(14,'Isabella','Hughes','Female','1990-12-10','7135559990','isabella.hughes@clinic.com','hashedpassword34',NULL,NULL,NULL,'admin14','2024-11-18 00:21:34','admin14','2024-11-18 06:26:36',14,14,9,0,0),(15,'Mason','Irwin','Male','1984-06-18','6025550001','mason.irwin@office.com','hashedpassword35',NULL,NULL,NULL,'admin15','2024-11-18 00:21:34','admin15','2024-11-18 06:26:36',15,15,10,0,0),(21,'Eraj','Anwar','Male','2000-11-17','4156718911','imsuperepic@gmail.com','123','2024-11-18 20:14:12','8324623337','anwaraeraj@gmail.com','user','2024-11-18 20:14:12','user','2024-11-18 20:14:12',14,28,9,0,0);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`medclinic_db_admin`@`%`*/ /*!50003 TRIGGER `doctor_inactivation_update` AFTER UPDATE ON `doctor` FOR EACH ROW BEGIN
    -- Check if the Inactive column changed from 0 to 1
    IF OLD.Inactive = 0 AND NEW.Inactive = 1 THEN
        -- Update related appointments with specific rules
        UPDATE appointment
        SET status =
            CASE
                -- Update appointments where status is 'Scheduled' to 'Cancelled'
                WHEN status = 'Scheduled' THEN 'Cancelled'
                -- Update appointments where status is 'Requested' to 'Request Denied'
                WHEN status = 'Requested' THEN 'Request Denied'
                ELSE status -- Leave other statuses unchanged
            END
        WHERE doctorID = NEW.doctorID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `email_queue`
--

DROP TABLE IF EXISTS `email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_queue` (
  `queueID` int unsigned NOT NULL AUTO_INCREMENT,
  `appointmentID` int unsigned NOT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned NOT NULL,
  `emailType` enum('Confirmation','Cancellation') NOT NULL,
  `status` enum('Pending','Sent','Failed') NOT NULL DEFAULT 'Pending',
  `sentAt` datetime DEFAULT NULL,
  PRIMARY KEY (`queueID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_queue`
--

LOCK TABLES `email_queue` WRITE;
/*!40000 ALTER TABLE `email_queue` DISABLE KEYS */;
INSERT INTO `email_queue` VALUES (1,1,1,1,'Cancellation','Sent','2024-11-18 16:46:36'),(2,2,2,2,'Cancellation','Sent','2024-11-18 16:46:37'),(3,6,6,6,'Cancellation','Sent','2024-11-18 16:46:37'),(4,11,6,6,'Cancellation','Sent','2024-11-18 16:46:38'),(5,20,17,1,'Confirmation','Sent','2024-11-18 21:39:28'),(6,23,17,1,'Confirmation','Sent','2024-11-18 21:39:28'),(7,24,17,1,'Confirmation','Sent','2024-11-18 21:39:29'),(8,25,17,1,'Confirmation','Sent','2024-11-18 22:39:28'),(9,26,17,1,'Confirmation','Sent','2024-11-18 22:39:28'),(10,27,17,1,'Confirmation','Sent','2024-11-18 22:39:29'),(11,28,1,1,'Confirmation','Sent','2024-11-19 00:39:28'),(12,32,17,6,'Confirmation','Sent','2024-11-19 04:44:11'),(13,33,17,6,'Confirmation','Sent','2024-11-19 05:44:11'),(14,34,17,6,'Confirmation','Sent','2024-11-19 05:44:12'),(15,34,17,6,'Cancellation','Sent','2024-11-19 05:44:13'),(16,35,17,1,'Confirmation','Sent','2024-11-19 05:44:13'),(17,37,17,6,'Confirmation','Sent','2024-11-19 06:44:11'),(18,36,17,6,'Confirmation','Sent','2024-11-19 06:44:12'),(19,38,17,6,'Confirmation','Sent','2024-11-19 06:44:12'),(20,38,17,6,'Cancellation','Sent','2024-11-19 06:44:13'),(21,35,17,1,'Cancellation','Sent','2024-11-19 06:44:14'),(22,40,17,6,'Confirmation','Sent','2024-11-19 06:44:14'),(23,40,17,6,'Cancellation','Sent','2024-11-19 06:44:15'),(24,42,17,6,'Confirmation','Sent','2024-11-19 19:44:11'),(25,41,17,6,'Confirmation','Sent','2024-11-19 19:44:12'),(26,43,17,6,'Confirmation','Sent','2024-11-19 19:44:13'),(27,47,17,6,'Confirmation','Sent','2024-11-19 21:44:11'),(28,46,17,6,'Confirmation','Sent','2024-11-19 21:44:12'),(29,36,17,6,'Cancellation','Sent','2024-11-19 22:44:11'),(30,39,17,6,'Cancellation','Sent','2024-11-19 22:44:12'),(31,73,6,6,'Cancellation','Failed',NULL),(32,21,17,2,'Confirmation','Sent','2024-11-19 22:44:13'),(33,81,17,2,'Confirmation','Failed',NULL),(34,86,20,6,'Confirmation','Sent','2024-11-19 23:35:05'),(35,86,20,6,'Cancellation','Sent','2024-11-19 23:35:25'),(36,88,20,2,'Confirmation','Sent','2024-11-19 23:36:49'),(37,84,17,2,'Confirmation','Sent','2024-11-19 23:39:29'),(38,89,20,2,'Confirmation','Sent','2024-11-20 00:51:35'),(39,86,1,2,'Cancellation','Sent','2024-11-20 00:52:30'),(40,21,17,2,'Cancellation','Sent','2024-11-20 01:01:37'),(41,84,17,2,'Cancellation','Sent','2024-11-20 01:01:38'),(42,89,20,2,'Cancellation','Sent','2024-11-20 01:01:39'),(43,7,7,7,'Cancellation','Sent','2024-12-02 09:11:42'),(44,12,7,7,'Cancellation','Sent','2024-12-02 09:11:58');
/*!40000 ALTER TABLE `email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contact` (
  `emergencyContactID` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `emergencyPhoneNumber` varchar(15) NOT NULL,
  `emergencyEmail` varchar(100) DEFAULT NULL,
  `patientID` int unsigned NOT NULL,
  PRIMARY KEY (`emergencyContactID`),
  KEY `fk_emergency_contact_patient` (`patientID`),
  CONSTRAINT `fk_emergency_contact_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
INSERT INTO `emergency_contact` VALUES (1,'Mary','Doe','Spouse','2125551112','mary.doe@emergency.com',1),(2,'Robert','Smith','Father','3105552223','robert.smith@emergency.com',2),(3,'Linda','Jones','Sister','3125553334','linda.jones@emergency.com',3),(4,'James','Williams','Friend','7135554445','james.williams@emergency.com',4),(5,'Patricia','Brown','Mother','6025555556','patricia.brown@emergency.com',5),(6,'Grace','Davis','Mother','2125551114','grace.davis@emergency.com',6),(7,'Henry','Lopez','Father','3105552225','henry.lopez@emergency.com',7),(8,'Ella','Gonzalez','Sister','3125553336','ella.gonzalez@emergency.com',8),(9,'Jack','Perez','Brother','7135554447','jack.perez@emergency.com',9),(10,'Lily','Taylor','Friend','6025555558','lily.taylor@emergency.com',10),(11,'Ella','Johnson','Mother','7185551115','ella.johnson@emergency.com',6),(12,'Lucas','King','Father','3105552226','lucas.king@emergency.com',7),(13,'Mia','Lewis','Sister','3125553337','mia.lewis@emergency.com',8),(14,'Ethan','Martinez','Brother','7135554448','ethan.martinez@emergency.com',9),(15,'Sofia','Nelson','Friend','6025555559','sofia.nelson@emergency.com',10),(16,'Bob','Zob','Friend','4511234455','BobZob@gmail.com',16),(17,'Denisse','Tovar','Girlfriend','8324675678','1234@gmail.com',17),(18,'Bob','Mclovin','Spouse','4519999999','Mclovin99@gmail.com',18),(19,'Eraj','Anwar','Father','4516611234','anwaraeraj@gmail.com',19),(20,'Baba','Booey','Father','9029309301','Bababooey@gmail.com',20),(21,'123214y','sdfasd','father','4151231515','3121@gmail.com',21),(22,'wfj[wda','sadfpas\'','pdsjaf;','1231238931','jkofoajds@gmail.com',22),(23,'Eric','Rime','Brother','3094032908','e.rime@gmail.com',23),(24,'Emmy','Lee','Sister','2398409098','e.lee@gmail.com',24),(25,'Sammi','Fonci','Wife','3843743949','s.fonci@gmail.com',25),(26,'Linda','Conrad','Wife','3284093400','l.conrad@gmail.com',26),(27,'Jason','Blahno','Brother','2840394000','j.blano@gmail.com',27),(28,'Max','Doodle','Brother','2983293029','m.doodle@gmail.com',28),(29,'Hugh','Lamon','Father','3849394703','h.lamon@gmail.com',29),(30,'joadijsfa','asdfa','fwefsda','2412412451','anwaraeraj@gmail.com',30),(31,'Eraj','Anwar','sadasda','8324623337','adfsaffads@gmail.com',31),(32,'Tyler','One','Uncle','8758768686','t.one@gmail.com',32),(33,'sdasdas','adada','Mother','4145266245','asdas@gmail.com',33),(34,'mom','mom','mom','1234567890','email@email.com',34);
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_history`
--

DROP TABLE IF EXISTS `family_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_history` (
  `familyHistoryID` int unsigned NOT NULL AUTO_INCREMENT,
  `condition` varchar(100) NOT NULL,
  `notes` text,
  `patientID` int unsigned NOT NULL,
  PRIMARY KEY (`familyHistoryID`),
  KEY `fk_family_history_patient` (`patientID`),
  CONSTRAINT `fk_family_history_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_history`
--

LOCK TABLES `family_history` WRITE;
/*!40000 ALTER TABLE `family_history` DISABLE KEYS */;
INSERT INTO `family_history` VALUES (1,'Hypertension','Grandfather had hypertension',1),(2,'Diabetes','Mother has type 2 diabetes',2),(3,'Asthma','Father has asthma',3),(4,'Heart Disease','Uncle diagnosed with heart disease',4),(5,'Cancer','No known family history',5),(6,'Asthma','Uncle has asthma',6),(7,'High Cholesterol','Grandmother has high cholesterol',7),(8,'Depression','Mother diagnosed with depression',8),(9,'Arthritis','Father has arthritis',9),(10,'None','No known family history',10),(11,'Breast Cancer','Mother diagnosed with breast cancer',6),(12,'Hypertension','Father has hypertension',7),(13,'Anxiety','Uncle diagnosed with anxiety',8),(14,'Diabetes','Grandfather has type 2 diabetes',9),(15,'None','No known family history',10),(16,'Diabetes','Dad has diabetes.',1),(17,'Diabetes Type II','Dad has diabetes type II.',17);
/*!40000 ALTER TABLE `family_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `insuranceID` int unsigned NOT NULL AUTO_INCREMENT,
  `providerName` varchar(50) NOT NULL,
  `policy_number` varchar(50) NOT NULL,
  `coverageDetails` varchar(250) DEFAULT NULL,
  `coverage_expiration_date` date DEFAULT NULL,
  `patientID` int unsigned NOT NULL,
  PRIMARY KEY (`insuranceID`),
  UNIQUE KEY `policy_number` (`policy_number`),
  KEY `fk_insurance_patient` (`patientID`),
  CONSTRAINT `fk_insurance_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'HealthCare Inc.','HC123456','Full coverage including surgeries','2025-12-31',1),(2,'MediPlus','MP654344','Partial coverage for consultations and medications','2024-06-30',2),(3,'Wellness Insurance','WI112233','Coverage for preventive care and emergency visits','2026-03-15',3),(4,'SecureLife','SL445566','Comprehensive coverage including dental and vision','2025-09-20',4),(5,'PrimeHealth','PH778899','Basic coverage with optional add-ons','2024-11-30',5),(6,'HealthCare Plus','HC123458','Extended coverage including mental health services','2026-01-31',6),(7,'MediAdvance','MP654323','Coverage for emergency services and prescriptions','2025-07-30',7),(8,'WellnessCare','WI112235','Full coverage for preventive and specialist care','2027-04-15',8),(9,'SecureLife Pro','SL445568','Premium coverage with additional dental and vision','2026-10-20',9),(10,'PrimeHealth Elite','PH778901','Comprehensive coverage with all optional add-ons','2025-12-30',10),(11,'HealthCare Elite','HC123459','Comprehensive coverage with premium benefits','2026-06-30',6),(12,'MediPlus Pro','MP654324','Extended coverage for specialized treatments','2025-08-31',7),(13,'Wellness Insurance Plus','WI112236','Full coverage including mental health services','2027-05-15',8),(14,'SecureLife Premium','SL445569','Premium coverage with additional wellness programs','2026-12-20',9),(15,'PrimeHealth Ultimate','PH778902','Ultimate coverage with all possible add-ons','2025-12-31',10),(16,'Blue Cross Blue Shield','2398HF828245','HMO','2025-03-21',15),(19,'Blue Cross Blue Shield','iufee893284','HMO','2024-11-29',19),(21,'Blue Cross Blue Shield','weoithwiegh','HMO','2024-11-28',21),(22,'Blue Cross Blue Shield','iusefgw4798u','HMO','2024-11-22',22),(23,'Blue Cross Blue Shield','ODAS75968600','HMO','2025-01-01',23),(24,'Anthem','986HG7696102','PPO','2024-11-30',24),(25,'UnitedHealthcare','GGI210340493','POS','2025-01-01',25),(27,'Cigna','KJH380403903','HMO','2025-01-01',26),(28,'Blue Cross Blue Shield','JHG928398249','PPO','2025-01-01',27),(29,'Blue Cross Blue Shield','JDH692227309','PPO','2025-01-01',28),(30,'Humana','KJDHU8340974','HMO','2025-10-01',29),(31,'Blue Cross Blue Shield','8liisghoihw4','HMO','0001-01-01',31),(32,'Blue Cross Blue Shield','GKJ702938094','PPO','2025-01-01',32),(33,'Blue Cross Blue Shield','KGj834086304','PPO','2025-01-01',33);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_approval`
--

DROP TABLE IF EXISTS `insurance_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_approval` (
  `approvalID` int unsigned NOT NULL AUTO_INCREMENT,
  `insuranceID` int unsigned NOT NULL,
  `prescriptionID` int unsigned NOT NULL,
  `approvalStatus` enum('Pending','Approved','Denied') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`approvalID`),
  KEY `insuranceID` (`insuranceID`),
  KEY `prescriptionID` (`prescriptionID`),
  CONSTRAINT `insurance_approval_ibfk_1` FOREIGN KEY (`insuranceID`) REFERENCES `insurance` (`insuranceID`) ON UPDATE CASCADE,
  CONSTRAINT `insurance_approval_ibfk_2` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription` (`prescriptionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_approval`
--

LOCK TABLES `insurance_approval` WRITE;
/*!40000 ALTER TABLE `insurance_approval` DISABLE KEYS */;
INSERT INTO `insurance_approval` VALUES (1,1,1,'Approved'),(2,2,2,'Pending'),(3,3,3,'Denied'),(4,4,4,'Approved'),(5,5,5,'Pending'),(6,6,6,'Approved'),(7,7,7,'Pending'),(8,8,8,'Denied'),(9,9,9,'Approved'),(10,10,10,'Pending'),(11,6,6,'Approved'),(12,7,7,'Pending'),(13,8,8,'Denied'),(14,9,9,'Approved'),(15,10,10,'Pending'),(16,1,42,'Approved'),(17,2,43,'Approved'),(18,3,44,'Approved'),(19,4,45,'Pending'),(20,5,46,'Denied'),(21,6,47,'Approved'),(22,7,48,'Pending'),(23,8,49,'Approved'),(24,9,50,'Denied'),(25,10,51,'Approved');
/*!40000 ALTER TABLE `insurance_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `officeID` int unsigned NOT NULL AUTO_INCREMENT,
  `officeName` varchar(50) NOT NULL,
  `addressID` int unsigned NOT NULL,
  `officePhoneNumber` varchar(15) NOT NULL,
  `officeEmail` varchar(100) NOT NULL,
  PRIMARY KEY (`officeID`),
  KEY `fk_office_address` (`addressID`),
  CONSTRAINT `fk_office_address` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'Downtown Clinic',1,'2125550001','downtown@clinic.com'),(2,'Uptown Health Center',2,'3105550002','uptown@health.com'),(3,'Midtown Medical',3,'3125550003','midtown@medical.com'),(4,'Suburban Clinic',4,'7135550004','suburban@clinic.com'),(5,'City Health Office',5,'6025550005','cityhealth@office.com'),(6,'Eastside Clinic',6,'2125550006','eastside@clinic.com'),(7,'Westside Health Center',7,'3105550007','westside@health.com'),(8,'Northside Medical',8,'3125550008','northside@medical.com'),(9,'Southside Clinic',9,'7135550009','southside@clinic.com'),(10,'Central Health Office',10,'6025550010','centralhealth@office.com'),(11,'Eastside Oncology Center',11,'7185550011','eastside.oncology@clinic.com'),(12,'West End Endocrinology Clinic',12,'3105550022','westend.endocrinology@health.com'),(13,'Gastro Health Center',13,'3125550033','gastro.health@medical.com'),(14,'MindCare Psychiatry Clinic',14,'7135550044','mindcare.psychiatry@clinic.com'),(15,'Radiant Radiology Office',15,'6025550055','radiant.radiology@office.com');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_prescription`
--

DROP TABLE IF EXISTS `other_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other_prescription` (
  `otherPrescriptionID` int unsigned NOT NULL AUTO_INCREMENT,
  `medicationName` varchar(50) NOT NULL,
  `patientID` int unsigned NOT NULL,
  PRIMARY KEY (`otherPrescriptionID`),
  KEY `fk_other_prescription_patient` (`patientID`),
  CONSTRAINT `fk_other_prescription_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_prescription`
--

LOCK TABLES `other_prescription` WRITE;
/*!40000 ALTER TABLE `other_prescription` DISABLE KEYS */;
INSERT INTO `other_prescription` VALUES (1,'Aspirin',1),(2,'Metformin',2),(3,'Albuterol',3),(4,'Lisinopril',4),(5,'Ibuprofen',5),(6,'Prednisone',6),(7,'Atorvastatin',7),(8,'Sertraline',8),(9,'Methotrexate',9),(10,'Omeprazole',10),(11,'Cetirizine',6),(12,'Amiodarone',7),(13,'Fluoxetine',8),(14,'Methocarbamol',9),(15,'Esomeprazole',10),(17,'Prozac',27);
/*!40000 ALTER TABLE `other_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientID` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` enum('Male','Female','Other','Prefer not to say') NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(100) NOT NULL,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addressID` int unsigned DEFAULT NULL,
  `Inactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phoneNumber` (`phoneNumber`),
  KEY `fk_patient_address` (`addressID`),
  CONSTRAINT `fk_patient_address` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'John','Doe','1990-01-01','Male','2125556666','john.doe@patient.com','hashedpassword6',NULL,'admin1','2024-11-17 19:41:04','admin1','2024-11-19 05:22:20',1,0),(2,'Janeee','Smith','1985-02-14','Female','3105557777','jane.smith@patient.com','hashedpassword7',NULL,'admin2','2024-11-17 19:41:04','admin2','2024-11-18 23:37:34',2,0),(3,'Bob','Jones','1970-03-20','Male','3125558888','bob.jones@patient.com','hashedpassword8',NULL,'admin3','2024-11-17 19:41:04','admin3','2024-11-17 19:41:04',3,0),(4,'Alice','Williams','2000-04-25','Female','7135559999','alice.williams@patient.com','hashedpassword9',NULL,'admin4','2024-11-17 19:41:04','admin4','2024-11-17 19:41:04',4,0),(5,'Charlie','Brown','1995-05-30','Other','6025550000','charlie.brown@patient.com','hashedpassword10',NULL,'admin5','2024-11-17 19:41:04','admin5','2024-11-17 19:41:04',5,0),(6,'Ethan','Davis','1993-06-18','Male','2125556667','ethan.davis@patient.com','hashedpassword21',NULL,'admin6','2024-11-18 00:18:49','admin6','2024-11-18 00:18:49',6,0),(7,'Ava','Lopez','1991-08-22','Female','3105557778','ava.lopez@patient.com','hashedpassword22',NULL,'admin7','2024-11-18 00:18:49','admin7','2024-11-18 00:18:49',7,0),(8,'Mason','Gonzalez','1987-10-30','Male','3125558889','mason.gonzalez@patient.com','hashedpassword23',NULL,'admin8','2024-11-18 00:18:49','admin8','2024-11-18 00:18:49',8,0),(9,'Isabella','Perez','1994-12-05','Female','7135559990','isabella.perez@patient.com','hashedpassword24',NULL,'admin9','2024-11-18 00:18:49','admin9','2024-11-18 00:18:49',9,0),(10,'Logan','Taylor','1992-03-14','Other','6025550001','logan.taylor@patient.com','hashedpassword25',NULL,'admin10','2024-11-18 00:18:49','admin10','2024-11-18 00:18:49',10,0),(11,'Olivia','Johnson','1992-01-15','Female','7185556668','olivia.johnson@patient.com','hashedpassword31',NULL,'admin11','2024-11-18 00:21:39','admin11','2024-11-18 00:21:39',11,0),(12,'Noah','King','1989-04-22','Male','3105557779','noah.king@patient.com','hashedpassword32',NULL,'admin12','2024-11-18 00:21:39','admin12','2024-11-18 00:21:39',12,0),(13,'Emma','Lewis','1995-07-30','Female','3125558890','emma.lewis@patient.com','hashedpassword33',NULL,'admin13','2024-11-18 00:21:39','admin13','2024-11-18 00:21:39',13,0),(14,'Aiden','Martinez','1988-10-05','Male','7135559991','aiden.martinez@patient.com','hashedpassword34',NULL,'admin14','2024-11-18 00:21:39','admin14','2024-11-18 00:21:39',14,0),(15,'Ava','Nelson','1993-12-12','Female','6025550002','ava.nelson@patient.com','hashedpassword35',NULL,'admin15','2024-11-18 00:21:39','admin15','2024-11-18 00:21:39',15,0),(16,'Zob','Dob','1988-03-12','Female','4152315555','ZobDob@gmail.com','123','2024-11-18 06:27:56','user','2024-11-18 06:27:56','user','2024-11-18 06:27:56',26,0),(17,'Derrick','Henry','2024-11-01','Male','8328487890','123@gmail.com','123','2024-11-18 14:47:07','user','2024-11-18 14:47:07','user','2024-11-18 14:47:07',27,0),(18,'Ray','Johnson','1995-05-12','Male','4516661451','RayJohnson@gmail.com','123','2024-11-19 03:35:22','user','2024-11-19 03:35:22','user','2024-11-19 03:35:22',29,0),(19,'Jaci','Manson','2024-11-08','Male','4511236512','JackManson@gmail.com','123','2024-11-19 05:05:22','user','2024-11-19 05:05:22','user','2024-11-19 05:09:19',31,0),(20,'Jane','Doe','1993-12-12','Male','1231242151','janedoeisepic123@gmail.com','123','2024-11-19 05:45:22','user','2024-11-19 05:45:22','user','2024-11-19 05:45:22',32,0),(21,'Baba','Booei','2024-11-15','Male','2412741201','bababooey@gmail.com','123','2024-11-19 06:04:45','user','2024-11-19 06:04:45','user','2024-11-19 06:05:53',33,0),(22,'poop','adsfop;asd','2001-01-01','Female','3123182381','1234@gmail.com','1234','2024-11-19 06:33:50','user','2024-11-19 06:33:50','user','2024-11-19 06:35:51',34,0),(23,'Geoff','Gordon','1980-01-01','Male','9749587302','jeffg@gmail.com','123','2024-11-19 15:23:16','user','2024-11-19 15:23:16','user','2024-11-19 15:26:17',35,0),(24,'Warric','Lime','1988-01-01','Male','2974409200','w.lime@gmail.com','123','2024-11-19 15:38:22','user','2024-11-19 15:38:22','user','2024-11-19 15:38:22',36,0),(25,'Tony','Fony','1990-01-01','Male','8341389439','t.fony@gmail.com','123','2024-11-19 16:01:36','user','2024-11-19 16:01:36','user','2024-11-19 16:01:36',37,0),(26,'Bob','Conrad','1958-01-01','Male','2389932883','b.con@gmail.com','123','2024-11-19 16:20:17','user','2024-11-19 16:20:17','user','2024-11-19 16:20:17',38,0),(27,'Marco','Daniels','1996-01-01','Other','2101934830','m.daniels@gmail.com','123','2024-11-19 18:08:35','user','2024-11-19 18:08:35','user','2024-11-19 18:08:35',39,0),(28,'Jacie','Blahno','1994-01-01','Other','1983727302','j.blahno@gmail.com','123','2024-11-19 18:18:55','user','2024-11-19 18:18:55','user','2024-11-19 18:18:55',40,0),(29,'Mary','Lamon','1990-01-01','Female','3479387498','m.lamon@gmail.com','123','2024-11-19 20:52:58','user','2024-11-19 20:52:58','user','2024-11-19 20:52:58',41,0),(30,'sjsadsfa','sdgasdgs','2001-01-01','Female','1232184904','321@gmail.com','321','2024-11-19 22:29:00','user','2024-11-19 22:29:00','user','2024-11-19 22:29:00',42,0),(31,'Baba','Booei','2001-01-01','Female','4124124124','aaa@gmail.com','123','2024-11-19 22:45:29','user','2024-11-19 22:45:29','user','2024-11-19 22:47:05',43,0),(32,'Tenzin','Niznet','1990-01-01','Male','7698698698','t.niznet@gmail.com','123','2024-11-19 23:25:36','user','2024-11-19 23:25:36','user','2024-11-19 23:25:36',44,0),(33,'Jessica','abbaa','2001-01-01','Female','1231234411','aba@gmail.com','123','2024-11-20 00:43:49','user','2024-11-20 00:43:49','user','2024-11-20 00:46:41',45,0),(34,'tester','tester','2024-12-02','Other','1234567890','email@tester.com','12345','2024-12-02 09:22:39','user','2024-12-02 09:22:39','user','2024-12-02 09:22:39',46,0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`medclinic_db_admin`@`%`*/ /*!50003 TRIGGER `patient_inactivation_update` AFTER UPDATE ON `patient` FOR EACH ROW BEGIN
    -- Check if the Inactive column changed from 0 to 1
    IF OLD.Inactive = 0 AND NEW.Inactive = 1 THEN
        -- Update related appointments with specific rules
        UPDATE appointment
        SET status =
            CASE
                -- Update appointments where status is 'Scheduled' to 'Cancelled'
                WHEN status = 'Scheduled' THEN 'Cancelled'
                -- Update appointments where status is 'Requested' to 'Request Denied'
                WHEN status = 'Requested' THEN 'Request Denied'
                ELSE status -- Leave other statuses unchanged
            END
        WHERE patientID = NEW.patientID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient_doctor`
--

DROP TABLE IF EXISTS `patient_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_doctor` (
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned NOT NULL,
  `startDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isPrimary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`patientID`,`doctorID`),
  KEY `fk_patient_doctor_doctor` (`doctorID`),
  CONSTRAINT `fk_patient_doctor_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patient_doctor_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_doctor`
--

LOCK TABLES `patient_doctor` WRITE;
/*!40000 ALTER TABLE `patient_doctor` DISABLE KEYS */;
INSERT INTO `patient_doctor` VALUES (1,1,'2024-11-17 19:41:05',1),(2,2,'2024-11-17 19:41:05',1),(3,3,'2024-11-17 19:41:05',1),(4,1,'2024-11-18 06:15:44',0),(4,4,'2024-11-17 19:41:05',1),(5,5,'2024-11-17 19:41:05',1),(6,6,'2024-11-18 00:18:50',1),(7,6,'2024-11-19 03:29:02',0),(7,7,'2024-11-18 00:18:50',1),(8,8,'2024-11-18 00:18:50',1),(9,9,'2024-11-18 00:18:50',1),(10,10,'2024-11-18 00:18:50',1),(11,6,'2024-11-19 03:25:42',0),(12,6,'2024-11-19 03:25:08',0),(13,6,'2024-11-19 03:28:18',0),(16,15,'2024-11-18 06:28:29',1),(19,13,'2024-11-19 05:06:25',1),(21,1,'2024-11-19 06:05:02',1),(22,5,'2024-11-24 23:29:09',0),(22,6,'2024-11-19 06:34:34',1),(30,15,'2024-11-19 22:29:18',1),(31,9,'2024-11-19 22:45:58',1),(33,4,'2024-11-20 00:44:32',0),(33,5,'2024-11-20 00:44:20',1),(34,7,'2024-12-02 09:24:17',1);
/*!40000 ALTER TABLE `patient_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_name_view`
--

DROP TABLE IF EXISTS `patient_name_view`;
/*!50001 DROP VIEW IF EXISTS `patient_name_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_name_view` AS SELECT 
 1 AS `firstName`,
 1 AS `lastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patient_pharmacy`
--

DROP TABLE IF EXISTS `patient_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_pharmacy` (
  `patientID` int unsigned NOT NULL,
  `pharmacyID` int NOT NULL,
  PRIMARY KEY (`patientID`,`pharmacyID`),
  KEY `pharmacyID` (`pharmacyID`),
  CONSTRAINT `patient_pharmacy_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_pharmacy_ibfk_2` FOREIGN KEY (`pharmacyID`) REFERENCES `pharmacy` (`pharmacyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_pharmacy`
--

LOCK TABLES `patient_pharmacy` WRITE;
/*!40000 ALTER TABLE `patient_pharmacy` DISABLE KEYS */;
INSERT INTO `patient_pharmacy` VALUES (1,1),(6,1),(2,2),(7,2),(17,2),(3,3),(8,3),(4,4),(9,4),(17,4),(5,5),(10,5),(17,5),(20,6);
/*!40000 ALTER TABLE `patient_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int unsigned NOT NULL AUTO_INCREMENT,
  `billID` int unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `payerType` enum('Patient','Insurance') NOT NULL DEFAULT 'Patient',
  PRIMARY KEY (`paymentID`),
  KEY `billID` (`billID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`billID`) REFERENCES `bill` (`billID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,200.00,'2024-11-17 19:41:05','Credit Card','Patient'),(2,2,150.00,'2024-11-17 19:41:05','Insurance','Insurance'),(3,3,0.00,'2024-11-17 19:41:05','None','Patient'),(4,4,100.00,'2024-11-17 19:41:05','Cash','Patient'),(5,5,75.00,'2024-11-17 19:41:05','Debit Card','Patient'),(6,6,250.00,'2024-11-18 00:18:50','Credit Card','Patient'),(7,7,200.00,'2024-11-18 00:18:50','Insurance','Insurance'),(8,8,0.00,'2024-11-18 00:18:50','None','Patient'),(9,9,120.00,'2024-11-18 00:18:50','Cash','Patient'),(10,10,90.00,'2024-11-18 00:18:50','Debit Card','Patient'),(11,6,300.00,'2024-11-18 00:24:19','Credit Card','Patient'),(12,7,225.00,'2024-11-18 00:24:19','Insurance','Insurance'),(13,8,0.00,'2024-11-18 00:24:19','None','Patient'),(14,9,140.00,'2024-11-18 00:24:19','Cash','Patient'),(15,10,100.00,'2024-11-18 00:24:19','Debit Card','Patient'),(16,16,100.00,'2024-11-18 19:45:45','Online Payment','Patient'),(17,17,500.00,'2024-11-18 20:55:34','Online Payment','Patient'),(18,18,250.00,'2024-11-18 21:00:26','Online Payment','Patient'),(19,17,150.00,'2024-11-18 21:49:19','Online Payment','Patient'),(20,19,120.00,'2024-11-19 00:22:50','Online Payment','Patient'),(21,19,1080.00,'2024-11-19 06:20:33','Online Payment','Patient'),(22,24,7150.00,'2024-11-19 23:59:58','Online Payment','Patient'),(23,26,10200.00,'2024-11-20 00:00:06','Online Payment','Patient'),(24,25,5150.00,'2024-11-20 00:00:23','Online Payment','Patient'),(25,20,150.00,'2025-01-13 17:36:45','Online Payment','Patient');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `pharmacyID` int NOT NULL AUTO_INCREMENT,
  `pharmacyName` varchar(75) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(175) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `phoneNumber` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pharmacyID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'HealthPlus Pharmacy','100 Health St','New York','NY','10001','2125551234','2024-11-17 19:41:04',NULL),(2,'CareWell Pharmacy','200 Care Blvd','Los Angeles','CA','90001','3105555678','2024-11-17 19:41:04',NULL),(3,'Medicure Pharmacy','300 Medic Ave','Chicago','IL','60601','3125559012','2024-11-17 19:41:04',NULL),(4,'Wellness Pharmacy','400 Wellness Rd','Houston','TX','77001','7135553456','2024-11-17 19:41:04',NULL),(5,'PharmaDirect','500 Pharma Blvd','Phoenix','AZ','85001','6025557890','2024-11-17 19:41:04',NULL),(6,'Walgreens Drug Store #304','123 Houston Dr','Houston','TX','77072','8324567895','2024-11-19 23:45:31',NULL);
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescriptionID` int unsigned NOT NULL AUTO_INCREMENT,
  `medicationName` varchar(100) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `instruction` text,
  `refillCount` int NOT NULL DEFAULT '0',
  `daySupply` int NOT NULL,
  `refillsRemaining` int NOT NULL DEFAULT '0',
  `dateIssued` datetime DEFAULT CURRENT_TIMESTAMP,
  `activeStatus` enum('Active','Inactive') NOT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  `pharmacyID` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`prescriptionID`),
  KEY `fk_prescription_doctor` (`doctorID`),
  KEY `fk_prescription_patient` (`patientID`),
  KEY `fk_prescription_pharmacy` (`pharmacyID`),
  CONSTRAINT `fk_prescription_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_prescription_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prescription_pharmacy` FOREIGN KEY (`pharmacyID`) REFERENCES `pharmacy` (`pharmacyID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'Amoxicillin','500mg','Three times a day','2024-12-01','2024-12-10',30,'Take after meals',2,10,2,'2024-11-17 19:41:05','Active',1,1,1,1),(2,'Metformin','850mg','Twice a day','2024-12-05',NULL,60,'Take with breakfast and dinner',3,30,3,'2024-11-17 19:41:05','Active',2,2,2,0),(3,'Albuterol Inhaler','2 puffs','As needed','2024-12-03',NULL,1,'Use when experiencing asthma symptoms',0,0,0,'2024-11-17 19:41:05','Active',3,3,3,0),(4,'Lisinopril','10mg','Once a day','2024-12-07','2025-12-07',365,'Take in the morning',1,30,1,'2024-11-17 19:41:05','Active',4,4,4,0),(5,'Ibuprofen','200mg','Every 6 hours','2024-12-02','2024-12-09',20,'Take with water',0,0,0,'2024-11-17 19:41:05','Inactive',5,5,5,0),(6,'Clonazepam','0.5mg','Twice a day','2024-12-06','2024-12-20',15,'Take before bedtime',1,7,1,'2024-11-18 00:18:50','Active',6,6,1,0),(7,'Glipizide','5mg','Once a day','2024-12-07',NULL,30,'Take in the morning',2,30,2,'2024-11-18 00:18:50','Active',7,7,2,0),(8,'Levetiracetam','500mg','Three times a day','2024-12-08',NULL,60,'Take with food',3,20,3,'2024-11-18 00:18:50','Active',8,8,3,0),(9,'Meloxicam','7.5mg','Once a day','2024-12-09','2025-01-09',30,'Take with water',1,30,1,'2024-11-18 00:18:50','Active',9,9,4,0),(10,'Hydroxyzine','25mg','As needed','2024-12-10',NULL,10,'Use when experiencing anxiety',0,0,0,'2024-11-18 00:18:50','Inactive',10,10,5,0),(11,'Tamoxifen','20mg','Once a day','2024-12-11','2025-12-11',365,'Take in the morning',2,30,2,'2024-11-18 00:24:23','Active',6,6,1,0),(12,'Levothyroxine','50mcg','Once a day','2024-12-12',NULL,180,'Take before breakfast',3,30,3,'2024-11-18 00:24:23','Active',7,7,2,0),(13,'Omeprazole','20mg','Twice a day','2024-12-13',NULL,60,'Take before meals',1,30,1,'2024-11-18 00:24:23','Active',8,8,3,0),(14,'Sertraline','50mg','Once a day','2024-12-14',NULL,90,'Take in the evening',2,30,2,'2024-11-18 00:24:23','Active',9,9,4,0),(15,'Contrast Dye','10ml','Once during MRI','2024-12-15',NULL,1,'Administer before MRI scan',0,0,0,'2024-11-18 00:24:23','Inactive',10,10,5,0),(16,'Advil','10 mg','Once daily.','2024-11-18','2025-11-17',30,'Take with food, only after dinner.',3,30,3,'2024-11-18 20:38:21','Active',1,1,1,1),(17,'Lisinopril','100 mg','Once per day','2024-11-18','2025-11-17',30,'None',2,30,1,'2024-11-18 20:53:49','Active',17,1,NULL,0),(18,'Drug','100mg','Once','2024-11-18','2025-11-17',1,'take once',1,1,0,'2024-11-18 21:12:18','Active',17,1,NULL,0),(19,'Drugs You Should Try It','10 mg','Once every day.','2024-11-19','2025-11-18',30,'GGs ',5,30,5,'2024-11-19 00:21:45','Active',1,1,1,1),(20,'Cocaine ','100mg','Once daily.','2024-11-19','2025-11-19',30,'Take with food, right after dinner.',3,30,2,'2024-11-19 04:48:14','Active',17,6,NULL,0),(21,'Advil','500 mg','Once daily','2024-11-19','2025-11-19',15,'Take after dinner.',2,15,1,'2024-11-19 05:18:48','Active',17,6,2,1),(42,'Amoxicillin','500mg','Three times a day','2024-12-01','2024-12-10',30,'Take with food.',2,10,2,'2024-11-19 21:57:30','Active',1,1,2,1),(43,'Metformin','1000mg','Twice a day','2024-12-05',NULL,60,'Take in the morning and evening.',1,30,1,'2024-11-19 21:57:30','Active',2,2,5,1),(44,'Lisinopril','20mg','Once a day','2024-12-10','2025-01-10',30,'Take at the same time each day.',0,30,0,'2024-11-19 21:57:30','Active',3,3,4,1),(45,'Atorvastatin','40mg','Once a day','2024-12-15',NULL,30,'Take before bedtime.',3,30,3,'2024-11-19 21:57:30','Active',4,4,4,1),(46,'Levothyroxine','50mcg','Once a day','2024-12-20',NULL,90,'Take on an empty stomach.',0,90,0,'2024-11-19 21:57:30','Active',5,5,5,1),(47,'Omeprazole','20mg','Once a day','2024-12-25','2025-01-25',30,'Take before meals.',1,30,1,'2024-11-19 21:57:30','Active',6,6,4,1),(48,'Albuterol','2 puffs','As needed','2024-12-30',NULL,1,'Use inhaler as directed.',2,30,2,'2024-11-19 21:57:30','Active',7,7,3,1),(49,'Sertraline','50mg','Once a day','2025-01-05',NULL,30,'Take in the morning.',2,30,2,'2024-11-19 21:57:30','Active',8,8,4,1),(50,'Gabapentin','300mg','Three times a day','2025-01-10',NULL,90,'Do not abruptly stop medication.',0,30,0,'2024-11-19 21:57:30','Active',9,9,4,1),(51,'Hydrochlorothiazide','25mg','Once a day','2025-01-15',NULL,30,'Take in the morning.',1,30,1,'2024-11-19 21:57:30','Active',10,10,4,1),(52,'Goprelto','40mg','Once a day.','2024-11-01','2025-11-01',30,'Take once right after dinner time.',0,30,0,'2024-11-19 16:52:00','Active',20,2,6,1),(53,'Advil','200mg','Twice a day.','2024-11-01','2025-11-01',30,'Take once after breakfast, once after dinner.',3,15,2,'2024-11-19 16:52:00','Active',20,2,6,1);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refill`
--

DROP TABLE IF EXISTS `refill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refill` (
  `refillID` int unsigned NOT NULL AUTO_INCREMENT,
  `prescriptionID` int unsigned NOT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  `requestDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `reviewDate` timestamp NULL DEFAULT NULL,
  `notes` text,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`refillID`),
  KEY `doctorID` (`doctorID`),
  KEY `patientID` (`patientID`),
  KEY `prescriptionID` (`prescriptionID`),
  CONSTRAINT `refill_ibfk_1` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription` (`prescriptionID`) ON DELETE CASCADE,
  CONSTRAINT `refill_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE,
  CONSTRAINT `refill_ibfk_3` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refill`
--

LOCK TABLES `refill` WRITE;
/*!40000 ALTER TABLE `refill` DISABLE KEYS */;
INSERT INTO `refill` VALUES (1,1,1,1,'2024-11-17 19:41:05','Approved',NULL,'Refill approved for Amoxicillin','2024-11-17 19:41:05'),(2,2,2,2,'2024-11-17 19:41:05','Pending',NULL,'Awaiting insurance confirmation','2024-11-17 19:41:05'),(3,3,3,3,'2024-11-17 19:41:05','Denied',NULL,'Prescription expired','2024-11-17 19:41:05'),(4,4,4,4,'2024-11-17 19:41:05','Approved',NULL,'Refill approved for Lisinopril','2024-11-17 19:41:05'),(5,5,5,5,'2024-11-17 19:41:05','Pending',NULL,'Awaiting patient request','2024-11-17 19:41:05'),(6,6,6,6,'2024-11-18 00:18:50','Approved',NULL,'Refill approved for Clonazepam','2024-11-18 00:18:50'),(7,7,7,7,'2024-11-18 00:18:50','Pending',NULL,'Awaiting insurance confirmation for Glipizide','2024-11-18 00:18:50'),(8,8,8,8,'2024-11-18 00:18:50','Denied',NULL,'Prescription expired for Levetiracetam','2024-11-18 00:18:50'),(9,9,9,9,'2024-11-18 00:18:50','Approved',NULL,'Refill approved for Meloxicam','2024-11-18 00:18:50'),(10,10,10,10,'2024-11-18 00:18:50','Pending',NULL,'Awaiting patient request for Hydroxyzine','2024-11-18 00:18:50'),(11,6,6,6,'2024-11-18 00:24:34','Approved',NULL,'Refill approved for Tamoxifen','2024-11-18 00:24:34'),(12,7,7,7,'2024-11-18 00:24:34','Pending',NULL,'Awaiting insurance confirmation for Levothyroxine','2024-11-18 00:24:34'),(13,8,8,8,'2024-11-18 00:24:34','Denied',NULL,'Prescription expired for Omeprazole','2024-11-18 00:24:34'),(14,9,9,9,'2024-11-18 00:24:34','Approved',NULL,'Refill approved for Sertraline','2024-11-18 00:24:34'),(15,10,10,10,'2024-11-18 00:24:34','Pending',NULL,'Awaiting patient request for Contrast Dye','2024-11-18 00:24:34'),(16,6,6,6,'2024-11-18 00:24:35','Approved',NULL,'Refill approved for Tamoxifen','2024-11-18 00:24:35'),(17,7,7,7,'2024-11-18 00:24:35','Pending',NULL,'Awaiting insurance confirmation for Levothyroxine','2024-11-18 00:24:35'),(18,8,8,8,'2024-11-18 00:24:35','Denied',NULL,'Prescription expired for Omeprazole','2024-11-18 00:24:35'),(19,9,9,9,'2024-11-18 00:24:35','Approved',NULL,'Refill approved for Sertraline','2024-11-18 00:24:35'),(20,10,10,10,'2024-11-18 00:24:35','Pending',NULL,'Awaiting patient request for Contrast Dye','2024-11-18 00:24:35'),(21,17,17,1,'2024-11-18 20:55:01','Denied','2024-11-19 00:29:45','I am having issues with your insurance information. Please schedule an appointment to resolve.','2024-11-19 06:29:51'),(22,18,17,1,'2024-11-18 21:43:53','Approved','2024-11-19 00:29:47','Refill approved - Dr. Olivia Green','2024-11-19 06:29:51'),(23,21,17,6,'2024-11-19 06:06:49','Approved','2024-11-19 00:29:49','Refill approved - Dr. Olivia Green','2024-11-19 06:29:51'),(24,20,17,6,'2024-11-19 06:38:22','Pending',NULL,NULL,'2024-11-19 06:38:22'),(25,18,17,1,'2024-11-19 06:38:22','Pending',NULL,NULL,'2024-11-19 06:38:22'),(26,21,17,6,'2024-11-19 22:48:32','Pending',NULL,NULL,'2024-11-19 22:48:32'),(27,53,20,2,'2024-11-20 00:48:16','Pending',NULL,NULL,'2024-11-20 00:48:16');
/*!40000 ALTER TABLE `refill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `serviceID` int unsigned NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`serviceID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'General Consultation',150.00),(2,'Blood Test',50.00),(3,'MRI Scan',1200.00),(4,'Physical Therapy',100.00),(5,'Vaccination',75.00),(6,'Ultrasound',200.00),(7,'X-Ray',100.00),(8,'Dental Cleaning',80.00),(9,'Eye Exam',120.00),(10,'Chiropractic Adjustment',90.00),(11,'Nutrition Consultation',100.00),(12,'Mental Health Counseling',150.00),(13,'Cardiology Consultation',180.00),(14,'Pediatrics Consultation',140.00),(15,'Dermatology Treatment',160.00),(16,'Ultrasound',200.00),(17,'X-Ray',100.00),(18,'Pap Smear',75.00),(19,'Prenatal Checkups',150.00),(20,'Contraceptive Counseling',50.00),(21,'Breast Health Services',100.00);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `specialtyID` int unsigned NOT NULL AUTO_INCREMENT,
  `specialtyName` varchar(50) NOT NULL,
  `specialtyDescription` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`specialtyID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'Cardiology','Heart and blood vessel disorders'),(2,'Neurology','Brain and nervous system disorders'),(3,'Orthopedics','Musculoskeletal system disorders'),(4,'Pediatrics','Medical care for children'),(5,'Dermatology','Skin-related conditions'),(6,'Oncology','Cancer and tumor-related disorders'),(7,'Endocrinology','Hormonal and metabolic disorders'),(8,'Gastroenterology','Digestive system disorders'),(9,'Psychiatry','Mental health disorders'),(10,'Radiology','Medical imaging and diagnostics'),(11,'Gynecology','Health care focusing on the female reproductive system, including the uterus, ovaries, and vagina.');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty_additional_charge`
--

DROP TABLE IF EXISTS `specialty_additional_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty_additional_charge` (
  `specialtyID` int unsigned NOT NULL,
  `additionalChargeTypeID` int unsigned NOT NULL,
  PRIMARY KEY (`specialtyID`,`additionalChargeTypeID`),
  KEY `additionalChargeTypeID` (`additionalChargeTypeID`),
  CONSTRAINT `specialty_additional_charge_ibfk_1` FOREIGN KEY (`specialtyID`) REFERENCES `specialty` (`specialtyID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `specialty_additional_charge_ibfk_2` FOREIGN KEY (`additionalChargeTypeID`) REFERENCES `additional_charge_type` (`additionalChargeTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty_additional_charge`
--

LOCK TABLES `specialty_additional_charge` WRITE;
/*!40000 ALTER TABLE `specialty_additional_charge` DISABLE KEYS */;
INSERT INTO `specialty_additional_charge` VALUES (1,1),(6,1),(2,2),(6,2),(7,2),(3,3),(7,3),(8,3),(4,4),(8,4),(9,4),(5,5),(9,5),(10,5),(6,6),(10,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `specialty_additional_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty_service`
--

DROP TABLE IF EXISTS `specialty_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty_service` (
  `specialtyID` int unsigned NOT NULL,
  `serviceID` int unsigned NOT NULL,
  PRIMARY KEY (`specialtyID`,`serviceID`),
  KEY `serviceID` (`serviceID`),
  CONSTRAINT `specialty_service_ibfk_1` FOREIGN KEY (`specialtyID`) REFERENCES `specialty` (`specialtyID`) ON DELETE CASCADE,
  CONSTRAINT `specialty_service_ibfk_2` FOREIGN KEY (`serviceID`) REFERENCES `service` (`serviceID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty_service`
--

LOCK TABLES `specialty_service` WRITE;
/*!40000 ALTER TABLE `specialty_service` DISABLE KEYS */;
INSERT INTO `specialty_service` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(1,2),(2,2),(6,2),(7,2),(8,2),(10,2),(2,3),(3,3),(6,3),(10,3),(3,4),(4,4),(7,4),(5,5),(8,5),(1,6),(8,6),(3,7),(10,7),(11,16),(11,18),(11,19),(11,21);
/*!40000 ALTER TABLE `specialty_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgery`
--

DROP TABLE IF EXISTS `surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surgery` (
  `surgeryID` int unsigned NOT NULL AUTO_INCREMENT,
  `surgeryType` varchar(100) NOT NULL,
  `surgeryDateTime` datetime DEFAULT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`surgeryID`),
  KEY `fk_surgery_doctor` (`doctorID`),
  KEY `fk_surgery_patient` (`patientID`),
  CONSTRAINT `fk_surgery_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_surgery_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery`
--

LOCK TABLES `surgery` WRITE;
/*!40000 ALTER TABLE `surgery` DISABLE KEYS */;
INSERT INTO `surgery` VALUES (1,'Appendectomy','2024-12-10 08:00:00',1,1),(2,'Knee Replacement','2024-12-15 09:30:00',2,2),(3,'Heart Bypass','2024-12-20 07:45:00',3,3),(4,'Cataract Surgery','2024-12-25 10:15:00',4,4),(5,'Gallbladder Removal','2024-12-30 11:00:00',5,5),(6,'Liver Resection','2024-12-16 09:00:00',6,6),(7,'Thyroid Surgery','2024-12-17 10:30:00',7,7),(8,'Colonoscopy','2024-12-18 14:00:00',8,8),(9,'Psychiatric Intervention','2024-12-19 16:15:00',9,9),(10,'Advanced Imaging Procedure','2024-12-20 11:45:00',10,10),(11,'Heart Transplant','2024-07-18 00:00:00',1,1),(12,'Lobotomy','2022-10-12 00:00:00',2,NULL),(13,'Heart Surgery','2024-11-18 00:00:00',17,6),(14,'Second Lobotomy','2024-12-02 00:00:00',2,NULL);
/*!40000 ALTER TABLE `surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_plan`
--

DROP TABLE IF EXISTS `treatment_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_plan` (
  `treatmentPlanID` int unsigned NOT NULL AUTO_INCREMENT,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  `notes` text,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`treatmentPlanID`),
  KEY `fk_treatment_plan_doctor` (`doctorID`),
  KEY `fk_treatment_plan_patient` (`patientID`),
  CONSTRAINT `fk_treatment_plan_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_treatment_plan_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_plan`
--

LOCK TABLES `treatment_plan` WRITE;
/*!40000 ALTER TABLE `treatment_plan` DISABLE KEYS */;
INSERT INTO `treatment_plan` VALUES (1,1,1,'Post-surgery rehabilitation plan','2024-12-11','2025-01-11'),(2,2,2,'Diabetes management plan','2024-12-16',NULL),(3,3,3,'Asthma control plan','2024-12-21',NULL),(4,4,4,'Vision improvement plan','2024-12-26','2025-06-26'),(5,5,5,'Pain management plan','2024-12-31',NULL),(6,6,6,'Cancer treatment and rehabilitation','2024-12-12','2025-06-12'),(7,7,7,'Thyroid hormone replacement therapy','2024-12-17',NULL),(8,8,8,'Gastrointestinal health improvement plan','2024-12-22',NULL),(9,9,9,'Mental health stabilization plan','2024-12-27','2025-06-27'),(10,10,10,'Radiology imaging schedule','2024-12-22',NULL);
/*!40000 ALTER TABLE `treatment_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine` (
  `vaccineID` int unsigned NOT NULL AUTO_INCREMENT,
  `vaccineName` varchar(100) NOT NULL,
  `dateAdministered` date DEFAULT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`vaccineID`),
  KEY `fk_vaccine_doctor` (`doctorID`),
  KEY `fk_vaccine_patient` (`patientID`),
  CONSTRAINT `fk_vaccine_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_vaccine_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine`
--

LOCK TABLES `vaccine` WRITE;
/*!40000 ALTER TABLE `vaccine` DISABLE KEYS */;
INSERT INTO `vaccine` VALUES (1,'Influenza','2024-11-01',1,1),(2,'COVID-19','2024-11-15',2,2),(3,'Hepatitis B','2024-11-20',3,3),(4,'Tetanus','2024-11-25',4,4),(5,'Measles','2024-11-30',5,5),(6,'Hepatitis A','2024-12-16',6,6),(7,'HPV Vaccine','2024-12-17',7,7),(8,'Shingles Vaccine','2024-12-18',8,8),(9,'Meningococcal Vaccine','2024-12-19',9,9),(10,'Polio Vaccine','2024-12-20',10,10),(11,'COVID-19','2024-11-18',1,1),(12,'COVID-19','2024-11-18',17,6);
/*!40000 ALTER TABLE `vaccine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_notes`
--

DROP TABLE IF EXISTS `visit_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_notes` (
  `visitNotesID` int unsigned NOT NULL AUTO_INCREMENT,
  `appointmentID` int unsigned DEFAULT NULL,
  `patientID` int unsigned NOT NULL,
  `doctorID` int unsigned DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`visitNotesID`),
  KEY `fk_visit_note_doctor` (`doctorID`),
  KEY `fk_visit_note_patient` (`patientID`),
  KEY `fk_visit_notes_appointment` (`appointmentID`),
  CONSTRAINT `fk_visit_note_doctor` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_visit_note_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_visit_notes_appointment` FOREIGN KEY (`appointmentID`) REFERENCES `appointment` (`appointmentID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_notes`
--

LOCK TABLES `visit_notes` WRITE;
/*!40000 ALTER TABLE `visit_notes` DISABLE KEYS */;
INSERT INTO `visit_notes` VALUES (1,1,1,1,'Patient is recovering well from surgery.'),(2,2,2,2,'Discussed blood test results and next steps.'),(3,3,3,3,'MRI shows no abnormalities.'),(4,4,4,4,'Physical therapy progressing as expected.'),(5,5,5,5,'Administered flu vaccine successfully.'),(6,6,6,6,'Oncology consultation completed successfully.'),(7,7,7,7,'Endocrinology follow-up scheduled.'),(8,8,8,8,'Gastrointestinal assessment shows improvement.'),(9,9,9,9,'Psychiatric session focused on anxiety management.'),(10,10,10,10,'Radiology imaging completed without issues.'),(11,1,1,1,'Had to do alot of work on them, they are good now.'),(12,20,17,1,'He did well'),(13,23,17,1,'He did well.'),(14,24,17,1,'None'),(15,25,17,1,'none'),(16,26,17,1,'nonoe'),(17,27,17,1,'nonoene'),(18,28,1,1,'GGs '),(19,32,17,6,'Prescribed new medication. \nGave COVID-19 Shot.'),(20,33,17,6,'He almost died.'),(21,37,17,6,'jsjjsklgfjkfj'),(22,38,17,6,'Refilled medications, and made some inactive.'),(23,60,6,2,'Appointed new medication.'),(24,88,20,2,'hghghg');
/*!40000 ALTER TABLE `visit_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_type` (
  `visitTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `visitTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`visitTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_type`
--

LOCK TABLES `visit_type` WRITE;
/*!40000 ALTER TABLE `visit_type` DISABLE KEYS */;
INSERT INTO `visit_type` VALUES (1,'Routine Checkup'),(2,'Follow-up'),(3,'Special Consultation'),(4,'Preventive Care'),(5,'Rehabilitation');
/*!40000 ALTER TABLE `visit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitals`
--

DROP TABLE IF EXISTS `vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitals` (
  `vitalsId` int unsigned NOT NULL AUTO_INCREMENT,
  `patientId` int unsigned NOT NULL,
  `recordDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `height` decimal(5,2) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `bloodPressureSystolic` int DEFAULT NULL,
  `bloodPressureDiastolic` int DEFAULT NULL,
  `heartRate` int DEFAULT NULL,
  `bodyTemperature` decimal(4,2) DEFAULT NULL,
  `respiratoryRate` int DEFAULT NULL,
  `bmi` decimal(5,2) GENERATED ALWAYS AS ((`weight` / ((`height` / 100) * (`height` / 100)))) STORED,
  `notes` varchar(250) DEFAULT NULL,
  `createdBy` varchar(100) NOT NULL,
  PRIMARY KEY (`vitalsId`),
  KEY `fk_vitals_patient` (`patientId`),
  CONSTRAINT `fk_vitals_patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitals`
--

LOCK TABLES `vitals` WRITE;
/*!40000 ALTER TABLE `vitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'prodmedical_clinic_database'
--

--
-- Final view structure for view `patient_name_view`
--

/*!50001 DROP VIEW IF EXISTS `patient_name_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`medclinic_db_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_name_view` AS select `womens_health_db`.`patient`.`firstName` AS `firstName`,`womens_health_db`.`patient`.`lastName` AS `lastName` from `womens_health_db`.`patient` where (`womens_health_db`.`patient`.`patientID` = 7) */;
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

-- Dump completed on 2025-02-02 16:50:54
