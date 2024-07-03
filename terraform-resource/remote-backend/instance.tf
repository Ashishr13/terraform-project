terraform {
  backend "s3" {                              #s3 backend used
    bucket         = "ashish-tf-state-bucket" #name of bucket created in aws
    region         = "ap-south-1"
    key            = "terraform.tfstate"      #name of tfstate file
    dynamodb_table = "ashish-terraform-table" #name of dynamedb created in aws with PARTITION_KEYS=LockID for locking mechanism
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "server-test" {
  ami           = ""
  instance_type = "t2.micro"
}


