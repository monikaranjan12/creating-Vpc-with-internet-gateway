terraform {

  required_version = ">= 0.14, <= 2.0.0"

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 3.0"

    }

  }

}
 
provider "aws" {

  region  = var.aws_region

  profile = "default"

}
 
module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"

  version = "2.78.0"
 
  name = "vpc-dev"

  cidr = "10.0.0.0/16"

  azs  = ["ap-south-1a", "ap-south-1b"]
 
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
 
  create_database_subnet_group = true

  create_database_subnet_route_table = true
 
  enable_nat_gateway = true

  single_nat_gateway = true
 
  enable_dns_hostnames = true

  enable_dns_support   = true
 
  public_subnet_tags = {

    Type = "public-subnets"

  }
 
  private_subnet_tags = {

    Type = "private-subnets"

  }
 
  database_subnet_tags = {

    Type = "database-subnets"

  }
 
  tags = {

    Owner       = "kalyan"

    Environment = "dev"

  }
 
  vpc_tags = {

    Name = "vpc-dev"

  }

}
 
