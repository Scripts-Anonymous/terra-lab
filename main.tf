# Terraform HCL

/*
Includes the connection info for aws
*/

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}
