# Lab 05 - AWS Config with SSH and Outputs

In this lab you will build the following infrastructure on AWS:

- 1 instance (as a web server)
- 2 Security groups
- 1 SSH Key Deployer

In this lab we will incorporate SSH support. You'll also learn how to use outputs to have Terraform tell you information you need to know, such as the IP address and name of an instance. Finally, we'll use cloud-init to provide additional configuration details to our build.

## Procedure

This lab is a bit more in-depth, so go slow, and take it step-by-step. This time we'll be using a current Ubuntu image. If you get stuck, view the solution in the /solution directory.

## Create a directory structure

Create three new directories: instances, keys, and scripts.
For example: `mkdir {instances,keys,scripts}`

- Your main.tf file will go into the instances directory. This is the directory where you will run your Terraform commands.
- Your SSH keys will be placed in the keys directory.
- Your cloud-init script (provided) will go in the scripts directory.

## Create an SSH key pair

You will need openssh or another SSH tool installed.

- Run the command `ssh-keygen` to create an SSH key pair.

> NOTE: Consider using ED25519 instead of the default RSA.
> For example: `ssh-keygen -t ed25519`

- Name the key "aws_key" and save the key to the "keys" directory. When prompted you can type:

  `./keys/aws_key`

> NOTE: You can also specify the path and key name with the `-f` option of the ssh-keygen command.)

> NOTE: The solution does not have a key pair, you will have to take care of that part!

## Build your Terraform files

- Make the following files within the instances directory:

  - version.tf
  - provider.tf
  - main.tf
  - outputs.tf

- In version.tf, use the standard terraform block code that you have used previously.
- In provider.tf, use the standard provider block code that you have used previously. Change the region to meet your geographical requirements.
- Copy the code from code-main.txt to your main.tf file.
  - Analyze this file. 
  - Find the block named `resource "aws_key_pair"`
  - Add your SSH public key where it says `public_key`
- Copy the code from code-outputs.txt to your outputs.tf file. Analyze this file. What information will Terraform supply you with when the terraform apply is complete?

> Note: If you were to apply the infrastructure and attempt to SSH in, you would use the `ubuntu` username. For example, you might do something similar to this:
`ssh -i "../keys/aws_key" ubuntu@<ip_address>`
However, we are going to incorporate a script which will create a new user account which we will later SSH in as.

> NOTE: If you were to look at the AWS console and view the SSH option, it would show "aws_key.pem" but the .pem extension will not work because we created a standard openssh key pair, not an AWS key pair.

## Copy and Point to the Script

This portion of the lab requires that you do two things:

- Copy the provided script as a YAML file into the scripts directory.
- Add the SSH public key to the YAML script.
- Point to the script from the main.tf file.

Let's complete those tasks now.

### Copy the Script

- Copy the code-script.txt file into your /scripts directory. 
- Name it `apache-mkdocs.yaml`
  - For example: `cp code-script.txt scripts/apache-mkdocs.yaml`
  - Analyze the new file.

> NOTE: Always understand every line of a script before executing it!

### Add the Public SSH Key

- In the YAML script file, find `ssh_authorized_keys:` and add your SSH public key in the next line.
- Save the file.

### Point to the Script from Terraform

- Add the following new line to your main.tf file just before the tags block and just after the closing square bracket (]).

  ```
  user_data = file("../scripts/apache-mkdocs.yaml")
  ```

  Make sure that the path and the filename are exact.


## Initialize, validate, and apply your Terraform configuration

- Your working Terraform directory is /instances.
- Use the commands you have learned to initialize, format, validate, plan, and finally, apply your configuration.

⚠️ **IMPORTANT** - WATCH FOR ERRORS. FIX AS NECESSARY! ⚠️

- What information was outputted to you in the terminal?

> NOTE: If you lose the outputted information just type `terraform output` to see it again!

- Once the infrastructure has been built, view it within your AWS console.
  
> NOTE: Depending on server load at AWS, you might need to wait a minute or two for the instance to be initialized and for the script to run its course.

## SSH into your new virtual machine

At this point, the system should install an Apache web server, install pip, install mkdocs, configure mkdocs, and make it visible as a website.

- SSH into the system. Use the knowledge you learned from the Terraform outputs. This time, you will need to use the "spiderman" account that was created by the cloud-init configuration.

For example:

```console
  ssh -i "../keys/aws_key" spiderman@<ipaddress>
```

Make sure that you can access the system. Run commands on the remote system such as:
`cat /etc/os-release`
and
`systemctl status apache2`

- View the hello.txt file and the new website located at /var/www/html

- Attempt to connect to the website from a browser at:
  
  ```console
  http://<ipaddress>
  ```
- Take a minute or two to analyze what was built at the AWS console. Also, view the state file.

- Play around with it! You did good!

## Destroy the infrastructure

When you are finished analyzing your infrastructure, use the appropriate command to destroy the infrastructure.

> ⚠ **IMPORTRANT** ⚠ I've mentioned it a hundred times it seems, but please do not forget to destroy your infrastructure!

---

## That was a lot of tech! Great job!

---