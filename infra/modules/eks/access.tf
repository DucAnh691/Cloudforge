resource "aws_eks_access_entry" "admin" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::427077356037:user/ducanh_devops"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "admin" {
  cluster_name  = module.eks.cluster_name
  principal_arn = "arn:aws:iam::427077356037:user/ducanh_devops"

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}