variable "region" {
  description = "aws region name"
}

# variable "vpc_name" {
#   description = "vpc name"
# }

variable "owner_name" {
  description = "owner name"
}

variable "environment_name" {
  description = "environment name"
}

variable "internal_domain_name" {
  description = "internal domain name"
}

variable "external_domain_name" {
  description = "External domain name"
}

variable "r53_target_zone" {
  description = "Specify route53 zone id to connect with"
}

variable "cidr" {
  description = "cidr"
}

variable "azs" {
  description = "availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "public subnets"
  type        = list(string)
}


variable "secondary_cidr_blocks" {
  description = "secondary_cidr_blocks"
  default     = []
}


########EKS######

# variable "eks_cluster_name" {
#   description = "cluster name"
# }

variable "eks_cluster_version" {
  description = "EKS cluster version"
}


variable "workernode_disk_size" {
  description = "Workernode disk size in GB/TB"
  type        = number
}

variable "workernode_instance_types" {
  description = "Workernode instance types"
  type        = list(string)
}