resource "kubernetes_secret" "dashboard-secret-certs" {
  metadata {
    labels    = var.labels
    name      = "kubernetes-dashboard-certs"
    namespace = kubernetes_namespace.namespace.metadata.0.name
  }
  type = "Opaque"

  depends_on = [
    kubernetes_namespace.namespace
  ]
}

resource "kubernetes_secret" "dashboard-secret-csrf" {
  metadata {
    labels    = var.labels
    name      = "kubernetes-dashboard-csrf"
    namespace = kubernetes_namespace.namespace.metadata.0.name
  }
  type = "Opaque"
  data = {
    csrf = ""
  }

  depends_on = [
    kubernetes_namespace.namespace
  ]
}

resource "kubernetes_secret" "dashboard-secret-key-holder" {
  metadata {
    labels    = var.labels
    name      = "kubernetes-dashboard-key-holder"
    namespace = kubernetes_namespace.namespace.metadata.0.name
  }
  type = "Opaque"

  depends_on = [
    kubernetes_namespace.namespace
  ]
}