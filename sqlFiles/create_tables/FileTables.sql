/*
SQLyog Ultimate v13.1.4  (64 bit)
MySQL - 10.4.22-MariaDB-log : Database - GTIDBA
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`GTIDBA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE 'GTIDBA';

/*Table structure for table `Static_Data` */

DROP TABLE IF EXISTS 'File_SASER';
DROP TABLE IF EXISTS 'Attachment_SASER';



CREATE TABLE File_SASER
(
'file_ID' int(20) COLLATE utf8mb4_unicode_ci NOT NULL,
'saser_initiative_ID' int(20) COLLATE utf8mb4_unicode_ci NOT NULL,
'file_type' varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
'file_name' varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
'file_format' varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
'file_uploaded_by' varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
'file_uploaded_on' date COLLATE utf8mb4_unicode_ci DEFAULT NULL,
'file_comment' varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
PRIMARY KEY 'file_ID' ('file_ID'),
CONSTRAINT 'fk_saser_initiative_ID'
	FOREIGN KEY(saser_initiative_ID) REFERENCES saser_initiative(saser_initiative_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE Attachment_SASER
(
'file_ID' int(20) COLLATE utf8mb4_unicode_ci NOT NULL,
'attachment_ID' int(20) COLLATE utf8mb4_unicode_ci NOT NULL,
PRIMARY KEY 'attachment_ID' ('attachment_ID'),

CONSTRAINT 'fk_file_ID'
	FOREIGN KEY(file_ID) REFERENCES File_SASER(file_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
