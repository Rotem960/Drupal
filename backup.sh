#!/bin/bash

# 1. Verifying that the containers are running
echo "Checking if PostgreSQL and Drupal containers are running..."
if ! docker ps --format '{{.Names}}' | grep -qE '^postgres_drupal$'; then
  echo "PostgreSQL container (postgres_drupal) is not running. Exiting."
  exit 1
fi

if ! docker ps --format '{{.Names}}' | grep -qE '^drupal_app$'; then
  echo "Drupal container (drupal_app) is not running. Exiting."
  exit 1
fi

echo "Both containers are running."

# 2. Setting up the backup directory
BACKUP_DIR="./backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
DB_BACKUP_FILE="$BACKUP_DIR/db_backup_$TIMESTAMP.sql"
FILES_BACKUP_FILE="$BACKUP_DIR/drupal_files_backup_$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

# 3. Backing up PostgreSQL database
echo "Backing up PostgreSQL database..."
docker exec postgres_drupal pg_dump -U drupal_user -d postgres_db > "$DB_BACKUP_FILE"

if [ $? -eq 0 ]; then
  echo "Database backup completed: $DB_BACKUP_FILE"
else
  echo "Error occurred while backing up the database!"
  exit 1
fi

# 4. Checking for Drupal volumes
echo "Checking for Drupal volumes..."
VOLUME_NAME=$(docker inspect drupal_app --format='{{range .Mounts}}{{.Name}}{{end}}')

if [ -n "$VOLUME_NAME" ]; then
  echo "Backing up Drupal files from volume: $VOLUME_NAME..."
  docker run --rm -v "$VOLUME_NAME":/data -v "$BACKUP_DIR":/backup alpine tar czf /backup/drupal_files_backup_$TIMESTAMP.tar.gz -C /data .

  if [ $? -eq 0 ]; then
    echo "Drupal files backup completed: $FILES_BACKUP_FILE"
  else
    echo "Error occurred while backing up Drupal files!"
    exit 1
  fi
else
  echo "No volumes found for Drupal container. Skipping file backup."
fi

echo "Backup process completed successfully!"
