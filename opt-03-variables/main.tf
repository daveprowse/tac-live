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
  region = var.region
}

resource "aws_instance" "opt_03" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = var.name
    Category = var.category
  }
}