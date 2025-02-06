# Drupal Website with PostgreSQL Database

This project sets up a Drupal website with a PostgreSQL database, using Docker containers for both the Drupal application and the PostgreSQL database. 
It includes scripts for initializing the environment, backing up the data that added to the website, restoring the data using the backup file, and cleaning up all the enviorments files.

## Group Members
- Rotem Abraham
- Tal Teboul
- ido Eli
- Itay Soldin

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Git](https://git-scm.com/)

## Repository Structure

This repository contains the following scripts and directories:

- `setup.sh`: Script to set up the Drupal website and PostgreSQL database with Docker containers.
- `backup.sh`: Script to back up the Drupal website files and the PostgreSQL database.
- `restore.sh`: Script to restore the website files and database from a backup into the website.
- `cleanup.sh`: Script to clean up the environment by removing containers, images, and volumes.
- `/backup`: Directory where backups of the database and website files will be stored.
 

## Step-By-Step Guide
### Cloning The Repository

The stages to clone this repository into your local machine:
1. create a folder wherever you prefer, to store this repository.
2. open the terminal for this folder.
3. run the next command: git clone https://github.com/Rotem960/durpal.git

   
### Running the Setup.sh Script

The setup.sh script will set up the Docker containers for the Drupal website and PostgreSQL database.
How the script works ?
- It creates a Docker network for the containers to communicate.
- Then t starts the PostgreSQL container.
- At last it starts the Drupal container.
 
In order to run it:
1. Give this script an execution permission by running the command: chmod +x setup.sh
2. run the script while using the command: ./setup.sh

after the script will stop running, the drupal website will be available at: http://localhost:8080
   
### Website Login Details
- Database name : postgres_bd
- Database username : drupal_user
- Host: postgres_drupal
- Port number: 5432
- Site name: Tal, Rotem, Ido and Itay's Website
- Site email address: zxcv20171234@gmail.com

## Running the Backup.sh Script
The backup.sh script will save the websites data to a file located in the backup folder.
How the script works ? 
- It creates a backup directory called 'backup'.
- In this folder, a file called : 'db_backup_TIMESTAMP.sql' will contain the backup of the PostgreSQL database.
- In file called : 'drupal_files_backup_TIMESTAMP.tar.gz' a compressed archive of the Drupal site’s files will be saved.

In order to run it:
1. Give this script an execution permission by running the command: chmod +x backup.sh
2. run the script while using the command: ./backup.sh

after the script will stop running you will be able to see the new files added to the 'backup' file.

### Running the Restore.sh Script 
The restore.sh script will restore the Drupal Website and Database data from the files in the 'backup' folder.

How the script works ?
- It will drop and recreate the PostgreSQL database.
- It restores the database data from the updated backup file.
- It restores the Drupal site files to the appropriate location.

In order to run it:
Note: Make sure you have backup files available before running this script.
1. Give this script an execution permission by running the command: chmod +x restore.sh
2. run the script while using the command: ./restore.sh


## Running the Cleanup.sh Script 
The cleanup.sh script will remove all the environment files that was created in the process.

How the script works ?
- It stops and removes the Docker containers (Drupal and PostgreSQL).
- It removes Docker images for both Drupal and PostgreSQL.
- It removes Docker volumes used for persistent storage of the Drupal files and PostgreSQL data.
This script will ensure that all Docker-related resources are removed from your system.

In order to run it:
1. Give this script an execution permission by running the command: chmod +x cleanup.sh
2. run the script while using the command: ./cleanup.sh

