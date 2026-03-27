terraform {
  backend "s3" {}  
}

provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment = var.environment
}

module "iam" {
  source = "../../modules/iam"

  project_name = var.project_name
}

module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
}

module "eks" {
  source = "../../modules/eks"

  project_name = var.project_name
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}