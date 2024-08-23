terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "opt_04" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t2.micro"

  # Add your block devices here!
  
  tags = {
    Name = "Opt-04-Server"
  }
}