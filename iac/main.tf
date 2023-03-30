# HCL - HashiCorp Configuration Language

# Language Reference: https://www.terraform.io/docs/configuration/index.html

resource "aws_s3_bucket" "datalake" {
    # Bucket name must be unique across all existing bucket names in Amazon S3
    # Params of the resource
    bucket = "${var.base_bucket_name}-${var.environment}-${var.account_id}"
    acl    = "private"

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    
    tags = {
        Name        = "datalake-${var.environment}"
        Environment = var.environment
    }
}

resource "aws_s3_bucket_object" "datalake-diogovieira-igti" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/spring.py"
  acl    = "private"
  source = "/home/harpy/Desktop/IGTI_TERRAFORM/infrastructure/spring.py"
  etag   = filemd5("/home/harpy/Desktop/IGTI_TERRAFORM/infrastructure/spring.py")
}

  
provider "aws" {
    region = "us-east-2"
         
}
  

