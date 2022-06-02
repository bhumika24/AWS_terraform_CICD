provider "aws"{
    region = "us-west-1"
    secret_key = ""
    access_key = ""

}

terraform {
    backend "s3" {
    encrypt = false
    bucket = "tf-state-s3"
    dynamodb_table = "tf-state-lock-dynamo"
    key = "path/path/terraform-tfstate"
    region = "us-west-1"
    }
}

resource "aws_vpc" "tf_test" {
    cidr_block = "10.0.8.0/16"
    instance_tenancy = "default"
    enable_dns_houstname = true
    tags = {
        Name = "tf_test"
    }
}

resource "aws_subnet" "subnet-tf-public" {
    vpc_id = aws_vpc.tf_test.vpc_id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-west-1a"
    tages = {
        "Name" = "Subnet-tf-public"

    }


resource "aws_subnet" "subnet-tf-private" {
    vpc_id = aws_vpc.tf_test.vpc_id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-west-1b"
    tages = {
        "Name" = "Subnet-tf-private"

    }

    }