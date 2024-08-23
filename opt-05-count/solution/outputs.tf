output "public_ips" {
  description = "Public IP addresses of each of the Instances"
  value       = aws_instance.opt_05[*].public_ip
}