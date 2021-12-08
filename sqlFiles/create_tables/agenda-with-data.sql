/* Table structure for table `meeting_calendar`*/

DROP TABLE IF EXISTS `meeting_calendar`;

CREATE TABLE `meeting_calendar` (
  `meeting_id` INT NOT NULL AUTO_INCREMENT,
  `meeting_name` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_date` DATE DEFAULT NULL,
  `meeting_start_time` TIME DEFAULT NULL,
  `meeting_end_time` TIME DEFAULT NULL,
  PRIMARY KEY (`meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO meeting_calendar VALUES 
(101, 'SGT: SASER FORUM', '2021-12-10', '11:00', '12:30'), 
(102, 'SGT: SASER FORUM', '2021-12-15', '11:00', '12:00');

/* Table structure for table `agenda`*/

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `agenda_id` INT NOT NULL AUTO_INCREMENT,
  `meeting_id` INT DEFAULT NULL,
  `date` DATE DEFAULT NULL,
  `start_time` TIME DEFAULT NULL,
  `end_time` TIME DEFAULT NULL,
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

INSERT INTO agenda VALUES 
(101, 101, '2021-12-10', '11:00', '12:30', 'Microsoft Teams', 'Craig Cadenhead', 'Courtley Whittaker (SGT)', 'Edwin Jacobs', 'Theo Mabaso', 'Helen Meyer', '2021-12-15'), 
(102, 102, '2021-12-15', '11:00', '12:00', 'Microsoft Teams', 'Paul Gerber', 'Johan Pieters (SGT)', 'Lawrence Moti', 'Chris Vermeulen', 'Helen Meyer', '2021-12-20');

/* Table structure for table `agenda_files`*/

DROP TABLE IF EXISTS `agenda_files`;

CREATE TABLE `agenda_files` (
	`agenda_files_id` INT DEFAULT NULL AUTO_INCREMENT,
	`agenda_id` INT NOT NULL,
	PRIMARY KEY (`agenda_files_id`),
	FOREIGN KEY (`agenda_id`) REFERENCES `agenda` (`agenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO agenda_files VALUES
(101, 101),
(102, 102);

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

INSERT INTO agenda_topics VALUES
(101, 101, 101, 1, 'Santam Nostra', 'For Input', 'Sean de Kock'),
(102, 102, 102, 1, 'Sebia to Fundamental Migration', 'For Approval', 'Wayne Phillips');

/* Table structure for table `saser_initiatives_per_agenda_topics`*/

DROP TABLE IF EXISTS `saser_initiatives_per_agenda_topics`;

CREATE TABLE `saser_initiatives_per_agenda_topics` (
	`saser_initiatives_per_agenda_topics_id` INT NOT NULL AUTO_INCREMENT,
	`saser_initiative_id` INT DEFAULT NULL,
	`topic_id` INT DEFAULT NULL,
	PRIMARY KEY (`saser_initiatives_per_agenda_topics_id`),
	FOREIGN KEY (`saser_initiative_id`) REFERENCES `saser_initiative` (`saser_initiative_id`),
	FOREIGN KEY (`topic_id`) REFERENCES `agenda_topics` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO saser_initiatives_per_agenda_topics VALUES
(101, 101, 101),
(102, 102, 102);