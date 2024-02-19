

### Step 1: Create an S3 Bucket

### Step 2: [In repo] Replace Bucket Name and Key Name in Terraform Configuration
Ensure you replace the bucket name in your `provider.tf` and the key name in your `variable.tf` with the appropriate values.

### Step 3: Create Root Credentials (Access Key & Secret Access Key)
```bash
# This step involves creating an IAM user with appropriate permissions in the AWS Management Console, then generating access keys for that user.
# Use `aws configure` to set up these credentials on your local machine.
```

### Step 4: Create an EC2 VM and Connect to It Using MobaXterm
This step involves creating an EC2 instance in the AWS Management Console and connecting to it using SSH or any preferred method.

### Step 5: Install AWS CLI and Terraform
```bash
# AWS CLI Installation
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
aws configure

# Terraform Installation
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Step 6: Run `aws configure` and Provide Access Key ID, Secret Access Key, and Region

### Step 7: Clone Terraform-EKS Repo on VM
```bash
git clone https://github.com/terraform-aws-modules/terraform-aws-eks.git
```

### Step 8: Initialize Terraform and Run Plan
```bash
cd Terraform-EKS
terraform init
terraform plan
Terraform apply --auto
```

### Step 9: Apply Terraform Changes
```bash
terraform apply --auto-approve
```

### Step 10: Connect to the Newly Created Kubernetes (EKS) VM and Install AWS CLI and kubectl
```bash
# AWS CLI Installation
# Terraform will set up the necessary IAM roles and permissions for the EC2 instance to interact with AWS services.

# kubectl Installation
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.0/2024-01-04/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
```

### Step 11: Configure kubectl to Connect to the EKS Cluster
```bash
aws eks update-kubeconfig --name AWS-EKS --region ap-south-1
```

### Step-12: Play around with EKS and make sure , afterwards to run 'terraform destroy --auto-approve' to delete the reosurces
