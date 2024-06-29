CREATE DATABASE  IF NOT EXISTS `nodejs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nodejs`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: nodejs
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Мастер и Маргарита','М.A. Булгаков','master_i_margarita.jpg','Роман, который не вписывается в привычные литературные рамки. В этой истории смешана философия и быт, теология и фантастика, мистика и реализм, мистика и лирика. И все эти составляющие переплетены умелыми руками в цельную и яркую историю, которая способна перевернуть ваш мир.'),(2,'Преступление и наказание','Ф.М. Достоевский','prestuplenie_i_nakazanie.jpg','Книга из школьной программы, которую трудно понять в нежном подростковом возрасте. Писатель показал двойственность человеческой души, когда черное переплетается с белым. История о Раскольникове, который переживает внутреннюю борьбу.'),(3,'Собачье сердце','М.A. Булгаков','sobachie_serdce.jpg','Удивительно тонкая и саркастическая история о людях и их пороках. История об эксперименте, который доказал, что из животного можно сделать человека, а вот вывести «животное» из человека нельзя.'),(4,'Три товарища','Эрих Мария Ремарк','tri_tovarisha.jpg','Рассказать о чем повествует этот роман невозможно. Роман нужно читать, и тогда придет понимание, что это не просто история, а исповедь. Исповедь о любви, дружбе, боли. История отчаяния и борьбы.'),(5,'Над пропастью во ржи','Джером Сэлинджер','nad_propastiu_vo_rzhi.jpg','История подростка, который своими глазами показывает свое восприятие мира, точку мировоззрения, отречение от привычных принципов и устоев морали общества, которые не вписываются в его индивидуальные рамки.'),(6,'Приключения Шерлока Холмса','Артур Конан Дойл','sherlok_holms.jpg','Легендарные расследования великого сыщика Шерлока, которые раскрывают подлость человеческой души. Истории, которые рассказывает друг и помощник детектива доктор Ватсон.'),(7,'Лев, колдунья и платяной шкаф','Клайв Льюис','lev_koldunia_i_platyanoi_shkaf.jpg','Первая книга серии «Хроники Нарнии» Клайва Стейплза Льюиса. Выпущена в 1950 году. Входит в 100 лучших романов на английском языке по рейтингу журнала Time'),(8,'Приключения Тома Сойера','Марк Твен','tom_soyer.jpg','Это смешная, милая и грустная книга – иногда все в одном абзаце. Главный герой – озорной и хитрый мальчишка, примерно 12 лет, который со своим другом Гекльберри Финном отправляется в различные приключения, иногда весьма опасные.'),(9,'Приключения Алисы в стране чудес','Льюис Кэрролл','alice_in_wonderland.webp',''),(10,'Евгений Онегин','А.С. Пушкин','evgeny_onegin.jpg','Знаменитый роман в стихах от классика русской литературы. Считается «энциклопедией русской жизни».'),(11,'Война и мир','Л.Н. Толстой','war_and_peace.jpg','Одна из тех книг, которую многие читатели ненавидят в юном возрасте. Зато взрослые могут открыть для себя это произведение заново, впечатляясь его масштабом, исторической ценностью и понимая мотивацию героев.'),(12,'Тихий Дон','Михаил Шолохов','tixiy_don.jpg','За этот четырехтомный роман Шолохов принялся, когда ему было 23 года, а закончил в 35-летнем возрасте. А в 60 лет (в 1965 году) за «Тихий Дон» он был награжден Нобелевской премией.'),(13,'Судьба человека','Михаил Шолохов','sudba_cheloveka.jpg','В Андрее Соколове воплотился собирательный образ советского гражданина, которого затронула война. И, пройдя через ее горнило, он нашел в себе силы остаться сострадательным человеком.'),(14,'Зелёная миля','Стивен Кинг','green_mile.jpg','Стивен Кинг приоткрывает дверь в жуткий мир смертников, откуда уже не возвращаются.'),(15,'Ромео и Джульетта','Уильям Шекспир','romeo_and_juliett.jpg','Трагическая история любви отпрысков двух враждующих семейств легла в основу множества экранизаций, спектаклей, песен и даже рок-опер. А правительство Вероны активно использует популярность пьесы для привлечения туристов.'),(22,'А зори здесь тихие...','Борис Васильев','a_zory_zdes_tihie.webp','Повесть Бориса Васильева \"А зори здесь тихие...\", одно из самых искренних и пронзительных произведений о войне, обладает удивительной силой воздействия на читателя - сердце наполняется болью за всех людей, отдавших жизни за Победу в той страшной войне. Трагическая история о подвиге пятерых девушек-зенитчиц, у которых впереди была вся жизнь, долгая и счастливая, но на их долю выпала жестокая война, разбившая все мечты и радости, разрушившая столько судеб...'),(23,'Записки юного врача','Михаил Булгаков','zapiski_unogo_vracha.webp','Эти семь маленьких шедевров Михаил Булгаков создал в юности, хотя через много лет отредактировал заново. Время действия - 1917 год, место - больница в глухой российской деревне. Сюда в качестве главного и единственного доктора пребывает 23-летний выпускник медицинского факультета с отличной теоретической подготовкой и полным отсутствием опыта. Первые пациенты, тяжелые случаи, неизбежные ошибки, борьба с собственными страхами и малодушием, маленькие и большие победы, иногда - трагические поражения. И каждый рассказ - отдельная уникальная история болезни, полная юмора и самоиронии, а также боли и горечи.');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rate` int DEFAULT NULL,
  UNIQUE KEY `book_id` (`book_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `rating_chk_1` CHECK (((0 < `rate`) and (`rate` < 11)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,3),(1,2,5),(2,1,10),(10,1,10),(23,1,10);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(1) DEFAULT 'U',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','admin','A'),(2,'User ABC','user','user123','U');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18  9:31:05
