-- MySQL dump 10.11
--
-- Host: dbserver    Database: brdev
-- ------------------------------------------------------
-- Server version	5.0.87-percona-highperf-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ManagersHalf`
--

DROP TABLE IF EXISTS `ManagersHalf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ManagersHalf` (
  `managerID` varchar(10) NOT NULL default '',
  `yearID` smallint(4) NOT NULL default '0',
  `teamID` char(3) NOT NULL default '',
  `lgID` char(2) NOT NULL default '',
  `inseason` int(2) default NULL,
  `half` smallint(1) NOT NULL default '1',
  `G` smallint(3) NOT NULL default '0',
  `W` smallint(3) NOT NULL default '0',
  `L` smallint(3) NOT NULL default '0',
  `rank` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`yearID`,`teamID`,`managerID`,`half`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-03-28 17:12:26
