output "service_account_name" {
  description = "The name of the created service account"
  value       = kubernetes_service_account.quest_sa.metadata[0].name
}

output "role_name" {
  description = "The name of the created role"
  value       = kubernetes_role.quest_role.metadata[0].name
}

output "role_binding_name" {
  description = "The name of the created role binding"
  value       = kubernetes_role_binding.quest_role_binding.metadata[0].name
}