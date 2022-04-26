resource "aws_s3_bucket" "els-s3-bucket" {
  bucket = "elsevier-s3-poc"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}

output "els-s3-bucket_name" {
    value = aws_s3_bucket.els-s3-bucket.bucket_domain_name
}