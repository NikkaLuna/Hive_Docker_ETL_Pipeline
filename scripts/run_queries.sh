#!/bin/bash
# Connect to Hive and run queries

# Connect to Hive using Beeline
docker exec -it myhiveserver beeline -u 'jdbc:hive2://localhost:10000/'

# Run Hive queries
beeline -u 'jdbc:hive2://localhost:10000/' -e "
CREATE TABLE Employee(emp_id STRING, emp_name STRING, salary INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
LOAD DATA INPATH '/hive_custom_data/emp.csv' INTO TABLE Employee;
SELECT * FROM Employee;
"
