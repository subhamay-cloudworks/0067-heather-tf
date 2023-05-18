## ---------------------------------------------------------------------------------------------------------------------
## SECURITY GROUP WITH HTTP AND HTTPS ACCESS
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "heather_web_sg" {
  name        = "heather-webserver-sg"
  description = "Security Group To Allow TLS Inbound Traffic"
  vpc_id      = data.aws_vpc.devl.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({ Name = "heather-sg" }, local.tags)
}
