resource "kubernetes_namespace" "keda" {
  metadata {
    name = "keda"
  }
}

resource "helm_release" "kedacore" {
  chart      = "keda"
  repository = "https://kedacore.github.io/charts"
  name       = "keda"
  namespace  = kubernetes_namespace.keda.metadata.0.name
  version    = "2.8.0"
}

resource "kubectl_manifest" "keda_manifests" {
  for_each  = data.kubectl_path_documents.keda_manifests.manifests
  yaml_body = each.value
}
