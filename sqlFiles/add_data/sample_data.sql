INSERT INTO saser_initiative (saser_initiative_id, initiative_name, name_of_enterprise_architect, name_of_project_manager, 
			name_of_solution_architect, business_unit, business_problem, 
			capability_category_2_id, 
			vendor, implement_partner, website_domain, tracking_status, existing_technology)
VALUES 
	(1, 'King James Saving Jar', 'Craig Cadenhead', 'Elena Meyer', 'Andre Fredricks', 
	1, 'Mobile app for children savings inline with Sanlam Takalane', 
	7, 'King James', 'Fullstack', 'N/A', 2, 'AWS')





CREATE TABLE tracking_status(
	status_id INT NOT NULL,
	description VARCHAR(100))

INSERT INTO tracking_status
VALUES 
	(1, 'Not started'),
	(2, 'Work in Progress'),
	(3, 'Completed'),
	(4, 'Abandoned'); 
