import mariadb
import sys
# Connect to MariaDB Platform
try:
    conn = mariadb.connect(
        user="root", #Username
        password="Bazinga1918", #Password
        host="127.0.0.1", #Host IP
        port=3306,
        database="saser_search-test"

    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

def searchIntiativeCluster(clusterNo):
    result=[]
    script= """SELECT 	saser_initiative.saser_initiative_id, saser_initiative.initiative_name,	tracking_status.description,	
			cluster.cluster_name, saser_initiative.name_of_project_manager,	saser_initiative.business_problem,
			capability_category2.category_name
            FROM (((((cluster
		        INNER JOIN segment ON cluster.cluster_id = segment.cluster_id)
		        INNER JOIN business_unit ON segment.segment_id =business_unit.segment_id)
		        INNER JOIN saser_initiative ON business_unit.business_unit_id = saser_initiative.business_unit)
		        INNER JOIN tracking_status ON saser_initiative.tracking_status_id=tracking_status.tracking_status_id)
		        INNER JOIN capability_category2 ON saser_initiative.capability_category_2_id =capability_category2.category_two_id	)
            WHERE segment.cluster_id = {}""".format(clusterNo)
    cs= conn.cursor()
    cs.execute(script)
    for row in cs:
        result.append(row)

    return result

def searchIntiativeStatus(statusNo):
    result=[]
    script= """SELECT 	saser_initiative.saser_initiative_id, saser_initiative.initiative_name,	tracking_status.description,	
			cluster.cluster_name, saser_initiative.name_of_project_manager,	saser_initiative.business_problem,
			capability_category2.category_name
            FROM (((((cluster
		        INNER JOIN segment ON cluster.cluster_id = segment.cluster_id)
		        INNER JOIN business_unit ON segment.segment_id =business_unit.segment_id)
		        INNER JOIN saser_initiative ON business_unit.business_unit_id = saser_initiative.business_unit)
		        INNER JOIN tracking_status ON saser_initiative.tracking_status_id=tracking_status.tracking_status_id)
		        INNER JOIN capability_category2 ON saser_initiative.capability_category_2_id =capability_category2.category_two_id	)
            WHERE tracking_status.tracking_status_id = {}""".format(statusNo)
    cs= conn.cursor()
    cs.execute(script)
    for row in cs:
        result.append(row)

    return result

def searchIntiativeClass(ClassNo):
    result=[]
    script= """SELECT 	saser_initiative.saser_initiative_id, saser_initiative.initiative_name,	tracking_status.description,	
			cluster.cluster_name, saser_initiative.name_of_project_manager,	saser_initiative.business_problem,
			capability_category2.category_name
            FROM (((((cluster
		        INNER JOIN segment ON cluster.cluster_id = segment.cluster_id)
		        INNER JOIN business_unit ON segment.segment_id =business_unit.segment_id)
		        INNER JOIN saser_initiative ON business_unit.business_unit_id = saser_initiative.business_unit)
		        INNER JOIN tracking_status ON saser_initiative.tracking_status_id=tracking_status.tracking_status_id)
		        INNER JOIN capability_category2 ON saser_initiative.capability_category_2_id =capability_category2.category_two_id	)
            WHERE saser_initiative.capability_category_2_id = {}""".format(ClassNo)
    cs= conn.cursor()
    cs.execute(script)
    for row in cs:
        result.append(row)

    return result

def searchIntiativeName(inName):
    result=[]
    script= """SELECT 	saser_initiative.saser_initiative_id, saser_initiative.initiative_name,	tracking_status.description,	
			cluster.cluster_name, saser_initiative.name_of_project_manager,	saser_initiative.business_problem,
			capability_category2.category_name
            FROM (((((cluster
		        INNER JOIN segment ON cluster.cluster_id = segment.cluster_id)
		        INNER JOIN business_unit ON segment.segment_id =business_unit.segment_id)
		        INNER JOIN saser_initiative ON business_unit.business_unit_id = saser_initiative.business_unit)
		        INNER JOIN tracking_status ON saser_initiative.tracking_status_id=tracking_status.tracking_status_id)
		        INNER JOIN capability_category2 ON saser_initiative.capability_category_2_id =capability_category2.category_two_id	)
            WHERE saser_initiative.initiative_name LIKE {}""".format("'%"+inName+"%'")
    cs= conn.cursor()
    cs.execute(script)
    for row in cs:
        result.append(row)

    return result

def searchIntiativeTech(inTech):
    result=[]
    script= """SELECT 	saser_initiative.saser_initiative_id, saser_initiative.initiative_name,	tracking_status.description,	
			cluster.cluster_name, saser_initiative.name_of_project_manager,	saser_initiative.business_problem,
			capability_category2.category_name
            FROM (((((cluster
		        INNER JOIN segment ON cluster.cluster_id = segment.cluster_id)
		        INNER JOIN business_unit ON segment.segment_id =business_unit.segment_id)
		        INNER JOIN saser_initiative ON business_unit.business_unit_id = saser_initiative.business_unit)
		        INNER JOIN tracking_status ON saser_initiative.tracking_status_id=tracking_status.tracking_status_id)
		        INNER JOIN capability_category2 ON saser_initiative.capability_category_2_id =capability_category2.category_two_id	)
            WHERE saser_initiative.existing_technology LIKE {} OR saser_initiative.new_technology LIKE {}""".format("'%"+inTech+"%'")
    cs= conn.cursor()
    cs.execute(script)
    for row in cs:
        result.append(row)

    return result


def searchIntiativeKeyword(inKW):
    result=[]
    
    script= """SELECT saser_initiative.saser_initiative_id, saser_initiative.initiative_name,	tracking_status.description,	
			cluster.cluster_name, saser_initiative.name_of_project_manager,	saser_initiative.business_problem,
			capability_category2.category_name
            FROM (((((cluster
		        INNER JOIN segment ON cluster.cluster_id = segment.cluster_id)
		        INNER JOIN business_unit ON segment.segment_id =business_unit.segment_id)
		        INNER JOIN saser_initiative ON business_unit.business_unit_id = saser_initiative.business_unit)
		        INNER JOIN tracking_status ON saser_initiative.tracking_status_id=tracking_status.tracking_status_id)
		        INNER JOIN capability_category2 ON saser_initiative.capability_category_2_id =capability_category2.category_two_id	)
            WHERE saser_initiative.business_problem LIKE {} OR saser_initiative.initiative_name LIKE {} OR saser_initiative.existing_technology LIKE {} OR saser_initiative.new_technology LIKE {}""".format("'%"+inKW+"%'","'%"+inKW+"%'","'%"+inKW+"%'","'%"+inKW+"%'")
    cs= conn.cursor()
    cs.execute(script)
    for row in cs:
        result.append(row)

    return result
