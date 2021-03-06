CREATE DATABASE  IF NOT EXISTS `jan_station` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jan_station`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jan_station
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Vehicle_NO` varchar(15) DEFAULT 'N/A',
  `Phone_No` varchar(15) DEFAULT 'N/A',
  `Address` varchar(50) DEFAULT 'N/A',
  `CNIC` varchar(13) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Store record of customer or Vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'C','Alam','','03121231212','Torwarsak, Buner','1234567891010','2017-07-17'),(2,'V','Adnan','PSD-444','03121111111','Jowar, Buner','1010101010101','2017-07-17');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`customer_AFTER_INSERT` AFTER INSERT ON `customer` FOR EACH ROW
BEGIN

declare customer_ID_LOCAL int ;
declare Date_LOCAL DATE ;

set customer_ID_LOCAL = new.customer_ID ;
set Date_LOCAL = new.`Date` ;

insert into customer_history (customer_ID, `Date`, HSD_LTR, HSD_PER_LTR, PMG_LTR, PMG_PER_LTR, LUB_LTR, LUB_PER_LTR, Others, Return_Amount) 
							values (customer_ID_LOCAL, Date_LOCAL, 00.00, 00.00, 00.00, 00.00, 00.00, 00.00, 00.00, 00.00) ;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_care`
--

DROP TABLE IF EXISTS `customer_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_care` (
  `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(30) NOT NULL,
  `HSD` decimal(9,2) DEFAULT '0.00',
  `HSD_Rate` decimal(5,2) DEFAULT '0.00',
  `PMG` decimal(9,2) DEFAULT '0.00',
  `PMG_Rate` decimal(5,2) DEFAULT '0.00',
  `LUB` decimal(9,2) DEFAULT '0.00',
  `LUB_Rate` decimal(5,2) DEFAULT '0.00',
  `Others` decimal(9,2) DEFAULT '0.00',
  `Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Transaction_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Store Usual Customer Record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_care`
--

