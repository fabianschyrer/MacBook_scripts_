#!/bin/sh

#####################################################################################################################
#																													#
#	Title:				Backup_CentralGroup_Fabian_MacBookPro.sh 													#
#	Purpose:			Backup Fabian's MacBook Pro (Central Group) 												#
#	Author:				Fabian Alexander Schyrer, Central Group 													#
#	Poasition:			General Manager, Cloud Engineering, CTO office												#
#	Date created:		2018-09-17																					#
#																													#
#####################################################################################################################



##### Variables #####

# Variables Backup Sources
BACKUP_SRC_ATOM_01=~/.atom
BACKUP_SRC_AWS_01=~/.aws
BACKUP_SRC_BASH_01=~/.bash_history
BACKUP_SRC_BASH_02=~/.bash_profile*
BACKUP_SRC_BASH_03=~/.bash_sessions
BACKUP_SRC_DOCKER_01=~.docker
BACKUP_SRC_SSH_01=~/.ssh
BACKUP_SRC_TERRAFORM_01=~.terraform.d
BACKUP_SRC_TERRAFORM_02=~/terraform
BACKUP_SRC_VIM_01=~/.viminfo
BACKUP_SRC_VIRTUALENV_01=~/.virtualenvs
BACKUP_SRC_VIRTUALENV_02=~/virtualenv
BACKUP_SRC_DESKTOP_01=~/Desktop
BACKUP_SRC_DOCUMENTS_01=~/Documents
BACKUP_SRC_DOWNLOADS_01=~/Downloads
BACKUP_SRC_GIT_01=~/.git
BACKUP_SRC_GIT_02=~/git
BACKUP_SRC_MS-ONE-DRIVE_01=~/OneDrive\ -\ Central\ Group
BACKUP_SRC_PYCHARM_01=~/PycharmProjects
BACKUP_SRC_INTELLIJ_01=~/IdeaProjects
BACKUP_SRC_LOGS_01=~/.logs
BACKUP_SRC_SCRIPTS_01=~/.scripts
BACKUP_SRC_VirtualMachines_01=~/VirtualBoxVMs
BACKUP_SRC_VirtualMachines_02=~/.minikube
BACKUP_SRC_OPENWHISK_01=~/.wskprops
BACKUP_SRC_BIN_01=/usr/local/bin/
BACKUP_SRC_ICLOUD_01=/Users/fabian/Library/Mobile\ Documents


# Variables Backuo Target
BACKUP_DISK="/Volumes/FSc_Backup_CentralGroup_2TB"
BACKUP_FOLDER=$(date +"%Y-%m-%d")
FILENAME=Backup_CentralGroup_Fabian_MacBookPro.sh
NOW=$(date +"%F")
#BACKUP_PATH



##### Housekeeping #####

# Print Backup Target
echo "***** Your backup target is: [ $BACKUP_DISK ]"
echo

# Create folder for today's backup
echo "***** Creating Backup Folder for today's backup"
cd $BACKUP_DISK
mkdir $BACKUP_FOLDER
cd $BACKUP_FOLDER
BACKUP_PATH=$BACKUP_DISK/$BACKUP_FOLDER
echo "***** Todays Backup will be created in: [ $BACKUP_PATH ]"
echo

# Redirect stdout/stderr to a Logfile
cd $BACKUP_PATH
mkdir logs
LOG_LOCATION="$BACKUP_PATH/logs"
cd $LOG_LOCATION
exec > >(tee -i $LOG_LOCATION/Backup_$FILENAME_$NOW.log)
exec 2>&1
echo "***** Log will be created in: [ $LOG_LOCATION ]"
echo



##### Backup #####

# Backup Atom Editor
echo "***** Backing up Atom Editor"
rsync -avzrh $BACKUP_SRC_ATOM_01 $BACKUP_PATH
echo

# Backup AWS CLI
echo "***** Backing up AWS CLI"
rsync -avzh $BACKUP_SRC_AWS_01 $BACKUP_PATH
echo

# Backup Bash Settings
echo "***** Backing up Bash"
rsync -avzh $BACKUP_SRC_BASH_01 $BACKUP_PATH
rsync -avzh $BACKUP_SRC_BASH_02 $BACKUP_PATH
rsync -avzh $BACKUP_SRC_BASH_03 $BACKUP_PATH
echo

