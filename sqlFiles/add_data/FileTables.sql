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

DROP TABLE IF EXISTS `File_SASER`;

CREATE TABLE `File_SASER` (
    `File_ID` int COLLATE utf8mb4_unicode_ci NOT NULL,
    `saser_initiative_ID` int COLLATE utf8mb4_unicode_ci NOT NULL,
    `file_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_format` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_uploaded_by` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_uploaded_on` date COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `file_comment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY `File_ID` (`File_ID`),
    CONSTRAINT `fk_saser_initiative_ID`
        FOREIGN KEY(`saser_initiative_ID`) REFERENCES Saser_initiative(`saser_initiative_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Attachment_SASER` */

DROP TABLE IF EXISTS `Attachment_SASER`;

CREATE TABLE `Attachment_SASER` (
    `File_ID` int COLLATE utf8mb4_unicode_ci NOT NULL,
    `attachment_ID` int COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY 'attachment_ID' ('attachment_ID'),
    CONSTRAINT `fk_file_ID`
        FOREIGN KEY(`File_ID`) REFERENCES File_SASER(`File_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




INSERT INTO File_SASER VALUES(1, `fileType1`, `filename1`, `pdf`, `Name1`, `Name2`, `2021-12-07`, `comment1`, 1)
INSERT INTO File_SASER VALUES(2, `fileType2`, `filename2`, `docx`, `Name3`, `Name4`, `2021-12-07`, `comment2`, 2)


INSERT INTO Attachment_SASER VALUES(1, 1)
INSERT INTO Attachment_SASER VALUES(2, 2)



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;