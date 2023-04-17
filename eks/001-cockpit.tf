resource "kubernetes_namespace" "cockpit_namespace" {
  metadata {
    name = "cockpit"
  }
}

resource "kubernetes_deployment" "cockpit_deployment" {
  metadata {
    name      = "cockpit"
    namespace = kubernetes_namespace.cockpit_namespace.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "cockpit"
      }
    }

    template {
      metadata {
        labels = {
          app = "cockpit"
        }
      }

      spec {
        container {
          image = "agentejo/cockpit:latest"
          name  = "cockpit"

          env {
            name  = "COCKPIT_MONGO_URI"
            value = "mongodb://mongo-mongodb:27017/cockpit"
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "cockpit" {
  metadata {
    name = "cockpit"
    namespace = kubernetes_namespace.cockpit_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = "cockpit"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
