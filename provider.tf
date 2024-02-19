# configure aws provider
provider "aws" {
  region  = var.region
}

# configure backend
terraform {
  backend "s3" {
    bucket         = "your_s3_bucket_name"
    key            = "eks.terraform.tfstate"
    region         = "ap-south-1"
    
  }
}
