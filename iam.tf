resource "aws_iam_policy" "ec2_policy" {
    name = "ec2_policy"
    path = "/"
    description = "Policy to provide permissions to Ec2"

    policy = jsonencode({
        "Version": "2023-05-19",
        "Statement": [
            {
                "Sid": "VisualEditor0",
                "Effect": "Allow",
                "Action": [
                    "s3:ListBucketMultipartUploads",
                    "s3:ListBucketVersions",
                    "s3:ListBucket",
                    "s3:ListMultipartUploadParts"
                ],
                "Resource": "arn:aws:s3:::${var.bucket_name}"
            }
        ]
    })
}
