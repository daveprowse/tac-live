################
## TEST FILE ###
################

# This works well for planning/testing, but applies are time consuming. 
# If you need to test with apply, use the test-users directory.
  
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

resource "aws_instance" "test_instance" {
  ami           = "ami-0b40807e5dc1afecf"
  instance_type = "t2.micro"
  tags = {
    Name = "TEST INSTANCE! DESTROY ME WHEN DONE!!"
  }
}
