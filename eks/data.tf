data "aws_caller_identity" "current" {}

data "aws_eks_cluster_auth" "cluster" {
  name = "devops-test"
}

data "aws_eks_cluster" "cluster" {
  name = "devops-test"
}

data "kubectl_path_documents" "keda_manifests" {
  pattern = "./manifests/keda/*.yaml"
}

data "kubectl_path_documents" "amazon_cloudwatch_manifests" {
  pattern = "./manifests/cloudwatch/*.yaml"
}

data "aws_elb" "cockpit" {
  name = local.lb_name
}
