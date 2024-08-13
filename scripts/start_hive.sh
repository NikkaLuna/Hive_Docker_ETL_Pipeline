#!/bin/bash
# Start Hive server using Docker

# Pull the Hive Docker image
docker pull apache/hive:4.0.0-alpha-1

# Run the Hive server
docker run -d -p 10000:10000 -p 10002:10002 --env SERVICE_NAME=hiveserver2 -v /home/project/data:/hive_custom_data --name myhiveserver apache/hive:4.0.0-alpha-1
