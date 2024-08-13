# Dockerized Hive ETL Project

## Introduction
This project demonstrates how to set up an Apache Hive server using Docker, create a Hive table, and load data from a CSV file into the table. The project showcases skills in shell scripting, Docker, and Hive SQL, with a focus on Extract, Transform, Load (ETL) processes.

## Prerequisites
Before you begin, ensure you have the following installed on your system:
- Docker
- Basic knowledge of shell commands

## Step-by-Step Instructions

### Step 1: Set Up the Data Directory

   1. **Create the Data Directory**:   
   Create a directory named `data` under `/home/project`.
   ```bash
   mkdir /home/project/data
   ```
   2. **Navigate to the Data Directory**:
   Change to the newly created directory.

   ```bash
   cd /home/project/data
   ```

    3. **Download the Employee Data CSV**:
    Use wget to download the emp.csv file, which contains Employee data in a comma-separated format.

```bash
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/data/emp.csv
```

### Step 2: Set Up Hive Server with Docker

1. **Pull the Hive Docker Image**:
Pull the Apache Hive image from Docker Hub.

```bash
docker pull apache/hive:4.0.0-alpha-1
```

2. **Run the Hive Server**:
Start the Hive server on port 10002 and mount the local data folder into the container.

```bash
docker run -d -p 10000:10000 -p 10002:10002 --env SERVICE_NAME=hiveserver2 -v /home/project/data:/hive_custom_data --name myhiveserver apache/hive:4.0.0-alpha-1
```

3. **Access Hive Using Beeline**:
Access the Hive server using Beeline, a SQL CLI for interacting with Hive.

```bash
docker exec -it myhiveserver beeline -u 'jdbc:hive2://localhost:10000/'
```

### Step 3: Create a Table, Load Data, and View Results

1. **Create the Employee Table**:

Create a table named Employee with three columns: emp_id, emp_name, and salary.

```sql
create table Employee(emp_id string, emp_name string, salary int) row format delimited fields terminated by ',';
```

2. **Verify Table Creation**:
Check if the table was created successfully.

```sql
show tables;
```

3. **Load Data into the Table**:
Load the data from the CSV file into the Employee table.

```sql
LOAD DATA INPATH '/hive_custom_data/emp.csv' INTO TABLE Employee;
```

4. **Query the Table**:

List all the rows from the Employee table to verify that the data was loaded correctly.

```sql
SELECT * FROM Employee;
```

## Making Scripts Executable

Before running the scripts, you'll need to make them executable. You can do this by running the following command in your project directory:

```bash
chmod +x scripts/*.sh
```
This command makes all .sh files in the scripts/ directory executable, allowing you to run them directly from the command line without needing to prefix them with bash or sh.

Running the Scripts
Once the scripts are executable, you can run them as follows:

```bash
./scripts/setup.sh
./scripts/start_hive.sh
./scripts/run_queries.sh
```
Making the scripts executable is a good practice, especially when sharing your project with others or setting up automation. It simplifies the process of running the scripts by allowing them to be executed directly.


## Expected Outcome
At the end of this project, you should have a running Hive server within a Docker container, a populated Employee table in Hive, and the ability to query the data from the table. The data in the Employee table will reflect the contents of the emp.csv file.

### Learning Objectives
Docker: Understand how to pull Docker images and run containers with specific configurations.
Apache Hive: Learn how to set up a Hive server, create tables, and load data into Hive.
SQL: Practice SQL commands within the Hive environment to manage and query data.
ETL Process: Gain hands-on experience with the ETL process by loading data from a CSV file into a Hive table.

### Conclusion
This project demonstrates a basic but powerful use case of Dockerized Hive for ETL processes. It provides a foundation for more advanced data processing workflows involving Apache Hive and other Big Data tools.