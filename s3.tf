resource "aws_s3_bucket" "example" {
  bucket = "sanketpethkar-tf-test-bucket"

  tags = {
    Name       = "sanketpethkar-tf-test-bucket"
    contact    = "sanketpethkar@example.com"
    department = "Cloud services"
  }
}


