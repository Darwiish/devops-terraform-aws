# Output public IP so we can access the web server
output "public_ip" {
  value = aws_instance.cloudinit_ec2.public_ip
}