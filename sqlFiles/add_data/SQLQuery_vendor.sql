/*Table structure for table `vendor`*/

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor`(
	`vendor_id` INT NOT NULL AUTO_INCREMENT,
	`vendor_name` VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY(`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

/*inserts for Vendor table*/

INSERT INTO vendor (vendor_id,vendor name)
VALUES('200','King James');

