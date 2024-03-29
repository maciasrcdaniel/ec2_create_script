#!/bin/bash 

# Terminate ec2 instance
echo "Type the ec2 instance id you would like to terminate: EX. i-02ksdf23421342" 
read -r ec2instanceid
echo "---------------------------------------------------------------" 

sleep 1 

# Delete sg group prompt 
echo "Type the security group id of the security group you would like to delete: EX. sg-01b3ba6b23bc850c8" 
read -r sggroupid
echo "---------------------------------------------------------------" 

sleep 1

# Delete keypair prompt
echo "Type they key pair name of the keys you would like to delete: EX. key_pair1" 
read -r keypairname
echo "---------------------------------------------------------------" 

sleep 1

# Ask to verify the deletion of items
echo "The following items have been selected for termination: " 
echo "EC2 Instance: $ec2instanceid" 
echo "Security Group: $sggroupid" 
echo "Key Pair Name: $keypairname" 

echo "Would you like to delete these items? Y/n" 
read -r deletionresponse 

# if/then statement to confirm termination deletion of items

if [[ $deletionresponse == "Y" || "y" ]]; then
    aws ec2 terminate-instances --instance-ids $ec2instanceid
    echo "****** Termination in progress ******" 
    sleep 10
    aws ec2 delete-security-group --group-id $sggroupid
    aws ec2 delete-key-pair --key-name $keypairname
    echo "Items have been deleted"
else
    echo "Items have NOT been deleted" 
fi








