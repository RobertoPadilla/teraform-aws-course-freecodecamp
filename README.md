# Automatic deployment of AWS resources with Terraform
I will be following freecodecamp course to raise resources in AWS from terraform.

In the master branch are my first notes and configuration file while learn the basic. Into the practice-project branch are my practice that I did in the course.

The practice will consist of:
1. Create vpc
2. Create Internet Gateway
3. Create Custom Route Table
4. Create a Subnet
5. Associate subnet with Route Table
6. Create Security Group to allow port 22,80,443
7. Create a network interface with an ip in the subnet that was created in step 4
8. Assign an elastic IP to the network interface created in step 7
9. Create Ubuntu server and install/enable apache2

## To reproduce this AWS configuration clone this repository and do...
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
# If you tired to write "yes" when you update changes also can you pass this flag
terraform apply --auto-approve
~~~
~~~bash
# Destroy our resources. If we have variables command ask for their values
terraform destroy
# This command also allows you to pass variables
terraform destroy -var "var_name=var_value"
# If you tired to write "yes" when you destroy resources also can you pass this flag
terraform destroy --auto-approve
~~~

## Notes

### Upload and destroy resources

Terraform knows if you deleted some resource from provider, if you run *terraform plan* after delete this resource from provider console, cli recognize that and this will upload resoruce again, and if you do changes in the configuration file, this also will be upload to provider. If you don't delete this resource and runs *terraform plan* again, cli notifies you that you haven't made any changes.

If you delete a resource block on terraform file and this resource is running in the provider cli assumes that this resource also must be eliminated from provider. If you run again apply command you destroy that resource.

### Resources attached to another resources

Definition order in terraform beetwen both resources doesn't matter.

### Terraform files

- terraform directory: created when init command is executed, this directory contains all necesary plugins to run configuration and connect with provider.

- terraform.tfstate: saves previus state of configuration that we do in the provider cloud, this file is important because if is not there, resources will upload again and then this resources will be duplicated