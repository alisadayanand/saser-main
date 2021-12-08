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
 
 
/* Table structure for table `action`*/

DROP TABLE IF EXISTS `action`;

CREATE TABLE `action` (
    `action_id` INT AUTO_INCREMENT NOT NULL,
    `action_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `action_status` INT DEFAULT NULL,
    `date_logged` DATE DEFAULT NULL,
    `last_modified_date` DATE DEFAULT NULL,
    `person_id` INT DEFAULT NULL,
    `person_responsible_id` INT DEFAULT NULL,
    `saser_initiative_id` INT DEFAULT NULL,
    `minutes_id` INT DEFAULT NULL,
    `summary` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`action_id`)
    FOREIGN KEY (`action_status`) REFERENCES `action_status` (`action_status`)
    FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
    FOREIGN KEY (`person_responsible_id`) REFERENCES `person_responsible_per_action` (`person_responsible_id`)
    FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative` (`saser_initiative_id`)
    FOREIGN KEY (`minutes_id`) REFERENCES `minutes` (`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `action_status`*/

DROP TABLE IF EXISTS `action_status`;

CREATE TABLE `action_status` (
    `action_status` INT NOT NULL,
    `status_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`action_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



/* Table structure for table `person_responsible_per_action`*/

DROP TABLE IF EXISTS `person_responsible_per_action`;

CREATE TABLE `person_responsible_per_action` (
    `person_responsible_id` INT NOT NULL,
    `person_id` INT DEFAULT NULL,
    `action_id` INT DEFAULT NULL,
    PRIMARY KEY (`person_responsible_id`)
    FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
    FOREIGN KEY (`action_id`) REFERENCES `action` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `Agenda`*/

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `agenda_id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `location` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chairperson` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendees` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `by_invitation` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apologies_declines` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minute_taker` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_meeting_date` date DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  KEY `agenda_id` (`agenda_id`)
  CONSTRAINT `fk_meeting_id` FOREIGN KEY (meeting_id) REFERENCES meeting_calendar (meeting_id)
  CONSTRAINT `fk_file_id` FOREIGN KEY (file_id) REFERENCES file_saser (file_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `agenda_topics`*/

DROP TABLE IF EXISTS `agenda_topics`;

CREATE TABLE `agenda_topics` (
  `topic_id` int NOT NULL AUTO_INCREMENT,
  `agenda_id` int DEFAULT NULL,
  `initiative_id` int DEFAULT NULL,
  `minutes_id` int DEFAULT NULL,
  `topic_number` int DEFAULT NULL,
  `topic_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic_owner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `topic_id` (`topic_id`)
  CONSTRAINT `fk_agenda_id` FOREIGN KEY (agenda_id) REFERENCES agenda (agenda_id)
  CONSTRAINT `fk_initiative_id` FOREIGN KEY (initiative_id) REFERENCES saser_initiative (saser_initiative_id)
  CONSTRAINT `fk_minutes_id` FOREIGN KEY (minutes_id) REFERENCES minutes (minutes_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `meeting_calendar`*/

DROP TABLE IF EXISTS `meeting_calendar`;

CREATE TABLE `meeting_calendar` (
  `meeting_id` int NOT NULL AUTO_INCREMENT,
  `meeting_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_date` date DEFAULT NULL,
  `meeting_time` time DEFAULT NULL,
  KEY `meeting_id` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `File_SASER` */

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

/*Table structure for table `minutes`*/

DROP TABLE IF EXISTS `minutes`;

CREATE TABLE `minutes` (
  `minutes_id` int COLLATE utf8mb4_unicode_ci NOT NULL,
  `agenda_id` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic_id` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chairperson` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minute_taker` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apologies` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_Comments` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY `minutes_id` (`minutes_id`)
  FOREIGN KEY (`agenda_id`) REFERENCES agenda (`agenda_id`)
  FOREIGN KEY (`topic_id`) REFERENCES agenda_topics (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `minutes_files`;

CREATE TABLE `minutes_files` (
  `minutes_id` int COLLATE utf8mb4_unicode_ci NOT NULL,
  `minutes_files_id` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY `minutes_files_id` (`minutes_id`)
  FOREIGN KEY (`minutes_id`) REFERENCES `minutes` (`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*Table structure for table `Recommendation`*/

DROP TABLE IF EXISTS `Recommendation`;

CREATE TABLE `Recommendation` (
    `Recommendation_ID` int COLLATE utf8mb4_unicode_ci NOT NULL,
    `Recommendation_Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Recommendation_Summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Recommendation_Status` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Date_Logged` date COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Last_Modified_Date` date COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Person_Responsible_ID` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Person_ID` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Saser_Iniative_ID` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Link_Minutes` int COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY `Recommendation_ID` (`Recommendation_ID`)
    CONSTRAINT `fk_Recommendation_Status`
        FOREIGN KEY (`Recommendation_Status`) REFERENCES Recommendation Status (`Recommendation_Status`)
    CONSTRAINT `fk_Person_Responsible_ID`
        FOREIGN KEY (`Person_Responsible_ID`) REFERENCES Person Responsible per recommendation (`Person_Responsible_ID`)
    CONSTRAINT `fk_Person_ID`
        FOREIGN KEY (`Person_ID`) REFERENCES Person(`Person_ID`)
    CONSTRAINT `fk_Saser_Iniative_ID`
        FOREIGN KEY (`Saser_Iniative_ID`) Saser_Initiative (`Saser_Iniative_ID`)
    CONSTRAINT `fk_Link_Minutes`
        FOREIGN KEY (`Link_Minutes`) Saser_Initiative (`Link_Minutes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Risk`*/

DROP TABLE IF EXISTS `Risk`;

CREATE TABLE `Risk` (
    `Risk_ID` int NOT NULL,
    `Risk_Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Risk_Summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `Risk_Status` int DEFAULT NULL,
    `Date_Logged` date DEFAULT NULL,
    `Last_Modified_Date` date DEFAULT NULL,
    `Person_Responsible_ID` int DEFAULT NULL,
    `Person_ID` int DEFAULT NULL,
    `Saser_Iniative_ID` int DEFAULT NULL,
    `Link_Minutes` int DEFAULT NULL,
    PRIMARY KEY `Risk_ID` (`Risk_ID`)
    CONSTRAINT `fk_Risk_Status`
        FOREIGN KEY (`Risk_Status`) REFERENCES Risk Status (`risk_Status`)
    CONSTRAINT `fk_Person_Responsible_ID`
        FOREIGN KEY (`Person_Responsible_ID`) REFERENCES Person Responsible per risk (`Person_Responsible_ID`)
    CONSTRAINT `fk_Person_ID`
        FOREIGN KEY (`Person_ID`) REFERENCES Person(`Person_ID`)
    CONSTRAINT `fk_Saser_Iniative_ID`
        FOREIGN KEY (`Saser_Iniative_ID`) Saser_Initiative (`Saser_Iniative_ID`)
    CONSTRAINT `fk_Link_Minutes`
        FOREIGN KEY (`Link_Minutes`) Saser_Initiative (`Link_Minutes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 

/*Table structure for table `Risk Status`*/

DROP TABLE IF EXISTS `Risk Status`;

CREATE TABLE `Risk Status` (
    `Risk_Status` int NOT NULL,
    `Status_Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY `Risk_Status` (`Risk_Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Person Responsible per Risk`*/

DROP TABLE IF EXISTS `Person Responsible per Risk`;

CREATE TABLE `Person Responsible per Risk` (
    `Person_Responsible_ID` int NOT NULL,
    `Person_ID` int DEFAULT NULL,
    `Risk_ID` int DEFAULT NULL,
    PRIMARY KEY `Person_Responsible_ID` (`Person_Responsible_ID`)
    CONSTRAINT `fk_Person_ID`
    FOREIGN KEY (`Person_ID`) REFERENCES Person (`Person_ID`)
    CONSTRAINT `fk_Risk_ID`
    FOREIGN KEY (`Risk_ID`) REFERENCES Risk (`Risk_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;.

/*Table structure for table `Recommendation Status`*/

DROP TABLE IF EXISTS `Recommendation Status`;

CREATE TABLE `Recommendation Status` (
    `Recommendation_Status` int NOT NULL,
    `Recommendation_Description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY `Recommendation_Status` (`Recommendation_Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Person Responsible per Recommendation`*/

DROP TABLE IF EXISTS `Person Responsible per Recommendation`;

CREATE TABLE `Person Responsible per Recommendation` (
    `Person_Responsible_ID` int NOT NULL,
    `Person_ID` int DEFAULT NULL,
    `Recommendation_ID` int DEFAULT NULL,
    PRIMARY KEY `Person_Responsible_ID` (`Person_Responsible_ID`)
    CONSTRAINT `fk_Person_ID`
    FOREIGN KEY (`Person_ID`) REFERENCES Person (`Person_ID`)
    CONSTRAINT `fk_Recommendation_ID`
    FOREIGN KEY (`Recommendation_ID`) REFERENCES Recommendation (`Recommendation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Capabaility_Category0`*/

DROP TABLE IF EXISTS `capability_category0`;

CREATE TABLE `capability_category0` (
    `category_zero_id` INT NOT NULL, 
    `category_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci NOT NULL, 
    CONSTRAINT pk_zero PRIMARY KEY(`category_zero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Capabaility_Category1`*/

DROP TABLE IF EXISTS `capability_category1`;

CREATE TABLE `capability_category1` (
    `category_one_id` INT NOT NULL, 
    `category_zero_id` INT NOT NULL,
    `category_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci NOT NULL, 
    CONSTRAINT pk_one PRIMARY KEY(`category_one_id`),
    CONSTRAINT fk_zero FOREIGN KEY (`category_zero_id`) REFERENCES `capability_category0`(`category_zero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Capabaility_Category2`*/

DROP TABLE IF EXISTS `capability_category2`;

CREATE TABLE `capability_category2` (
    `category_two_id` INT NOT NULL AUTO_INCREMENT, 
    `category_one_id` INT NOT NULL,
    `category_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci NOT NULL, 
    CONSTRAINT pk_two PRIMARY KEY(`category_two_id`),
    CONSTRAINT fk_one FOREIGN KEY (`category_one_id`) REFERENCES `capability_category1`(`category_one_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `person`*/

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `person_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_surname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_ecode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_group_id` INT DEFAULT NULL,
  PRIMARY KEY(`person_id`),
  FOREIGN KEY(`user_group_id`) REFERENCES user_group(`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `role`*/

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `user_group`*/

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `user_group_id` INT NOT NULL AUTO_INCREMENT,
  `user_group_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `notification`*/

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` INT NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_group_id` INT DEFAULT NULL,
  `attachment_id` INT DEFAULT NULL,
  `sent_status` BIT NOT NULL,
  PRIMARY KEY(`notification_id`),
  FOREIGN KEY(`user_group_id`) REFERENCES user_group(`user_group_id`),
  FOREIGN KEY(`attachment_id`) REFERENCES Attachment_SASER(`attachment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Initiative_Partner`*/

DROP TABLE IF EXISTS `Initiative_Partner`;

CREATE TABLE `Initiative_Partner` (
    `Initiative_Partner_ID` INT NOT NULL,
    `Implement_Partner_ID` INT NOT NULL,
    `Saser_Initiative_ID` INT NOT NULL,
    PRIMARY KEY(`Initiative_Partner_ID`),
    FOREIGN KEY(`Implement_Partner_ID`) REFERENCES Implement_Partner(`Implement_Partner_ID`),
    FOREIGN KEY(`Saser_Initiative_ID`) REFERENCES Saser_Initiative(`Saser_Initiative_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Implement_Partner`*/

DROP TABLE IF EXISTS `Implement_Partner`;

CREATE TABLE `Implement_Partner` (
    `Implement_Partner_ID` INT NOT NULL,
	`Implement_Partner_Name` VARCHAR(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	PRIMARY KEY(`Implement_Partner_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cluster`(`cluster_id` INT NOT NULL AUTO_INCREMENT
                       `cluster_name` VARCHAR (150) COLLATE utf8mb4_unicode_ci,
                        PRIMARY KEY (`cluster_id`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `segment` (`segment_id`INT NOT NULL AUTO_INCREMENT,
                      `segment_name` VARCHAR (150) COLLATE utf8mb4_unicode_ci NOT NULL,
		      `cluster_id` INT NOT NULL,
		       PRIMARY KEY (`segment_id`),
		       FOREIGN KEY (`cluster_id`) REFERENCES `cluster`(`cluster_id`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `business_unit` ( `business_unit_id` INT NOT NULL AUTO_INCREMENT,
                             `business_unit_name` VARCHAR (150) COLLATE utf8mb4_unicode_ci  NOT NULL,
			     `segment_id` INT NOT NULL,
			      PRIMARY KEY (`business_unit_id`),
			      FOREIGN KEY (`segment_id`) REFERENCES `segment`(`segment_id`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*Table structure for table `Saser_Initiative`*/

DROP TABLE IF EXISTS `saser_initiative`;

CREATE TABLE `saser_initiative` (
	`saser_initiative_id` INT NOT NULL AUTO_INCREMENT,
	`initiative_name` VARCHAR(500) NOT NULL COLLATE utf8mb4_unicode_ci,
	`name_of_enterprise_architect` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`name_of_project_manager` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`name_of_solution_architect` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`cluster_id` INT,
	`segment` INT,
	`business_unit` INT,
	`approved_budget` INT, 
	`cost_center` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`business_problem` TEXT COLLATE utf8mb4_unicode_ci,
	`it_business_objective` TEXT COLLATE utf8mb4_unicode_ci,
	`select_date` DATE,
	`capability_category_0_id` INT NOT NULL,
	`capability_category_1_id` INT,
	`capability_category_2_id` INT,
	`new_technology` TEXT COLLATE utf8mb4_unicode_ci,
	`vendor` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`implement_partner` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`website_domain` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`tracking_status` INT,
	`existing_technology` TEXT COLLATE utf8mb4_unicode_ci,
	`date_presented` DATE,
	`purpose_id` INT,
	CONSTRAINT pk_saser PRIMARY KEY(`saser_initiative_id`),
	CONSTRAINT fk_cluster_id FOREIGN KEY (`cluster_id`) REFERENCES `cluster`(`cluster_id`),
	CONSTRAINT fk_segment FOREIGN KEY (`segment`) REFERENCES `segment`(`segment_id`),
	CONSTRAINT fk_business_unit FOREIGN KEY (`business_unit`) REFERENCES `business_unit`(`business_unit_id`),
	CONSTRAINT fk_zero FOREIGN KEY (`capability_category_0_id`) REFERENCES `capabaility_category0`(`category_zero_id`),
	CONSTRAINT fk_one FOREIGN KEY (`capability_category_1_id`) REFERENCES `capabaility_category1`(`category_one_id`),
	CONSTRAINT fk_two FOREIGN KEY (`capability_category_2_id`) REFERENCES `capabaility_category2`(`category_two_id`),
	CONSTRAINT fk_tracking_status FOREIGN KEY (`tracking_status`) REFERENCES `tracking_status`(`status_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `Tracking_Status`*/

DROP TABLE IF EXISTS `Tracking_Status`;

CREATE TABLE `Tracking_Status`(
	`Status_ID` INT NOT NULL, AUTO_INCREMENT,
	`Description` VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY(`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
