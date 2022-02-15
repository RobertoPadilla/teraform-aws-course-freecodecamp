# Configure AWS resources from Terraform
I will be following freecodecamp course to raise resources in AWS from terraform.

## Clone this repository and do...
~~~bash
terraform init

terraform plan -var "scf=<your_path_to_credentials>" -var "profile=<your_profile_name>"

terraform apply -var "scf=<your_path_to_credentials>" -var "profile=<your_profile_name>"
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
~~~bash
# Destroy our resources. If we have variables command ask for their values
terraform destroy
# This command also allows you to pass variables
terraform destroy -var "var_name=var_value"
~~~

## Notes

Terraform knows if you deleted some resource from provider, if you run *terraform plan* after delete this resource from provider console, cli recognize that and this will upload resoruce again, and if you do changes in the configuration file, this also will be upload to provider. If you don't delete this resource and runs *terraform plan* again, cli notifies you that you haven't made any changes.

If you delete a resource block on terraform file and this resource is running in the provider cli asumes that this resource also must be eliminated from provider. If you run again apply command you destroy that resource.