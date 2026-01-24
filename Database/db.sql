-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: void4
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Super Admin','superadmin@smjoshi.edu.in','admin@123','SUPER_ADMIN'),(2,'School Admin','schooladmin@smjoshi.edu.in','school@123','SCHOOL_ADMIN'),(3,'Academic Admin','academic@smjoshi.edu.in','academic@123','ACADEMIC_ADMIN'),(4,'Technical Admin','techadmin@smjoshi.edu.in','tech@123','TECH_ADMIN'),(5,'Support Admin','support@smjoshi.edu.in','support@123','SUPPORT_ADMIN');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'class 1'),(2,'class 2'),(3,'class 3'),(4,'class 4'),(5,'class 5'),(6,'class 6'),(7,'class 7'),(8,'class 8'),(9,'class 9'),(10,'class 10');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `college_id` int NOT NULL AUTO_INCREMENT,
  `college_name` varchar(150) NOT NULL,
  `district` varchar(100) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (1,'s m joshi','pune','maharastra'),(2,'ZP School Nashik','Nashik','Gangapur Road, Nashik'),(3,'ZP School Nagpur','Nagpur','Wardha Road, Nagpur'),(4,'ZP School Kolhapur','Kolhapur','Radhanagari Road, Kolhapur'),(5,'ZP School Satara','Satara','Powai Naka, Satara'),(6,'ZP School Solapur','Solapur','Hotgi Road, Solapur'),(7,'ZP School Ahmednagar','Ahmednagar','Station Road, Ahmednagar'),(8,'ZP School Aurangabad','Aurangabad','Beed Bypass, Aurangabad'),(9,'ZP School Jalgaon','Jalgaon','MIDC Area, Jalgaon'),(10,'ZP School Beed','Beed','College Road, Beed');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_responses`
--

DROP TABLE IF EXISTS `issue_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issue_responses` (
  `response_id` int NOT NULL AUTO_INCREMENT,
  `issue_id` int DEFAULT NULL,
  `responder_id` int DEFAULT NULL,
  `response_text` text,
  `response_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`response_id`),
  KEY `issue_id` (`issue_id`),
  CONSTRAINT `issue_responses_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `teacher_issues` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_responses`
--

