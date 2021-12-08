
INSERT INTO cluster
VALUES 	(1,'Short-Term Insurance'),
			(2, 'Sanlam Group Office'), 
			(3, 'Sanlam Life and Savings'),
			(4, 'Sanlam Emerging Markets'),
			(5, 'Sanlam Investment Group');


INSERT INTO segment (segment_id,segment_name,cluster_id)
VALUES 	(1,'Santam Commercial and Personal',1),
			(2,'Group Market Development',2)	,
			(3,'Group Corporate Brand',2	)	,
			(4,'Group Human Resources',2	)	,
			(5,'Group Actuarial',2)	,
			(6,'Group Strategy',2),
			(7,'Group Finance',2)	,
			(8,'SA Retail Affluent',3)	,
			(9,'Sanlam Corporate',3)	,
			(10,'SA Retail Mass',3)	;
			
INSERT INTO business_unit (business_unit_id, business_unit_name, segment_id)
VALUES (	1	,'	Santam Commercial and Personal	',	1	)	,
(	2	,'	Group Marketing 	',	2	)	,
(	3	,'	Group Corporate Brand	',	2	)	,
(	4	,'	Sanlam Foundation	',	3	)	,
(	5	,'	Group Human Capital	',	4	)	,
(	6	,'	Group Rewards	',	4	)	,
(	7	,'	Group Employee Experience	',	4	)	,
(	8	,'	Group Compliance Management	',	5	)	,
(	9	,'	Group Strategy	',	6	)	,
(	10	,'	Group Investor Relations	',	7	)	,
(	11	,'	Life & Savings HR	',	8	)	,
(	12	,'	Sanlam Connect	',	8	)	,
(	13	,'	Sanlam Credit Solutions	',	8	)	,
(	14	,'	Sanlam Indie	',	8	)	,
(	15	,'	Sanlam Group Technology	',	8	)	,
(	16	,'	Client & Intermediary	',	8	)	,
(	17	,'	Corporate Facilities	',	8	)	,
(	18	,'	SBD_Multi-Data	',	8	)	,
(	19	,'	Sanlam Employee Benefits	',	9	)	,
(	20	,'	Sanlam Corporate	',	9	)	,
(	21	,'	Sanlam Sky	',	10	)	;
 


	


