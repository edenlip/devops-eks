resource "kubernetes_namespace" "amazon_cloudwatch" {
  metadata {
    name = "amazon-cloudwatch"
  }
}

resource "kubectl_manifest" "amazon_cloudwatch_manifests" {
  for_each  = data.kubectl_path_documents.amazon_cloudwatch_manifests.manifests
  yaml_body = each.value
}
