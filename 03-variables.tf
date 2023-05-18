## ---------------------------------------------------------------------------------------------------------------------
## VARIABLE DEFINATION
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## Project Name ##############################################
variable "project_name" {
  description = "The name of the project."
  type        = string
}

######################################## Environment Name ##########################################
variable "environment" {
  description = "The environment."
  type        = string
}

######################################## AWS Region ################################################
variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
}

######################################## KMS Key ###################################################
variable "s3_bucket_name" {
  description = "Name of S3 Bucket."
  type        = string
}

######################################## S3 Bucket #################################################
variable "kms_key" {
  description = "Name of the KMS Key Id."
  type        = string
}

