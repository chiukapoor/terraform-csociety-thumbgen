resource "aws_iam_policy" "lambdaS3CWpolicy" {
  name = "${var.policy_name}"
  path = "/"
  description = "Policy to provide Lambda access to CloudWatch and buckets ${var.source_bucket_name}, thumbnail-${var.source_bucket_name}"
  
  # Terraform's "jsonencode" function converts a terraform expression result to valid JSON syntax.
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogGroup",
                "logs:CreateLogStream"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::${var.source_bucket_name}/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::thumbnail-${var.source_bucket_name}/*"
        }
    ]
})
}

resource "aws_iam_role" "lambdaS3CWrole" {
    name = "${var.role_name}"
    description = "Role to provide Lambda access to CloudWatch and buckets ${var.source_bucket_name}, thumbnail-${var.source_bucket_name}"
    assume_role_policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})
}

resource "aws_iam_role_policy_attachment" "lambdaS3CWpolicy_attachment" {
  role       = aws_iam_role.lambdaS3CWrole.name
  policy_arn = aws_iam_policy.lambdaS3CWpolicy.arn
}

