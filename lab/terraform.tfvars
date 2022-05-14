owner_name = "devops"

region ="us-east-1"

environment_name = "lab"

internal_domain_name = "lab.example.com"

external_domain_name = "lab.example.com"

r53_target_zone = "Z0316730000000T4"

cidr = "10.0.1.0/24"

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

private_subnets = ["10.0.1.0/27", "10.0.1.32/27", "10.0.1.64/27"]

public_subnets = ["10.0.1.96/27", "10.0.1.128/27", "10.0.1.160/27"]

eks_cluster_version = "1.22"

workernode_disk_size = 10

workernode_instance_types = ["m5.large", "m5n.large"]



