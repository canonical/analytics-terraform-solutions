# TODO: Update to use a reusable module instead of defining
# a `juju_application` resource
resource "juju_application" "grafana_agent_k8s" {
  count = var.cos_configuration && var.existing_grafana_agent_name == null ? 1 : 0
  charm {
    name    = "grafana-agent-k8s"
    channel = "latest/stable"
  }
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name
  name  = "grafana-agent-k8s-kubeflow"
  storage_directives = {
    data = var.grafana_agent_k8s_size
  }
  trust = true
  units = 1
}

resource "juju_integration" "mlflow_mysql_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.mlflow_mysql.application_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "mlflow_mysql_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.mlflow_mysql.application_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "mlflow_mysql_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.mlflow_mysql.application_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "mlflow_server_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.mlflow_server.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "mlflow_server_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.mlflow_server.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "minio_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.minio.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "minio_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : var.model_name

  application {
    name     = module.minio.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}
