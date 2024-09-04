# Example of multiple providers: AWS and Linode

## In the terraform block we specify the AWS and Linode sources
## for the provider plugins and the versions.
terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.00"
    }
    linode = {
      source  = "linode/linode"
      version = "2.27.0"
    }

  }
}

## In provider blocks we specify things like the AWS region
## and the token used to allow access to Linode
provider "aws" {
  region = "us-east-2"
}

provider "linode" {  
  token  = var.token
}

variable "token" {}
variable "key" {}
variable "password" {}

## In another file we might specify a Linode instance in the following way:
resource "linode_instance" "lnsf_arch" {
  label           = "ARCH-SERVER"
  image           = "linode/arch"
  region          = "us-east"
  type            = "g6-standard-1"
  authorized_keys = [var.key]
  root_pass       = var.password
}
## NOTE: Secure credentials (including token, SSH key, and password) should not be listed here. 
## Instead, you can make a terraform.tfvars file (and exclude it from source in .gitignore)
## Or, better yet, use environment variables or a vault of some sort.

