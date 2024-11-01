output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.my_alb.dns_name
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_instance.public_ip
}
