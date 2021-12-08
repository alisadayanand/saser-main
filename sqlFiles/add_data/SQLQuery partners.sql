CREATE TABLE `implement_partner` (
	`implement_partner_id` INT NOT NULL AUTO_INCREMENT,
	`implement_partner_name` VARCHAR(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
	PRIMARY KEY(`implement_partner_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO implement_partner (`Name`, `role`, `Vendor`)
		VALUES ('Realm Digital', 'Manager','Azure');



/*Table structure for table `initiative_partner`*/



	DROP TABLE IF EXISTS `initiative_partner`;



CREATE TABLE `initiative_partner` (
`initiative_partner_id` INT NOT NULL AUTO_INCimplement_partnerREMENT,
`implement_partner_id` INT NOT NULL,
`saser_initiative_id` INT NOT NULL,
PRIMARY KEY(`initiative_partner_id`),
FOREIGN KEY(`implement_partner_id`) REFERENCES `implement_partner`(`implement_partner_id`)
/*FOREIGN KEY(`saser_initiative_id`) REFERENCES saser_initiative(`saser_initiative_id`)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO initiative_partner  (`ID`, `Saser Initiative`, `Domain`)
		VALUES ('101', 'Full Stack','Santam');