# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                    = "ami-0866a3c8686eaeeba"  # Replace with your chosen AMI ID
  instance_type          = "t2.micro"
  key_name               = "keypair"
  subnet_id              = aws_subnet.public_1.id
  security_groups        = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "Hello, SunWater Capital!" > /var/www/html/index.html
  EOF

  tags = {
    Name = "my-instance"
  }
}

# Attach EC2 to Target Group
resource "aws_lb_target_group_attachment" "my_instance" {
  target_group_arn = aws_lb_target_group.my_tg.arn
  target_id        = aws_instance.my_instance.id
  port             = 80
}
