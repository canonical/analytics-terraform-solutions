variable "create_model" {
  description = "Allows to skip Juju model creation and re-use a model created in a higher level module"
  type        = bool
  default     = true
}

variable "minio_size" {
  description = "Size allocated for minio data"
  type        = string
  default     = "11G"
  # default = "10G"
}

variable "mlflow_mysql_size" {
  description = "Size allocated for mysql data"
  type        = string
  default     = "1G"
  # default = "10G"
}

variable "model_name" {
  description = "Model name"
  type        = string
  default     = "kubeflow"
}
