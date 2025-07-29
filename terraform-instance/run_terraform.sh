#!/bin/bash

# Prompt user for inputs
read -p "Enter ami_id (e.g. ami-0f918f7e67a3323f0): " ami_id
read -p "Enter instance type (e.g. t2.micro): " itype
read -p "Enter instance name (e.g. my-instance): " iname
read -p "Enter key name (e.g. chandra_Devops): " kname
read -p "Enter availability zone (e.g. ap-south-1a): " azone
read -p "Enter environment name (e.g. dev): " ename

# Write inputs to terraform.tfvars
cat > terraform.tfvars << EOF
ami_id = "$ami_id"
itype = "$itype"
iname = "$iname"
kname = "$kname"
azone = "$azone"
ename = "$ename"
EOF

echo "terraform.tfvars created/updated!"

echo "Initializing terraform"
# Initialize Terraform (run only once per config)
terraform init
echo "wait for 10 sec"
sleep 10
echo "planning infra"
# Plan Terraform changes
terraform plan
echo "wait for 10 sec"
sleep 10
Echo "started applying the plan"
# Apply Terraform changes automatically
terraform apply --auto-approve  
