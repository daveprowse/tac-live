####################################
## PUT TERRAFORM CLOUD BLOCK HERE!  ##


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.00"
    }
  }

  required_version = ">= 1.9.0"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-2"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_instance" "lab_09" {
  ami           = "ami-0b40807e5dc1afecf"
  instance_type = "t2.micro"

  tags = {
    Name = "Lab-09-Terraform-Cloud"
  }
}