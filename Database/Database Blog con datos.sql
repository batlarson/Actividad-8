CREATE DATABASE  IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blog`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Gabriel García Márquez','gabriel@example.com',_binary 'gabriel.jpg'),(2,'Isabel Allende','isabel@example.com',_binary 'isabel.jpg'),(3,'Mario Vargas Llosa','mario@example.com',_binary 'mario.jpg'),(4,'Jorge Luis Borges','jorge@example.com',_binary 'jorge.jpg'),(5,'Octavio Paz','octavio@example.com',_binary 'octavio.jpg'),(6,'Pablo Neruda','pablo@example.com',_binary 'pablo.jpg'),(7,'Carlos Fuentes','carlos@example.com',_binary 'carlos.jpg'),(8,'Laura Esquivel','laura@example.com',_binary 'laura.jpg'),(9,'Julio Cortázar','julio@example.com',_binary 'julio.jpg'),(10,'Roberto Bolaño','roberto@example.com',_binary 'roberto.jpg'),(11,'Charles Dickenss','charles@example.com',_binary 'charles.jpg');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `category` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `authors_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_authors_idx` (`authors_id`),
  CONSTRAINT `fk_posts_authors` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Cien años de soledad','Una obra maestra de la literatura mundial que narra la historia de la familia Buendía en el pueblo ficticio de Macondo.','2023-01-15 10:30:00','1',1),(2,'La casa de los espíritus','Una novela que combina realismo mágico y política en la historia de una familia chilena.','2023-02-20 14:45:00','2',2),(3,'La ciudad y los perros','Una crítica a la sociedad peruana a través de la vida de los cadetes en una escuela militar.','2023-03-10 09:20:00','1',3),(4,'Ficciones','Una colección de cuentos que exploran conceptos filosóficos y laberintos literarios.','2023-04-05 16:55:00','3',4),(5,'El laberinto de la soledad','Un ensayo sobre la identidad mexicana y la soledad del ser humano.','2023-05-18 11:30:00','4',5),(6,'Veinte poemas de amor y una canción desesperada','Una colección de poemas que exploran el amor y el desamor.','2023-06-25 08:15:00','2',6),(7,'La muerte de Artemio Cruz','Una novela que refleja la historia reciente de México a través de la vida de un hombre moribundo','2023-07-12 13:40:00','1',7),(8,'Como agua para chocolate','Una novela que mezcla recetas de cocina con una historia de amor y realismo mágico.','2023-08-21 15:25:00','3',8),(9,'Rayuela','Una novela experimental que puede leerse de varias maneras y que cuestiona la estructura narrativa tradicional.','2023-09-30 17:00:00','4',9),(10,'Los detectives salvajes','Una novela que sigue las aventuras de un grupo de poetas en búsqueda de una figura mítica en la literatura mexicana.','2023-10-10 19:20:00','2',10),(11,'El amor en los tiempos del cólera','Una historia de amor que se desarrolla a lo largo de varias décadas en el Caribe colombiano.','2023-11-01 11:00:00','3',1),(12,'De amor y de sombra','Una novela que aborda la dictadura chilena y un romance en tiempos difíciles.','2023-11-05 14:30:00','1',2),(13,'Conversación en La Catedral','Una profunda exploración de la dictadura y la corrupción en el Perú a través de un diálogo entre dos personajes.','2023-11-10 09:45:00','2',3),(14,'El Aleph','Otra colección de cuentos que exploran temas como el infinito y el tiempo.','2023-11-15 16:20:00','3',4),(15,'Piedra de sol','Un poema extenso que refleja la historia, la cultura y la identidad mexicana.','2023-11-20 12:50:00','4',5),(16,'Residencia en la tierra','Una colección de poemas que muestran la visión del mundo del autor y su compromiso social.','2023-11-25 08:40:00','2',6),(17,'Aura','Una novela corta que mezcla realismo y elementos fantásticos en la Ciudad de México.','2023-11-30 13:35:00','1',7),(18,'Tan veloz como el deseo','Una historia de amor y de pérdidas en el México rural.','2023-12-05 15:55:00','3',8),(19,'62/Modelo para armar','Una novela que continúa explorando la experimentación narrativa iniciada en Rayuela.','2023-12-10 17:10:00','4',9),(20,'2666','Una novela póstuma y monumental que explora la violencia en la ciudad ficticia de Santa Teresa.','2023-12-15 19:30:00','2',10),(21,'Canto general','Una obra épica que abarca la historia de América Latina y celebra su identidad y resistencia','2024-05-26 00:00:00','2',6);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 16:15:30
