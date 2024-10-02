variable "cos_configuration" {
  description = "Boolean value that enables COS configuration"
  type        = bool
  default     = false
}

variable "create_model" {
  description = "Allows to skip Juju model creation and re-use a model created in a higher level module"
  type        = bool
  default     = true
}

variable "existing_grafana_agent_name" {
  description = "Name of an existing grafana-agent-k8s deployment"
  type        = string
  default     = null
}

variable "grafana_agent_k8s_size" {
  description = "Grafana agent database storage size"
  type        = string
  default     = "10G"
}

variable "minio_size" {
  description = "Size allocated for minio data"
  type        = string
  default     = "10G"
}

variable "mlflow_mysql_size" {
  description = "Size allocated for mysql data"
  type        = string
  default     = "10G"
}

variable "model_name" {
  description = "Model name"
  type        = string
  default     = "kubeflow"
}
