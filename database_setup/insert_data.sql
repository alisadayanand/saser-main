USE 'saser_db';

INSERT INTO capability_category0
VALUES
	(1, 'Engagement/Presentation'),
	(2, 'Operational'),
	(3, 'Enterprise support'),
	(4, 'Technology');

INSERT INTO cluster
VALUES 
	(1,"Short term Insurance"),
	(2,"Life and Savings");

INSERT INTO vendor
VALUES 
	(1,"King James"),
	(2,"Vendor2");

INSERT INTO implement_partner
VALUES 
	(1,"implement_partner_Name1"),
	(2,"implement_partner_Name2");

INSERT INTO meeting_calendar 
VALUES 
	(1, 'SGT: SASER FORUM', '2021-12-10', '11:00'), 
	(2, 'SGT: SASER FORUM', '2021-12-15', '11:00');
	
INSERT INTO recommendation_status 
VALUES 
	(1, "WIP"), 
	(2, "Open");
	
INSERT INTO risk_status 
VALUES 
	(1, "Red"), 
	(2, "Amber"), 
	(3, "Green");

INSERT INTO action_status 
VALUES 
	(1, "Open"), 
	(2, "WIP"), 
	(3, "Closed"), 
	(4, "Cancelled");

INSERT INTO role(`role_name`) 
VALUES
	('Contractor'),
	('Enterprise Architect'),
	('Vendor'),
	('Chairperson'),
	('Minute-taker');

INSERT INTO user_group(`user_group_name`) 
VALUES
	('Architects'),
	('Panel'),
	('Admin');

INSERT INTO tracking_status
VALUES 
	(1, 'Not started'),
	(2, 'Work in Progress'),
	(3, 'Completed'),
	(4, 'Abandoned'); 


INSERT INTO capability_category1 
VALUES 
	(1, 1, 'Face to Face'),
	(2, 1, 'Digital'),
	(3, 1, 'Contact Centre'),
	(4, 2, 'Marketing (Support)'),
	(5, 2, 'Product '),
	(6, 2, 'Sales '),
	(7, 2, 'Services'),
	(8, 2, 'Operations'),
	(9, 3, 'Strategy '),
	(10, 3, 'Financial & Physical Resource'),
	(11, 3, 'Enterprise Risk'),
	(12, 3, 'Enterprise IT '),
	(13, 3, 'Human Resource'),
	(14, 3, 'External Relationship'),
	(15, 3, 'Data'),
	(16, 4, 'Hardware'),
	(17, 4, 'Server Software'),
	(18, 4, 'End User Services'),
	(19, 4, 'Network'),
	(20, 4, 'Security'),
	(21, 4, 'Middleware'),
	(22, 4, 'Data Strorage');


INSERT INTO segment
VALUES
	(1, "Retail Affluent", 1),
	(2, "Corporate Finance", 2);

INSERT INTO agenda 
VALUES 
	(1, 1, '2021-12-10', '11:00', 'Microsoft Teams', 'Craig Cadenhead', 'Courtley Whittaker (SGT)', 'Edwin Jacobs', 'Theo Mabaso', 'Helen Meyer', '2021-12-15'), 
	(2, 2, '2021-12-15', '11:00', 'Microsoft Teams', 'Paul Gerber', 'Johan Pieters (SGT)', 'Lawrence Moti', 'Chris Vermeulen', 'Helen Meyer', '2021-12-20');


INSERT INTO capability_category2
VALUES
	(1, 1, 'Branch'),
	(2, 4, 'Advertising'),
	(3, 11, 'Legal & Compliance'),
	(4, 16, 'Virtual HW');
	
	
INSERT INTO business_unit
VALUES
	(1, "SGT", 2),
	(2, "Sanlam Sky", 1);
	
INSERT INTO agenda_files
VALUES
	(1, 2),
	(2, 1);
	
	
INSERT INTO minutes
VALUES 
	(1,1,'2021-12-07','Craig Cadenhead','Helen Meyer','Adriaan de Lange',1,'Spelling mistake'),
	(2,2,'2021-12-14','Craig Cadenhead','Helen Meyer','',0,'Meeting does not exist');	
	

