# Opt-09: (Optional) Terraform Logging

You can log what happens during the usage of commands such as `terraform init` and `terraform apply`. Most commonly you will make use of the following Terraform environment variables:

- `TF_LOG`  - which enables logging.
- `TF_LOG_PATH` - which configures a path and log file location.

There are five levels of logging: TRACE, DEBUG, INFO, WARN, and ERROR. TRACE is the most verbose of the five.

## Basic Logging

Make sure you are working in an initialized directory.

Run the following commands:

`TF_LOG=ERROR terraform init`

Now, remove all Terraform directories and state files.

Run the following command:

`TF_LOG=ERROR terraform apply`

This should show an error (which it would show anyway)

Now, move up the ladder with WARN, INFO, DEBUG, and finally, TRACE. For example:

`TF_LOG=INFO terraform apply`

> NOTE: TRACE is what you want when presenting logs to team members or Hashicorp support.
> 
## Persistent Logging

Set the following Terraform environment variable to allow for logging throughout the session:

`export TF_LOG=TRACE`

Now run a `terraform apply`  

It logs all terraform commands for the rest of the terminal session. 

## Log Location

Set the following Terraform environment variable to send the logs to a file (instead of to the standard output terminal.)

`export TF_LOG_PATH=logs.txt`

> Note: Or, output it to .terraform.log  (to make it hidden)

Run `terraform init` or `apply` and check the log one by one! If you do an apply, don't say yes so that no infrastructure is created. 

> NOTE: These will append by default.

> You can also do data subsets:
>
>  `export TF_LOG_CORE=TRACE` for Terraform Core messages only. 
> or
> `export TF_LOG_PROVIDER=TRACE` for provider plugin messages only. (This) is common when troubleshooting lesser cloud services and third-party-written provider plugins such as libvirt and proxmox.)

## Unset the Variables

First `export TF_LOG_PATH=`

The `=` sign sets the variable to off. This unsets the path variable.

However, it still logs to the terminal

Now, `export TF_LOG_CORE=`

All logging is now turned off.

---
## *Be persistent and vigilant with your logging efforts!*

---
