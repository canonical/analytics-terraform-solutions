output "model_name" {
  value = var.create_model ? juju_model.kubeflow[0].name : var.model
}
