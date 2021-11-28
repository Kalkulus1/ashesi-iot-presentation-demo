variable "aws_region" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


resource "aws_iot_certificate" "cert" {
  active = true
}

resource "aws_iot_policy" "pubsub" {
  name = "PubSubToAnyTopic"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iot:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iot_policy_attachment" "attachment" {
  policy = aws_iot_policy.pubsub.name
  target = aws_iot_certificate.cert.arn
}