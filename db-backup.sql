-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: francisjohn.mysql.pythonanywhere-services.com    Database: francisjohn$default
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `UEdata`
--

DROP TABLE IF EXISTS `UEdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UEdata` (
  `user` varchar(255) NOT NULL,
  `project` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `outliertype` text NOT NULL,
  `q1` int(11) NOT NULL,
  `median` int(11) NOT NULL,
  `q3` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UEdata`
--

LOCK TABLES `UEdata` WRITE;
/*!40000 ALTER TABLE `UEdata` DISABLE KEYS */;
INSERT INTO `UEdata` VALUES ('Return-To-The-Roots','s25client',78410,'1/3/2016 14:36','commits',' time between commits for committer / commit parent count \'Alex@grundis.de\' / \'1\'',232,1863,12072,859761,'https://github.com/Return-To-The-Roots/s25client/commit/7f58bd491bafa6228e5598f7ac6841c729ca3a87\r'),('steptools','NC.js',590280,'1/5/2016 17:40','commits',' time between commits for file \'src/client/models/nc.js\'',609,4273,61015,5028280,'https://github.com/steptools/NC.js/commit/5ab785dbe23f1c71e8bf4dad6fb0178d0af1ad3f\r'),('gentoo','dotnet',1,'1/6/2016 4:57','commits',' number of files deleted',0,0,0,15,'https://github.com/gentoo/dotnet/commit/b1035b67bc6a27889acb7c294be707e2d9430923\r'),('evercam','evercam-admin',18,'1/6/2016 13:53','commits',' number of LOC deleted for file / committer \'app/controllers/cameras_controller.rb\' / \'junaid@evercam.io\'',1,2,4,40,'https://github.com/evercam/evercam-admin/commit/d524796f661a61e9698b8d2ce07511ee9a8d39c1\r'),('fossasia','gci15.fossasia.org',12,'1/6/2016 16:24','pulls',' number of comments for merge status \'true\'',1,1,3,27,'https://github.com/fossasia/gci15.fossasia.org/pull/312\r'),('crossroads','api.goodcity',1237,'1/8/2016 9:12','pulls',' number of LOC added for assignee \'steveyken\'',12,102,254,1237,'https://github.com/crossroads/api.goodcity/pull/142\r'),('annict','annict',1582,'1/9/2016 11:15','commits',' number of LOC added for committer \'me@shimba.co\'',3,14,74,124381,'https://github.com/annict/annict/commit/59907b2847b361e3ca37e81c0de2349fc36547dd\r'),('keybase','kbfs',3071,'1/9/2016 20:38','commits',' number of LOC added for commit parent count \'1\'',4,18,69,155747,'https://github.com/keybase/kbfs/commit/1fa18d1a6784c97a58d013c43f0c95a953b2da86\r'),('layerhq','documentation',235,'1/10/2016 15:23','commits',' number of LOC added for committer \'dcheckoway@gmail.com\'',1,6,34,235,'https://github.com/layerhq/documentation/commit/23bb0bfd8a2e19deda14f79f7a8734972cd4d3b4\r'),('turingschool','curriculum',425,'1/11/2016 19:37','commits',' number of LOC modified for committer \'horace.d.williams@gmail.com\'',2,8,31,955,'https://github.com/turingschool/curriculum/commit/8c3a28b8af2484580a886bfec052bd2fbff1ccc1\r'),('zalando-stups','yourturn',96,'1/12/2016 15:23','commits',' number of LOC modified for file \'client/lib/violation/src/router.react.jsx\'',4,8,26,248,'https://github.com/zalando-stups/yourturn/commit/e067a5623cb2dc8c5d8261f2360dcd3bbd6ff640\r'),('zalando-stups','yourturn',14943800,'1/13/2016 13:00','commits',' time between commits for file / committer \'server/mocks/5005-team.js\' / \'prayerslayer@gmail.com\'',5930,155354,695979,14943800,'https://github.com/zalando-stups/yourturn/commit/380323611a259d9e64a1feb3b0942adc1d6397b1\r'),('gpac','gpac',1,'1/13/2016 13:13','commits',' number of pulls for commit parent count \'1\'',0,0,0,2,'https://github.com/gpac/gpac/commit/d130f627511f3f744f98005ce904d34de2572b55\r'),('Return-To-The-Roots','s25client',9834360,'1/13/2016 18:01','commits',' time between commits for file \'src/GameCommand.h\'',13501,180433,1374220,9834360,'https://github.com/Return-To-The-Roots/s25client/commit/20f62c7489f476085a668b8aa472f19215194c9f\r'),('steptools','NC.js',96242,'1/13/2016 19:33','commits',' time between commits for filetype \'.js\'',170,664,3176,45206400,'https://github.com/steptools/NC.js/commit/5da3a9758a1295d2540d3fcaf68e7a769b3c7a22\r'),('HaaseIT','HCSF',423,'1/15/2016 11:22','commits',' number of LOC modified for commit parent count \'1\'',3,17,62,2665,'https://github.com/HaaseIT/HCSF/commit/01f2c4389348cd6ff5bbf866269f0f16172fb947\r'),('mulesoft','mulesoft-docs',5,'1/15/2016 17:50','commits',' number of files modified for commit parent count \'1\'',1,1,1,300,'https://github.com/mulesoft/mulesoft-docs/commit/e5523cc29ecfea706f227b5623629ea08326011c\r'),('reportbase','j15a',70939,'1/17/2016 19:35','commits',' time between commits for committer \'reportbase@gmail.com\'',40,155,1115,1381870,'https://github.com/reportbase/j15a/commit/03048e0b68d5fc8175c3e88a8c5eccddd1bb37fe\r'),('keybase','kbfs',71,'1/18/2016 9:02','commits',' number of LOC deleted for file / commit parent count \'libkbfs/folder_branch_ops.go\' / \'2\'',1,3,9,71,'https://github.com/keybase/kbfs/commit/6e22d501bba36d078d7c0a35672e1c9d626a7e26\r'),('steptools','NC.js',2214,'1/19/2016 20:02','commits',' number of LOC modified for filetype \'.js\'',6,20,66,127113,'https://github.com/steptools/NC.js/commit/fd407e8187e14f6a7abd4f60f1073837ef9842e6\r'),('Return-To-The-Roots','s25client',8649210,'1/19/2016 21:33','commits',' time between commits for file \'src/controls/ctrlTable.cpp\'',7167,187664,485121,8649210,'https://github.com/Return-To-The-Roots/s25client/commit/44e35274e2c6560ad3c655f45cfe0778ade6ca67\r'),('formio','formio',67,'1/19/2016 21:52','commits',' number of LOC deleted for committer \'zackurben@gmail.com\'',1,4,17,4022,'https://github.com/formio/formio/commit/57cdcdecc668000d65b634a297fab4231f3b31f4\r'),('broadinstitute','picard',338,'1/20/2016 14:04','commits',' number of LOC modified',4,16,75,41920,'https://github.com/broadinstitute/picard/commit/7b8c64960e9ffe87f8b4d358cff09ad436bf42bb\r'),('SUNET','eduid-dashboard',25,'1/21/2016 12:18','commits',' number of LOC deleted for file / committer \'eduiddashboard/__init__.py\' / \'enrique@cazalla.net\'',0,2,5,25,'https://github.com/SUNET/eduid-dashboard/commit/c0c8b0b4a9520732ed477ffbd06edbbc42866c6c\r'),('Return-To-The-Roots','s25client',265,'1/21/2016 23:56','commits',' number of LOC added for file / commit parent count \'src/buildings/nobHQ.cpp\' / \'1\'',1,2,6,402,'https://github.com/Return-To-The-Roots/s25client/commit/693f200d4759a4d7f873794cdf156ff7fe41f68c\r'),('Return-To-The-Roots','s25client',4509970,'1/22/2016 0:22','commits',' time between commits for file / label \'src/ingameWindows/iwMilitaryBuilding.cpp\' / \'enhancement\'',76531,225690,617380,10033400,'https://github.com/Return-To-The-Roots/s25client/commit/3e40c5d08eef042f01556a395f6bb31bf8f057ce');
/*!40000 ALTER TABLE `UEdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-05 17:46:51
