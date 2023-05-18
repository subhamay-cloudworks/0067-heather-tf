## ---------------------------------------------------------------------------------------------------------------------
## OUTPUTS
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

######################################## AWS Current Region ########################################
output "heather_current_aws_region" {
  description = "Heather Current Region Where The Resources Are Created"
  value       = data.aws_region.current.name
}

output "heather_current_aws_region_description" {
  description = "Heather Current Region Description Where The Resources Are Created"
  value       = data.aws_region.current.description
}

######################################## AWS Current Account ########################################
output "heather_current_account" {
  description = "Heather AWS Account Id Where The Resources Are Created"
  value       = data.aws_caller_identity.current.account_id
}

######################################## AWS VPC ########################################
output "heather_default_vpc_id" {
  description = "Heather VPC Where The EC2 Instance Will Be Launched"
  value       = data.aws_vpc.devl.id
}


######################################## S3 Bucket #################################################
output "heather_s3_bucket_name_arn" {
  description = "Heather S3 Bucket Arn"
  value       = aws_s3_bucket.heather_s3_bucket.arn
}

output "heather_s3_bucket_id" {
  description = "Heather S3 Bucket Id"
  value       = aws_s3_bucket.heather_s3_bucket.id
}


output "heather_s3_bucket_domain_name" {
  description = "Heather S3 Domain Name"
  value       = aws_s3_bucket.heather_s3_bucket.bucket_domain_name
}

output "heather_s3_bucket_regional_domain_name" {
  description = "Heather S3 Regional Domain Name"
  value       = aws_s3_bucket.heather_s3_bucket.bucket_regional_domain_name
}

output "heather_s3_hosted_zone_id" {
  description = "Heather S3 Hosted Zone Id"
  value       = aws_s3_bucket.heather_s3_bucket.hosted_zone_id
}

output "heather_s3_bucket_region" {
  description = "Heather S3 Bucket Region"
  value       = aws_s3_bucket.heather_s3_bucket.region
}

output "heather_s3_bucket_tags_all" {
  description = "Heather S3 Bucket Tags All"
  value       = aws_s3_bucket.heather_s3_bucket.tags_all
}


######################################## IAM Role ##################################################
output "heather_iam_role_arn" {
  description = "Heather S3 Bucket Tags All"
  value       = aws_iam_role.heather_ec2_role.arn
}

output "heather_iam_role_assume_policy" {
  description = "Heather S3 Bucket Tags All"
  value       = aws_iam_role.heather_ec2_role.assume_role_policy
}


######################################## EC2 WebServer #############################################
output "heather_webserver_ip" {
  description = "Heather S3 Bucket Tags All"
  value       = aws_instance.heather_web_server.public_ip
}

output "heather_webserver_ami" {
  description = "Heather Webserver EC2 AMI"
  value       = aws_instance.heather_web_server.ami
}

output "heather_webserver_az" {
  description = "Heather Webserver Availability Zone"
  value       = aws_instance.heather_web_server.availability_zone
}

output "heather_webserver_instance_state" {
  description = "Heather Webserver Instance State"
  value       = aws_instance.heather_web_server.instance_state
}

output "heather_webserver_instance_type" {
  description = "Heather Webserver Instance Type"
  value       = aws_instance.heather_web_server.instance_type
}

output "heather_webserver_security_groups" {
  description = "Heather Webserver Security Groups"
  value       = aws_instance.heather_web_server.security_groups
}
