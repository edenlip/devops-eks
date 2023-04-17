output "load_balancer_name" {
  value = local.lb_name
}

output "load_balancer_hostname" {
  value = kubernetes_service.cockpit.status.0.load_balancer.0.ingress.0.hostname
}
