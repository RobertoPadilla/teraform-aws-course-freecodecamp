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

# Setting a resource: "<provider_resource>" "resource_name"
# resource "aws_instance" "terraform-test" {
#   ami = "ami-0b614a5d911900a9b"
#   instance_type = "t2.micro"

#   tags = {
#     "from" = "terraform-config"
#   }
# }

# Setting a vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "production"
  }
}

# Setting a subnet for vpc by reference
resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    "Name" = "prod-subnet-1"
  }
}