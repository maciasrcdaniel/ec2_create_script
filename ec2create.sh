#!/bin/bash

# INITIAL INTRODUCTION
echo "EC2 CREATION SCRIPT - AWS CLI script to create EC2 instance in your terminal"
echo "*"
sleep 1
echo "If you haven't installed the AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
echo "*"
sleep 1
echo "Before starting make sure you have a user/role that has access key permissions to the CLI" 
echo "*"
sleep 1
echo "MAKE SURE THAT YOU ARE IN THE SAME FOLDER AS YOUR USER DATA SCRIPT IF APPLICABLE" 
echo "--------------------------------------------------------------------------" 


sleep 2
# REQUIREMENTS
echo "Requirements: User with CLI access, Keypair, Security Group, User Data(Optional)"
echo "--------------------------------------------------------------------------" 
sleep 2

# AWS CLI - KEYPAIR CREATION COMMANDS
echo "What would you like the keypair to be named? "
read -r keypairname

aws ec2 create-key-pair --key-name $keypairname --query 'KeyMaterial' --output text > $keypairname.pem
echo "Your keypair has been created: $keypairname" 
echo "--------------------------------------------------------------------------" 

# AWS CLI - SECURITY GROUP CREATION 
echo "What would you like to name the security group: " 
read -r sggroupname

echo "Enter a description for the security group: " 
read -r sggroupdescription

sgidname=`aws ec2 create-security-group --group-name $sggroupname --description $sggroupdescription --query 'GroupId' --output text`
echo "Your security group has been created: $sgidname"
echo "Your description for $sgidname: $sggroupdescription"  
echo "--------------------------------------------------------------------------" 

# CREATE EC2 INSTANCE
echo "Enter your AMI image id: ex. ami-04sc92034..." 
read -r amiimageid
echo "--------------------------------------------------------------------------" 

echo "Select your instance type: Ex. t2.micro" 
read -r instancetypeid
echo "--------------------------------------------------------------------------" 

aws ec2 run-instances --image-id $amiimageid --instance-type $instancetypeid --security-group-ids $sgidname --key-name $keypairname 

# COMMAND BELOW INCLUDES ADDITIONAL FIELDS LIKE SUBNET AND USER DATA 
# REPLACE THE COMMAND ABOVE WITH THE ONE BELOW

: '
aws ec2 run-instances --image-id ami-06ca3ca175f37dd66 --instance-type t2.micro --security-group-ids sg-01175d375658cc570 --subnet-id subnet-0742f5170e2f67db1 --key-name LUIT_KEYS --user-data file://user-data-subnet-id.txt
'


