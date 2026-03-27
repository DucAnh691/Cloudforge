module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.2"

  cluster_name    = "${var.project_name}-eks"
  cluster_version = "1.33"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["m7i-flex.large"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  tags = {
    Project = var.project_name
  }
}