-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: luminar_examhub
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
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batches` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `batch_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `fk_batch_course` (`course_id`),
  CONSTRAINT `fk_batch_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
INSERT INTO `batches` VALUES (1,5,'JAVA SEP 2025 Bini 9.30AM'),(2,3,'MEARN SEP 2025 10.30AM'),(3,1,'DS Aug 2025 2.30PM'),(4,5,'JAVA DEC 2025 Bini 7.30AM');
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Python data science'),(2,'Python data analytics'),(3,'MEARN stack'),(4,'ASP .Net'),(5,'Java springboot');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'MANAGER'),(2,'HR'),(3,'TRAINER'),(4,'SYSTEM HEAD'),(5,'ACADEMIC');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_details`
--

DROP TABLE IF EXISTS `exam_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_details` (
  `exam_det_id` int NOT NULL AUTO_INCREMENT,
  `exam_mode_id` int DEFAULT NULL,
  `pass_id` int DEFAULT NULL,
  `exam_det_name` varchar(45) DEFAULT NULL,
  `exam_det_date` date DEFAULT NULL,
  PRIMARY KEY (`exam_det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_details`
--

LOCK TABLES `exam_details` WRITE;
/*!40000 ALTER TABLE `exam_details` DISABLE KEYS */;
INSERT INTO `exam_details` VALUES (1,1,1,'JSP - Module 1','2026-02-16'),(2,5,2,'JSP - Module 2','2026-02-21'),(3,3,3,'Data science practical','2026-02-14'),(4,4,4,'Data analytics test','2026-02-20');
/*!40000 ALTER TABLE `exam_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_evaluation_allotment`
--

DROP TABLE IF EXISTS `exam_evaluation_allotment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_evaluation_allotment` (
  `exam_eval_id` int NOT NULL AUTO_INCREMENT,
  `exam_det_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`exam_eval_id`),
  KEY `fk_eval_details` (`exam_det_id`),
  KEY `fk_eval_staff` (`staff_id`),
  CONSTRAINT `fk_eval_details` FOREIGN KEY (`exam_det_id`) REFERENCES `exam_details` (`exam_det_id`),
  CONSTRAINT `fk_eval_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_evaluation_allotment`
--

LOCK TABLES `exam_evaluation_allotment` WRITE;
/*!40000 ALTER TABLE `exam_evaluation_allotment` DISABLE KEYS */;
INSERT INTO `exam_evaluation_allotment` VALUES (1,1,4),(2,2,4),(3,3,5);
/*!40000 ALTER TABLE `exam_evaluation_allotment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_mode`
--

DROP TABLE IF EXISTS `exam_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_mode` (
  `exam_mode_id` int NOT NULL AUTO_INCREMENT,
  `exam_mode_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_mode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_mode`
--

LOCK TABLES `exam_mode` WRITE;
/*!40000 ALTER TABLE `exam_mode` DISABLE KEYS */;
INSERT INTO `exam_mode` VALUES (1,'Thoery(written)'),(2,'Thoery (MCQ)'),(3,'Coding test'),(4,'Oral'),(5,'Project creation'),(6,'Debugging test');
/*!40000 ALTER TABLE `exam_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_score`
--

DROP TABLE IF EXISTS `exam_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_score` (
  `exam_score_id` int NOT NULL AUTO_INCREMENT,
  `exam_det_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `exam_score` int DEFAULT NULL,
  `exam_comments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`exam_score_id`),
  KEY `fk_score_details` (`exam_det_id`),
  KEY `fk_score_student` (`student_id`),
  CONSTRAINT `fk_score_details` FOREIGN KEY (`exam_det_id`) REFERENCES `exam_details` (`exam_det_id`),
  CONSTRAINT `fk_score_student` FOREIGN KEY (`student_id`) REFERENCES `student_basic_details` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_score`
--

LOCK TABLES `exam_score` WRITE;
/*!40000 ALTER TABLE `exam_score` DISABLE KEYS */;
INSERT INTO `exam_score` VALUES (1,3,1,50,'Keep practicing'),(2,1,4,88,'good');
/*!40000 ALTER TABLE `exam_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_details` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `login_user_name` varchar(45) DEFAULT NULL,
  `login_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `fk_login_staff` (`staff_id`),
  CONSTRAINT `fk_login_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (1,1,'admin','admin123'),(2,2,'abi','abi123'),(4,4,'amal','amal123'),(5,5,'mini','mini123'),(6,6,'dinesh','dinesh123');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passing_criteria`
--

DROP TABLE IF EXISTS `passing_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passing_criteria` (
  `pass_id` int NOT NULL AUTO_INCREMENT,
  `pass_criteria_score` int DEFAULT NULL,
  PRIMARY KEY (`pass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passing_criteria`
--

LOCK TABLES `passing_criteria` WRITE;
/*!40000 ALTER TABLE `passing_criteria` DISABLE KEYS */;
INSERT INTO `passing_criteria` VALUES (1,70),(2,65),(3,55);
/*!40000 ALTER TABLE `passing_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'academic'),(3,'hr'),(4,'trainer'),(5,'pending');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_details`
--

DROP TABLE IF EXISTS `staff_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_details` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `dept_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `staff_roll_no` varchar(45) DEFAULT NULL,
  `staff_name` varchar(45) DEFAULT NULL,
  `staff_contact_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `fk_staff_dept` (`dept_id`),
  KEY `fk_staff_role` (`role_id`),
  CONSTRAINT `fk_staff_dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `fk_staff_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_details`
--

LOCK TABLES `staff_details` WRITE;
/*!40000 ALTER TABLE `staff_details` DISABLE KEYS */;
INSERT INTO `staff_details` VALUES (1,1,1,'101','Ragil','9876543210'),(2,5,2,'10021','Abi','8785734894'),(4,3,4,'9000','Amal','6574747565'),(5,2,3,'5674','Mini','8787662323'),(6,2,5,'1512','Dinesh','8765456788');
/*!40000 ALTER TABLE `staff_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_basic_details`
--

DROP TABLE IF EXISTS `student_basic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_basic_details` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(45) DEFAULT NULL,
  `student_contact` varchar(45) DEFAULT NULL,
  `student_qualification` varchar(45) DEFAULT NULL,
  `student_graduation_year` year DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_basic_details`
--

LOCK TABLES `student_basic_details` WRITE;
/*!40000 ALTER TABLE `student_basic_details` DISABLE KEYS */;
INSERT INTO `student_basic_details` VALUES (1,'Hari','9876568932','MCA',2021),(2,'Akash L','6789987654','BCA',2026),(4,'Sunil','678987698767','Btech',2025),(5,'Nimmi','9876556777','Mtech',2025);
/*!40000 ALTER TABLE `student_basic_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_experience_details`
--

DROP TABLE IF EXISTS `student_experience_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_experience_details` (
  `student_exp_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `student_company` varchar(45) DEFAULT NULL,
  `student_designation` varchar(45) DEFAULT NULL,
  `student_total_exp` int DEFAULT NULL,
  `student_technology` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_exp_id`),
  KEY `fk_basic_exp` (`student_id`),
  CONSTRAINT `fk_basic_exp` FOREIGN KEY (`student_id`) REFERENCES `student_basic_details` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_experience_details`
--

LOCK TABLES `student_experience_details` WRITE;
/*!40000 ALTER TABLE `student_experience_details` DISABLE KEYS */;
INSERT INTO `student_experience_details` VALUES (1,1,'TCS','Tech support',3,'Java'),(2,5,'Salesforce','Support',1,'Python');
/*!40000 ALTER TABLE `student_experience_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-12 20:26:13
