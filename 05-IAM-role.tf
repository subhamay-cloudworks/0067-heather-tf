## ---------------------------------------------------------------------------------------------------------------------
## IAM ROLE AND EC2 INSTANCE PROFILE
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

resource "aws_iam_role" "heather_ec2_role" {
  name               = "heather-iam-role-for-ec2"
  assume_role_policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": "ec2.amazonaws.com"
                    },
                    "Action": "sts:AssumeRole"
                }
            ] 
        }
    EOF

  tags = local.tags
}

resource "aws_iam_instance_profile" "heather_ec2_instance_profile" {
  name = "heather-ec2-instance-profile"
  role = aws_iam_role.heather_ec2_role.name
}

resource "aws_iam_role_policy_attachment" "heather_role_policy_attachment" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ])
  role       = aws_iam_role.heather_ec2_role.name
  policy_arn = each.value
}
