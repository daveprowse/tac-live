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

resource "aws_instance" "workspace_testing" {
  ami           = "ami-0b40807e5dc1afecf"
  instance_type = var.instance_type

  tags = {
    Name = var.name
  }
}