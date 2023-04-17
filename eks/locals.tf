locals {
  aws_region = "us-east-1"

  extra_tags = {
    TerraformManaged = "True"
    Environment      = local.env_name
  }

  env_name = "devops-test"

  lb_name = split("-", split(".", kubernetes_service.cockpit.status.0.load_balancer.0.ingress.0.hostname).0).0
}