LOCK TABLES `issue_responses` WRITE;
/*!40000 ALTER TABLE `issue_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `subject_id` int NOT NULL,
  `password` varchar(10) DEFAULT NULL,
  `subject` varchar(10) DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (101,'123','Math',111,'s.m.joshi'),(102,'123','Science',111,'s.m.joshi'),(103,'123','sst',111,'s.m.joshi'),(104,'123','English',111,'s.m.joshi'),(105,'123','Science',111,'s.m.joshi'),(106,'123','History',111,'s.m.joshi'),(107,'123','Geography',111,'s.m.joshi'),(108,'123','Art',111,'s.m.joshi'),(109,'123','PE',111,'s.m.joshi'),(110,'123','Computer',111,'s.m.joshi'),(111,'123','marathi',111,'s.m.joshi'),(112,'123','Hindi',111,'S.M. Joshi');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(500) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `college_id` int DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `subject_id` (`subject`),
  KEY `fk_notice_class` (`class_id`),
  KEY `fk_notice_college` (`college_id`),
  CONSTRAINT `fk_notice_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `fk_notice_college` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (40,'Math','Revise addition and subtraction basics.','2025-02-01 00:00:00','Math Revision Plan',NULL,1,1,'1',111,'S.M. Joshi'),(41,'Math','Practice worksheets to be completed.','2025-02-02 00:00:00','Worksheet Submission','uploads/math_ws.pdf',2,1,'1',111,'S.M. Joshi'),(42,'Science','Conduct simple science experiments.','2025-02-03 00:00:00','Activity-Based Learning',NULL,3,1,'2',111,'S.M. Joshi'),(43,'Science','Explain water cycle using charts.','2025-02-04 00:00:00','Water Cycle Lesson','uploads/water_cycle.pdf',4,1,'2',111,'S.M. Joshi'),(44,'English','Encourage daily reading habits.','2025-02-05 00:00:00','Reading Improvement',NULL,5,1,'3',111,'S.M. Joshi'),(45,'English','Focus on sentence formation.','2025-02-06 00:00:00','Grammar Focus','uploads/grammar.pdf',6,1,'3',111,'S.M. Joshi'),(46,'History','Cover freedom movement stories.','2025-02-07 00:00:00','Freedom Movement',NULL,7,1,'4',111,'S.M. Joshi'),(47,'History','Use storytelling methods.','2025-02-08 00:00:00','Storytelling Session',NULL,8,1,'4',111,'S.M. Joshi'),(48,'Geography','Teach map reading skills.','2025-02-09 00:00:00','Map Reading','uploads/maps.pdf',9,1,'5',111,'S.M. Joshi'),(49,'Geography','Explain climate zones.','2025-02-10 00:00:00','Climate Zones',NULL,10,1,'5',111,'S.M. Joshi'),(50,'Art','Organize drawing competition.','2025-02-11 00:00:00','Art Activity',NULL,1,1,'6',111,'S.M. Joshi'),(51,'Art','Focus on creativity exercises.','2025-02-12 00:00:00','Creative Skills','uploads/art.pdf',2,1,'6',111,'S.M. Joshi'),(52,'Computer','Introduce basic computer parts.','2025-02-13 00:00:00','Computer Basics',NULL,3,1,'7',111,'S.M. Joshi'),(53,'Computer','Explain internet safety.','2025-02-14 00:00:00','Internet Safety','uploads/internet.pdf',4,1,'7',111,'S.M. Joshi'),(54,'Math','Prepare students for unit test.','2025-02-15 00:00:00','Unit Test Notice',NULL,5,1,'1',111,'S.M. Joshi'),(55,'Science','Revise previous science chapters.','2025-02-16 00:00:00','Revision Session',NULL,6,1,'2',111,'S.M. Joshi'),(56,'English','Practice writing short paragraphs.','2025-02-17 00:00:00','Writing Practice','uploads/writing.pdf',7,1,'3',111,'S.M. Joshi'),(57,'History','Discuss important national leaders.','2025-02-18 00:00:00','National Leaders',NULL,8,1,'4',111,'S.M. Joshi'),(58,'Geography','Explain natural resources.','2025-02-19 00:00:00','Natural Resources',NULL,9,1,'5',111,'S.M. Joshi'),(59,'Art','Conduct colouring activity.','2025-02-20 00:00:00','Colouring Activity',NULL,10,1,'6',111,'S.M. Joshi'),(60,'Computer','Practice typing skills.','2025-02-21 00:00:00','Typing Practice',NULL,1,1,'7',111,'S.M. Joshi'),(61,'Math','Use real-life examples in teaching.','2025-02-22 00:00:00','Practical Math',NULL,2,1,'1',111,'S.M. Joshi'),(62,'Science','Explain importance of plants.','2025-02-23 00:00:00','Plants and Life',NULL,3,1,'2',111,'S.M. Joshi'),(63,'English','Improve pronunciation skills.','2025-02-24 00:00:00','Pronunciation Practice',NULL,4,1,'3',111,'S.M. Joshi'),(64,'History','Revise past lessons.','2025-02-25 00:00:00','History Revision',NULL,5,1,'4',111,'S.M. Joshi'),(65,'Geography','Conduct map-based quiz.','2025-02-26 00:00:00','Map Quiz','uploads/map_quiz.pdf',6,1,'5',111,'S.M. Joshi'),(66,'Art','Encourage poster making.','2025-02-27 00:00:00','Poster Making',NULL,7,1,'6',111,'S.M. Joshi'),(67,'Computer','Teach basic MS Word.','2025-02-28 00:00:00','MS Word Basics',NULL,8,1,'7',111,'S.M. Joshi'),(68,'Math','Focus on problem-solving skills.','2025-03-01 00:00:00','Problem Solving',NULL,9,1,'1',111,'S.M. Joshi'),(69,'Science','Explain human body systems.','2025-03-02 00:00:00','Human Body','uploads/human_body.pdf',10,1,'2',111,'S.M. Joshi'),(70,'English','Conduct spelling test.','2025-03-03 00:00:00','Spelling Test',NULL,1,1,'3',111,'S.M. Joshi'),(71,'History','Explain constitution basics.','2025-03-04 00:00:00','Indian Constitution',NULL,2,1,'4',111,'S.M. Joshi'),(72,'Geography','Teach directions and symbols.','2025-03-05 00:00:00','Directions & Symbols',NULL,3,1,'5',111,'S.M. Joshi'),(73,'Art','Organize craft activity.','2025-03-06 00:00:00','Craft Activity',NULL,4,1,'6',111,'S.M. Joshi'),(74,'Computer','Introduce basic programming idea.','2025-03-07 00:00:00','Intro to Programming',NULL,5,1,'7',111,'S.M. Joshi');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `class_id` int DEFAULT NULL,
  `college_id` int DEFAULT NULL,
  `attendance` int DEFAULT NULL,
  `marks` float DEFAULT NULL,
  `behaviour_score` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `class_id` (`class_id`),
  KEY `college_id` (`college_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'om',1,1,2,8,6,111,'s.m.joshi'),(2,'ayesha',1,1,4,6,7,111,'s.m.joshi'),(3,'siddhi',1,1,7,1,3,111,'s.m.joshi'),(4,'shanta',1,1,100,1,1,111,'s.m.joshi'),(5,'sumit',1,1,7,2,6,111,'s.m.joshi'),(6,'ayush',1,1,2,5,8,111,'s.m.joshi'),(7,'manthan',1,1,8,4,1,111,'s.m.joshi'),(9,'shubham',1,1,6,3,2,111,'s.m.joshi'),(10,'aniket',1,1,8,2,4,111,'s.m.joshi'),(11,'prem',1,1,9,2,3,111,'s.m.joshi'),(12,'ram',1,1,45,3,8,111,'s.m.joshi'),(13,'Aryan',1,1,99,10,9,111,'s.m.joshi'),(14,'shivtej',1,1,44,12,7,111,'s.m.joshi'),(15,'roshan',1,1,55,34,6,111,'s.m.joshi'),(16,'om',1,1,66,44,1,111,'s.m.joshi'),(17,'vidya',1,1,0,66,8,111,'s.m.joshi'),(18,'Sahil',1,1,100,100,10,NULL,NULL),(19,'aisha inamdar',1,1,30,70,6,111,'s.m.joshi'),(20,'Rajveer',1,1,14,50,5,111,'s.m.joshi'),(21,'Abc',1,1,50,60,5,111,'s.m.joshi'),(26,'Virat',1,1,99,99,10,111,'s.m.joshi'),(27,'Sumit Patel ',1,1,25,85,9,111,'s.m.joshi'),(28,'Sanvi ',1,1,80,50,9,111,'s.m.joshi'),(29,'Siddhi Vilas Bahutule ',1,1,80,89,7,111,'S m joshi'),(30,'Anushri',1,1,77,50,2,111,'s.m.joshi'),(31,'Arun',1,1,77,34,10,111,'s.m.joshi'),(32,'Student32',1,1,85,72,7,111,'S.M. Joshi'),(33,'Student33',2,1,78,65,6,111,'S.M. Joshi'),(34,'Student34',3,1,92,81,8,111,'S.M. Joshi'),(35,'Student35',4,1,88,74,7,111,'S.M. Joshi'),(36,'Student36',5,1,69,55,5,111,'S.M. Joshi'),(37,'Student37',6,1,95,89,9,111,'S.M. Joshi'),(38,'Student38',7,1,73,61,6,111,'S.M. Joshi'),(39,'Student39',8,1,84,70,7,111,'S.M. Joshi'),(40,'Student40',9,1,90,86,9,111,'S.M. Joshi'),(41,'Student41',10,1,66,48,4,111,'S.M. Joshi'),(42,'Student42',1,1,87,76,8,111,'S.M. Joshi'),(43,'Student43',2,1,79,68,6,111,'S.M. Joshi'),(44,'Student44',3,1,91,84,8,111,'S.M. Joshi'),(45,'Student45',4,1,75,60,6,111,'S.M. Joshi'),(46,'Student46',5,1,82,71,7,111,'S.M. Joshi'),(47,'Student47',6,1,96,93,10,111,'S.M. Joshi'),(48,'Student48',7,1,68,52,5,111,'S.M. Joshi'),(49,'Student49',8,1,86,74,7,111,'S.M. Joshi'),(50,'Student50',9,1,93,88,9,111,'S.M. Joshi'),(51,'Student51',10,1,71,59,6,111,'S.M. Joshi'),(52,'Student52',1,1,88,77,8,111,'S.M. Joshi'),(53,'Student53',2,1,80,69,6,111,'S.M. Joshi'),(54,'Student54',3,1,94,90,9,111,'S.M. Joshi'),(55,'Student55',4,1,76,63,6,111,'S.M. Joshi'),(56,'Student56',5,1,83,72,7,111,'S.M. Joshi'),(57,'Student57',6,1,97,95,10,111,'S.M. Joshi'),(58,'Student58',7,1,67,50,4,111,'S.M. Joshi'),(59,'Student59',8,1,85,73,7,111,'S.M. Joshi'),(60,'Student60',9,1,92,87,9,111,'S.M. Joshi'),(61,'Student61',10,1,70,58,5,111,'S.M. Joshi'),(62,'Student62',1,1,89,79,8,111,'S.M. Joshi'),(63,'Student63',2,1,81,70,6,111,'S.M. Joshi'),(64,'Student64',3,1,93,88,9,111,'S.M. Joshi'),(65,'Student65',4,1,77,65,6,111,'S.M. Joshi'),(66,'Student66',5,1,84,74,7,111,'S.M. Joshi'),(67,'Student67',6,1,98,96,10,111,'S.M. Joshi'),(68,'Student68',7,1,69,54,5,111,'S.M. Joshi'),(69,'Student69',8,1,87,75,7,111,'S.M. Joshi'),(70,'Student70',9,1,94,89,9,111,'S.M. Joshi'),(71,'Student71',10,1,72,60,6,111,'S.M. Joshi'),(72,'Student72',1,1,86,78,8,111,'S.M. Joshi'),(73,'Student73',2,1,79,67,6,111,'S.M. Joshi'),(74,'Student74',3,1,92,85,9,111,'S.M. Joshi'),(75,'Student75',4,1,74,62,6,111,'S.M. Joshi'),(76,'Student76',5,1,81,70,7,111,'S.M. Joshi'),(77,'Student77',6,1,95,91,9,111,'S.M. Joshi'),(78,'Student78',7,1,66,49,4,111,'S.M. Joshi'),(79,'Student79',8,1,84,72,7,111,'S.M. Joshi'),(80,'Student80',9,1,91,86,9,111,'S.M. Joshi'),(81,'Student81',10,1,73,61,6,111,'S.M. Joshi'),(82,'Student82',1,1,88,80,8,111,'S.M. Joshi'),(83,'Student83',2,1,82,71,7,111,'S.M. Joshi'),(84,'Student84',3,1,94,90,9,111,'S.M. Joshi'),(85,'Student85',4,1,78,66,6,111,'S.M. Joshi'),(86,'Student86',5,1,85,75,7,111,'S.M. Joshi'),(87,'Student87',6,1,96,94,10,111,'S.M. Joshi'),(88,'Student88',7,1,70,55,5,111,'S.M. Joshi'),(89,'Student89',8,1,86,76,7,111,'S.M. Joshi'),(90,'Student90',9,1,93,88,9,111,'S.M. Joshi'),(91,'Student91',10,1,74,62,6,111,'S.M. Joshi'),(92,'Student92',1,1,89,81,8,111,'S.M. Joshi'),(93,'Student93',2,1,83,72,7,111,'S.M. Joshi'),(94,'Student94',3,1,95,92,10,111,'S.M. Joshi'),(95,'Student95',4,1,79,67,6,111,'S.M. Joshi'),(96,'Student96',5,1,86,76,7,111,'S.M. Joshi'),(97,'Student97',6,1,97,96,10,111,'S.M. Joshi'),(98,'Student98',7,1,71,56,5,111,'S.M. Joshi'),(99,'Student99',8,1,87,77,7,111,'S.M. Joshi'),(100,'Student100',9,1,94,89,9,111,'S.M. Joshi'),(101,'Student101',10,1,75,63,6,111,'S.M. Joshi');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_issues`
--

DROP TABLE IF EXISTS `teacher_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_issues` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `issue_description` text,
  `status` varchar(30) DEFAULT 'PENDING',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(100) DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `subject_id` (`subject_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `teacher_issues_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `teacher_issues_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `login` (`subject_id`),
  CONSTRAINT `teacher_issues_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_issues`
--

LOCK TABLES `teacher_issues` WRITE;
/*!40000 ALTER TABLE `teacher_issues` DISABLE KEYS */;
INSERT INTO `teacher_issues` VALUES (3,1,101,1,'hello its description about 1st demo','PENDING','2026-01-12 13:59:35','first category',111,'s.m.joshi'),(4,1,101,1,'rfed','PENDING','2026-01-12 14:33:01','gf',111,'s.m.joshi'),(5,1,101,1,'Technical gadgets shortage','PENDING','2026-01-12 14:37:44','It Support',111,'s.m.joshi'),(6,1,101,1,'yt','PENDING','2026-01-12 14:38:24','ygfd',111,'s.m.joshi'),(7,1,101,1,'ljhg','PENDING','2026-01-12 14:40:16','og',111,'s.m.joshi'),(8,1,101,1,'Students are not coming for the regular lectures','PENDING','2026-01-12 14:43:16','Poor Attendance of students',111,'s.m.joshi'),(9,1,101,1,'every students behavior and grasping power is different','PENDING','2026-01-12 14:54:34','Behaviour problem of student',111,'s.m.joshi'),(10,1,101,1,'mentor visits are less frequent','PENDING','2026-01-12 14:56:17','consultancy',111,'s.m.joshi'),(11,1,101,1,'dfg','PENDING','2026-01-12 15:29:06','dfg',111,'s.m.joshi'),(12,1,101,1,'infrastructure','PENDING','2026-01-13 12:28:47','it',111,'s.m.joshi'),(13,1,101,1,'poor internet connections','PENDING','2026-01-13 12:47:54','internet',111,'s.m.joshi'),(14,1,101,1,'Students are facing difficulty understanding basic addition concepts.','OPEN','2025-01-05 10:15:00','Academic',111,'S.M. Joshi'),(15,2,101,2,'Need additional worksheets for practice sessions.','IN_PROGRESS','2025-01-06 11:00:00','Academic',111,'S.M. Joshi'),(16,3,105,3,'Science lab equipment not sufficient for all students.','OPEN','2025-01-07 09:45:00','Infrastructure',111,'S.M. Joshi'),(17,3,105,4,'Audio system not working properly during science videos.','RESOLVED','2025-01-08 12:30:00','Technical',111,'S.M. Joshi'),(18,4,104,5,'Students need more time to complete grammar exercises.','OPEN','2025-01-09 10:10:00','Academic',111,'S.M. Joshi'),(19,5,104,6,'Request to schedule extra English reading sessions.','IN_PROGRESS','2025-01-10 11:40:00','Administrative',111,'S.M. Joshi'),(20,6,106,7,'History syllabus completion delayed due to holidays.','OPEN','2025-01-11 09:20:00','Administrative',111,'S.M. Joshi'),(21,7,107,8,'World map chart required for geography lessons.','RESOLVED','2025-01-12 01:15:00','Infrastructure',111,'S.M. Joshi'),(22,8,108,9,'Art supplies like colours and drawing sheets are insufficient.','OPEN','2025-01-13 10:50:00','Infrastructure',111,'S.M. Joshi'),(23,9,110,10,'Computer lab systems are running slow during practical sessions.','IN_PROGRESS','2025-01-14 02:00:00','Technical',111,'S.M. Joshi'),(24,1,101,1,'no food available','PENDING','2026-01-20 15:01:07','canteen',111,'s.m.joshi'),(145,10,101,1,'Students struggle with basic addition concepts','OPEN','2025-01-01 10:00:00','Academic',NULL,'S.M. Joshi'),(146,11,101,2,'Need more practice worksheets','IN_PROGRESS','2025-01-02 11:00:00','Academic',NULL,'S.M. Joshi'),(147,12,104,3,'Low reading comprehension among students','OPEN','2025-01-03 09:30:00','Academic',NULL,'S.M. Joshi'),(148,13,105,4,'Science charts are outdated','RESOLVED','2025-01-04 12:15:00','Infrastructure',NULL,'S.M. Joshi'),(149,14,102,5,'Students face difficulty in Marathi grammar','OPEN','2025-01-05 10:45:00','Academic',NULL,'S.M. Joshi'),(215,15,103,6,'Hindi textbooks insufficient','IN_PROGRESS','2025-01-06 11:00:00','Infrastructure',NULL,'S.M. Joshi'),(216,16,101,7,'Math lab tools missing','OPEN','2025-01-07 09:30:00','Infrastructure',NULL,'S.M. Joshi'),(217,17,105,8,'Science audio system issue','RESOLVED','2025-01-08 12:10:00','Technical',NULL,'S.M. Joshi'),(218,18,104,9,'Writing practice needed','OPEN','2025-01-09 10:40:00','Academic',NULL,'S.M. Joshi'),(219,19,106,10,'History syllabus delay','IN_PROGRESS','2025-01-10 11:25:00','Administrative',NULL,'S.M. Joshi'),(220,20,107,1,'Geography maps required','OPEN','2025-01-11 09:15:00','Infrastructure',NULL,'S.M. Joshi'),(221,21,108,2,'Art supplies shortage','RESOLVED','2025-01-12 12:00:00','Infrastructure',NULL,'S.M. Joshi'),(222,22,110,3,'Computer systems slow','OPEN','2025-01-13 10:35:00','Technical',NULL,'S.M. Joshi'),(223,23,101,4,'Multiplication concepts weak','IN_PROGRESS','2025-01-14 11:05:00','Academic',NULL,'S.M. Joshi'),(224,24,105,5,'Need activity-based science','OPEN','2025-01-15 09:50:00','Academic',NULL,'S.M. Joshi'),(225,25,104,6,'Grammar worksheets required','RESOLVED','2025-01-16 12:20:00','Academic',NULL,'S.M. Joshi'),(226,26,102,7,'Language barrier issues','OPEN','2025-01-17 10:10:00','Academic',NULL,'S.M. Joshi'),(227,27,103,8,'Hindi audio lessons needed','IN_PROGRESS','2025-01-18 11:40:00','Technical',NULL,'S.M. Joshi'),(228,28,106,9,'Storytelling approach needed','OPEN','2025-01-19 09:55:00','Academic',NULL,'S.M. Joshi'),(229,29,109,10,'Sports equipment missing','RESOLVED','2025-01-20 12:45:00','Infrastructure',NULL,'S.M. Joshi'),(230,30,101,1,'Parents not supporting homework','OPEN','2025-01-21 10:00:00','Administrative',NULL,'S.M. Joshi'),(231,31,105,2,'Science lab overcrowded','IN_PROGRESS','2025-01-22 11:20:00','Infrastructure',NULL,'S.M. Joshi'),(232,32,104,3,'Students shy in speaking English','OPEN','2025-01-23 09:35:00','Academic',NULL,'S.M. Joshi'),(233,33,107,4,'Globe required for geography','RESOLVED','2025-01-24 12:15:00','Infrastructure',NULL,'S.M. Joshi'),(234,34,108,5,'Need creative art ideas','OPEN','2025-01-25 10:55:00','Academic',NULL,'S.M. Joshi'),(235,35,110,6,'Internet slow in lab','IN_PROGRESS','2025-01-26 11:35:00','Technical',NULL,'S.M. Joshi'),(236,36,101,7,'Word problems confusing','OPEN','2025-01-27 09:10:00','Academic',NULL,'S.M. Joshi'),(237,37,105,8,'Science kits missing','RESOLVED','2025-01-28 12:00:00','Infrastructure',NULL,'S.M. Joshi'),(238,38,104,9,'Need more story books','OPEN','2025-01-29 10:20:00','Academic',NULL,'S.M. Joshi'),(239,39,106,10,'Time management issue','IN_PROGRESS','2025-01-30 11:50:00','Administrative',NULL,'S.M. Joshi'),(240,40,107,1,'Map reading difficult','OPEN','2025-01-31 09:35:00','Academic',NULL,'S.M. Joshi'),(241,1,101,1,'we don\'t want daily college','PENDING','2026-01-24 16:34:50','daily college',111,'s.m.joshi');
/*!40000 ALTER TABLE `teacher_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `subject_id` int DEFAULT NULL,
  `college_id` int DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  `cluster` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `email` (`email`),
  KEY `subject_id` (`subject_id`),
  KEY `college_id` (`college_id`),
  KEY `fk_class` (`class_id`),
  CONSTRAINT `fk_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `login` (`subject_id`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'ayesha','siddhivilas26@gmail.com','123',101,1,5,'hod',1,'0012-12-12','math',111,'s.m.joshi','C'),(2,'om','s222222@gmail.com','123',101,1,4,'asst. hod',1,'2009-09-12','math',111,'s.m.joshi','A'),(3,'Sneha Kulkarni','sneha.k@edu.in','sneha@123',105,2,6,'Teacher',3,'2019-08-15','Science',111,'s.m.joshi','A'),(4,'Vijay Pawar','vijay.p@edu.in','vijay@123',102,2,12,'Senior Teacher',4,'2013-05-20','Marathi',111,'s.m.joshi','A'),(5,'Neha Jadhav','neha.j@edu.in','neha@123',103,3,5,'Assistant Teacher',5,'2020-06-10','Hindi',111,'s.m.joshi','B'),(6,'Sunil Shinde','sunil.s@edu.in','sunil@123',106,3,9,'Teacher',2,'2016-04-18','History',111,'s.m.joshi','B'),(7,'Pooja More','pooja.m@edu.in','pooja@123',107,1,4,'Assistant Teacher',3,'2021-01-05','Geography',111,'s.m.joshi','B'),(8,'Amit Kale','amit.k@edu.in','amit@123',110,2,7,'Teacher',4,'2018-09-09','Computer',111,'s.m.joshi','B'),(9,'Kavita Joshi','kavita.j@edu.in','kavita@123',108,3,11,'Senior Teacher',1,'2012-03-22','Art',111,'s.m.joshi',NULL),(10,'Rahul Patankar','rahul.p@edu.in','rahul@123',109,1,6,'Teacher',5,'2019-11-11','PE',111,'s.m.joshi','c'),(11,'Asha Patil','asha10@edu.in','teach@123',101,1,12,'Senior Teacher',1,'2014-06-01','Math',111,'S.M. Joshi','A'),(12,'Ravi Kulkarni','ravi11@edu.in','teach@123',101,1,8,'Teacher',2,'2017-07-15','Math',111,'S.M. Joshi','A'),(13,'Sneha Deshmukh','sneha12@edu.in','teach@123',104,1,6,'Teacher',3,'2019-08-10','English',111,'S.M. Joshi','A'),(14,'Vikas Pawar','vikas13@edu.in','teach@123',105,1,9,'Teacher',4,'2016-05-20','Science',111,'S.M. Joshi','A'),(15,'Neha Jadhav','neha14@edu.in','teach@123',102,1,5,'Assistant Teacher',5,'2020-06-12','Marathi',111,'S.M. Joshi','A'),(16,'Sunil Patil','sunil15@edu.in','teach@123',103,1,11,'Senior Teacher',6,'2013-04-18','Hindi',111,'S.M. Joshi','A'),(17,'Pooja More','pooja16@edu.in','teach@123',101,1,7,'Teacher',7,'2018-01-05','Math',111,'S.M. Joshi','A'),(18,'Amit Kale','amit17@edu.in','teach@123',105,1,10,'Teacher',8,'2015-09-09','Science',111,'S.M. Joshi','A'),(19,'Kavita Joshi','kavita18@edu.in','teach@123',104,1,13,'Senior Teacher',9,'2012-03-22','English',111,'S.M. Joshi','A'),(20,'Rahul Patankar','rahul19@edu.in','teach@123',106,1,6,'Teacher',10,'2019-11-11','History',111,'S.M. Joshi','A'),(21,'Meena Patil','meena20@edu.in','teach@123',107,1,8,'Teacher',1,'2017-06-10','Geography',111,'S.M. Joshi','B'),(22,'Suresh Pawar','suresh21@edu.in','teach@123',108,1,9,'Teacher',2,'2016-07-11','Art',111,'S.M. Joshi','B'),(23,'Nisha Kulkarni','nisha22@edu.in','teach@123',110,1,7,'Teacher',3,'2018-08-12','Computer',111,'S.M. Joshi','B'),(24,'Mahesh Patil','mahesh23@edu.in','teach@123',109,1,11,'Senior Teacher',4,'2013-05-01','PE',111,'S.M. Joshi','B'),(25,'Rutuja Desai','rutuja24@edu.in','teach@123',101,1,6,'Teacher',5,'2019-02-15','Math',111,'S.M. Joshi','B'),(26,'Ganesh More','ganesh25@edu.in','teach@123',105,1,10,'Teacher',6,'2015-10-20','Science',111,'S.M. Joshi','B'),(27,'Smita Joshi','smita26@edu.in','teach@123',104,1,12,'Senior Teacher',7,'2012-07-07','English',111,'S.M. Joshi','B'),(28,'Rohit Shinde','rohit27@edu.in','teach@123',102,1,5,'Assistant Teacher',8,'2020-01-01','Marathi',111,'S.M. Joshi','B'),(29,'Anjali Patankar','anjali28@edu.in','teach@123',103,1,9,'Teacher',9,'2016-09-09','Hindi',111,'S.M. Joshi','B'),(30,'Pravin Jadhav','pravin29@edu.in','teach@123',106,1,8,'Teacher',10,'2017-11-11','History',111,'S.M. Joshi','B'),(31,'Lata Pawar','lata30@edu.in','teach@123',101,1,14,'Senior Teacher',1,'2011-06-01','Math',111,'S.M. Joshi','C'),(32,'Bharat Kale','bharat31@edu.in','teach@123',105,1,7,'Teacher',2,'2018-07-15','Science',111,'S.M. Joshi','C'),(33,'Savita More','savita32@edu.in','teach@123',104,1,6,'Teacher',3,'2019-08-10','English',111,'S.M. Joshi','C'),(34,'Deepak Patil','deepak33@edu.in','teach@123',102,1,10,'Teacher',4,'2015-05-20','Marathi',111,'S.M. Joshi','C'),(35,'Rekha Jadhav','rekha34@edu.in','teach@123',103,1,8,'Teacher',5,'2017-06-12','Hindi',111,'S.M. Joshi','C'),(36,'Umesh Joshi','umesh35@edu.in','teach@123',107,1,9,'Teacher',6,'2016-04-18','Geography',111,'S.M. Joshi','C'),(37,'Pallavi Patil','pallavi36@edu.in','teach@123',108,1,6,'Teacher',7,'2019-01-05','Art',111,'S.M. Joshi','C'),(38,'Akash More','akash37@edu.in','teach@123',110,1,7,'Teacher',8,'2018-09-09','Computer',111,'S.M. Joshi','C'),(39,'Sonal Pawar','sonal38@edu.in','teach@123',109,1,11,'Senior Teacher',9,'2013-03-22','PE',111,'S.M. Joshi','C'),(40,'Nitin Shinde','nitin39@edu.in','teach@123',106,1,8,'Teacher',10,'2017-11-11','History',111,'S.M. Joshi','C');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_college_mapping`
--

DROP TABLE IF EXISTS `trainer_college_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_college_mapping` (
  `mapping_id` int NOT NULL AUTO_INCREMENT,
  `trainer_id` int DEFAULT NULL,
  `college_id` int DEFAULT NULL,
  PRIMARY KEY (`mapping_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `college_id` (`college_id`),
  CONSTRAINT `trainer_college_mapping_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  CONSTRAINT `trainer_college_mapping_ibfk_2` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_college_mapping`
--

LOCK TABLES `trainer_college_mapping` WRITE;
/*!40000 ALTER TABLE `trainer_college_mapping` DISABLE KEYS */;
INSERT INTO `trainer_college_mapping` VALUES (14,1,1),(15,1,2),(16,2,1),(17,2,3),(18,3,1),(19,4,2),(20,5,1),(21,5,2),(22,6,3),(23,7,1),(24,8,2),(25,9,3),(26,10,1);
/*!40000 ALTER TABLE `trainer_college_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_subject_mapping`
--

DROP TABLE IF EXISTS `trainer_subject_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_subject_mapping` (
  `mapping_id` int NOT NULL AUTO_INCREMENT,
  `trainer_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`mapping_id`),
  KEY `trainer_id` (`trainer_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `trainer_subject_mapping_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  CONSTRAINT `trainer_subject_mapping_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `login` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_subject_mapping`
--

LOCK TABLES `trainer_subject_mapping` WRITE;
/*!40000 ALTER TABLE `trainer_subject_mapping` DISABLE KEYS */;
INSERT INTO `trainer_subject_mapping` VALUES (1,1,101),(2,1,102),(3,2,103),(4,2,104),(5,3,105),(6,4,106),(7,5,107),(8,5,110),(9,6,102),(10,7,101),(11,8,108),(12,9,109),(13,10,103);
/*!40000 ALTER TABLE `trainer_subject_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_videos`
--

DROP TABLE IF EXISTS `trainer_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `upload_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `video_url` varchar(500) DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `subject_id` (`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_videos`
--

LOCK TABLES `trainer_videos` WRITE;
/*!40000 ALTER TABLE `trainer_videos` DISABLE KEYS */;
INSERT INTO `trainer_videos` VALUES (13,'Math','Trainer Math Session 1','2025-05-01 00:00:00','https://www.youtube.com/live/anhbMmxLSiU?si=4Kn8Q60KPyAZMsgO',111,'S.M. Joshi'),(14,'Math','Trainer Math Session 2','2025-05-02 00:00:00','https://www.youtube.com/live/13lhhdfulYk?si=oobSjHUKZs77lDjm',111,'S.M. Joshi'),(15,'Math','Trainer Math Session 3','2025-05-03 00:00:00','https://www.youtube.com/live/uIgfE1yWHMs?si=zh9EfeHz5D4D2Kq7',111,'S.M. Joshi'),(16,'Math','Trainer Math Session 4','2025-05-04 00:00:00','https://www.youtube.com/live/HvwaRsvUwQI?si=qHxnjrwW-2Q_1Slk',111,'S.M. Joshi'),(17,'Math','Trainer Math Session 5','2025-05-05 00:00:00','https://www.youtube.com/live/KNJntHXUrOA?si=aukddbQU5E5aW-uL',111,'S.M. Joshi'),(18,'Math','Trainer Math Session 6','2025-05-06 00:00:00','https://www.youtube.com/live/m5mKtzU7T9I?si=n2ZN27AjjYXTkqQR',111,'S.M. Joshi'),(19,'Math','Trainer Math Session 7','2025-05-07 00:00:00','https://www.youtube.com/live/kFsw5NbaN5s?si=6-3LnVTq8dhSogUM',111,'S.M. Joshi'),(20,'Math','Trainer Math Session 8','2025-05-08 00:00:00','https://www.youtube.com/live/qeh_IpVwj2M?si=CWxOjEyk_Jhx0Zlm',111,'S.M. Joshi'),(21,'Math','Trainer Math Session 9','2025-05-09 00:00:00','https://www.youtube.com/live/ny8YWy_-aqA?si=w_dwdlG0u25GR6q9',111,'S.M. Joshi'),(22,'Math','Trainer Math Session 10','2025-05-10 00:00:00','https://www.youtube.com/live/SuZH0OxsXE0?si=CoBL5bTAiPhGhdYJ',111,'S.M. Joshi'),(23,'math','Lessons','2026-01-24 15:08:27','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(24,'math','Lessons','2026-01-24 15:10:00','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(25,'math','Lessonsss','2026-01-24 15:16:39','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(26,'math','heavy','2026-01-24 15:41:42','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(27,'math','heavy','2026-01-24 15:48:09','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(28,'math','heavy','2026-01-24 15:50:10','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(29,'math','heavy','2026-01-24 15:59:21','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'s.m.joshi'),(30,'math','heavy','2026-01-24 16:02:01','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'S.M.Joshi'),(31,'math','heavy','2026-01-24 16:13:02','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'S.M.Joshi'),(32,'math','om chaudhari','2026-01-24 16:13:29','https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',111,'S.M.Joshi');
/*!40000 ALTER TABLE `trainer_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `trainer_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'ACTIVE',
  `subject_id` int DEFAULT NULL,
  `subject_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'kuch toh hai','siddhivilas26@gmail.com','123','Trainer','Active',101,'math'),(2,'Aryan','aryan1109@gmail.com','123','Trainer','Active',102,'science'),(3,'Meena Deshmukh','meena.d@diet.gov.in','trainer@123','English Trainer','ACTIVE',104,'English'),(4,'Rahul Pawar','rahul.p@diet.gov.in','trainer@123','History Trainer','ACTIVE',106,'History'),(5,'Kavita Joshi','kavita.j@diet.gov.in','trainer@123','Geography Trainer','ACTIVE',107,'Geography'),(6,'Amit Shinde','amit.s@diet.gov.in','trainer@123','Art Trainer','ACTIVE',108,'Art'),(7,'Neha More','neha.m@diet.gov.in','trainer@123','Computer Trainer','ACTIVE',110,'CS'),(8,'Prakash Jadhav','prakash.j@diet.gov.in','trainer@123','EVS Trainer','ACTIVE',109,'PE'),(9,'Sunita Kale','sunita.k@diet.gov.in','trainer@123','Marathi Trainer','ACTIVE',102,'Marathi'),(10,'Vijay Patankar','vijay.p@diet.gov.in','trainer@123','Hindi Trainer','ACTIVE',103,'Hindi'),(11,'Ramesh Patil','ramesh.p@diet.gov.in','trainer@123','Math Trainer','ACTIVE',101,'Mathematics'),(12,'Shubhangi Desai','shubhangi.d@diet.gov.in','trainer@123','Science Trainer','ACTIVE',105,'Science'),(13,'Deepak More','deepak.m@diet.gov.in','trainer@123','English Trainer','ACTIVE',104,'English'),(14,'Poonam Chavan','poonam.c@diet.gov.in','trainer@123','History Trainer','ACTIVE',106,'History'),(15,'Ajay Kulkarni','ajay.k@diet.gov.in','trainer@123','Geography Trainer','ACTIVE',107,'Geography'),(16,'Smita Joshi','smita.j@diet.gov.in','trainer@123','Art Trainer','ACTIVE',108,'Art'),(17,'Nitin Shinde','nitin.s@diet.gov.in','trainer@123','Computer Trainer','ACTIVE',110,'CS'),(18,'Asha Pawar','asha.p@diet.gov.in','trainer@123','EVS Trainer','ACTIVE',109,'PE'),(19,'Mahesh Patankar','mahesh.p@diet.gov.in','trainer@123','Marathi Trainer','ACTIVE',102,'Marathi'),(20,'Pallavi Jadhav','pallavi.j@diet.gov.in','trainer@123','Hindi Trainer','ACTIVE',103,'Hindi'),(21,'Kiran Patil','kiran.p@diet.gov.in','trainer@123','Math Trainer','ACTIVE',101,'Mathematics'),(22,'Snehal Deshmukh','snehal.d@diet.gov.in','trainer@123','Science Trainer','ACTIVE',105,'Science'),(23,'Rohit Kulkarni','rohit.k@diet.gov.in','trainer@123','English Trainer','ACTIVE',104,'English'),(24,'Seema More','seema.m@diet.gov.in','trainer@123','History Trainer','ACTIVE',106,'History'),(25,'Sanjay Patil','sanjay.p@diet.gov.in','trainer@123','Geography Trainer','ACTIVE',107,'Geography'),(26,'Manisha Joshi','manisha.j@diet.gov.in','trainer@123','Art Trainer','ACTIVE',108,'Art'),(27,'Akash Shinde','akash.s@diet.gov.in','trainer@123','Computer Trainer','ACTIVE',110,'CS'),(28,'Rekha Pawar','rekha.p@diet.gov.in','trainer@123','EVS Trainer','ACTIVE',109,'PE'),(29,'Pravin Chavan','pravin.c@diet.gov.in','trainer@123','Marathi Trainer','ACTIVE',102,'Marathi'),(30,'Nisha Kulkarni','nisha.k@diet.gov.in','trainer@123','Hindi Trainer','ACTIVE',103,'Hindi'),(31,'Ganesh Patil','ganesh.p@diet.gov.in','trainer@123','Math Trainer','ACTIVE',101,'Mathematics'),(32,'Aarti Desai','aarti.d@diet.gov.in','trainer@123','Science Trainer','ACTIVE',105,'Science'),(33,'Swapnil More','swapnil.m@diet.gov.in','trainer@123','English Trainer','ACTIVE',104,'English'),(34,'Vaishali Jadhav','vaishali.j@diet.gov.in','trainer@123','History Trainer','ACTIVE',106,'History'),(35,'Umesh Shinde','umesh.s@diet.gov.in','trainer@123','Geography Trainer','ACTIVE',107,'Geography'),(36,'Priti Joshi','priti.j@diet.gov.in','trainer@123','Art Trainer','ACTIVE',108,'Art'),(37,'Rohan Patil','rohan.p@diet.gov.in','trainer@123','Computer Trainer','ACTIVE',110,'CS'),(38,'Sonal Pawar','sonal.p@diet.gov.in','trainer@123','EVS Trainer','ACTIVE',109,'PE'),(39,'Dilip Kulkarni','dilip.k@diet.gov.in','trainer@123','Marathi Trainer','ACTIVE',102,'Marathi'),(40,'Madhuri Deshmukh','madhuri.d@diet.gov.in','trainer@123','Hindi Trainer','ACTIVE',103,'Hindi'),(41,'Vikas Patil','vikas.p@diet.gov.in','trainer@123','Math Trainer','INACTIVE',101,'Mathematics'),(42,'Rutuja More','rutuja.m@diet.gov.in','trainer@123','Science Trainer','INACTIVE',105,'Science'),(43,'Sagar Kulkarni','sagar.k@diet.gov.in','trainer@123','English Trainer','INACTIVE',104,'English'),(44,'Komal Jadhav','komal.j@diet.gov.in','trainer@123','History Trainer','INACTIVE',106,'History'),(45,'Yogesh Shinde','yogesh.s@diet.gov.in','trainer@123','Geography Trainer','INACTIVE',107,'Geography'),(46,'Bhavana Joshi','bhavana.j@diet.gov.in','trainer@123','Art Trainer','INACTIVE',108,'Art'),(47,'Kunal Patil','kunal.p@diet.gov.in','trainer@123','Computer Trainer','INACTIVE',110,'CS'),(48,'Sujata Pawar','sujata.p@diet.gov.in','trainer@123','EVS Trainer','INACTIVE',109,'PE'),(49,'Milind Desai','milind.d@diet.gov.in','trainer@123','Marathi Trainer','INACTIVE',102,'Marathi'),(50,'Pankaj Kulkarni','pankaj.k@diet.gov.in','trainer@123','Hindi Trainer','INACTIVE',103,'Hindi');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_modules`
--

DROP TABLE IF EXISTS `training_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_modules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `cluster` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_modules`
--

LOCK TABLES `training_modules` WRITE;
/*!40000 ALTER TABLE `training_modules` DISABLE KEYS */;
INSERT INTO `training_modules` VALUES (62,'Strategies to improve student attendance through daily check-ins and parent communication.\nIncludes simple tools for tracking absenteeism and motivating regular attendance.\nFocuses on building trust with parents.','A','2025-03-01 04:30:00'),(63,'Classroom behaviour management techniques for large classrooms.\nCovers positive reinforcement, clear rules, and student responsibility.\nDesigned for schools facing frequent disruptions.','A','2025-03-02 05:00:00'),(64,'Parent awareness programs to highlight the importance of education.\nIncludes ideas for meetings, local language communication, and community involvement.\nHelps reduce dropout rates.','A','2025-03-03 05:30:00'),(65,'Managing mixed-ability classrooms effectively.\nProvides grouping strategies and peer learning techniques.\nHelps teachers balance fast and slow learners.','A','2025-03-04 06:00:00'),(66,'Reducing student absenteeism using school-level data.\nExplains how to identify patterns and take timely action.\nEncourages proactive teacher intervention.','A','2025-03-05 06:30:00'),(67,'Using advanced Teaching Learning Materials (TLMs) for science classes.\nDemonstrates low-cost experiments and visual aids.\nEnhances conceptual understanding.','B','2025-03-06 04:30:00'),(68,'Encouraging higher-order thinking skills among high-performing students.\nFocuses on problem-solving and analytical questions.\nSuitable for competitive exam readiness.','B','2025-03-07 05:00:00'),(69,'Integrating digital tools in daily teaching.\nCovers use of videos, simulations, and online quizzes.\nImproves engagement and learning outcomes.','B','2025-03-08 05:30:00'),(70,'Designing project-based learning activities.\nGuides teachers to create real-life application projects.\nBoosts creativity and teamwork.','B','2025-03-09 06:00:00'),(71,'Assessment techniques beyond written exams.\nIncludes oral tests, peer assessment, and activity-based evaluation.\nSupports holistic student development.','B','2025-03-10 06:30:00'),(72,'Language contextualisation for tribal and rural students.\nSuggests using local examples and mother tongue support.\nImproves comprehension and participation.','C','2025-03-11 04:30:00'),(73,'Teaching concepts using culturally relevant examples.\nAligns lessons with local traditions and daily life.\nMakes learning more relatable.','C','2025-03-12 05:00:00'),(74,'Multilingual teaching strategies for early grades.\nExplains gradual transition from local language to state language.\nReduces learning gaps.','C','2025-03-13 05:30:00'),(75,'Supporting first-generation learners in classrooms.\nFocuses on confidence building and foundational skills.\nEncourages inclusive teaching practices.','C','2025-03-14 06:00:00'),(76,'Designing low-resource teaching activities.\nUses locally available materials for demonstrations.\nIdeal for remote schools.','C','2025-03-15 06:30:00'),(77,'Using classroom feedback to improve teaching methods.\nShows how small changes can have big impact.\nEncourages reflective teaching.','A','2025-03-16 04:30:00'),(78,'Micro-learning modules for teacher self-development.\nShort lessons focusing on one skill at a time.\nSupports continuous professional growth.','B','2025-03-17 05:00:00'),(79,'Using student performance data to plan lessons.\nHelps identify weak areas quickly.\nEnables targeted teaching.','A','2025-03-18 05:30:00'),(80,'Blending online and offline teaching methods.\nExplains how to combine videos with classroom discussion.\nImproves flexibility in teaching.','B','2025-03-19 06:00:00'),(81,'Creating inclusive classrooms for diverse learners.\nAddresses learning differences and social inclusion.\nBuilds a positive classroom environment.','C','2025-03-20 06:30:00');
/*!40000 ALTER TABLE `training_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `video_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `description` text NOT NULL,
  `upload_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `school_id` int DEFAULT NULL,
  `school_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`video_id`),
  KEY `subject_id` (`subject_id`),
  KEY `class_id` (`class_id`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `login` (`subject_id`),
  CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `videos_ibfk_3` FOREIGN KEY (`uploaded_by`) REFERENCES `trainers` (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (48,'Math Live Session 1',101,1,'Hindi','https://www.youtube.com/live/anhbMmxLSiU?si=4Kn8Q60KPyAZMsgO',1,'Math live video 1','2025-03-01 00:00:00',111,'S.M. Joshi'),(49,'Math Live Session 2',101,2,'Hindi','https://www.youtube.com/live/13lhhdfulYk?si=oobSjHUKZs77lDjm',1,'Math live video 2','2025-03-02 00:00:00',111,'S.M. Joshi'),(50,'Math Live Session 3',101,3,'Hindi','https://www.youtube.com/live/uIgfE1yWHMs?si=zh9EfeHz5D4D2Kq7',1,'Math live video 3','2025-03-03 00:00:00',111,'S.M. Joshi'),(51,'Math Live Session 4',101,4,'Hindi','https://www.youtube.com/live/HvwaRsvUwQI?si=qHxnjrwW-2Q_1Slk',1,'Math live video 4','2025-03-04 00:00:00',111,'S.M. Joshi'),(52,'Math Live Session 5',101,5,'Hindi','https://www.youtube.com/live/KNJntHXUrOA?si=aukddbQU5E5aW-uL',1,'Math live video 5','2025-03-05 00:00:00',111,'S.M. Joshi'),(53,'Math Live Session 6',101,6,'Hindi','https://www.youtube.com/live/m5mKtzU7T9I?si=n2ZN27AjjYXTkqQR',1,'Math live video 6','2025-03-06 00:00:00',111,'S.M. Joshi'),(54,'Math Live Session 7',101,7,'Hindi','https://www.youtube.com/live/kFsw5NbaN5s?si=6-3LnVTq8dhSogUM',1,'Math live video 7','2025-03-07 00:00:00',111,'S.M. Joshi'),(55,'Math Live Session 8',101,8,'Hindi','https://www.youtube.com/live/qeh_IpVwj2M?si=CWxOjEyk_Jhx0Zlm',1,'Math live video 8','2025-03-08 00:00:00',111,'S.M. Joshi'),(56,'Math Live Session 9',101,9,'Hindi','https://www.youtube.com/live/ny8YWy_-aqA?si=w_dwdlG0u25GR6q9',1,'Math live video 9','2025-03-09 00:00:00',111,'S.M. Joshi'),(57,'Math Live Session 10',101,10,'Hindi','https://www.youtube.com/live/SuZH0OxsXE0?si=CoBL5bTAiPhGhdYJ',1,'Math live video 10','2025-03-10 00:00:00',111,'S.M. Joshi'),(58,'Science Live Session 1',102,1,'Hindi','https://youtu.be/quCJ5juoYBs?si=LY8U4_ROfJ8-vRWh',1,'Science live video for Class 1','2025-03-11 00:00:00',111,'S.M. Joshi'),(59,'Science Live Session 2',102,2,'Hindi','https://youtu.be/hoXJug74VCI?si=4wgLMgggq8R5N_9G',1,'Science live video for Class 2','2025-03-12 00:00:00',111,'S.M. Joshi'),(60,'Science Live Session 3',102,3,'Hindi','https://youtu.be/ybovMbXu0Ac?si=yqLs9hMAIEcD9nol',1,'Science live video for Class 3','2025-03-13 00:00:00',111,'S.M. Joshi'),(61,'Science Live Session 4',102,4,'Hindi','https://youtu.be/p78Xmj_hgX4?si=ZgSlsouqPpxtDGlC',1,'Science live video for Class 4','2025-03-14 00:00:00',111,'S.M. Joshi'),(62,'Science Live Session 5',102,5,'Hindi','https://youtu.be/7KcnuLguVqU?si=Fror0AYyBC2KjhN3',1,'Science live video for Class 5','2025-03-15 00:00:00',111,'S.M. Joshi'),(63,'Science Live Session 6',102,6,'Hindi','https://youtu.be/lwQAPAO4JpI?si=oH_-RnC0jt0itkZs',1,'Science live video for Class 6','2025-03-16 00:00:00',111,'S.M. Joshi'),(64,'Science Live Session 7',102,7,'Hindi','https://youtu.be/_dKAPpk4WPg?si=-TARIAwOfyaywZXS',1,'Science live video for Class 7','2025-03-17 00:00:00',111,'S.M. Joshi'),(65,'Science Live Session 8',102,8,'Hindi','https://youtu.be/JKnCAEiIdio?si=C_HbWFNfwbiPWW3C',1,'Science live video for Class 8','2025-03-18 00:00:00',111,'S.M. Joshi'),(66,'Science Live Session 9',102,9,'Hindi','https://youtu.be/Nf7KBaX_LWs?si=uITfb4FSItLCu4CO',1,'Science live video for Class 9','2025-03-19 00:00:00',111,'S.M. Joshi'),(67,'Science Live Session 10',102,10,'Hindi','https://youtu.be/6gZZTiiryQU?si=TpYXGieEAiXaY3c_',1,'Science live video for Class 10','2025-03-20 00:00:00',111,'S.M. Joshi'),(68,'SST Live Session 1',103,1,'Hindi','https://www.youtube.com/live/0ljIeQCuFow?si=het9nqFdCX_GyiYe',1,'SST live video for Class 1','2025-03-21 00:00:00',111,'S.M. Joshi'),(69,'SST Live Session 2',103,2,'Hindi','https://www.youtube.com/live/qR771sVu4Jo?si=_kcw9w19hA6h9h6B',1,'SST live video for Class 2','2025-03-22 00:00:00',111,'S.M. Joshi'),(70,'SST Live Session 3',103,3,'Hindi','https://www.youtube.com/live/rm7TYrOALH4?si=Mv3As7P-fduuBVKi',1,'SST live video for Class 3','2025-03-23 00:00:00',111,'S.M. Joshi'),(71,'SST Live Session 4',103,4,'Hindi','https://www.youtube.com/live/jDfoAk_v1Io?si=ZKxdA1idtbITsspr',1,'SST live video for Class 4','2025-03-24 00:00:00',111,'S.M. Joshi'),(72,'SST Live Session 5',103,5,'Hindi','https://www.youtube.com/live/XtQUnY-jdKU?si=u95B_ULLOC0m7O66',1,'SST live video for Class 5','2025-03-25 00:00:00',111,'S.M. Joshi'),(73,'SST Live Session 6',103,6,'Hindi','https://www.youtube.com/live/MnYLgEX_H2c?si=WIaMm8c4TTeWTEuo',1,'SST live video for Class 6','2025-03-26 00:00:00',111,'S.M. Joshi'),(74,'SST Live Session 7',103,7,'Hindi','https://www.youtube.com/live/0S8abveIm5Y?si=kNTFHvXu9oMnqoEq',1,'SST live video for Class 7','2025-03-27 00:00:00',111,'S.M. Joshi'),(75,'SST Live Session 8',103,8,'Hindi','https://www.youtube.com/live/SnKIZuB2aK0?si=mxUoUWmbHSVmKga5',1,'SST live video for Class 8','2025-03-28 00:00:00',111,'S.M. Joshi'),(76,'SST Live Session 9',103,9,'Hindi','https://www.youtube.com/live/vOoKTWhHz8Y?si=hFsBACU6jfYKmUyZ',1,'SST live video for Class 9','2025-03-29 00:00:00',111,'S.M. Joshi'),(77,'SST Live Session 10',103,10,'Hindi','https://www.youtube.com/live/2Mnn6iI00e0?si=vRZZprVjoFgGyN7v',1,'SST live video for Class 10','2025-03-30 00:00:00',111,'S.M. Joshi'),(78,'English Live Session 1',104,1,'English','https://www.youtube.com/live/OnSUWIyQqIc?si=Co3I_hZhhgqDSQD5',1,'English live video for Class 1','2025-03-31 00:00:00',111,'S.M. Joshi'),(79,'English Live Session 2',104,2,'English','https://www.youtube.com/live/TxFCpzIOh7Y?si=RpwEMVYW9bzvlwjl',1,'English live video for Class 2','2025-04-01 00:00:00',111,'S.M. Joshi'),(80,'English Live Session 3',104,3,'English','https://www.youtube.com/live/d5OlPujm0pk?si=Wspbc1aHq44VU4t-',1,'English live video for Class 3','2025-04-02 00:00:00',111,'S.M. Joshi'),(81,'English Live Session 4',104,4,'English','https://www.youtube.com/live/9zlqMbo5af8?si=VcmjsmSff1EjYj3B',1,'English live video for Class 4','2025-04-03 00:00:00',111,'S.M. Joshi'),(82,'English Live Session 5',104,5,'English','https://www.youtube.com/live/fLaWskVLVXc?si=OnqdGf8Li1ILCwks',1,'English live video for Class 5','2025-04-04 00:00:00',111,'S.M. Joshi'),(83,'English Live Session 6',104,6,'English','https://www.youtube.com/live/A4n-MKvn8ZU?si=rWCZwC9N6QGypkRE',1,'English live video for Class 6','2025-04-05 00:00:00',111,'S.M. Joshi'),(84,'English Live Session 7',104,7,'English','https://www.youtube.com/live/-XOH5_fAnYc?si=n_nF5I-aMR_RFXhi',1,'English live video for Class 7','2025-04-06 00:00:00',111,'S.M. Joshi'),(85,'English Live Session 8',104,8,'English','https://www.youtube.com/live/IhUhynyMaJo?si=sIaPi0vsEBZjS1uG',1,'English live video for Class 8','2025-04-07 00:00:00',111,'S.M. Joshi'),(86,'English Live Session 9',104,9,'English','https://www.youtube.com/live/a8cdMUw4RXY?si=gLHQlZFVzH4hnFcV',1,'English live video for Class 9','2025-04-08 00:00:00',111,'S.M. Joshi'),(87,'English Live Session 10',104,10,'English','https://www.youtube.com/live/3ksZZoI29FI?si=r_hc1POOJ-sJkKSn',1,'English live video for Class 10','2025-04-09 00:00:00',111,'S.M. Joshi'),(88,'Marathi Live Session 1',111,1,'Marathi','https://www.youtube.com/live/mRhUkVMWoX8?si=4XJKJRZXFUYXfNuA',1,'Marathi live video for Class 1','2025-04-10 00:00:00',111,'S.M. Joshi'),(89,'Marathi Live Session 2',111,2,'Marathi','https://www.youtube.com/live/ezdwWBAUTgI?si=eEd47f7sFvl26idC',1,'Marathi live video for Class 2','2025-04-11 00:00:00',111,'S.M. Joshi'),(90,'Marathi Live Session 3',111,3,'Marathi','https://www.youtube.com/live/OqV4fXJV8E8?si=coE4acEPxE_7Bg5N',1,'Marathi live video for Class 3','2025-04-12 00:00:00',111,'S.M. Joshi'),(91,'Marathi Live Session 4',111,4,'Marathi','https://www.youtube.com/live/3U2TtWCnbmU?si=dXua-tSh0ckfzBql',1,'Marathi live video for Class 4','2025-04-13 00:00:00',111,'S.M. Joshi'),(92,'Marathi Live Session 5',111,5,'Marathi','https://www.youtube.com/live/x3HZydAnyiQ?si=Hvgw9X69U4SJBFwl',1,'Marathi live video for Class 5','2025-04-14 00:00:00',111,'S.M. Joshi'),(93,'Marathi Live Session 6',111,6,'Marathi','https://www.youtube.com/live/c2XdOQ2ltA0?si=cX8qrZHM-hBWVOIM',1,'Marathi live video for Class 6','2025-04-15 00:00:00',111,'S.M. Joshi'),(94,'Marathi Live Session 7',111,7,'Marathi','https://www.youtube.com/live/_3YD52OqKkw?si=9MP26HOULIbwcZne',1,'Marathi live video for Class 7','2025-04-16 00:00:00',111,'S.M. Joshi'),(95,'Marathi Live Session 8',111,8,'Marathi','https://www.youtube.com/live/a7wXa4rxk6g?si=i6TVYpoyq3wPkufu',1,'Marathi live video for Class 8','2025-04-17 00:00:00',111,'S.M. Joshi'),(96,'Marathi Live Session 9',111,9,'Marathi','https://www.youtube.com/live/htnGgOI-3WM?si=r523ids5op2UM5ML',1,'Marathi live video for Class 9','2025-04-18 00:00:00',111,'S.M. Joshi'),(97,'Marathi Live Session 10',111,10,'Marathi','https://www.youtube.com/live/7xjROrB8q5s?si=jba9zUuXXRHFKLQx',1,'Marathi live video for Class 10','2025-04-19 00:00:00',111,'S.M. Joshi'),(98,'Hindi Live Session 1',112,1,'Hindi','https://www.youtube.com/live/Yut6yU2CgUo?si=2szYvpxJtLsMr-jl',1,'Hindi live video for Class 1','2025-04-20 00:00:00',111,'S.M. Joshi'),(99,'Hindi Live Session 2',112,2,'Hindi','https://www.youtube.com/live/IwxShxsjZV0?si=2br1ahomDFIZzQRQ',1,'Hindi live video for Class 2','2025-04-21 00:00:00',111,'S.M. Joshi'),(100,'Hindi Live Session 3',112,3,'Hindi','https://www.youtube.com/live/9tONS1vkNBE?si=Sb_wAKMKozctiL9e',1,'Hindi live video for Class 3','2025-04-22 00:00:00',111,'S.M. Joshi'),(101,'Hindi Live Session 4',112,4,'Hindi','https://www.youtube.com/live/ZGAxFBo-zUg?si=is1KUbeM90fY3h3w',1,'Hindi live video for Class 4','2025-04-23 00:00:00',111,'S.M. Joshi'),(102,'Hindi Live Session 5',112,5,'Hindi','https://www.youtube.com/live/zADoWDow5cQ?si=YJgVUKFlUAIYJYwp',1,'Hindi live video for Class 5','2025-04-24 00:00:00',111,'S.M. Joshi'),(103,'Hindi Live Session 6',112,6,'Hindi','https://www.youtube.com/live/1mhii-rKVso?si=qNB9fZW5PQivhiJS',1,'Hindi live video for Class 6','2025-04-25 00:00:00',111,'S.M. Joshi'),(104,'Hindi Live Session 7',112,7,'Hindi','https://www.youtube.com/live/lgzHI37sDUw?si=OJIXeZ5EjPUaGiUB',1,'Hindi live video for Class 7','2025-04-26 00:00:00',111,'S.M. Joshi'),(105,'Hindi Live Session 8',112,8,'Hindi','https://www.youtube.com/live/RtutjvvvlU0?si=JFLZ-cOQqozpa3iy',1,'Hindi live video for Class 8','2025-04-27 00:00:00',111,'S.M. Joshi'),(106,'Hindi Live Session 9',112,9,'Hindi','https://www.youtube.com/live/DTpQvo4U2nk?si=Cln5jVipR_rKhk_q',1,'Hindi live video for Class 9','2025-04-28 00:00:00',111,'S.M. Joshi'),(107,'Hindi Live Session 10',112,10,'Hindi','https://www.youtube.com/live/7ZdwccQow6c?si=1toZw4IGc87W8DL9',1,'Hindi live video for Class 10','2025-04-29 00:00:00',111,'S.M. Joshi'),(108,'om chaudhari',101,1,NULL,'https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',NULL,'not defined','2026-01-24 16:23:44',111,'s.m.joshi'),(109,'om chaudhari',101,1,NULL,'https://youtu.be/PfhHkGWxm2g?si=HP6ud02kvCsVh5vd',NULL,'not defined','2026-01-24 16:28:39',111,'s.m.joshi');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-24 16:49:35
