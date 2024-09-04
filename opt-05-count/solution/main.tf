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
  region = "us-east-2"
}

resource "aws_instance" "opt_05" {
  count         = 2
  ami           = "ami-0b40807e5dc1afecf"
  instance_type = "t2.micro"

  tags = {
    Name = "Opt-05-Server-${count.index + 1}"
  }
}