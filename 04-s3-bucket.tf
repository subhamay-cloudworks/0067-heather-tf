## ---------------------------------------------------------------------------------------------------------------------
## S3 BUCKET CREATION AND UPLOAD INDEX.HTML
## Modification History:
##   - 1.0.0    May 17,2023   -- Initial Version
## ---------------------------------------------------------------------------------------------------------------------

########################################  Local Variables ####################################
locals {
  tags = tomap({
    Environment = var.environment
    ProjectName = var.project_name
  })
}


locals {
  bucket-name = "${var.s3_bucket_name}-${var.environment}-${var.aws_region}"
}
########################################  Creating aa S3 Bucket ####################################
resource "aws_s3_bucket" "heather_s3_bucket" {
  bucket        = local.bucket-name
  force_destroy = true

  tags = local.tags
}

resource "aws_s3_bucket_ownership_controls" "heather_s3_bucket" {
  bucket = aws_s3_bucket.heather_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "heather_s3_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.heather_s3_bucket]

  bucket = aws_s3_bucket.heather_s3_bucket.id
  acl    = "private"
}

######################################## SSE Encryption ############################################
resource "aws_s3_bucket_server_side_encryption_configuration" "heather_s3_bucket_sse" {
  bucket = aws_s3_bucket.heather_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key
      sse_algorithm     = "aws:kms"
    }
  }
}

######################################## S3 Lifecycle Policy To Delete Incomplete Upload ###########
resource "aws_s3_bucket_lifecycle_configuration" "heather_s3_bucket_lifecycle_policy" {
  bucket = aws_s3_bucket.heather_s3_bucket.id

  rule {
    id     = "Keep previous version 30 days, then in Glacier another 60"
    status = "Enabled"

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "GLACIER"
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }

}

######################################## Upload Objects To The S3 Bucket ###########################
resource "aws_s3_object" "s3_object" {
  for_each     = fileset("html/", "*")
  bucket       = aws_s3_bucket.heather_s3_bucket.id
  key          = each.value
  source       = "html/${each.value}"
  etag         = filemd5("html/${each.value}")
  content_type = "text/html"
}
