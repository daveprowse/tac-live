# Lab 05 - AWS Config with SSH and Outputs (PART II)
Now let's add a cloud-config to our Terraform configuration. This configuration will install an Apache web server and install and configure a mkdocs website.

## Procedure
- Copy the code-script.txt file into your /scripts directory. Name it apache-mkdocs.yaml.
  - For example: `cp code-script.txt scripts/apache-mkdocs.yaml`
  - Analyze the new file. 

> NOTE: Always understand every line of a script before executing it!

  - Find "ssh_authorized_keys:" and add your SSH public key in the next line. 
  - Save the file

- Add the following new line to your main.tf file just before the tags block and just after the closing square bracket (]).

  ```
  user_data = file("../scripts/apache-mkdocs.yaml")
  ```

  Make sure that the path and the filename are exact. 

- Re-initialize the directory, validate your code, and apply the new infrastructure. Allow for a couple of minutes for automatic configuration of the system.

At this point, the system should install an Apache web server, install pip, install mkdocs, configure mkdocs, and make it visible as a website.

- SSH into the system. Use the knowledge you learned from the Terraform outputs. This time, you will need to use the "spiderman" account that was created by the cloud-init configuration. Example: 
  ```
  ssh -i "../keys/aws_key" spiderman@<ipaddress>
  ```

- View the hello.txt file and the new website located at /var/www/html

- Attempt to connect to the website from a browser at: 
  
  ```
  http://<ipaddress>
  ```

- Play around with it! You did good!

- When complete, be sure to destroy the infrastructure.

---
## *That was a lot of tech! Great job!*
---


