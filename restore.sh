#!/bin/bash

BACKUP_DIR="./backup"
LATEST_DB_BACKUP=$(ls -t $BACKUP_DIR/db_backup_*.sql | head -1)
LATEST_FILES_BACKUP=$(ls -t $BACKUP_DIR/drupal_files_backup_*.tar.gz | head -1)

# restore database
if [ -f "$LATEST_DB_BACKUP" ]; then
  echo "Restoring PostgreSQL database from $LATEST_DB_BACKUP..."
  cat "$LATEST_DB_BACKUP" | docker exec -i postgres_drupal psql -U drupal_user -d postgres_db
  echo "Database restored successfully."
else
  echo "No database backup found!"
  exit 1
fi

# restore durpal files
if [ -f "$LATEST_FILES_BACKUP" ]; then
  echo "Restoring Drupal files..."
  VOLUME_NAME=$(docker inspect drupal_app --format='{{range .Mounts}}{{.Name}}{{end}}')

  docker run --rm -v "$VOLUME_NAME":/data -v "$BACKUP_DIR":/backup alpine tar xzf /backup/$(basename "$LATEST_FILES_BACKUP") -C /data
  echo "Drupal files restored successfully."
else
  echo "No Drupal file backup found!"
  exit 1
fi

echo "Restore completed successfully!"
