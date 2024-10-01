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

variable "dex_connectors" {
  description = "dex-auth connectors in yaml format"
  type        = string
  default     = ""
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

variable "http_proxy" {
  description = "Value of the http_proxy environment variable"
  type        = string
  default     = ""
}

variable "https_proxy" {
  description = "Value of the https_proxy environment variable"
  type        = string
  default     = ""
}

variable "istio_tls_secret_id" {
  description = "The juju secret id for the tls key/cert for istio-pilot"
  type        = string
  default     = ""
}

variable "jupyter_ui_config" {
  description = "Map of config values passed to jupyter-ui"
  type        = map(string)
  default     = {}
}

variable "katib_db_size" {
  description = "Katib database storage size"
  type        = string
  default     = "10G"
}

variable "kfp_db_size" {
  description = "KFP database storage size"
  type        = string
  default     = "10G"
}

variable "minio_size" {
  description = "MinIO database storage size"
  type        = string
  default     = "10G"
}

variable "mlmd_size" {
  description = "MLMD database storage size"
  type        = string
  default     = "10G"
}

variable "no_proxy" {
  description = "Value of the no_proxy environment variable"
  type        = string
  default     = ""
}

variable "public_url" {
  description = "Public URL of Kubeflow for auth/OIDC"
  type        = string
  default     = "http://dex-auth.kubeflow.svc:5556"
}
