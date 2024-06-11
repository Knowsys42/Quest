# stage020/kubernetes-rbac/main.tf

# Create a Kubernetes service account
resource "kubernetes_service_account" "quest_sa" {
  metadata {
    name      = "quest-service-account"
    namespace = "default"
  }
}

# Create a Kubernetes role
resource "kubernetes_role" "quest_role" {
  metadata {
    name      = "quest-role"
    namespace = "default"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "configmaps", "secrets"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "replicasets", "statefulsets"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = ["extensions", "apps"]
    resources  = ["deployments", "replicasets"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["jobs", "cronjobs"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = ["argoproj.io"]
    resources  = ["applications", "appprojects"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
}

# Create a Kubernetes role binding
resource "kubernetes_role_binding" "quest_role_binding" {
  metadata {
    name      = "quest-role-binding"
    namespace = "default"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.quest_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.quest_sa.metadata[0].name
    namespace = "default"
  }
}