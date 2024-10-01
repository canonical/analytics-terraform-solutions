variable "minio_size" {
  description = "Size allocated for minio data"
  type        = string
  default = "11G"
  # default = "10G"
}

variable "mlflow_mysql_size" {
  description = "Size allocated for mysql data"
  type        = string
  default = "1G"
  # default = "10G"
}

variable "model_name" {
  description = "Model name"
  type        = string
  default     = "kubeflow"
}
