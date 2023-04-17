locals {

  aws_region = "us-east-1"

  cluster_name = "devops-test"

  eks_version = "1.22"

  vpc_id = "vpc-0f13eb0e673efb4df"

  extra_tags = {
    TerraformManaged = "True"
    Environment      = local.env_name
  }

  env_name = "devops-test"

}
