#EBS Volume
resource "aws_ebs_volume" "prod_volume" {
  availability_zone = var.az
  size              = var.volume_size
  type              = var.volume_type
  tags = {
    Name = "storage_volume"
  }
}