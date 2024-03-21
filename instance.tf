resource "aws_instance" "testinstance" {
    instance_type = "t2.micro"
    key_name = "priya"
    ami = "ami-0cd59ecaf368e5ccf"
    vpc_security_group_ids = [aws_security_group.testsg.id]
    associate_public_ip_address=true
    subnet_id = aws_subnet.testpublic1.id
    private_ip = "10.45.1.5"
    iam_instance_profile = "ec2-role"
    user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install openjdk-11-jre-headless -y
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update -y
  sudo apt-get install jenkins -y
  
  EOF
  tags = {
    "Name" = "${var.vpc_name}-server"
  }
}
  