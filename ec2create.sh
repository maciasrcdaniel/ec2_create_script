#!/bin/bash

# INITIAL INTRODUCTION
echo "EC2 CREATION SCRIPT - AWS CLI script to create EC2 instance in your terminal"
echo "If you haven't installed the AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
echo "Before starting make sure you have a user that has access key permissions to the CLI" 
echo "MAKE SURE THAT YOU ARE IN THE SAME FOLDER AS YOUR USER DATA SCRIPT IF APPLICABLE" 
sleep 2

# --------------------------------------------------------------------------
# KEYPAIR BLOCK 
# NOTES: FUNCTION VS HARDCODING PROCEDURES

# REQUIREMENTS
echo "Requirements: User with CLI access, Keypair, Security Group, User Data(Optional)"
sleep 2 

# AWS CLI - KEYPAIR CREATION COMMANDS
echo "What would you like the keypair to be named? "
read -r keypairname
sleep 2

aws ec2 create-key-pair --key-name $keypairname --query 'KeyMaterial' --output text > $keypairname.pem
sleep 2
echo "Your keypair has been created: $keypairname" 
sleep 2

# AWS CLI - SECURITY GROUP CREATION 
echo "What would you like to name the security group: " 
read -r sggroupname
sleep 2

echo "Enter a description for the security group: " 
read -r sggroupdescription
sleep 2

sgidname=`aws ec2 create-security-group --group-name $sggroupname --description $sggroupdescription` --query 'GroupId' --output text`
sleep 2 
echo "Your security group has been created: $sgidname" 





# KEYPAIR CREATION AWS CLI COMMANDS & VERIFY KEY PAIR NAMING CONVENTIONS ARE FOLLOWED

# read -r keypairname

# newkeypairname = aws ec2 create-key-pairs --key-name $keypairname
# echo "Keypair created: $newkeypairname"

# --------------------------------------------------------------------------


