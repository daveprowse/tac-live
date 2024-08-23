# Opt-04: (Optional) The SPLAT Expression!
In this lab you can practice with splat expressions which can work as wildcards for referencing multiple items within a set.
In this directory you will find :
- main.tf 
  - This has a single AWS instance. 
- outputs.tf
  - This will contain a single output reference.

> Note: If you get stuck, see the solution directory.

## Goals
1. Set up two block devices for the instance in main.tf
2. Output each block device's volume ID using a splat expression.

## Procedure
- Access the main.tf file and add two block devices (storage drives) to the instance resource. For example:
```
  ebs_block_device {
    device_name = "sda1"
    volume_size = 16
  }

  ebs_block_device {
    device_name = "sda2"
    volume_size = 16
  }
```

- Access outputs.tf and add an output block that will display the block devices' volume IDs. For example:
```
output "ebs_block_device" {
  description = "block device volume IDs"
  value       = aws_instance.opt_04.ebs_block_device[*].volume_id
}
```

> Note: You could also have written the code as:
> `aws_instance.opt_04.ebs_block_device.*.volume_id`
>
> but that is the legacy sequence - [*] is recommended.

- Initialize and apply your code. It should result in two volume IDs displayed in the terminal. Check these against the state file and against the AWS console. 

- **Destroy the infrastructure**

> Note: For more information about ebs_block_devices, see the Terraform Registry: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#ebs-ephemeral-and-root-block-devices

---
## *Nice job!*
---