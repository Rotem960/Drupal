#!/bin/bash

echo "Stopping all running containers..."
docker stop $(docker ps -aq)

echo "Removing all containers..."
docker rm $(docker ps -aq)

echo "Removing all Docker volumes..."
docker volume rm $(docker volume ls -q)

echo "Removing all Docker networks (except default ones)..."
docker network prune -f

echo "Removing all Docker images..."
docker rmi -f $(docker images -q)

echo "Removing all stopped containers, unused networks, and build cache..."
docker system prune -af

echo "Cleanup completed successfully! Everything has been removed."
