provider "aws" {
  profile = "root"
  region  = "ap-northeast-2"
}

module "no-nat-vpc" {
  source = "../../"

  prefix     = "no-nat-ex"
  vpc_name   = "vpc"
  vpc_region = "ap-northeast-2"
  vpc_cidr   = "10.0.0.0/16"

  is_enable_nat = false
  webserver_subnets = {
    "a" : "10.0.1.0/24"
    "b" : "10.0.2.0/24"
  }

  was_subnets = {
    "a" : "10.0.100.0/24"
    "b" : "10.0.101.0/24"
  }

  db_subnets = {
    "a" : "10.0.200.0/24"
    "b" : "10.0.201.0/24"
  }

  endpoint_setting = {
    s3_is_enable           = true
    ecr_is_enable          = true
    sqs_is_enable          = true
    codepipeline_is_enable = true
    apigateway_is_enable   = true
  }
}
