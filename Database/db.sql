-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: void4
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
INSERT INTO `login` VALUES (101,'123','science',111,'s.m.joshi'),(102,'123','math',111,'s.m.joshi'),(103,'321','sst',111,'s.m.joshi'),(104,'eng@104','English',111,'s.m.joshi'),(105,'sci@105','Science',111,'s.m.joshi'),(106,'his@106','History',111,'s.m.joshi'),(107,'geo@107','Geography',111,'s.m.joshi'),(108,'art@108','Art',111,'s.m.joshi'),(109,'pe@109','PE',111,'s.m.joshi'),(110,'cs@110','Computer',111,'s.m.joshi'),(111,'999','marathi',111,'s.m.joshi'),(134,'123','science',112,'Xzyz'),(333,'12345','math',1234,'humemchenry'),(444,'123','sst',112,'Shab gf'),(777,'777','math',111,'s.m.joshi');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'math','Holiday for my birthday take day off as much as you want if you don\'t want to come to college ever you have full persmission dont come i will handle the exam marks','2012-12-12 00:00:00','Holiday Notice',NULL,1,NULL,NULL,111,'s.m.joshi'),(2,'math','Holiday for my birthday take day off as much as you want if you don\'t want to come to college ever you have full persmission dont come i will handle the exam marks','2012-05-09 00:00:00','Project completed',NULL,1,NULL,NULL,111,'s.m.joshi'),(3,'math','With Chrome profiles, you can separate all your Chrome stuff. Create profiles for friends and family, or split between work and fun.','2012-05-09 00:00:00','the end',NULL,1,NULL,NULL,111,'s.m.joshi'),(4,'science','or yyyyyyyyyyyyyyyyyyyyyyyyysplit between work and fun.','2012-05-09 00:00:00','the end',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(5,'sst',' you zzzzzzzzzzzzzzzzzzzzzzzzzzzcan separate all your Chrome stuff. Create profiles for friends and family, or split between work and fun.','2012-05-09 00:00:00','the end',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(6,'Math','Teachers are requested to focus on basic arithmetic revision before unit test.','2025-01-05 00:00:00','Unit Test Preparation','uploads/notices/math_unit_test.pdf',1,1,'4',111,'S.M. Joshi'),(7,'Math','Submit solved worksheets for Class 2 students by next week.','2025-01-06 00:00:00','Worksheet Submission',NULL,2,1,'4',111,'S.M. Joshi'),(8,'Science','Include at least one hands-on activity during science periods.','2025-01-07 00:00:00','Activity-Based Learning','uploads/notices/science_activity_guidelines.pdf',3,1,'3',111,'S.M. Joshi'),(9,'Science','Conduct discussion on plants and animals during morning session.','2025-01-08 00:00:00','Environment Awareness',NULL,4,1,'3',111,'S.M. Joshi'),(10,'English','Encourage students to read aloud daily for 10 minutes.','2025-01-09 00:00:00','Reading Improvement Program','uploads/notices/reading_program.pdf',5,1,'5',111,'S.M. Joshi'),(11,'English','Focus on sentence formation and basic grammar exercises.','2025-01-10 00:00:00','Grammar Practice',NULL,6,1,'5',111,'S.M. Joshi'),(12,'History','Cover freedom movement chapter with storytelling approach.','2025-01-11 00:00:00','Freedom Movement Module','uploads/notices/history_module.pdf',7,1,'1',111,'S.M. Joshi'),(13,'Geography','Teach basic map reading skills using wall maps.','2025-01-12 00:00:00','Map Reading Skills',NULL,8,1,'8',111,'S.M. Joshi'),(14,'Art','Organize drawing and colouring activities this week.','2025-01-13 00:00:00','Creativity Week','uploads/notices/art_activity.pdf',9,1,'7',111,'S.M. Joshi'),(15,'Computer','Introduce parts of computer and basic operations.','2025-01-14 00:00:00','Basic Computer Awareness','uploads/notices/computer_basics.pdf',10,1,'6',111,'S.M. Joshi'),(16,'math','om chaudhari','2026-01-15 14:44:59','\r\n12,43,180 views  11 Jan 2026  #cryingcat #猫 #貓咪\r\n#cryingcat #猫 #貓咪\r\n#cryingcat #猫 #貓\r\n#動物 #貓咪 #短片\r\nMama Cat Trims Fur on the Farm and Makes Tiger Hat For Kittens At Home???\r\n小貓的復仇行動，從猫爸爸的背叛開始\r\n\r\n? Thank you for liking this～\r\n? Made-up content for joy and good vibes\r\n? So thankful for your hearts～\r\n',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(17,'math','tomorrow there will be class test for the class 10 on the subject mathematics.','2026-01-15 14:49:04','class test for 10th',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(18,'math','sdfgzxcvbn','2026-01-15 15:10:11','1345',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(19,'math','zxcvbnm,','2026-01-15 15:13:52','sdfg',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(20,'math','Please make sure you do your work','2026-01-15 18:34:25','Sumit Patel ',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(21,'math','kuch nahi horaha hai','2026-01-17 15:39:27','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(22,'math','kuch nahi horaha hai','2026-01-17 15:39:37','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(23,'math','kuch nahi horaha hai','2026-01-17 15:39:39','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(24,'math','kuch nahi horaha hai','2026-01-17 15:39:39','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(25,'math','kuch nahi horaha hai','2026-01-17 15:39:39','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(26,'math','kuch nahi horaha hai','2026-01-17 15:39:40','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(27,'math','kuch nahi horaha hai','2026-01-17 15:39:40','kuch nahi horaha hai',NULL,1,NULL,NULL,111,'s.m.joshi'),(28,'math','areee','2026-01-17 15:45:45','kahi',NULL,1,NULL,NULL,111,'s.m.joshi'),(29,'math','Xyz','2026-01-17 22:22:48','Anushri',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(30,'math','Sh','2026-01-17 22:23:13','Ty',NULL,1,NULL,NULL,111,'s.m.joshi'),(31,'math','! bottle for everyone','2026-01-20 15:03:29','bhai ka birthday',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(32,'math','! bottle for everyone','2026-01-20 15:07:50','bhai ka birthday',NULL,NULL,NULL,NULL,111,'s.m.joshi'),(33,'math','come with flower','2026-01-20 15:11:04','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi'),(34,'math','come with flower','2026-01-20 15:13:06','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi'),(35,'math','come with flower','2026-01-20 15:13:08','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi'),(36,'math','come with flower','2026-01-20 15:13:08','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi'),(37,'math','come with flower','2026-01-20 15:13:08','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi'),(38,'math','come with flower','2026-01-20 15:13:08','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi'),(39,'math','come with flower','2026-01-20 15:13:08','bhai Ki death',NULL,1,NULL,NULL,111,'s.m.joshi');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'om',1,1,2,8,6,111,'s.m.joshi'),(2,'ayesha',1,1,4,6,7,111,'s.m.joshi'),(3,'siddhi',1,1,7,1,3,111,'s.m.joshi'),(4,'shanta',1,1,100,1,1,111,'s.m.joshi'),(5,'sumit',1,1,7,2,6,111,'s.m.joshi'),(6,'ayush',1,1,2,5,8,111,'s.m.joshi'),(7,'manthan',1,1,8,4,1,111,'s.m.joshi'),(9,'shubham',1,1,6,3,2,111,'s.m.joshi'),(10,'aniket',1,1,8,2,4,111,'s.m.joshi'),(11,'prem',1,1,9,2,3,111,'s.m.joshi'),(12,'ram',1,1,45,3,8,111,'s.m.joshi'),(13,'Aryan',1,1,99,10,9,111,'s.m.joshi'),(14,'shivtej',1,1,44,12,7,111,'s.m.joshi'),(15,'roshan',1,1,55,34,6,111,'s.m.joshi'),(16,'om',1,1,66,44,1,111,'s.m.joshi'),(17,'vidya',1,1,0,66,8,111,'s.m.joshi'),(18,'Sahil',1,1,100,100,10,NULL,NULL),(19,'aisha inamdar',1,1,30,70,6,111,'s.m.joshi'),(20,'Rajveer',1,1,14,50,5,111,'s.m.joshi'),(21,'Abc',1,1,50,60,5,111,'s.m.joshi'),(26,'Virat',1,1,99,99,10,111,'s.m.joshi'),(27,'Sumit Patel ',1,1,25,85,9,111,'s.m.joshi'),(28,'Sanvi ',1,1,80,50,9,111,'s.m.joshi'),(29,'Siddhi Vilas Bahutule ',1,1,80,89,7,111,'S m joshi'),(30,'Anushri',1,1,77,50,2,111,'s.m.joshi'),(31,'Arun',1,1,77,34,10,111,'s.m.joshi');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_issues`
--

LOCK TABLES `teacher_issues` WRITE;
/*!40000 ALTER TABLE `teacher_issues` DISABLE KEYS */;
INSERT INTO `teacher_issues` VALUES (3,1,101,1,'hello its description about 1st demo','PENDING','2026-01-12 13:59:35','first category',111,'s.m.joshi'),(4,1,101,1,'rfed','PENDING','2026-01-12 14:33:01','gf',111,'s.m.joshi'),(5,1,101,1,'Technical gadgets shortage','PENDING','2026-01-12 14:37:44','It Support',111,'s.m.joshi'),(6,1,101,1,'yt','PENDING','2026-01-12 14:38:24','ygfd',111,'s.m.joshi'),(7,1,101,1,'ljhg','PENDING','2026-01-12 14:40:16','og',111,'s.m.joshi'),(8,1,101,1,'Students are not coming for the regular lectures','PENDING','2026-01-12 14:43:16','Poor Attendance of students',111,'s.m.joshi'),(9,1,101,1,'every students behavior and grasping power is different','PENDING','2026-01-12 14:54:34','Behaviour problem of student',111,'s.m.joshi'),(10,1,101,1,'mentor visits are less frequent','PENDING','2026-01-12 14:56:17','consultancy',111,'s.m.joshi'),(11,1,101,1,'dfg','PENDING','2026-01-12 15:29:06','dfg',111,'s.m.joshi'),(12,1,101,1,'infrastructure','PENDING','2026-01-13 12:28:47','it',111,'s.m.joshi'),(13,1,101,1,'poor internet connections','PENDING','2026-01-13 12:47:54','internet',111,'s.m.joshi'),(14,1,101,1,'Students are facing difficulty understanding basic addition concepts.','OPEN','2025-01-05 10:15:00','Academic',111,'S.M. Joshi'),(15,2,101,2,'Need additional worksheets for practice sessions.','IN_PROGRESS','2025-01-06 11:00:00','Academic',111,'S.M. Joshi'),(16,3,105,3,'Science lab equipment not sufficient for all students.','OPEN','2025-01-07 09:45:00','Infrastructure',111,'S.M. Joshi'),(17,3,105,4,'Audio system not working properly during science videos.','RESOLVED','2025-01-08 12:30:00','Technical',111,'S.M. Joshi'),(18,4,104,5,'Students need more time to complete grammar exercises.','OPEN','2025-01-09 10:10:00','Academic',111,'S.M. Joshi'),(19,5,104,6,'Request to schedule extra English reading sessions.','IN_PROGRESS','2025-01-10 11:40:00','Administrative',111,'S.M. Joshi'),(20,6,106,7,'History syllabus completion delayed due to holidays.','OPEN','2025-01-11 09:20:00','Administrative',111,'S.M. Joshi'),(21,7,107,8,'World map chart required for geography lessons.','RESOLVED','2025-01-12 01:15:00','Infrastructure',111,'S.M. Joshi'),(22,8,108,9,'Art supplies like colours and drawing sheets are insufficient.','OPEN','2025-01-13 10:50:00','Infrastructure',111,'S.M. Joshi'),(23,9,110,10,'Computer lab systems are running slow during practical sessions.','IN_PROGRESS','2025-01-14 02:00:00','Technical',111,'S.M. Joshi'),(24,1,101,1,'no food available','PENDING','2026-01-20 15:01:07','canteen',111,'s.m.joshi');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'ayesha','siddhivilas26@gmail.com','123',101,1,5,'hod',1,'0012-12-12','math',111,'s.m.joshi','C'),(2,'om','s222222@gmail.com','123',101,1,4,'asst. hod',1,'2009-09-12','math',111,'s.m.joshi','A'),(3,'Sneha Kulkarni','sneha.k@edu.in','sneha@123',105,2,6,'Teacher',3,'2019-08-15','Science',111,'s.m.joshi','A'),(4,'Vijay Pawar','vijay.p@edu.in','vijay@123',102,2,12,'Senior Teacher',4,'2013-05-20','Marathi',111,'s.m.joshi','A'),(5,'Neha Jadhav','neha.j@edu.in','neha@123',103,3,5,'Assistant Teacher',5,'2020-06-10','Hindi',111,'s.m.joshi','B'),(6,'Sunil Shinde','sunil.s@edu.in','sunil@123',106,3,9,'Teacher',2,'2016-04-18','History',111,'s.m.joshi','B'),(7,'Pooja More','pooja.m@edu.in','pooja@123',107,1,4,'Assistant Teacher',3,'2021-01-05','Geography',111,'s.m.joshi','B'),(8,'Amit Kale','amit.k@edu.in','amit@123',110,2,7,'Teacher',4,'2018-09-09','Computer',111,'s.m.joshi','B'),(9,'Kavita Joshi','kavita.j@edu.in','kavita@123',108,3,11,'Senior Teacher',1,'2012-03-22','Art',111,'s.m.joshi',NULL),(10,'Rahul Patankar','rahul.p@edu.in','rahul@123',109,1,6,'Teacher',5,'2019-11-11','PE',111,'s.m.joshi','c');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_videos`
--

LOCK TABLES `trainer_videos` WRITE;
/*!40000 ALTER TABLE `trainer_videos` DISABLE KEYS */;
INSERT INTO `trainer_videos` VALUES (1,'math','Song','2012-12-12 00:00:00','https://youtu.be/AbkEmIgJMcU?si=IwfBm21NTcsFEnEw',111,'s.m.joshi'),(2,'math','Music','2012-12-12 00:00:00','https://youtu.be/n2dVFdqMYGA?si=vs85PXbu7GYCixAH',111,'s.m.joshi'),(3,'math','album','2012-12-12 00:00:00','https://youtu.be/AbkEmIgJMcU?si=IwfBm21NTcsFEnEw',111,'s.m.joshi'),(4,'science','om','2002-12-02 00:00:00','https://youtu.be/AbkEmIgJMcU?si=IwfBm21NTcsFEnEw',111,'s.m.joshi'),(5,'sst','aisha','2012-03-02 00:00:00','https://youtu.be/AbkEmIgJMcU?si=IwfBm21NTcsFEnEw',111,'s.m.joshi'),(6,'math','1st upload by trainer','2026-01-15 13:33:03','https://youtu.be/hyx3K5jafzk?si=E4n1c6KHSjrqS-0w',111,'s.m.joshi'),(7,'math','1st upload by trainer','2026-01-15 13:33:29','https://youtu.be/hyx3K5jafzk?si=E4n1c6KHSjrqS-0w',111,'s.m.joshi'),(8,'math','2nd video','2026-01-15 13:38:32','https://youtu.be/cLWXPbp60Fs?si=PqAofxm4NSvibK-R',111,'s.m.joshi'),(9,'math','3rd','2026-01-15 13:43:59','https://youtu.be/cLWXPbp60Fs?si=PqAofxm4NSvibK-R',111,'s.m.joshi'),(10,'math','science exhibition','2026-01-15 13:47:38','https://youtube.com/shorts/P_a-GcFNFeE?si=Bi6P3e1FLaTYQ4Sq',111,'s.m.joshi'),(11,'math','shivtej bhukan','2026-01-15 13:57:52','https://youtu.be/deUTMxksNxM?si=bdyS7oxndLmevZmM',111,'s.m.joshi'),(12,'math','Ice age','2026-01-15 18:36:03','https://www.youtube.com/watch?v=DxsDekHDKXo&list=RDDxsDekHDKXo&start_radio=1',111,'s.m.joshi');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'kuch toh hai','siddhivilas26@gmail.com','123','Trainer','Active',101,'math'),(2,'Aryan','aryan1109@gmail.com','123','Trainer','Active',102,'science');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_modules`
--

LOCK TABLES `training_modules` WRITE;
/*!40000 ALTER TABLE `training_modules` DISABLE KEYS */;
INSERT INTO `training_modules` VALUES (1,'sacred','A','2026-01-20 07:11:45'),(2,'Day good','C','2026-01-20 07:41:24'),(3,'I’m Aisha Inamdar, BCA sophomore at JSV College, coding & guitar daily.','A','2026-01-20 07:51:31'),(4,'Aisha Inamdar, third year BCA student, enjoys coding, guitar, and everyday dancing.','B','2026-01-20 07:52:01'),(5,'{\"role\":\"assistant\",\"reasoning_content\":\"The user requests: \\\"Rewrite+the+following+educational+content+for+an+Indian+tribal+(Cluster+C)+audience.+Use+very+simple+words,+short+sentences,+culturally+familiar+examples,+and+explanations+suitable+for+low-resource+settings.+Avoid+technical+terms+where+possible.+Reduce+the+output+to+exactly+half+the+number+of+words+of+the+input.+Content:+my+name+is+aisha+inamdar+i+am+a+student+at+s,m,joshi+college+in+third+year+of+bca+ my+hobiies+are+coding+guitar+playing+an+dancing.\\\"\\n\\nWe need to rewrite, using very simple words, short sentences, culturally familiar examples, explanations suitable for low-resource settings, avoid technical terms, exactly half the number of words of the input.\\n\\nFirstly, count words of input, after decoding: Let\'s decode the content:\\n\\n\\\"my name is aisha inamdar i am a student at s,m,joshi college in third year of bca my hobbies are coding guitar playing an dancing.\\\"\\n\\nWe need to count words. Let\'s break:\\n\\nmy(1)\\nname(2)\\nis(3)\\naisha(4)\\ninamdar(5)\\ni(6)\\nam(7)\\na(8)\\nstudent(9)\\nat(10)\\ns,m,joshi(11) -> that\'s one word\\ncollege(12)\\nin(13)\\nthird(14)\\nyear(15)\\nof(16)\\nbca(17)\\nmy(18)\\nhobbies(19)\\nare(20)\\ncoding(21)\\nguitar(22)\\nplaying(23)\\nan(24)\\ndancing(25)\\n\\nSo 25 words. Exactly half would be 12.5 words - we need integer? They say exactly half the number of words. We can round down or up? Probably they expect 12 or 13 words after rewrite. We should aim for 12 or 13 words. Let\'s get 12 words. Bold: exactly half 25 is 12.5; maybe they expect 12 words if floor. We\'ll aim for 12 words.\\n\\nNow we need to rewrite content for Indian tribal audience. Use simple words, short sentences, familiar examples, suitable for low-resource settings. Avoid technical terms. So we need to describe name, student, college, year, hobbies: coding, guitar playing, dancing. But we must do in 12 words. Must keep sense.\\n\\nWe can include: \\\"I am Aisha Inamdar. I study at S.M. Joshi College. I am in 3rd year of BCA. My hobbies: coding, guitar, dancing.\\\" But that\'s many words. We need 12 words total. Let\'s try:\\n\\n\\\"Aisha Inamdar, student at S.M. Joshi College, 3rd year, loves coding, guitar, dance.\\\"\\n\\nCount words:\\n\\nAisha(1)\\nInamdar,(2)\\nstudent(3)\\nat(4)\\nS.M.(5)\\nJoshi(6)\\nCollege,(7)\\n3rd(8)\\nyear,(9)\\nloves(10)\\ncoding,(11)\\nguitar,(12)\\ndance(13)\\n\\n13 words. Too many. Need 12. Maybe drop \\\"student\\\" or \\\"college\\\". We need to convey basic info: name, student at college, 3rd year, hobbies.\\n\\nTry: \\\"Aisha Inamdar, student at S.M. Joshi College, 3rd year, enjoys coding, guitar, dance.\\\"\\n\\nCount:\\n\\nAisha1\\nInamdar,2\\nstudent3\\nat4\\nS.M.5\\nJoshi6\\nCollege,7\\n3rd8\\nyear,9\\nenjoys10\\ncoding,11\\nguitar,12\\ndance13\\n\\nAgain 13 words.\\n\\nLet\'s try: \\\"I am Aisha Inamdar, 3rd year student at S.M. Joshi College, love coding, guitar, dance.\\\"\\n\\nCount:\\n\\nI1\\nam2\\nAisha3\\nInamdar,4\\n3rd5\\nyear6\\nstudent7\\nat8\\nS.M.9\\nJoshi10\\nCollege,11\\nlove12\\ncoding,13\\nguitar,14\\ndance15\\n\\n15 words.\\n\\nMaybe we can use shorter: \\\"Aisha Inamdar, 3rd year at S.M. Joshi College, enjoys coding, guitar, dancing.\\\"\\n\\nCount:\\n\\nAisha1\\nInamdar,2\\n3rd3\\nyear4\\nat5\\nS.M.6\\nJoshi7\\nCollege,8\\nenjoys9\\ncoding,10\\nguitar,11\\ndancing12\\n\\nThat\'s 12 words. Great. But we used \\\"enjoys\\\" (English). Maybe okay. \\\"enjoys\\\" is simple. It references BCA maybe not necessary. It\'s fine for tribal audience? Could maybe say \\\"studying\\\" but we didn\'t mention BCA. It\'s okay. We said 3rd year at S.M. Joshi College. That\'s simple. They said avoid technical terms - \\\"BCA\\\" is a technical term; we omitted it. Good.\\n\\nBut we used \\\"dancing\\\" singular. It\'s fine. It\'s 12 words.\\n\\nWe need very simple words, culturally familiar, but maybe we need to be more local. Use \\\"guitar\\\" might be known? It\'s okay. Maybe change \\\"enjoys\\\" to \\\"likes\\\". \\\"likes\\\" is simpler. That would still be 12? Let\'s recount:\\n\\nAisha1\\nInamdar,2\\n3rd3\\nyear4\\nat5\\nS.M.6\\nJoshi7\\nCollege,8\\nlikes9\\ncoding,10\\nguitar,11\\ndancing12\\n\\nYes 12 words. \\\"coding\\\" maybe technical but it\'s their hobby they love. Might be okay. They want simple words, but coding remains technical. But maybe we keep it because the user used it. But if we want to reduce perception of technical? But it\'s a hobby - we can keep. The user: \\\"my hobbies are coding, guitar, playing and dancing.\\\" Coding is not \\\"technical term\\\"? It\'s a hobby. It\'s okay. So final answer: \\\"Aisha Inamdar, 3rd year at S.M. Joshi College, likes coding, guitar, dancing.\\\"\\n\\nWe need to present as final text.\\n\\nBut maybe we can adjust further to cultural example: \\\"likes playing notes with sticks as drums\\\". But not needed. Just keep.\\n\\nSo final output: Provide the phrase: \\\"Aisha Inamdar, 3rd year at S.M. Joshi College, likes coding, guitar, dancing.\\\"\\n\\nDouble-check word count: Let\'s breakdown with punctuation removed: Aisha(1) Inamdar(2) 3rd(3) year(4) at(5) S.M.(6) Joshi(7) College(8) likes(9) coding(10) guitar(11) dancing(12). Good.\\n\\nThus final.\",\"tool_calls\":[]}','C','2026-01-20 07:52:35'),(6,'{\"role\":\"assistant\",\"reasoning_content\":\"The user requests: \\\"Rewrite+the+following+educational+content+for+an+Indian+tribal+(Cluster+C)+audience.+Use+very+simple+words,+short+sentences,+culturally+familiar+examples,+and+explanations+suitable+for+low-resource+settings.+Avoid+technical+terms+where+possible.+Reduce+the+output+to+exactly+half+the+number+of+words+of+the+input.+Content:+my+name+is+aisha+inamdar+i+am+a+student+at+s,m,joshi+college+in+third+year+of+bca+ my+hobiies+are+coding+guitar+playing+an+dancing.\\\"\\n\\nWe need to rewrite, using very simple words, short sentences, culturally familiar examples, explanations suitable for low-resource settings, avoid technical terms, exactly half the number of words of the input.\\n\\nFirstly, count words of input, after decoding: Let\'s decode the content:\\n\\n\\\"my name is aisha inamdar i am a student at s,m,joshi college in third year of bca my hobbies are coding guitar playing an dancing.\\\"\\n\\nWe need to count words. Let\'s break:\\n\\nmy(1)\\nname(2)\\nis(3)\\naisha(4)\\ninamdar(5)\\ni(6)\\nam(7)\\na(8)\\nstudent(9)\\nat(10)\\ns,m,joshi(11) -> that\'s one word\\ncollege(12)\\nin(13)\\nthird(14)\\nyear(15)\\nof(16)\\nbca(17)\\nmy(18)\\nhobbies(19)\\nare(20)\\ncoding(21)\\nguitar(22)\\nplaying(23)\\nan(24)\\ndancing(25)\\n\\nSo 25 words. Exactly half would be 12.5 words - we need integer? They say exactly half the number of words. We can round down or up? Probably they expect 12 or 13 words after rewrite. We should aim for 12 or 13 words. Let\'s get 12 words. Bold: exactly half 25 is 12.5; maybe they expect 12 words if floor. We\'ll aim for 12 words.\\n\\nNow we need to rewrite content for Indian tribal audience. Use simple words, short sentences, familiar examples, suitable for low-resource settings. Avoid technical terms. So we need to describe name, student, college, year, hobbies: coding, guitar playing, dancing. But we must do in 12 words. Must keep sense.\\n\\nWe can include: \\\"I am Aisha Inamdar. I study at S.M. Joshi College. I am in 3rd year of BCA. My hobbies: coding, guitar, dancing.\\\" But that\'s many words. We need 12 words total. Let\'s try:\\n\\n\\\"Aisha Inamdar, student at S.M. Joshi College, 3rd year, loves coding, guitar, dance.\\\"\\n\\nCount words:\\n\\nAisha(1)\\nInamdar,(2)\\nstudent(3)\\nat(4)\\nS.M.(5)\\nJoshi(6)\\nCollege,(7)\\n3rd(8)\\nyear,(9)\\nloves(10)\\ncoding,(11)\\nguitar,(12)\\ndance(13)\\n\\n13 words. Too many. Need 12. Maybe drop \\\"student\\\" or \\\"college\\\". We need to convey basic info: name, student at college, 3rd year, hobbies.\\n\\nTry: \\\"Aisha Inamdar, student at S.M. Joshi College, 3rd year, enjoys coding, guitar, dance.\\\"\\n\\nCount:\\n\\nAisha1\\nInamdar,2\\nstudent3\\nat4\\nS.M.5\\nJoshi6\\nCollege,7\\n3rd8\\nyear,9\\nenjoys10\\ncoding,11\\nguitar,12\\ndance13\\n\\nAgain 13 words.\\n\\nLet\'s try: \\\"I am Aisha Inamdar, 3rd year student at S.M. Joshi College, love coding, guitar, dance.\\\"\\n\\nCount:\\n\\nI1\\nam2\\nAisha3\\nInamdar,4\\n3rd5\\nyear6\\nstudent7\\nat8\\nS.M.9\\nJoshi10\\nCollege,11\\nlove12\\ncoding,13\\nguitar,14\\ndance15\\n\\n15 words.\\n\\nMaybe we can use shorter: \\\"Aisha Inamdar, 3rd year at S.M. Joshi College, enjoys coding, guitar, dancing.\\\"\\n\\nCount:\\n\\nAisha1\\nInamdar,2\\n3rd3\\nyear4\\nat5\\nS.M.6\\nJoshi7\\nCollege,8\\nenjoys9\\ncoding,10\\nguitar,11\\ndancing12\\n\\nThat\'s 12 words. Great. But we used \\\"enjoys\\\" (English). Maybe okay. \\\"enjoys\\\" is simple. It references BCA maybe not necessary. It\'s fine for tribal audience? Could maybe say \\\"studying\\\" but we didn\'t mention BCA. It\'s okay. We said 3rd year at S.M. Joshi College. That\'s simple. They said avoid technical terms - \\\"BCA\\\" is a technical term; we omitted it. Good.\\n\\nBut we used \\\"dancing\\\" singular. It\'s fine. It\'s 12 words.\\n\\nWe need very simple words, culturally familiar, but maybe we need to be more local. Use \\\"guitar\\\" might be known? It\'s okay. Maybe change \\\"enjoys\\\" to \\\"likes\\\". \\\"likes\\\" is simpler. That would still be 12? Let\'s recount:\\n\\nAisha1\\nInamdar,2\\n3rd3\\nyear4\\nat5\\nS.M.6\\nJoshi7\\nCollege,8\\nlikes9\\ncoding,10\\nguitar,11\\ndancing12\\n\\nYes 12 words. \\\"coding\\\" maybe technical but it\'s their hobby they love. Might be okay. They want simple words, but coding remains technical. But maybe we keep it because the user used it. But if we want to reduce perception of technical? But it\'s a hobby - we can keep. The user: \\\"my hobbies are coding, guitar, playing and dancing.\\\" Coding is not \\\"technical term\\\"? It\'s a hobby. It\'s okay. So final answer: \\\"Aisha Inamdar, 3rd year at S.M. Joshi College, likes coding, guitar, dancing.\\\"\\n\\nWe need to present as final text.\\n\\nBut maybe we can adjust further to cultural example: \\\"likes playing notes with sticks as drums\\\". But not needed. Just keep.\\n\\nSo final output: Provide the phrase: \\\"Aisha Inamdar, 3rd year at S.M. Joshi College, likes coding, guitar, dancing.\\\"\\n\\nDouble-check word count: Let\'s breakdown with punctuation removed: Aisha(1) Inamdar(2) 3rd(3) year(4) at(5) S.M.(6) Joshi(7) College(8) likes(9) coding(10) guitar(11) dancing(12). Good.\\n\\nThus final.\",\"tool_calls\":[]}','C','2026-01-20 07:52:46'),(7,'Denmark\'s cold‑climate moves now backfire. EU officials misread the 1813 Treaty of Kiel, seeing Denmark as colonial ruler of Greenland. They adopted Danish ideas to hold power over a 50‑k Inuit community on a vast, ice‑covered island, echoing Mumbai\'s crowded governance struggles in today\'s digital age.','A','2026-01-20 07:55:38'),(8,'Denmark’s past rule in Greenland is now hurting the people. European leaders ignore that Denmark got Greenland in the 1813 treaty. They follow Denmark’s idea to stay in charge. Greenland has 50,000 people on a huge, icy land, barely used in the far north and many.','C','2026-01-20 07:56:11'),(9,'Letter learning','C','2026-01-20 09:46:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'ayesha',101,1,'urdu','https://youtu.be/RefIZ5PeiTs?si=znDjrOPTHoo8sLqX',1,'aisha\'s cat','2011-08-12 00:00:00',111,'s.m.joshi'),(2,'inamdar',102,2,'english','https://youtu.be/RefIZ5PeiTs?si=znDjrOPTHoo8sLqX',2,'aisha\'s cat trainer','2012-03-12 00:00:00',111,'s.m.joshi'),(3,'Basic Addition Concepts',101,1,'Marathi','https://youtu.be/math_add_c1',4,'Teaching addition using objects and daily life examples','2025-01-01 00:00:00',111,'S.M. Joshi'),(4,'Subtraction Using Number Line',101,2,'Marathi','https://youtu.be/math_sub_c2',4,'Visual explanation of subtraction for beginners','2025-01-02 00:00:00',111,'S.M. Joshi'),(5,'Introduction to Science',105,3,'English','https://youtu.be/sci_intro_c3',3,'Basic science concepts explained with activities','2025-01-03 00:00:00',111,'S.M. Joshi'),(6,'Plants and Animals',105,4,'Marathi','https://youtu.be/sci_plants_c4',3,'Understanding living and non-living things','2025-01-04 00:00:00',111,'S.M. Joshi'),(7,'English Grammar – Nouns',104,5,'English','https://youtu.be/eng_nouns_c5',5,'Clear explanation of nouns with examples','2025-01-05 00:00:00',111,'S.M. Joshi'),(8,'Sentence Formation Basics',104,6,'Marathi','https://youtu.be/eng_sentence_c6',5,'How to form meaningful sentences','2025-01-06 00:00:00',111,'S.M. Joshi'),(9,'Indian Freedom Movement',106,7,'Marathi','https://youtu.be/history_freedom_c7',1,'Overview of freedom struggle and key leaders','2025-01-07 00:00:00',111,'S.M. Joshi'),(10,'Our Earth and Continents',107,8,'English','https://youtu.be/geo_earth_c8',8,'Structure of earth and continents explained','2025-01-08 00:00:00',111,'S.M. Joshi'),(11,'Art and Creative Expression',108,9,'Marathi','https://youtu.be/art_creativity_c9',7,'Encouraging creativity and imagination','2025-01-09 00:00:00',111,'S.M. Joshi'),(12,'Computer Basics for Beginners',110,10,'English','https://youtu.be/cs_basics_c10',6,'Introduction to computer fundamentals','2025-01-10 00:00:00',111,'S.M. Joshi'),(13,'11th',101,1,NULL,'https://youtu.be/cLWXPbp60Fs?si=PqAofxm4NSvibK-R',NULL,'not defined','2026-01-17 15:43:02',111,'s.m.joshi'),(14,'bhai ka birthday',101,1,NULL,'https://youtu.be/x8F5dz8kv1w?si=0vo-1Xt7bE8crpt-',NULL,'not defined','2026-01-20 15:07:56',111,'s.m.joshi'),(15,'bhai ka birthday',101,1,NULL,'https://youtu.be/x8F5dz8kv1w?si=0vo-1Xt7bE8crpt-',NULL,'not defined','2026-01-20 15:09:19',111,'s.m.joshi'),(16,'bhai ka birthday',101,1,NULL,'https://youtu.be/x8F5dz8kv1w?si=0vo-1Xt7bE8crpt-',NULL,'not defined','2026-01-20 15:09:20',111,'s.m.joshi'),(17,'bhai ki death',101,1,NULL,'https://youtu.be/hyx3K5jafzk?si=E4n1c6KHSjrqS-0w',NULL,'not defined','2026-01-20 15:14:03',111,'s.m.joshi');
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

-- Dump completed on 2026-01-20 15:32:50
