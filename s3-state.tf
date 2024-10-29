terraform {
  backend "s3" {
    bucket = "fastfood-tf"
    key = "cognito/terraform.tfstate"
    region = "us-east-1"
  }
}