LOCK TABLES `customer_care` WRITE;
/*!40000 ALTER TABLE `customer_care` DISABLE KEYS */;
INSERT INTO `customer_care` VALUES (1,'Azaz',2.00,10.00,2.00,10.00,2.00,10.00,0.00,'2017-07-17 21:51:19'),(2,'Zafar',2000.00,12.00,0.00,12.00,0.00,12.00,0.00,'2017-07-21 21:09:18');
/*!40000 ALTER TABLE `customer_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_care_view`
--

DROP TABLE IF EXISTS `customer_care_view`;
/*!50001 DROP VIEW IF EXISTS `customer_care_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_care_view` AS SELECT 
 1 AS `Transaction_ID`,
 1 AS `Customer_Name`,
 1 AS `HSD`,
 1 AS `HSD_Rate`,
 1 AS `PMG`,
 1 AS `PMG_Rate`,
 1 AS `LUB`,
 1 AS `LUB_Rate`,
 1 AS `Others`,
 1 AS `Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_history`
--

DROP TABLE IF EXISTS `customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_history` (
  `CH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `customer_ID` int(11) NOT NULL,
  `Date` varchar(45) NOT NULL,
  `HSD_LTR` decimal(9,2) DEFAULT '0.00',
  `HSD_PER_LTR` decimal(5,2) DEFAULT '0.00',
  `PMG_LTR` decimal(9,2) DEFAULT '0.00',
  `PMG_PER_LTR` decimal(5,2) DEFAULT '0.00',
  `LUB_LTR` decimal(9,2) DEFAULT '0.00',
  `LUB_PER_LTR` decimal(5,2) DEFAULT '0.00',
  `Others` decimal(9,2) DEFAULT '0.00',
  `Return_Amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`CH_ID`),
  KEY `CSID_FPK_idx` (`customer_ID`),
  CONSTRAINT `CSID_FPK` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer debt record will be stored here.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_history`
--

LOCK TABLES `customer_history` WRITE;
/*!40000 ALTER TABLE `customer_history` DISABLE KEYS */;
INSERT INTO `customer_history` VALUES (1,1,'2017-07-17',4.00,10.00,4.00,10.00,4.00,10.00,0.00,30.00),(2,2,'2017-07-17',3.00,10.00,3.00,10.00,3.00,10.00,0.00,40.00),(3,1,'2017-07-29',50.00,12.00,50.00,12.00,50.00,12.00,1000.00,1000.00);
/*!40000 ALTER TABLE `customer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_info_view`
--

DROP TABLE IF EXISTS `customer_info_view`;
/*!50001 DROP VIEW IF EXISTS `customer_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_info_view` AS SELECT 
 1 AS `customer_ID`,
 1 AS `type`,
 1 AS `Name`,
 1 AS `Vehicle_NO`,
 1 AS `Phone_No`,
 1 AS `Address`,
 1 AS `CNIC`,
 1 AS `Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `daily_report`
--

DROP TABLE IF EXISTS `daily_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_report` (
  `daily_report_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Today_Profit` decimal(9,2) DEFAULT '0.00',
  `Today_Sale` decimal(10,2) DEFAULT '0.00',
  `Remaining_Balance` decimal(10,2) DEFAULT '0.00',
  `Incoming_Stock` decimal(10,2) DEFAULT '0.00',
  `Current_Day_Remaining` decimal(10,2) AS (Remaining_Balance+Incoming_Stock-Today_Sale) VIRTUAL,
  PRIMARY KEY (`daily_report_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_report`
--

LOCK TABLES `daily_report` WRITE;
/*!40000 ALTER TABLE `daily_report` DISABLE KEYS */;
INSERT INTO `daily_report` VALUES (1,'2017-07-17',100.00,150.00,0.00,300.00,150.00),(2,'2017-07-18',25.00,75.00,150.00,210.00,285.00),(3,'2017-07-19',25.00,105.00,285.00,0.00,180.00),(4,'2017-07-20',25.00,105.00,180.00,150.00,225.00),(5,'2017-07-21',25.00,75.00,225.00,150.00,300.00),(6,'2017-07-29',25.00,105.00,300.00,0.00,195.00);
/*!40000 ALTER TABLE `daily_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_sale`
--

DROP TABLE IF EXISTS `daily_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_sale` (
  `daily_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `HSD_LTR` decimal(9,2) DEFAULT '0.00',
  `HSD_PER_LTR` decimal(5,2) DEFAULT '0.00' COMMENT 'Store value of Sale per liter',
  `PMG_LTR` decimal(9,2) DEFAULT '0.00',
  `PMG_PER_LTR` decimal(5,2) DEFAULT '0.00',
  `LUB_LTR` decimal(9,2) DEFAULT '0.00',
  `LUB_PER_LTR` decimal(5,2) DEFAULT '0.00',
  `Miscellaneous_Charges` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`daily_sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='This table contain report of daily sale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_sale`
--

LOCK TABLES `daily_sale` WRITE;
/*!40000 ALTER TABLE `daily_sale` DISABLE KEYS */;
INSERT INTO `daily_sale` VALUES (1,'2017-07-17',10.00,10.00,10.00,10.00,10.00,10.00,50.00),(2,'2017-07-18',5.00,10.00,5.00,10.00,5.00,10.00,50.00),(3,'2017-07-19',5.00,12.00,5.00,12.00,5.00,12.00,50.00),(4,'2017-07-20',5.00,10.00,5.00,10.00,5.00,10.00,50.00),(5,'2017-07-21',5.00,10.00,5.00,10.00,5.00,10.00,50.00),(6,'2017-07-29',5.00,12.00,5.00,12.00,5.00,12.00,50.00);
/*!40000 ALTER TABLE `daily_sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`daily_sale_AFTER_INSERT` AFTER INSERT ON `daily_sale` FOR EACH ROW
BEGIN

-- Execute when new sale is made
-- Update Meter State And Profit/Total Sale/Remaining Balance Calculation

DECLARE Remaining_HSD_Local decimal(8,2) default 0.00 ;
DECLARE Remaining_PMG_Local decimal(8,2) default 0.00 ;
DECLARE Remaining_LUB_Local decimal(8,2) default 0.00 ;

-- Variable for Profit/Sale Calculation
DECLARE Total_Profit decimal(10,2) default 0.00 ;
DECLARE Total_Sale decimal(10,2) default 0.00 ;
DECLARE Previous_RB decimal(10,2) default 0.00 ;
DECLARE Total_Remaining decimal(10,2) default 0.00 ;
DECLARE HSD_Sale_Rate decimal(5,2) default 0.00 ;
DECLARE HSD_Purc_Rate decimal(5,2) default 0.00 ;
DECLARE PMG_Sale_Rate decimal(5,2) default 0.00 ;
DECLARE PMG_Purc_Rate decimal(5,2) default 0.00 ;
DECLARE LUB_Sale_Rate decimal(5,2) default 0.00 ;
DECLARE LUB_Purc_Rate decimal(5,2) default 0.00 ;

	-- Minus oil from the Tank 
	select Remaining_HSD, Remaining_PMG, Remaining_LUB INTO Remaining_HSD_Local, Remaining_PMG_Local, Remaining_LUB_Local 
    FROM meter_state ;
    
    SET Remaining_HSD_Local = Remaining_HSD_Local - NEW.HSD_LTR;
    SET Remaining_PMG_Local = Remaining_PMG_Local - NEW.PMG_LTR;
    SET Remaining_LUB_Local = Remaining_LUB_Local - NEW.LUB_LTR;
    
	update `meter_state` 
    set Remaining_HSD = Remaining_HSD_Local,
    Remaining_PMG = Remaining_PMG_Local,
    Remaining_LUB = Remaining_LUB_Local ;

	-- Profit/Total Sale/ Remaining Balance Calculation
    -- Read Sale and Purchase Rate from Meter
    SELECT HSD_PER_LTR_SALE, PMG_PER_LTR_SALE, LUB_PER_LTR_SALE, HSD_PER_LTR_PURC, PMG_PER_LTR_PURC, LUB_PER_LTR_PURC
    INTO HSD_Sale_Rate, PMG_Sale_Rate, LUB_Sale_Rate, HSD_Purc_Rate, PMG_Purc_Rate, LUB_Purc_Rate
    FROM meter_state ;
    
    SET Total_Profit = NEW.HSD_LTR * (HSD_Sale_Rate - HSD_Purc_Rate) +
					   NEW.PMG_LTR * (PMG_Sale_Rate - PMG_Purc_Rate) +
                       NEW.LUB_LTR * (LUB_Sale_Rate - LUB_Purc_Rate) ;
    SET Total_Profit = Total_Profit - NEW.Miscellaneous_Charges ;
    
    SET Total_Sale = NEW.HSD_LTR * HSD_Purc_Rate +
					 NEW.PMG_LTR * PMG_Purc_Rate +
					 NEW.LUB_LTR * LUB_Purc_Rate ;
    
    # Remaining Balance Calculation
    IF NOT EXISTS (SELECT 1 FROM `daily_report` WHERE daily_report_ID = NEW.`daily_sale_id`- 1 LIMIT 1)
    THEN
		SET Total_Remaining = 0.00;
	ELSE
		#Previous income + previous RB - today sale
		SELECT Current_Day_Remaining INTO Previous_RB
		FROM `daily_report` WHERE `daily_report_ID` = NEW.`daily_sale_id` - 1 ;
        SET Total_Remaining = Previous_RB;
    END IF;
    
                       
	IF NOT EXISTS (SELECT 1 FROM `daily_report` WHERE `Date` = NEW.`date` LIMIT 1)
    THEN
		INSERT INTO daily_report (daily_report_ID, `Date`, Today_Profit, Today_Sale, Remaining_Balance) VALUES (NEW.`daily_sale_id`, NEW.`date`, Total_Profit, Total_Sale, Total_Remaining) ;
	ELSE
		UPDATE daily_report
        SET Today_Profit = Total_Profit,
        Today_Sale = Total_Sale,
        Remaining_Balance = Total_Remaining
        WHERE `Date` = NEW.`date` ;
        
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`daily_sale_BEFORE_UPDATE` BEFORE UPDATE ON `daily_sale` FOR EACH ROW
BEGIN

DECLARE Remaining_HSD_Local decimal(8,2) default 0.00 ;
DECLARE Remaining_PMG_Local decimal(8,2) default 0.00 ;
DECLARE Remaining_LUB_Local decimal(8,2) default 0.00 ;

DECLARE old_HSD_Daily decimal(9,2) default 0.00 ;
DECLARE old_PMG_Daily decimal(9,2) default 0.00 ;
DECLARE old_LUB_Daily decimal(9,2) default 0.00 ;

#DECLARE Total_Remaining decimal(10,2) default 0.00 ;
DECLARE HSD_Purc_Rate decimal(5,2) default 0.00 ;
DECLARE PMG_Purc_Rate decimal(5,2) default 0.00 ;
DECLARE LUB_Purc_Rate decimal(5,2) default 0.00 ;

	select Remaining_HSD, Remaining_PMG, Remaining_LUB 
    INTO Remaining_HSD_Local, Remaining_PMG_Local, Remaining_LUB_Local 
    FROM meter_state ;
    
    select HSD_LTR, PMG_LTR, LUB_LTR INTO old_HSD_Daily, old_PMG_Daily, old_LUB_Daily 
    FROM daily_sale 
    WHERE `date` = NEW.`date`;
    
    -- Minus new stock with previous stock
    SET Remaining_HSD_Local = (old_HSD_Daily + Remaining_HSD_Local) - NEW.HSD_LTR;
    SET Remaining_PMG_Local = (old_PMG_Daily + Remaining_PMG_Local) - NEW.PMG_LTR;
    SET Remaining_LUB_Local = (old_LUB_Daily + Remaining_LUB_Local) - NEW.LUB_LTR;
    
    update `meter_state` 
    set Remaining_HSD = Remaining_HSD_Local,
    Remaining_PMG = Remaining_PMG_Local,
    Remaining_LUB = Remaining_LUB_Local ;
    
    -- Remaining Balance Calculation
    -- Read Purchase Rate from Meter
    SELECT HSD_PER_LTR_PURC, PMG_PER_LTR_PURC, LUB_PER_LTR_PURC
    INTO HSD_Purc_Rate, PMG_Purc_Rate, LUB_Purc_Rate
    FROM meter_state ;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`daily_sale_AFTER_UPDATE` AFTER UPDATE ON `daily_sale` FOR EACH ROW
BEGIN

-- Execute when new sale is made

-- Variable for Profit/Total Sale Calculation
DECLARE Total_Profit decimal(10,2) default 0.00 ;
DECLARE Total_Sale decimal(10,2) default 0.00 ;
DECLARE Total_Remaining decimal(10,2) default 0.00 ;
DECLARE Previous_RB decimal(10,2) default 0.00 ;
DECLARE HSD_Sale_Rate decimal(5,2) default 0.00 ;
DECLARE HSD_Purc_Rate decimal(5,2) default 0.00 ;
DECLARE PMG_Sale_Rate decimal(5,2) default 0.00 ;
DECLARE PMG_Purc_Rate decimal(5,2) default 0.00 ;
DECLARE LUB_Sale_Rate decimal(5,2) default 0.00 ;
DECLARE LUB_Purc_Rate decimal(5,2) default 0.00 ;


	-- Profit/Total Sale/ Remaining Balance Calculation
    -- Read Sale and Purchase Rate from Meter
    SELECT HSD_PER_LTR_SALE, PMG_PER_LTR_SALE, LUB_PER_LTR_SALE, HSD_PER_LTR_PURC, PMG_PER_LTR_PURC, LUB_PER_LTR_PURC
    INTO HSD_Sale_Rate, PMG_Sale_Rate, LUB_Sale_Rate, HSD_Purc_Rate, PMG_Purc_Rate, LUB_Purc_Rate
    FROM meter_state ;
    
    SET Total_Profit = NEW.HSD_LTR * (HSD_Sale_Rate - HSD_Purc_Rate) +
					   NEW.PMG_LTR * (PMG_Sale_Rate - PMG_Purc_Rate) +
                       NEW.LUB_LTR * (LUB_Sale_Rate - LUB_Purc_Rate) ;
	
    SET Total_Profit = Total_Profit - NEW.Miscellaneous_Charges ;
    
	SET Total_Sale = NEW.HSD_LTR * HSD_Purc_Rate +
					 NEW.PMG_LTR * PMG_Purc_Rate +
					 NEW.LUB_LTR * LUB_Purc_Rate ;
                     
	# Remaining Balance Calculation
    IF NOT EXISTS (SELECT 1 FROM `daily_report` WHERE daily_report_ID = NEW.`daily_sale_id`- 1 LIMIT 1)
    THEN
		SET Total_Remaining = 0.00;
	ELSE
		#Previous income + previous RB - today sale
		SELECT Current_Day_Remaining INTO Previous_RB
		FROM `daily_report` WHERE `daily_report_ID` = NEW.`daily_sale_id` - 1 ;
        SET Total_Remaining = Previous_RB;
    END IF;
	
                       
	IF NOT EXISTS (SELECT 1 FROM `daily_report` WHERE `Date` = NEW.`date` LIMIT 1)
    THEN
        INSERT INTO daily_report (daily_report_ID, `Date`, Today_Profit, Today_Sale, Remaining_Balance) VALUES (NEW.`daily_sale_id`, NEW.`date`, Total_Profit, Total_Sale, Total_Remaining) ;
	ELSE
		UPDATE daily_report
        SET Today_Profit = Total_Profit,
        Today_Sale = Total_Sale,
        Remaining_Balance = Total_Remaining
        WHERE `Date` = NEW.`date` ;
	
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `daily_summary_view`
--

DROP TABLE IF EXISTS `daily_summary_view`;
/*!50001 DROP VIEW IF EXISTS `daily_summary_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `daily_summary_view` AS SELECT 
 1 AS `daily_report_ID`,
 1 AS `Date`,
 1 AS `Today_Profit`,
 1 AS `Today_Sale`,
 1 AS `Remaining_Balance`,
 1 AS `Incoming_Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `incoming_stock`
--

DROP TABLE IF EXISTS `incoming_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incoming_stock` (
  `incoming_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `HSD_LTR` decimal(9,2) DEFAULT '0.00',
  `HSD_PER_LTR_PURCHASE` decimal(5,2) DEFAULT '0.00' COMMENT 'Store value of Purchase per liter',
  `PMG_LTR` decimal(9,2) DEFAULT '0.00',
  `PMG_PER_LTR_PURCHASE` decimal(5,2) DEFAULT '0.00',
  `LUB_LTR` decimal(9,2) DEFAULT '0.00',
  `LUB_PER_LTR_PURCHASE` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`incoming_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='This table contain the incoming stock record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_stock`
--

LOCK TABLES `incoming_stock` WRITE;
/*!40000 ALTER TABLE `incoming_stock` DISABLE KEYS */;
INSERT INTO `incoming_stock` VALUES (1,'2017-07-17',20.00,5.00,20.00,5.00,20.00,5.00),(2,'2017-07-18',10.00,7.00,10.00,7.00,10.00,7.00),(3,'2017-07-20',10.00,5.00,10.00,5.00,10.00,5.00),(4,'2017-07-21',10.00,5.00,10.00,5.00,10.00,5.00);
/*!40000 ALTER TABLE `incoming_stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`incoming_stock_AFTER_INSERT` AFTER INSERT ON `incoming_stock` FOR EACH ROW
BEGIN

-- Execute when new stock (Oil) come
-- Calculation for Total_New_Income

DECLARE old_HSD decimal(8,2) default 0.00 ;
DECLARE old_PMG decimal(8,2) default 0.00 ;
DECLARE old_LUB decimal(8,2) default 0.00 ;

DECLARE Total_Income DECIMAL(10,2) default 0.00 ;

	-- Read old status of the Tank
	select Remaining_HSD, Remaining_PMG, Remaining_LUB INTO old_HSD, old_PMG, old_LUB 
    FROM meter_state ;
    
    -- Add new stock with previous stock
    SET old_HSD = NEW.HSD_LTR + old_HSD;
    SET old_PMG = NEW.PMG_LTR + old_PMG;
    SET old_LUB = NEW.LUB_LTR + old_LUB;
    
	update `meter_state` 
    set Remaining_HSD = old_HSD,
    Remaining_PMG = old_PMG,
    Remaining_LUB = old_LUB ;
    
    -- Total Income Calculation
    SET Total_Income = (NEW.HSD_LTR * NEW.HSD_PER_LTR_PURCHASE) +
					   (NEW.PMG_LTR * NEW.PMG_PER_LTR_PURCHASE) +
					   (NEW.LUB_LTR * NEW.LUB_PER_LTR_PURCHASE) ;
	
    IF NOT EXISTS (SELECT 1 FROM `daily_report` WHERE `Date` = NEW.`date` LIMIT 1)
    THEN
		INSERT INTO daily_report (`Date`, Incoming_Stock) VALUES (NEW.`date`, Total_Income) ;
	ELSE
		UPDATE daily_report
        SET Incoming_Stock = Total_Income
        WHERE `Date` = NEW.`date` ;
	
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`incoming_stock_BEFORE_UPDATE` BEFORE UPDATE ON `incoming_stock` FOR EACH ROW
BEGIN

-- Execute when doing updation in existing record
-- Calculation for Meter State
DECLARE old_HSD decimal(8,2) default 0.00 ;
DECLARE old_PMG decimal(8,2) default 0.00 ;
DECLARE old_LUB decimal(8,2) default 0.00 ;
DECLARE Previous_HSD_Inc decimal(9,2) default 0.00 ;
DECLARE Previous_PMG_Inc decimal(9,2) default 0.00 ;
DECLARE Previous_LUB_Inc decimal(9,2) default 0.00 ;

	-- First read Tank status
	select Remaining_HSD, Remaining_PMG, Remaining_LUB INTO old_HSD, old_PMG, old_LUB 
    FROM meter_state ;
    
    -- Read already added income stock
	select HSD_LTR, PMG_LTR, LUB_LTR INTO Previous_HSD_Inc, Previous_PMG_Inc, Previous_LUB_Inc 
	FROM incoming_stock 
	WHERE `date` = NEW.`date`;
    
	-- (Existing Tank Status - already Added Incoming) + New Update Incoming Stock
	SET old_HSD = (old_HSD - Previous_HSD_Inc) + NEW.HSD_LTR;
	SET old_PMG = (old_PMG - Previous_PMG_Inc) + NEW.PMG_LTR;
	SET old_LUB = (old_LUB - Previous_LUB_Inc) + NEW.LUB_LTR;
    
	update `meter_state` 
	set Remaining_HSD = old_HSD,
	Remaining_PMG = old_PMG,
	Remaining_LUB = old_LUB ;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jan_station`.`incoming_stock_AFTER_UPDATE` AFTER UPDATE ON `incoming_stock` FOR EACH ROW
BEGIN

-- Update Total_Income Price for daily_report Table

DECLARE Total_Income DECIMAL(10,2) default 0.00 ;

	-- Total Income Calculation
    SET Total_Income = (NEW.HSD_LTR * NEW.HSD_PER_LTR_PURCHASE) +
					   (NEW.PMG_LTR * NEW.PMG_PER_LTR_PURCHASE) +
					   (NEW.LUB_LTR * NEW.LUB_PER_LTR_PURCHASE) ;
	
    IF NOT EXISTS (SELECT 1 FROM `daily_report` WHERE `Date` = NEW.`date` LIMIT 1)
    THEN
		INSERT INTO daily_report (`Date`, Incoming_Stock) VALUES (NEW.`date`, Total_Income) ;
	ELSE
		UPDATE daily_report
        SET Incoming_Stock = Total_Income
        WHERE `Date` = NEW.`date` ;
	
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ledge_history_view`
--

DROP TABLE IF EXISTS `ledge_history_view`;
/*!50001 DROP VIEW IF EXISTS `ledge_history_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ledge_history_view` AS SELECT 
 1 AS `customer_ID`,
 1 AS `Date`,
 1 AS `HSD_LTR`,
 1 AS `HSD_PER_LTR`,
 1 AS `PMG_LTR`,
 1 AS `PMG_PER_LTR`,
 1 AS `LUB_LTR`,
 1 AS `LUB_PER_LTR`,
 1 AS `Others`,
 1 AS `Return_Amount`,
 1 AS `NET`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `meter_state`
--

DROP TABLE IF EXISTS `meter_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meter_state` (
  `HSD_PER_LTR_SALE` decimal(5,2) DEFAULT '0.00',
  `PMG_PER_LTR_SALE` decimal(5,2) DEFAULT '0.00',
  `LUB_PER_LTR_SALE` decimal(5,2) DEFAULT '0.00',
  `HSD_PER_LTR_PURC` decimal(5,2) DEFAULT '0.00',
  `PMG_PER_LTR_PURC` decimal(5,2) DEFAULT '0.00',
  `LUB_PER_LTR_PURC` decimal(5,2) DEFAULT '0.00',
  `Remaining_HSD` decimal(8,2) DEFAULT '0.00',
  `Remaining_PMG` decimal(8,2) DEFAULT '0.00',
  `Remaining_LUB` decimal(8,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meter_state`
--

LOCK TABLES `meter_state` WRITE;
/*!40000 ALTER TABLE `meter_state` DISABLE KEYS */;
INSERT INTO `meter_state` VALUES (12.00,12.00,12.00,7.00,7.00,7.00,15.00,15.00,15.00);
/*!40000 ALTER TABLE `meter_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `monthly_income_view`
--

DROP TABLE IF EXISTS `monthly_income_view`;
/*!50001 DROP VIEW IF EXISTS `monthly_income_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `monthly_income_view` AS SELECT 
 1 AS `Date`,
 1 AS `Total_HSD`,
 1 AS `Total_PMG`,
 1 AS `Total_LUB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `monthly_sale_view`
--

DROP TABLE IF EXISTS `monthly_sale_view`;
/*!50001 DROP VIEW IF EXISTS `monthly_sale_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `monthly_sale_view` AS SELECT 
 1 AS `Date`,
 1 AS `Total_HSD`,
 1 AS `Total_PMG`,
 1 AS `Total_LUB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `remaining_balance_view`
--

DROP TABLE IF EXISTS `remaining_balance_view`;
/*!50001 DROP VIEW IF EXISTS `remaining_balance_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `remaining_balance_view` AS SELECT 
 1 AS `ID`,
 1 AS `Remaining_Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `remaining_stock_view`
--

DROP TABLE IF EXISTS `remaining_stock_view`;
/*!50001 DROP VIEW IF EXISTS `remaining_stock_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `remaining_stock_view` AS SELECT 
 1 AS `Date`,
 1 AS `Remaining_HSD`,
 1 AS `Remaining_PMG`,
 1 AS `Remaining_LUB`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_remaining_debt_view`
--

DROP TABLE IF EXISTS `total_remaining_debt_view`;
/*!50001 DROP VIEW IF EXISTS `total_remaining_debt_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `total_remaining_debt_view` AS SELECT 
 1 AS `Total_remaining_Debt`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'jan_station'
--

--
-- Dumping routines for database 'jan_station'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer`(IN `Type_P` VARCHAR(1),
													   IN `Name_P` VARCHAR(30), 
													   IN `Vehicle_NO_P` VARCHAR(15), 
													   IN `Phone_No_P` VARCHAR(15), 
													   IN `Address_P` VARCHAR(50), 
													   IN `CNIC_P` VARCHAR(13), 
													   IN `Date_P` DATE
                                                             )
    NO SQL
BEGIN
start transaction;

IF NOT EXISTS ( SELECT 1 FROM customer WHERE CNIC = CNIC_P LIMIT 1)
THEN
    insert into customer (`Type`, `Name`, Vehicle_NO, Phone_No, Address, CNIC, `Date`) 
							values (Type_P, Name_P, Vehicle_NO_P, Phone_No_P, Address_P, CNIC_P, Date_P) ;
	
ELSE
	update customer 
    set `Type` = Type_P,
	`Name`=Name_P, 
    Vehicle_NO=Vehicle_NO_P,
    Phone_No=Phone_No_P,
    Address=Address_P
    WHERE CNIC = CNIC_P ;
    
END IF;



commit;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_customer_amount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_amount`(IN `customer_ID_P` INT,
													   IN `Date_P` DATE,
													   IN `HSD_LTR_P` DECIMAL(9,2),
													   IN `HSD_PER_LTR_P` DECIMAL(5,2), 
													   IN `PMG_LTR_P` DECIMAL(9,2), 
													   IN `PMG_PER_LTR_P` DECIMAL(5,2), 
													   IN `LUB_LTR_P` DECIMAL(9,2), 
													   IN `LUB_PER_LTR_P` DECIMAL(5,2),
                                                       IN `Others_P` DECIMAL(9,2)
                                                       )
    NO SQL
BEGIN

DECLARE HSD_LTR_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE PMG_LTR_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE LUB_LTR_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE Others_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;

start transaction;

IF NOT EXISTS ( SELECT 1 FROM customer_history WHERE customer_ID = customer_ID_P AND `Date` = Date_P LIMIT 1)
THEN
    insert into customer_history (customer_ID, `Date`, HSD_LTR, HSD_PER_LTR, PMG_LTR, PMG_PER_LTR, LUB_LTR, LUB_PER_LTR, Others, Return_Amount) 
							values (customer_ID_P, Date_P, HSD_LTR_P, HSD_PER_LTR_P, PMG_LTR_P, PMG_PER_LTR_P, LUB_LTR_P, LUB_PER_LTR_P, Others_P, 0.00) ;
ELSE
	
    SELECT DISTINCT HSD_LTR, PMG_LTR, LUB_LTR, Others
	INTO HSD_LTR_LOCAL, PMG_LTR_LOCAL, LUB_LTR_LOCAL, Others_LOCAL
	from customer_history WHERE customer_ID = customer_ID_P AND `Date`=Date_P;
    
    # Add with today record
    SET HSD_LTR_P = HSD_LTR_P + HSD_LTR_LOCAL;
	SET PMG_LTR_P = PMG_LTR_P + PMG_LTR_LOCAL;
	SET LUB_LTR_P = LUB_LTR_P + LUB_LTR_LOCAL;
	SET Others_P = Others_P + Others_LOCAL;
    
	update customer_history 
    set HSD_LTR = HSD_LTR_P,
	HSD_PER_LTR = HSD_PER_LTR_P, 
    PMG_LTR = PMG_LTR_P,
    PMG_PER_LTR = PMG_PER_LTR_P,
    LUB_LTR = LUB_LTR_P,
    LUB_PER_LTR = LUB_PER_LTR_P,
    Others = Others_P
    WHERE customer_ID = customer_ID_P AND `Date`= Date_P;
    
END IF;



commit;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_customer_care` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_care`(
									  IN `Transaction_ID_P` INT,
									  IN `Customer_Name_P` VARCHAR(30), 
									  IN `HSD_P` DECIMAL(9,2), 
									  IN `HSD_Rate_P` DECIMAL(5,2), 
									  IN `PMG_P` DECIMAL(9,2), 
									  IN `PMG_Rate_P` DECIMAL(5,2),
                                      IN `LUB_P` DECIMAL(9,2), 
									  IN `LUB_Rate_P` DECIMAL(5,2),
                                      IN `Others_P` DECIMAL(9,2), 
									  IN `Time_P` DATETIME
                                      )
BEGIN

start transaction;
	
    IF NOT EXISTS (SELECT 1 FROM `customer_care` WHERE `Transaction_ID` = Transaction_ID_P LIMIT 1)
    THEN
		insert into customer_care (`Transaction_ID`, `Customer_Name`, `HSD`, `HSD_Rate`, `PMG`, `PMG_Rate`, `LUB`, `LUB_Rate`, `Others`, `Time`) 
		values (`Transaction_ID_P`, `Customer_Name_P`, `HSD_P`, `HSD_Rate_P`, `PMG_P`, `PMG_Rate_P`, `LUB_P`, `LUB_Rate_P`, `Others_P`, `Time_P`) ;
	END IF;



commit;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_customer_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_customer_history`(IN `customer_ID_P` INT,
													   IN `Date_P` DATE,
													   IN `HSD_LTR_P` DECIMAL(9,2),
													   IN `HSD_PER_LTR_P` DECIMAL(5,2), 
													   IN `PMG_LTR_P` DECIMAL(9,2), 
													   IN `PMG_PER_LTR_P` DECIMAL(5,2), 
													   IN `LUB_LTR_P` DECIMAL(9,2), 
													   IN `LUB_PER_LTR_P` DECIMAL(5,2),
                                                       IN `Others_P` DECIMAL(9,2),
                                                       IN `Return_Amount_P` DECIMAL(10,2)
                                                       )
    NO SQL
BEGIN

DECLARE HSD_LTR_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE HSD_PER_LTR_LOCAL DECIMAL(5,2) DEFAULT 00.00 ;
DECLARE PMG_LTR_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE PMG_PER_LTR_LOCAL DECIMAL(5,2) DEFAULT 00.00 ;
DECLARE LUB_LTR_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE LUB_PER_LTR_LOCAL DECIMAL(5,2) DEFAULT 00.00 ;
DECLARE Others_LOCAL DECIMAL(9,2) DEFAULT 00.00 ;
DECLARE Return_Amount_LOCAL DECIMAL(10,2) DEFAULT 00.00 ;

start transaction;

IF NOT EXISTS ( SELECT 1 FROM customer_history WHERE customer_ID = customer_ID_P AND `Date` = Date_P LIMIT 1)
THEN
    insert into customer_history (customer_ID, `Date`, HSD_LTR, HSD_PER_LTR, PMG_LTR, PMG_PER_LTR, LUB_LTR, LUB_PER_LTR, Others, Return_Amount) 
							values (customer_ID_P, Date_P, HSD_LTR_P, HSD_PER_LTR_P, PMG_LTR_P, PMG_PER_LTR_P, LUB_LTR_P, LUB_PER_LTR_P, Others_P, Return_Amount_P) ;
ELSE
	
    SELECT HSD_LTR, HSD_PER_LTR, PMG_LTR, PMG_PER_LTR, LUB_LTR, LUB_PER_LTR, Others, Return_Amount
	  INTO HSD_LTR_LOCAL, HSD_PER_LTR_LOCAL, PMG_LTR_LOCAL, PMG_PER_LTR_LOCAL, LUB_LTR_LOCAL, LUB_PER_LTR_LOCAL, Others_LOCAL, Return_Amount_LOCAL
			from customer_history WHERE customer_ID = customer_ID_P AND `Date`=Date_P;
    
    # If request come from return form then no need to update per/rate and Others
    SET HSD_LTR_P = HSD_LTR_P + HSD_LTR_LOCAL;
	SET HSD_PER_LTR_P = HSD_PER_LTR_P;
	SET PMG_LTR_P = PMG_LTR_P + PMG_LTR_LOCAL;
	SET PMG_PER_LTR_P = PMG_PER_LTR_P ;
	SET LUB_LTR_P = LUB_LTR_P + LUB_LTR_LOCAL;
	SET LUB_PER_LTR_P = LUB_PER_LTR_P ;
	SET Others_P = Others_P + Others_LOCAL;
	SET Return_Amount_P = Return_Amount_LOCAL;
  
    
    
    
	update customer_history 
    set HSD_LTR = HSD_LTR_P,
	HSD_PER_LTR = HSD_PER_LTR_P, 
    PMG_LTR = PMG_LTR_P,
    PMG_PER_LTR = PMG_PER_LTR_P,
    LUB_LTR = LUB_LTR_P,
    LUB_PER_LTR = LUB_PER_LTR_P,
    Others = Others_P,
    Return_Amount = Return_Amount_P
    WHERE customer_ID = customer_ID_P AND `Date`= Date_P;
    
END IF;



commit;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_daily_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_daily_sale`(IN `date_P` DATE, 
															 IN `HSD_LTR_P` DECIMAL(9,2), 
                                                             IN `PMG_LTR_P` DECIMAL(9,2), 
                                                             IN `LUB_LTR_P` DECIMAL(9,2), 
                                                             IN `HSD_PER_LTR_SALE_P` DECIMAL(5,2), 
                                                             IN `PMG_PER_LTR_SALE_P` DECIMAL(5,2), 
                                                             IN `LUB_PER_LTR_SALE_P` DECIMAL(5,2), 
                                                             IN `Miscellaneous_Charges_P` DECIMAL(9,2)
                                                             )
    NO SQL
BEGIN
start transaction;

IF NOT EXISTS ( SELECT 1 FROM daily_sale WHERE `date` = date_p LIMIT 1)
THEN
    insert into daily_sale (`date`, HSD_LTR, PMG_LTR, LUB_LTR, HSD_PER_LTR, PMG_PER_LTR, LUB_PER_LTR, Miscellaneous_Charges) 
							values (date_P , HSD_LTR_P, PMG_LTR_P, LUB_LTR_P, HSD_PER_LTR_SALE_P, PMG_PER_LTR_SALE_P, LUB_PER_LTR_SALE_P, Miscellaneous_Charges_P) ;
ELSE
	update daily_sale 
    set HSD_LTR=HSD_LTR_P, 
    PMG_LTR=PMG_LTR_P,
    LUB_LTR=LUB_LTR_P,
    HSD_PER_LTR=HSD_PER_LTR_SALE_P,
    PMG_PER_LTR=PMG_PER_LTR_SALE_P,
    LUB_PER_LTR=LUB_PER_LTR_SALE_P,
    Miscellaneous_Charges=Miscellaneous_Charges_P
    WHERE `date` = date_P ;
    
END IF;



commit;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_incoming_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_incoming_stock`(IN `date_P` DATE, 
															 IN `HSD_LTR_P` DECIMAL(9,2), 
                                                             IN `PMG_LTR_P` DECIMAL(9,2), 
                                                             IN `LUB_LTR_P` DECIMAL(9,2), 
                                                             IN `HSD_PER_LTR_PURCHASE_P` DECIMAL(5,2), 
                                                             IN `PMG_PER_LTR_PURCHASE_P` DECIMAL(5,2), 
                                                             IN `LUB_PER_LTR_PURCHASE_P` DECIMAL(5,2)
                                                             )
    NO SQL
BEGIN
start transaction;

IF NOT EXISTS ( SELECT 1 FROM `incoming_stock` WHERE `date` = date_p LIMIT 1)
THEN
    insert into `incoming_stock` (`date`, HSD_LTR, PMG_LTR, LUB_LTR, HSD_PER_LTR_PURCHASE, PMG_PER_LTR_PURCHASE, LUB_PER_LTR_PURCHASE) 
							values (date_P , HSD_LTR_P, PMG_LTR_P, LUB_LTR_P, HSD_PER_LTR_PURCHASE_P, PMG_PER_LTR_PURCHASE_P, LUB_PER_LTR_PURCHASE_P) ;
ELSE
	update `incoming_stock` 
    set HSD_LTR=HSD_LTR_P, 
    PMG_LTR=PMG_LTR_P,
    LUB_LTR=LUB_LTR_P,
    HSD_PER_LTR_PURCHASE=HSD_PER_LTR_PURCHASE_P,
    PMG_PER_LTR_PURCHASE=PMG_PER_LTR_PURCHASE_P,
    LUB_PER_LTR_PURCHASE=LUB_PER_LTR_PURCHASE_P
    WHERE `date` = date_P ;
    
END IF;



commit;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `return_customer_amount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `return_customer_amount`(IN `customer_ID_P` INT,
													   IN `Date_P` DATE,
                                                       IN `Return_Amount_P` DECIMAL(10,2)
                                                       )
    NO SQL
BEGIN


DECLARE Return_Amount_LOCAL DECIMAL(10,2) DEFAULT 00.00 ;

start transaction;

SELECT DISTINCT Return_Amount INTO Return_Amount_LOCAL
from customer_history WHERE customer_ID = customer_ID_P AND `Date`=Date_P;
    
    # Add new return amount with previous return amount
	SET Return_Amount_P = Return_Amount_P + Return_Amount_LOCAL;
    
	update customer_history 
    set Return_Amount = Return_Amount_P
    WHERE customer_ID = customer_ID_P AND `Date`= Date_P;

commit;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_oil_rate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_oil_rate`(IN `HSD_PER_LTR_P` DECIMAL(5,2),
									IN `PMG_PER_LTR_P` DECIMAL(5,2),
                                    IN `LUB_PER_LTR_P` DECIMAL(5,2),
                                    IN `HSD_PER_LTR_PURC_P` DECIMAL(5,2),
                                    IN `PMG_PER_LTR_PURC_P` DECIMAL(5,2),
                                    IN `LUB_PER_LTR_PURC_P` DECIMAL(5,2)
                                    )
BEGIN
start transaction;

update `meter_state`
set HSD_PER_LTR_SALE = HSD_PER_LTR_P,
PMG_PER_LTR_SALE = PMG_PER_LTR_P,
LUB_PER_LTR_SALE = LUB_PER_LTR_P,
HSD_PER_LTR_PURC = HSD_PER_LTR_PURC_P,
PMG_PER_LTR_PURC = PMG_PER_LTR_PURC_P,
LUB_PER_LTR_PURC = LUB_PER_LTR_PURC_P
 ;


commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_care_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_care_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_care_view` AS select `customer_care`.`Transaction_ID` AS `Transaction_ID`,`customer_care`.`Customer_Name` AS `Customer_Name`,`customer_care`.`HSD` AS `HSD`,`customer_care`.`HSD_Rate` AS `HSD_Rate`,`customer_care`.`PMG` AS `PMG`,`customer_care`.`PMG_Rate` AS `PMG_Rate`,`customer_care`.`LUB` AS `LUB`,`customer_care`.`LUB_Rate` AS `LUB_Rate`,`customer_care`.`Others` AS `Others`,`customer_care`.`Time` AS `Time` from `customer_care` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_info_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_info_view` AS select `customer`.`customer_ID` AS `customer_ID`,`customer`.`type` AS `type`,`customer`.`Name` AS `Name`,`customer`.`Vehicle_NO` AS `Vehicle_NO`,`customer`.`Phone_No` AS `Phone_No`,`customer`.`Address` AS `Address`,`customer`.`CNIC` AS `CNIC`,`customer`.`Date` AS `Date` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `daily_summary_view`
--

/*!50001 DROP VIEW IF EXISTS `daily_summary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_summary_view` AS select `daily_report`.`daily_report_ID` AS `daily_report_ID`,`daily_report`.`Date` AS `Date`,`daily_report`.`Today_Profit` AS `Today_Profit`,`daily_report`.`Today_Sale` AS `Today_Sale`,`daily_report`.`Remaining_Balance` AS `Remaining_Balance`,`daily_report`.`Incoming_Stock` AS `Incoming_Stock` from `daily_report` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ledge_history_view`
--

/*!50001 DROP VIEW IF EXISTS `ledge_history_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ledge_history_view` AS select distinct `customer_history`.`customer_ID` AS `customer_ID`,`customer_history`.`Date` AS `Date`,`customer_history`.`HSD_LTR` AS `HSD_LTR`,`customer_history`.`HSD_PER_LTR` AS `HSD_PER_LTR`,`customer_history`.`PMG_LTR` AS `PMG_LTR`,`customer_history`.`PMG_PER_LTR` AS `PMG_PER_LTR`,`customer_history`.`LUB_LTR` AS `LUB_LTR`,`customer_history`.`LUB_PER_LTR` AS `LUB_PER_LTR`,`customer_history`.`Others` AS `Others`,`customer_history`.`Return_Amount` AS `Return_Amount`,((((`customer_history`.`HSD_LTR` * `customer_history`.`HSD_PER_LTR`) + (`customer_history`.`PMG_LTR` * `customer_history`.`PMG_PER_LTR`)) + (`customer_history`.`LUB_LTR` * `customer_history`.`LUB_PER_LTR`)) + `customer_history`.`Others`) AS `NET` from `customer_history` order by `customer_history`.`Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_income_view`
--

/*!50001 DROP VIEW IF EXISTS `monthly_income_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_income_view` AS select concat(year(`inc`.`date`),'-',month(`inc`.`date`),'-','dd') AS `Date`,sum(`inc`.`HSD_LTR`) AS `Total_HSD`,sum(`inc`.`PMG_LTR`) AS `Total_PMG`,sum(`inc`.`HSD_LTR`) AS `Total_LUB` from `incoming_stock` `inc` group by concat(year(`inc`.`date`),'-',month(`inc`.`date`),'-','dd') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_sale_view`
--

/*!50001 DROP VIEW IF EXISTS `monthly_sale_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_sale_view` AS select concat(year(`sale`.`date`),'-',month(`sale`.`date`),'-','dd') AS `Date`,sum(`sale`.`HSD_LTR`) AS `Total_HSD`,sum(`sale`.`PMG_LTR`) AS `Total_PMG`,sum(`sale`.`HSD_LTR`) AS `Total_LUB` from `daily_sale` `sale` group by concat(year(`sale`.`date`),'-',month(`sale`.`date`),'-','dd') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `remaining_balance_view`
--

/*!50001 DROP VIEW IF EXISTS `remaining_balance_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `remaining_balance_view` AS select distinct `customer_history`.`customer_ID` AS `ID`,(select ((((sum((`customer_history`.`HSD_LTR` * `customer_history`.`HSD_PER_LTR`)) + sum((`customer_history`.`PMG_LTR` * `customer_history`.`PMG_PER_LTR`))) + sum((`customer_history`.`LUB_LTR` * `customer_history`.`LUB_PER_LTR`))) + sum(`customer_history`.`Others`)) - sum(`customer_history`.`Return_Amount`)) AS `Total` from `customer_history` where (`customer_history`.`customer_ID` = `ID`)) AS `Remaining_Balance` from `customer_history` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `remaining_stock_view`
--

/*!50001 DROP VIEW IF EXISTS `remaining_stock_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `remaining_stock_view` AS select `msv`.`Date` AS `Date`,(`miv`.`Total_HSD` - `msv`.`Total_HSD`) AS `Remaining_HSD`,(`miv`.`Total_PMG` - `msv`.`Total_PMG`) AS `Remaining_PMG`,(`miv`.`Total_LUB` - `msv`.`Total_LUB`) AS `Remaining_LUB` from (`monthly_income_view` `miv` join `monthly_sale_view` `msv`) group by `miv`.`Date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_remaining_debt_view`
--

/*!50001 DROP VIEW IF EXISTS `total_remaining_debt_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_remaining_debt_view` AS select distinct ((((sum((`customer_history`.`HSD_LTR` * `customer_history`.`HSD_PER_LTR`)) + sum((`customer_history`.`PMG_LTR` * `customer_history`.`PMG_PER_LTR`))) + sum((`customer_history`.`LUB_LTR` * `customer_history`.`LUB_PER_LTR`))) + sum(`customer_history`.`Others`)) - sum(`customer_history`.`Return_Amount`)) AS `Total_remaining_Debt` from `customer_history` */;
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

-- Dump completed on 2017-07-29 17:50:36
