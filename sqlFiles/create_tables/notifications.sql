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

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*--------------------------------------------------------------------------------------------------------------*/
INSERT INTO `role`(`role_name`) VALUES
('Contractor'),
('Enterprise Architect'),
('Vendor'),
('Chairperson'),
('Minute-taker');
/*--------------------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `user_group_id` INT NOT NULL AUTO_INCREMENT,
  `user_group_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY(`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*--------------------------------------------------------------------------------------------------------------*/
INSERT INTO `user_group`(`user_group_name`) VALUES
('Architects'),
('Panel'),
('Admin');
/*--------------------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS `notification_per_user_group`;

CREATE TABLE `notification_per_user_group` (
  `notification_per_user_group_id` INT NOT NULL AUTO_INCREMENT,
  `user_group_id` INT NOT NULL,
  `notification_id` INT NOT NULL,
  PRIMARY KEY(`notification_per_user_group_id`),
  FOREIGN KEY(`user_group_id`) REFERENCES `user_group`(`user_group_id`),
  FOREIGN KEY(`notification_id`) REFERENCES `notification`(`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*--------------------------------------------------------------------------------------------------------------*/
INSERT INTO `notification_per_user_group`(`user_group_id`, `notification_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 2);
/*--------------------------------------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` INT NOT NULL AUTO_INCREMENT,
  `notification_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` INT DEFAULT NULL,
  `sent_status` BIT NOT NULL,
  PRIMARY KEY(`notification_id`),
  FOREIGN KEY(`attachment_id`) REFERENCES Attachment_SASER(`attachment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*--------------------------------------------------------------------------------------------------------------*/
INSERT INTO `notification`(`notification_type`, `attachment_id`, `sent_status`) VALUES
('Agenda', 2, 1),
('Minutes', 1, 0),
(NULL, NULL, 1);
/*--------------------------------------------------------------------------------------------------------------*/
