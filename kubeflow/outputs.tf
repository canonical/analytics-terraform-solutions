output "model_name" {
  value = local.model_name
}

output "grafana_agent_name" {
  value = one(juju_application.grafana_agent_k8s[*].name)
}

output "existing_grafana_agent_name" {
  value = var.existing_grafana_agent_name
}
