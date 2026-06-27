# Public IP address of the EC2 instance
output "instance_public_ip" {
  description = "Public IP of the WordPress server"
  value       = aws_instance.wordpress.public_ip
}

# URL to access the WordPress website
output "wordpress_url" {
  description = "URL to access WordPress"
  value       = "http://${aws_instance.wordpress.public_ip}"
}