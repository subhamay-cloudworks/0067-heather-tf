## ---------------------------------------------------------------------------------------------------------------------
## DATA BLOCK TO FETCH LATEST AMAZON LINUX AMI
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_vpc" "devl" {
  tags = {
    Name = "devl"
  }
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.*"]
  }
}