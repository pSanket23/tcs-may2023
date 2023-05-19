variable "aws_access_key" {
  default = ""
}

variable "aws_secret_key" {
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "az" {
  default = "us-east-1c"
}

variable "volume_size" {
  default = 20
}

variable "ami" {
  default = "ami-0b0af3577fe5e3532"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "volume_type" {
  default = "gp2"
}

variable "tags" {
  type = map(string)
  default = {
    "name" = "python-instance"
  }
}

variable "ec2_public_key" {
  default = ""
}


variable "bucket_name" {
  default = "sanketpethkar-tf-test-bucket"
}