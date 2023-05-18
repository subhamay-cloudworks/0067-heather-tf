## ---------------------------------------------------------------------------------------------------------------------
## EC2 INSTANCE WITH APACHE WEB SERVER INSTALLED
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "heather_web_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.heather_web_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.heather_ec2_instance_profile.name

  user_data = <<EOF
    #!/bin/bash
    sudo su
    yum update -y
    yum install httpd -y
    aws s3 cp s3://${aws_s3_bucket.heather_s3_bucket.id}/index.html  /var/www/html/index.html
    systemctl start httpd
    systemctl enable httpd
    EOF

  tags = merge({ Name = "Heather-WebServer" }, local.tags)

}


