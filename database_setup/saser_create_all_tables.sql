/*DROP DATABASE IF EXISTS `saser_db`;*/
/*CREATE DATABASE `saser_db`;*/

/*USE `saser_db`;*/

USE `SGTDEVSaser`;

/*Table structure for table `Capabaility_Category0`*/

DROP TABLE IF EXISTS `capability_category0`;

CREATE TABLE `capability_category0` (
   `category_zero_id` INT NOT NULL,
   `category_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci NOT NULL, 
   PRIMARY KEY (`category_zero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
	
/*Table structure for table `cluster`*/

DROP TABLE IF EXISTS `cluster`;

CREATE TABLE `cluster` (
	`cluster_id` INT NOT NULL AUTO_INCREMENT,
	`cluster_name` VARCHAR (150) COLLATE utf8mb4_unicode_ci NOT NULL,
	PRIMARY KEY (`cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/*Table structure for table `vendor`*/

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor`(
	`vendor_id` INT NOT NULL AUTO_INCREMENT,
	`vendor_name` VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY(`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;


/*Table structure for table `implement_partner`*/

DROP TABLE IF EXISTS `implement_partner`;

CREATE TABLE `implement_partner` (
   `implement_partner_id` INT NOT NULL AUTO_INCREMENT,
	`implement_partner_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	PRIMARY KEY(`implement_partner_id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
	
/* Table structure for table `meeting_calendar`*/

DROP TABLE IF EXISTS `meeting_calendar`;

CREATE TABLE `meeting_calendar` (
  `meeting_id` INT NOT NULL AUTO_INCREMENT,
  `meeting_name` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_date` DATE DEFAULT NULL,
  `meeting_time` TIME DEFAULT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `recommendation_status`*/

DROP TABLE IF EXISTS `recommendation_status`;

CREATE TABLE `recommendation_status` (
	`recommendation_status_id` INT NOT NULL AUTO_INCREMENT,
	`recommendation_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`recommendation_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/* Table structure for table `action_status`*/

DROP TABLE IF EXISTS `action_status`;

CREATE TABLE `action_status` (
    `action_status_id` INT NOT NULL AUTO_INCREMENT,
    `status_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`action_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `risk_status`*/

DROP TABLE IF EXISTS `risk_status`;

CREATE TABLE `risk_status` (
	`risk_status_id` INT NOT NULL AUTO_INCREMENT,
	`status_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`risk_status_id`)
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


/*Table structure for table `tracking_status`*/

DROP TABLE IF EXISTS `tracking_status`;

CREATE TABLE `tracking_status`(
	`tracking_status_id` INT NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY(`tracking_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/*Table structure for table `capability_category1`*/

DROP TABLE IF EXISTS `capability_category1`;

CREATE TABLE `capability_category1` (
   `category_one_id` INT NOT NULL, 
   `category_zero_id` INT NOT NULL,
   `category_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci NOT NULL, 
   PRIMARY KEY (`category_one_id`),
	FOREIGN KEY (`category_zero_id`) REFERENCES `capability_category0`(`category_zero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `segment`*/

DROP TABLE IF EXISTS `segment`;

CREATE TABLE `segment` (
	`segment_id` INT NOT NULL AUTO_INCREMENT,
	`segment_name` VARCHAR (150) COLLATE utf8mb4_unicode_ci NOT NULL,
	`cluster_id` INT NOT NULL,
	PRIMARY KEY (`segment_id`),
	FOREIGN KEY (`cluster_id`) REFERENCES `cluster`(`cluster_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/* Table structure for table `agenda`*/

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `agenda_id` INT NOT NULL AUTO_INCREMENT,
  `meeting_id` INT DEFAULT NULL,
  `date` DATE DEFAULT NULL,
  `time` TIME DEFAULT NULL,
  `location` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chairperson` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendees` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `by_invitation` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apologies_declines` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minute_taker` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_meeting_date` DATE DEFAULT NULL,
  PRIMARY KEY `agenda_id` (`agenda_id`),
  FOREIGN KEY (`meeting_id`) REFERENCES `meeting_calendar` (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/*Table structure for table `capability_category2`*/

DROP TABLE IF EXISTS `capability_category2`;

CREATE TABLE `capability_category2` (
   `category_two_id` INT NOT NULL AUTO_INCREMENT, 
   `category_one_id` INT NOT NULL,
   `category_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci NOT NULL,
	PRIMARY KEY (`category_two_id`),
	FOREIGN KEY (`category_one_id`) REFERENCES `capability_category1`(`category_one_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `business_unit`*/

DROP TABLE IF EXISTS `business_unit`;

CREATE TABLE `business_unit` ( 
	`business_unit_id` INT NOT NULL AUTO_INCREMENT,
	`business_unit_name` VARCHAR (150) COLLATE utf8mb4_unicode_ci NOT NULL,
	`segment_id` INT NOT NULL,
	PRIMARY KEY (`business_unit_id`),
	FOREIGN KEY (`segment_id`) REFERENCES `segment`(`segment_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `agenda_files`*/

DROP TABLE IF EXISTS `agenda_files`;

CREATE TABLE `agenda_files` (
	`agenda_files_id` INT DEFAULT NULL AUTO_INCREMENT,
	`agenda_id` INT NOT NULL,
	PRIMARY KEY (`agenda_files_id`),
	FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`agenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;


/*Table structure for table `minutes`*/

DROP TABLE IF EXISTS `minutes`;

CREATE TABLE `minutes` (
  `minutes_id` INT NOT NULL AUTO_INCREMENT,
  `agenda_id` INT DEFAULT NULL,
  `meeting_date` VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chairperson` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minute_taker` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apologies` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_Comments` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`minutes_id`),
  FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`agenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `saser_initiative`*/

DROP TABLE IF EXISTS `saser_initiative`;

CREATE TABLE `saser_initiative` (
	`saser_initiative_id` INT NOT NULL AUTO_INCREMENT,
	`initiative_name` VARCHAR(500) NOT NULL COLLATE utf8mb4_unicode_ci,
	`name_of_enterprise_architect` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`name_of_project_manager` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`name_of_solution_architect` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`business_unit_id` INT DEFAULT NULL,
	`approved_budget` INT DEFAULT NULL, 
	`cost_center` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`business_problem` TEXT COLLATE utf8mb4_unicode_ci,
	`it_business_objective` TEXT COLLATE utf8mb4_unicode_ci,
	`select_date` DATE,
	`capability_category_2_id` INT,
	`new_technology` TEXT COLLATE utf8mb4_unicode_ci,
	`website_domain` VARCHAR(250) COLLATE utf8mb4_unicode_ci,
	`existing_technology` TEXT COLLATE utf8mb4_unicode_ci,
	`date_presented` DATE,
	`tracking_status_id` INT NOT NULL,
	PRIMARY KEY (`saser_initiative_id`),
	FOREIGN KEY (`business_unit_id`) REFERENCES `business_unit`(`business_unit_id`),
	FOREIGN KEY (`capability_category_2_id`) REFERENCES `capability_category2`(`category_two_id`),
	FOREIGN KEY (`tracking_status_id`) REFERENCES `tracking_status`(`tracking_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `agenda_topics`*/

DROP TABLE IF EXISTS `agenda_topics`;

CREATE TABLE `agenda_topics` (
  `topic_id` INT NOT NULL AUTO_INCREMENT,
  `agenda_id` INT DEFAULT NULL,
  `minutes_id` INT DEFAULT NULL,
  `topic_number` INT DEFAULT NULL,
  `topic_name` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `topic_owner` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`agenda_id`),
  FOREIGN KEY (`minutes_id`) REFERENCES `minutes` (`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `minutes_files`*/

DROP TABLE IF EXISTS `minutes_files`;

CREATE TABLE `minutes_files` (
	`minutes_files_id` INT NOT NULL AUTO_INCREMENT,
	`minutes_id` INT NOT NULL,
	PRIMARY KEY (`minutes_files_id`),
	FOREIGN KEY (`minutes_id`) REFERENCES `minutes` (`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/*Table structure for table `vendor_per_initiative`*/

DROP TABLE IF EXISTS `vendor_per_initiative`;

CREATE TABLE `vendor_per_initiative` ( 
	`vendor_per_initiative_id` INT NOT NULL AUTO_INCREMENT,
	`vendor_id` INT NOT NULL,
	`saser_initiative_id` INT NOT NULL,
	PRIMARY KEY (`vendor_per_initiative_id`),
	FOREIGN KEY (`vendor_id`) REFERENCES `vendor`(`vendor_id`),
	FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative`(`saser_initiative_id`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `initiative_partner`*/

DROP TABLE IF EXISTS `initiative_partner`;

CREATE TABLE `initiative_partner` (
   `initiative_partner_id` INT NOT NULL AUTO_INCREMENT,
   `implement_partner_id` INT NOT NULL,
   `saser_initiative_id` INT NOT NULL,
   PRIMARY KEY(`initiative_partner_id`),
   FOREIGN KEY(`implement_partner_id`) REFERENCES `implement_partner`(`implement_partner_id`),
   FOREIGN KEY(`saser_initiative_id`) REFERENCES `saser_initiative`(`saser_initiative_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `file_saser` */

DROP TABLE IF EXISTS `file_saser`;

CREATE TABLE `file_saser` (
   `file_id` INT NOT NULL AUTO_INCREMENT,
   `saser_initiative_id` INT NOT NULL,
   `file_type` VARCHAR(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `file_name` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `file_format` VARCHAR(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `file_uploaded_by` VARCHAR(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `file_uploaded_on` DATE DEFAULT NULL,
   `file_comment` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
   `agenda_files_id` INT DEFAULT NULL,
   `minutes_files_id` INT DEFAULT NULL,
   PRIMARY KEY (`file_id`),
   FOREIGN KEY(`saser_initiative_id`) REFERENCES `saser_initiative`(`saser_initiative_id`),
   FOREIGN KEY(`agenda_files_id`) REFERENCES `agenda_files`(`agenda_files_id`),
   FOREIGN KEY(`minutes_files_id`) REFERENCES `minutes_files`(`minutes_files_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `notification`*/

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` INT NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` INT DEFAULT NULL,
  `sent_status` BOOLEAN NOT NULL,
  PRIMARY KEY(`notification_id`),
  FOREIGN KEY(`file_id`) REFERENCES `file_saser`(`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*Table structure for table `person`*/

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `person_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_surname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_ecode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_group_id` INT DEFAULT NULL,
  `role_id` INT DEFAULT NULL,
  PRIMARY KEY(`person_id`),
  FOREIGN KEY(`user_group_id`) REFERENCES `user_group`(`user_group_id`),
  FOREIGN KEY(`role_id`) REFERENCES `role`(`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


/*Table structure for table `notification_per_user_group`*/

DROP TABLE IF EXISTS `notification_per_user_group`;

CREATE TABLE `notification_per_user_group` (
  `notification_per_user_group_id` INT NOT NULL AUTO_INCREMENT,
  `notification_id` INT DEFAULT NULL,
  `user_group_id` INT DEFAULT NULL,
  PRIMARY KEY(`notification_per_user_group_id`),
  FOREIGN KEY(`notification_id`) REFERENCES `notification`(`notification_id`),
  FOREIGN KEY(`user_group_id`) REFERENCES `user_group`(`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/* Table structure for table `action`*/

DROP TABLE IF EXISTS `action`;

CREATE TABLE `action` (
	`action_id` INT NOT NULL AUTO_INCREMENT,
	`action_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	`action_status_id` INT DEFAULT NULL,
	`date_logged` DATE DEFAULT NULL,
	`last_modified_date` DATE DEFAULT NULL,
	`person_id` INT DEFAULT NULL,
	`saser_initiative_id` INT DEFAULT NULL,
	`minutes_id` INT DEFAULT NULL,
	`summary` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	PRIMARY KEY (`action_id`),
	FOREIGN KEY (`action_status_id`) REFERENCES `action_status`(`action_status_id`),
	FOREIGN KEY (`person_id`) REFERENCES `person`(`person_id`),
	FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative`(`saser_initiative_id`),
	FOREIGN KEY (`minutes_id`) REFERENCES `minutes`(`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `recommendation`*/

DROP TABLE IF EXISTS `recommendation`;

CREATE TABLE `recommendation` (
	`recommendation_id` INT NOT NULL AUTO_INCREMENT,
	`recommendation_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	`recommendation_summary` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	`recommendation_status_id` INT DEFAULT NULL,
	`date_logged` DATE DEFAULT NULL,
	`last_modified_date` DATE DEFAULT NULL,
	`person_id` INT DEFAULT NULL,
	`saser_initiative_id` INT DEFAULT NULL,
	`minutes_id` INT DEFAULT NULL,
	PRIMARY KEY (`recommendation_id`),
	FOREIGN KEY (`recommendation_status_id`) REFERENCES `recommendation_status`(`recommendation_status_id`),
	FOREIGN KEY (`person_id`) REFERENCES `person`(`person_id`),
	FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative`(`saser_initiative_id`),
	FOREIGN KEY (`minutes_id`) REFERENCES `minutes`(`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `risk`*/

DROP TABLE IF EXISTS `risk`;

CREATE TABLE `risk` (
	`risk_id` INT NOT NULL AUTO_INCREMENT,
	`risk_description` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	`risk_summary` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	`risk_status_id` INT DEFAULT NULL,
	`date_logged` DATE DEFAULT NULL,
	`last_modified_date` DATE DEFAULT NULL,
	`person_id` INT DEFAULT NULL,
	`saser_initiative_id` INT DEFAULT NULL,
	`minutes_id` INT DEFAULT NULL,
	PRIMARY KEY (`risk_id`),
	FOREIGN KEY (`risk_status_id`) REFERENCES `risk_status` (`risk_status_id`),
	FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
	FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative` (`saser_initiative_id`),
	FOREIGN KEY (`minutes_id`) REFERENCES `minutes`  (`minutes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI; 

/*Table structure for table `person_responsible_per_risk`*/

DROP TABLE IF EXISTS `person_responsible_per_risk`;

CREATE TABLE `person_responsible_per_risk` (
	`person_responsible_id` INT NOT NULL AUTO_INCREMENT,
	`person_id` INT DEFAULT NULL,
	`risk_id` INT DEFAULT NULL,
	PRIMARY KEY (`person_responsible_id`),
	FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
	FOREIGN KEY (`risk_id`) REFERENCES `risk` (`risk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/*Table structure for table `person_responsible_per_recommendation`*/

DROP TABLE IF EXISTS `person_responsible_per_recommendation`;

CREATE TABLE `person_responsible_per_recommendation` (
	`person_responsible_id` INT NOT NULL AUTO_INCREMENT,
	`person_id` INT DEFAULT NULL,
	`recommendation_id` INT DEFAULT NULL,
	PRIMARY KEY (`person_responsible_id`),
	FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
	FOREIGN KEY (`recommendation_id`) REFERENCES `recommendation` (`recommendation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/* Table structure for table `person_responsible_per_action`*/

DROP TABLE IF EXISTS `person_responsible_per_action`;

CREATE TABLE `person_responsible_per_action` (
   `person_responsible_id` INT NOT NULL AUTO_INCREMENT,
   `person_id` INT DEFAULT NULL,
   `action_id` INT DEFAULT NULL,
   PRIMARY KEY (`person_responsible_id`),
   FOREIGN KEY (`person_id`) REFERENCES `person`(`person_id`),
   FOREIGN KEY (`action_id`) REFERENCES `action`(`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/* Table structure for table `saser_initiatives_per_agenda_topics`*/

DROP TABLE IF EXISTS `saser_initiatives_per_agenda_topics`;

CREATE TABLE `saser_initiatives_per_agenda_topics` (
   `saser_initiatives_per_agenda_topics_id` INT NOT NULL AUTO_INCREMENT,
   `saser_initiative_id` INT DEFAULT NULL,
   `topic_id` INT DEFAULT NULL,
   PRIMARY KEY (`saser_initiatives_per_agenda_topics_id`),
   FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative`(`saser_initiative_id`),
   FOREIGN KEY (`topic_id`) REFERENCES `agenda_topics`(`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
