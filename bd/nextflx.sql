-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: netflix
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id_actors` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id_actors`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Tom','Hanks','Estados Unidos','1956-07-09'),(2,'Roberto','Benigni','Italia','1952-10-27'),(3,'John','Travolta','Estados Unidos','1954-02-18');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id_movies` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_movies`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Pulp Fiction','Crimen','https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg','Top 10','1994'),(2,'La vita è bella','Comedia','https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg','Top 10','1997'),(3,'Forrest Gump','Comedia','https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg','Top 10','1994');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_has_actors`
--

DROP TABLE IF EXISTS `movies_has_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_has_actors` (
  `movies_id_movies` int NOT NULL,
  `actors_id_actors` int NOT NULL,
  PRIMARY KEY (`movies_id_movies`,`actors_id_actors`),
  KEY `fk_movies_has_actors_actors1_idx` (`actors_id_actors`),
  KEY `fk_movies_has_actors_movies1_idx` (`movies_id_movies`),
  CONSTRAINT `fk_movies_has_actors_actors1` FOREIGN KEY (`actors_id_actors`) REFERENCES `actors` (`id_actors`),
  CONSTRAINT `fk_movies_has_actors_movies1` FOREIGN KEY (`movies_id_movies`) REFERENCES `movies` (`id_movies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_has_actors`
--

LOCK TABLES `movies_has_actors` WRITE;
/*!40000 ALTER TABLE `movies_has_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_has_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `plan_details` varchar(45) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'laura_dev','laura','Laura','laura@gmail.com','Standard'),(2,'maria_dev','maria','Maria','maria@gmail.com','Standard'),(3,'ester_dev','ester','Ester','ester@gmail.com','Standard');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_movies`
--

DROP TABLE IF EXISTS `users_has_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_movies` (
  `users_id_user` int NOT NULL,
  `movies_id_movies` int NOT NULL,
  `score` int DEFAULT NULL,
  `favoritas` int NOT NULL,
  PRIMARY KEY (`users_id_user`,`movies_id_movies`),
  KEY `fk_users_has_movies_movies1_idx` (`movies_id_movies`),
  KEY `fk_users_has_movies_users_idx` (`users_id_user`),
  CONSTRAINT `fk_users_has_movies_movies1` FOREIGN KEY (`movies_id_movies`) REFERENCES `movies` (`id_movies`),
  CONSTRAINT `fk_users_has_movies_users` FOREIGN KEY (`users_id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_movies`
--

LOCK TABLES `users_has_movies` WRITE;
/*!40000 ALTER TABLE `users_has_movies` DISABLE KEYS */;
INSERT INTO `users_has_movies` VALUES (1,1,7,0),(1,2,9,0),(2,2,8,0),(3,3,1,0);
/*!40000 ALTER TABLE `users_has_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-04 21:10:55
