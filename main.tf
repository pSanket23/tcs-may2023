# AWS Account Details
provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# SSH Key pair
resource "aws_key_pair" "my-tf-key" {
  key_name   = "my-tf-key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "my-tf-key-pem" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "my-tf-key.pem"
}

# EC2 instance Private subnet
resource "aws_instance" "python-instance" {
  availability_zone      = var.az
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.prod_pri_sg.id]
  key_name               = aws_key_pair.my-tf-key.key_name
  user_data              = data.template_file.user_data.template
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name       = "main-python-instance"
    contact    = "sanketpethkar@example.com"
    department = "Cloud services"
  }
}

# EBS EC2 Attachment
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.prod_volume.id
  instance_id = aws_instance.python-instance.id
}

# EC2 instance in public subnet
resource "aws_instance" "bastion-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.prod_pub_sg.id]
  key_name               = aws_key_pair.my-tf-key.key_name
  #user_data = data.template_file.user_data.template
  tags = {
    Name       = "bastion-instance"
    contact    = "sanketpethkar@example.com"
    department = "Cloud services"
  }
}
