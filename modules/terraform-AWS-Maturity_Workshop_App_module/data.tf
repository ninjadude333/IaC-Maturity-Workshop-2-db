data "aws_ami" "amazonLnx" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_instances" "app" {
  filter {
    name   = "iam-instance-profile.arn"
    values = [aws_iam_instance_profile.app_s3_access.arn]
  }
  instance_state_names = ["running", "pending"]
}

data "aws_route53_zone" "dudelabxxx" {
  name         = "dudelabxxx.com."
  private_zone = false
}