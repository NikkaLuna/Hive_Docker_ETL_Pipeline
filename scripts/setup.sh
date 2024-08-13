# Setup script for Dockerized Hive ETL Project

# Create the data directory
mkdir -p /home/project/data

# Navigate to the data directory
cd /home/project/data

# Download the Employee data CSV
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-BD0225EN-SkillsNetwork/data/emp.csv
