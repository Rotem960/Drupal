#!/bin/bash

# 1. creating Docker network
echo "Creating Docker network..."
docker network create drupal_network
if [ $? -ne 0 ]; then
  echo "Failed to create network. Exiting."
  exit 1
fi

# 2. starting PostgreSQL container
echo "Starting PostgreSQL container..."
docker run -d \
  --network drupal_network \
  --name postgres_drupal \
  -p 5432:5432 \
  -e POSTGRES_DB=postgres_db \
  -e POSTGRES_USER=drupal_user \
  -e POSTGRES_PASSWORD=my-secret-pw \
  postgres:latest
if [ $? -ne 0 ]; then
  echo "Failed to start PostgreSQL container. Exiting."
  exit 1
fi

# 3. starting Drupal container
echo "Starting Drupal container..."
docker run -d \
  -p 8080:80 \
  --name drupal_app \
  --network drupal_network \
  drupal:latest
if [ $? -ne 0 ]; then
  echo "Failed to start Drupal container. Exiting."
  exit 1
fi

# 4. Verifying that the containers are running
echo "Verifying containers..."
docker ps
if [ $? -eq 0 ]; then
  echo "Setup completed successfully!"
else
  echo "Error in setup. Please check the logs."
fi
