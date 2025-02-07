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
### Step 1: Cloning The Repository

The stages to clone this repository into your local machine:
1. create a folder wherever you prefer, to store this repository.
2. open the terminal for this folder.
3. run the next command: git clone https://github.com/Rotem960/durpal.git
4. cd to the durpal directory by running this command : cd durpal.
   
### step 2: Running the Setup.sh Script

The setup.sh script will set up the Docker containers for the Drupal website and PostgreSQL database.
How the script works ?
- It creates a Docker network for the containers to communicate.
- Then t starts the PostgreSQL container.
- At last it starts the Drupal container.
 
In order to run it type command: bash ./setup.sh

### Step 3: Running the Restore.sh Script 
The restore.sh script will restore our Drupal Website and Database data from the files in the 'backup' folder.

How the script works ?
- It will drop and recreate the PostgreSQL database.
- It restores the database data from the updated backup file.
- It restores the Drupal site files to the appropriate location.

In order to run it type command: bash ./restore.sh

Note: Make sure you have available files in the backup folder before running this script.

### After preforming steps 1 and 2 our drupal website will be available at: http://localhost:8080
### Step 4: Website Login Details
Enter the following details in order to connect to our existing website:
- Database name : postgres_bd
- Database username : drupal_user
- Database password is in the assignment instructions
- Host: postgres_drupal
- Port number: 5432
 
After entering this information you will see a "Drupal is already installed" massege.
1. Click on the option that says : "View your existing site".
2. In the site page that will appear click on the LogIn button that is on the top right side of the screen.
3. Enter username and password from the assignment instructions.

##Now Our Website And Website Content Is Available For You
###Feel free to view our content and to add new ones.

### Running the Backup.sh Script Instructions
The backup.sh script will save the websites data to a file located in the backup folder.
How the script works ? 
- It creates a backup directory called 'backup'.
- In this folder, a file called : 'db_backup_TIMESTAMP.sql' will contain the backup of the PostgreSQL database.
- In file called : 'drupal_files_backup_TIMESTAMP.tar.gz' a compressed archive of the Drupal site’s files will be saved.

In order to run it type command: bash ./backup.sh

after the script will stop running you will be able to see the new files added to the 'backup' file.

### Running the Cleanup.sh Script Instructions
In order to bring the working enviorment back to the state it was before running our scripts use the cleanup.sh script.
The cleanup.sh script will remove all the environment files that was created in the process.

How the script works ?
- It stops and removes the Docker containers (Drupal and PostgreSQL).
- It removes Docker images for both Drupal and PostgreSQL.
- It removes Docker volumes used for persistent storage of the Drupal files and PostgreSQL data.
This script will ensure that all Docker-related resources are removed from your system.

In order to run it type command: bash ./cleanup.sh


##Thank You ! :) 