# Backup Docker
echo "***** Backing up Docker"
rsync -avzh $BACKUP_SRC_Docker_01 $BACKUP_PATH
echo

# Backup SSH
echo "***** Backing up SSH"
rsync -avzh $BACKUP_SRC_SSH_01 $BACKUP_PATH
echo

# Backup Terraform
echo "***** Backing up Terraform"
rsync -avzh $BACKUP_SRC_TERRAFORM_01 $BACKUP_PATH
rsync -avzh $BACKUP_SRC_TERRAFORM_02 $BACKUP_PATH
echo

# Backup VIM
echo "***** Backing up VIM"
rsync -avzh $BACKUP_SRC_VIM_01 $BACKUP_PATH
echo

# Backup Virtualenv
echo "***** Backing up Virtualenv"
rsync -avzh $BACKUP_SRC_VIRTUALENV_01 $BACKUP_PATH
rsync -avzh $BACKUP_SRC_VIRTUALENV_02 $BACKUP_PATH
echo

# Backup Desktop
echo "***** Backing up Desktop"
rsync -avzh $BACKUP_SRC_DESKTOP_01 $BACKUP_PATH
echo

# Backup Downloads
echo "***** Backing Downloads"
rsync -avzh $BACKUP_SRC_DOWNLOADS_01 $BACKUP_PATH
echo

# Backup Documents
echo "***** Backing up Documents"
rsync -avzh $BACKUP_SRC_Documents_01 $BACKUP_PATH
echo

# Backup Git
echo "***** Backing up Git"
rsync -avzh $BACKUP_SRC_GIT_01 $BACKUP_PATH
rsync -avzh $BACKUP_SRC_GIT_02 $BACKUP_PATH
echo

# Backup MS OneDrive
echo "***** Backing up Microsoft OneDrive"
rsync -avzh $BACKUP_SRC_MS-ONE-DRIVE_01 $BACKUP_PATH
echo

# Backup PyCharm
echo "***** Backing up PyCharm Projects"
rsync -avzh $BACKUP_SRC_PYCHARM_01 $BACKUP_PATH
echo

# Backup IntelliJ
echo "***** Backing up IntelliJ Projects"
rsync -avzh $BACKUP_SRC_INTELLIJ_01 $BACKUP_PATH
echo

# Backup Logs
echo "***** Backing up Terminal Logs"
rsync -avzh $BACKUP_SRC_LOGS_01 $BACKUP_PATH
echo

# Backup Scripts
echo "***** Backing up custom Scripts"
rsync -avzh $BACKUP_SRC_SCRIPTS_01 $BACKUP_PATH
echo

# Backup Virtual Machines
echo "***** Backing up Virtual Machines (VirtalBox) and Minikube"
rsync -avzh $BACKUP_SRC_VirtualMachines_01 $BACKUP_PATH
rsync -avzh $BACKUP_SRC_VirtualMachines_02 $BACKUP_PATH
echo

# Backup OpenWhisk
echo "***** Backing up Apache OpenWhisk"
rsync -avzh $BACKUP_SRC_OPENWHISK_01 $BACKUP_PATH
echo

# Backup /usr/local/bin
echo "***** Backing up /usr/local/bin"
rsync -avzh $BACKUP_SRC_BIN_01 $BACKUP_PATH
echo

# Backup Apple iCloud
echo "***** Backing up Apple iCloud Data"
rsync -avzh $BACKUP_SRC_ICLOUD_01 $BACKUP_PATH
echo



# Create list of Docker Images
echo "***** Creating a List of Docker Images"
docker image list > $BACKUP_PATH/Docker_Image_List_$NOW.txt
echo

# Create list of installed Apps
echo "***** Creating a List of installed Applications"
brew list > $BACKUP_PATH/brew_installed_apps_$NOW.txt
ls /Applications  > $BACKUP_PATH/MacOSX_installed_apps_$NOW.txt
pip list > $BACKUP_PATH/pip_installed_packages_$NOW.txt
echo

# Backup completed
echo "***** Backup has been successfully created."
ls -las $BACKUP_PATH
echo
echo "***** The detailed Log can be found at $LOG_LOCATION"
ls -las $LOG_LOCATION
tail $LOG_LOCATION/Backup_$FILENAME_$NOW.log
echo
echo "***** End of Backup"
echo "***** Please edject your USB Drive."
echo
