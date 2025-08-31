resource "aws_security_group" "allow_http_ssh" {
  name    = "allow http and SSH"

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

  ingress {
  description = "SSH"
  from_port = 22
  to_port = 22
  protocol  = "TCP"
  cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags  = {
    Name  = "allow http"
  }
}

resource "aws_instance" "webServer" {
  ami           = "ami-015cbce10f839bd0c"
  instance_type = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.allow_http_ssh.id]
  key_name  = "<add_your_access_key_name>"
  
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1> I was created by Terraform</h1>" > /var/www/html/index.html
              EOF

  tags  = {
  Name = "webServer"
  }
}

output "webserver_public_ip" {
  value = aws_instance.webServer.public_ip
}

