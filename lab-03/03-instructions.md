# Lab 03 - First Configuration (AWS)
In this lab you will create a basic instance on AWS. You will need an AWS account. It's recommended to create a new IAM user that you can test with during these labs. Let's go!

> Note: Your AWS account will need a default VPC and subnet. More on this below.

## Procedure

- Copy and paste the code from code.txt into a new file named main.tf.

> NOTE: Change the AWS region to best suit your location. A list of regions can be found here: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html 

- Adjust the formatting of the code with the `terraform fmt` command.
- Initialize the working directory with the `terraform init` command.
  - Notice that a directory (.terraform) and a file (.terraform.lock.hcl) have been created automatically after issuing this command.
- Validate and verify the configuration with commands:

  `terraform validate`

  `terraform plan`

- Create the infastructure with the `terraform apply` command.

> Important! For this lab you will need to have a default VPC and default subnet within your AWS account. These are often created automatically for you. If not, you can create them in the VPC section of the AWS console. For example:
> - VPC: https://us-east-2.console.aws.amazon.com/vpc/home?region=us-east-2#Home:
> - Subnet: https://us-east-2.console.aws.amazon.com/vpc/home?region=us-east-2#subnets:
> Be sure to have a working VPC and subnet. If you are working in a different region, be sure to create the VPC and subnet within your region.

- Verify the infrastructure at the AWS console.
- Analyze the "state" file. This is called "terraform.tfstate". 

> Note: The state file represents a source of truth for the resources that were provisioned with Terraform.

- Destroy the infrastructure with the `terraform destroy` command.
- Analyze the "state" file once more and identify the changes. Notice that a new file named "terraform.tfstate.backup" has been created. Analyze that as well.

> NOTE: Remember to use free tier versions of virtual machines (such as t2.micro) and to destroy them when you are finished testing so that you don't get charged anymore than necessary. Most of these labs should result in a minimal charge, or no charge if run properly.

> NOTE: You might also be interested in linting programs such as TFlint: 
https://github.com/terraform-linters/tflint

---
## *Fantastic! Another lab... DONE!!*
---