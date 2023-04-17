resource "kubernetes_namespace" "mongo" {
  metadata {
    name = "mongo"
  }
}

resource "helm_release" "mongo" {
  name       = "mongo"
  namespace  = kubernetes_namespace.mongo.metadata.0.name
  chart      = "mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  version    = "13.9.4"

}
