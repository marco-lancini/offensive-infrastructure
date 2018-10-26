# Overview

This is a demo of using Terraform (https://terraform.io) to provision a sample AWS architecture.  Using this will cost you money.

# Before You Begin
If you haven't already configured the AWS CLI, or another SDK, on the machine where you will be running Terraform you should follow these instructions to setup the AWS CLI and create a credential profile which Terraform will use for authentication:  
http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

# Launching
1. terraform get
2. terraform plan
3. terraform apply

# Destroying
There's [currently an issue](https://github.com/hashicorp/terraform/issues/2493) with using the [create_before_destroy lifecycle policy](https://www.terraform.io/docs/configuration/resources.html#lifecycle) on resources that effects destroying them.  The easiest way to destroy the environment is to change the create_before_destroy to false.  This change will need to be made in the `autoscaling_groups/webapp-asg.tf` and `launch_configurations/webapp-lc.tf` files.

Once you set create_before_destroy to false you can run `terraform destroy successfully`.
