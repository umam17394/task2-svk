# modules/ec2/main.tf
resource "aws_security_group" "main" {
  name        = var.security_group_name
  description = "Allow inbound SSH and HTTP traffic"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "main" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  #subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.main.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
              yum install fontconfig java-17-openjdk
              yum install jenkins
              systemctl start jenkins
              EOF

  tags = {
    Name = var.instance_name
  }
}

