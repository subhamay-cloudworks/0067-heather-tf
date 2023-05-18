
## ---------------------------------------------------------------------------------------------------------------------
## PROVIDER AND BACKEND SETUP
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

terraform {
  backend "s3" {
    bucket = "subhamay-tf-remote-state-us-east-1"  // Bucket where to SAVE Terraform State
    key    = "0067-heather/devl/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                           // Region where bucket created
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}