INSERT INTO saser_initiative
VALUES 
	(1, 'King James Savings Jar', 'Craig Cadenhead', 'Elena Meyer', 'Andre Fredricks', 1, 100000, 'Cost centre 2', 'Mobile app for children savings inline with Sanlam Takalane',
	'Resolve connectivity issues','2021-10-13', 2, 'N/A', 'www.savingsjar.co.za', 'N/A', '2021-11-27', 1),
	(2, 'Health app', 'Craig Cadenhead', 'Brinley Titus', 'Johan Kotze', 2, 200000, 'SGT cost centre', 'Book desks for HWP', 'Automate booking process',
	'2021-12-09', 1, 'N/A', 'sanlam.dev.booker.co.za', 'N/A', '2021-12-22', 1);


INSERT INTO minutes_files 
VALUES
	(1, 2),
	(2, 2);
		
		
INSERT INTO agenda_topics 
VALUES
	(1, 1, 1, 1, 'Santam Nostra', 'For Input', 'Sean de Kock'),
	(2, 2, 2, 1, 'Sebia to Fundamental Migration', 'For Approval', 'Wayne Phillips');
	

INSERT INTO vendor_per_initiative 
VALUES
	(1, 2, 2),
	(2, 2, 1);
	
	
INSERT INTO initiative_partner 
VALUES
	(1, 1, 1),
	(2, 2, 2);	
		
	
INSERT INTO file_saser 
VALUES
	(1, 1, 'fileType1', 'filename1', 'pdf', 'Name1', '2021-12-07', 'comment1', 1, 2),
	(2, 2, 'fileType2', 'filename2', 'docx', 'Name2', '2021-12-08', 'comment2', 2, 1);


INSERT INTO notification(`notification_type`, `file_id`, `sent_status`) 
VALUES
	('Agenda', 2, 1),
	('Minutes', 1, 0),
	(NULL, NULL, 1);


INSERT INTO person(`person_name`,`person_surname`,`person_ecode`,`person_email`,`user_group_id`, `role_id`) 
VALUES
	('Akashni','Naicker','E695697','akashni.naicker@sanlam.co.za', 1, NULL),
	('Nirvana','Pillay', 'E695710', 'nirvana.pillay@sanlam.co.za', NULL, 1);


INSERT INTO notification_per_user_group 
VALUES
	(1, 2, 1),
	(2, 3, 2);


INSERT INTO `action`
VALUES
	(1, "Discuss new policies with the cloud team", 1, '2021-10-15', '2021-10-16', 2, 1, 1, "Discuss the new policies with the cloud team and get their approval"),
	(2, "Discuss new policies with the intergration team", 2, '2021-11-12', '2021-11-16', 1, 2, 1, "Discuss the new policies with the intergration team and get their approval");


INSERT  INTO risk(`risk_description`,`risk_summary`,`risk_status_id`,`date_logged`,`last_modified_date`,`person_id`,`saser_initiative_id`,`minutes_id`) 
VALUES 
	('Sanity check to be done on the volumes that are going to be put through.','Could be very risky',1,'2021-12-07','2021-12-07', 1, 1, 1),
	('Sanity check to be done.','Not risky',2,'2021-12-07','2021-12-07', 2, 2, 2);


INSERT  INTO recommendation(`recommendation_description`,`recommendation_summary`,`recommendation_status_id`,`date_logged`,`last_modified_date`,`person_id`,`saser_initiative_id`,`minutes_id`) 
VALUES 
	('Apache NiFi – a Sanity check to be done on the volumes that are going to be put through.','Nothing more to add', 1,'2021-12-07','2021-12-07', 1, 1, 1),
	('Apache NiFi – a Sanity check to be done.','More to details needed', 2, '2021-12-07','2021-12-07', 2, 2, 2);


INSERT INTO person_responsible_per_action 
VALUES
	(1, 1, 2),
	(2, 2, 1);


INSERT INTO person_responsible_per_risk 
VALUES
	(1, 2, 1),
	(2, 1, 2);
	
	
INSERT INTO person_responsible_per_recommendation 
VALUES
	(1, 1, 1),
	(2, 2, 2);

INSERT INTO saser_initiatives_per_agenda_topics 
VALUES
	(1, 1, 1),
	(2, 2, 2);
