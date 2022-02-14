# Configure AWS resources from Terraform
I will be following freecodecamp course to raise resources in AWS from terraform.

## Clone this repository and do...
~~~bash
terraform init

terraform plan -var "scf=$AWS_CREDENTIALS_PATH"
~~~

## Basic terraform commands
~~~bash
# Initialize backend and provider plugins
# if plugins are not installed this command will do
terraform init 
~~~
~~~bash
# Describe resources that will be deployed and if terraform file is wrong then show an error
terraform plan
# Also allow you to pass variables to setup the configuration
terraform plan -var "var_name=var_value"
~~~
~~~bash
# Deploy our resources. If we have variables command ask for their values
terraform apply
# This command also allows you to pass variables
terraform apply -var "var_name=var_value"
~~~