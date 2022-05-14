
locals {
  region = var.region
}

provider "aws" {
  region = local.region
}

terraform {
  required_version = "= 1.1.8"
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-s3-state-file"
    dynamodb_table = "terraform-dynamodb-state-lock"
    key            = "lab/state.tf"
    region = "us-east-1"
  }
}

module "infra" {
  source = "git@github.com:sremnk/terraform-aws-infra-module?ref=v0.0.1"
  #source                    = "../../terraform-aws-infra-module"
  cidr                  = var.cidr
  secondary_cidr_blocks = var.secondary_cidr_blocks
  vpc_name              = "example-${var.region}-${var.environment_name}-vpc"
  owner_name            = var.owner_name
  environment_name      = var.environment_name
  internal_domain_name  = var.internal_domain_name
  external_domain_name  = var.external_domain_name
  eks_cluster_name      = "example-${var.environment_name}"
  azs                   = var.azs
  private_subnets       = var.private_subnets
  public_subnets        = var.public_subnets
  r53_target_zone       = var.r53_target_zone
}

module "eks-managed-node-group" {
  #source                    = "../../terraform-aws-eks-module"
  source = "git@github.com:sremnk/terraform-aws-eks-module?ref=v0.0.1"
  
  owner_name                = var.owner_name
  environment_name          = var.environment_name
  eks_cluster_name          = "example-${var.environment_name}"
  eks_cluster_version       = var.eks_cluster_version
  vpc_id                    = module.infra.vpc_id
  subnet_ids                = module.infra.private_subnets
  workernode_disk_size      = var.workernode_disk_size
  workernode_instance_types = var.workernode_instance_types
  external_domain_name      = var.external_domain_name
}


resource "null_resource" "update_kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${module.eks-managed-node-group.cluster_id}"
  }
}

