output "ebs_block_device" {
  description = "block device volume IDs"
  value       = aws_instance.opt_04.ebs_block_device[*].volume_id
}