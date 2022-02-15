/*
Hardcoded credentials are not recommended then I create a 
terraform input variable that allows to pass credential file
*/
# Input variables
variable "scf" { } 
variable "profile" { }

# Setting provider
provider "aws" {
  shared_credentials_files = ["${var.scf}"]
  profile = "${var.profile}"
  region = "us-east-2"
}