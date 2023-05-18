# Project Heather: Launching an EC2 Instance with Apache Web Server installed.

This is a sample project to launch an EC2 server with Apache Web Server installed and copying a html index file from S3 to Ec2.

## Description

This terraform template creates a S3 bucket and uploads a HTML test index file. Next, it launches an EC2 server and installs Apache Web Server and copies the index.html file from S3 to /var/www/html/. Once the stack creation is complete, the webserver can be accessed using the Public IP of the EC2 instance - http://\<Public IP\>


## Getting Started

### Dependencies

* Create a Customer Managed KMS Key in the region where you want to create the stack..
* Modify the KMS Key Policy to let the IAM user encrypt / decrypt using any resource using the created KMS Key.
* Please ensure that latest version of HashiCorp Terraform is installed in your system.

### Installing

* Clone the repository.


### Executing program

* Use the following steps to create the stack
```
terraform init

terraform plan

terraform apply -auto-approve

## To delete the stack run the following command:
terraform destroy -auto-approve 
```

## Help

Post message in my blog (https://subhamay.blog)


## Authors

Contributors names and contact info

Subhamay Bhattacharyya  - [subhamoyb@yahoo.com](https://subhamay.blog)

## Version History


* 0.1
    * Initial Release

## License

This project is licensed under Subhamay Bhattacharyya. All Rights Reserved.

## Acknowledgments
