# TODO: Update to use a reusable module instead of defining
# a `juju_application` resource
resource "juju_application" "grafana_agent_k8s" {
  count = var.cos_configuration && var.existing_grafana_agent_name == null ? 1 : 0
  charm {
    name    = "grafana-agent-k8s"
    channel = "latest/stable"
  }
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  name  = "grafana-agent-k8s-kubeflow"
  storage_directives = {
    data = var.grafana_agent_k8s_size
  }
  trust = true
  units = 1
}

resource "juju_integration" "argo_controller_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.argo_controller.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "argo_controller_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.argo_controller.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "argo_controller_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.argo_controller.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "admission_webhook_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.admission_webhook.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "dex_auth_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.dex_auth.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "dex_auth_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.dex_auth.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "dex_auth_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.dex_auth.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "envoy_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.envoy.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "envoy_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.envoy.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "envoy_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.envoy.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "istio_ingressgateway_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_ingressgateway.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "istio_pilot_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "istio_pilot_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "jupyter_controller_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.jupyter_controller.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "jupyter_controller_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.jupyter_controller.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "jupyter_controller_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.jupyter_controller.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "jupyter_ui_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.jupyter_ui.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "katib_controller_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_controller.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "katib_controller_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_controller.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "katib_controller_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_controller.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "katib_db_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_db.application_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "katib_db_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_db.application_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "katib_db_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_db.application_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "katib_db_manager_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_db_manager.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "katib_ui_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_ui.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_api_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "kfp_api_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "kfp_api_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}


resource "juju_integration" "kfp_db_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_db.application_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "kfp_db_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_db.application_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "kfp_db_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_db.application_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_metadata_writer_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_metadata_writer.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_persistence_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_persistence.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_profile_controller_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_profile_controller.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_schedwf_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_schedwf.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_ui_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_ui.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_viewer_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_viewer.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kfp_viz_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_viz.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "knative_eventing_knative_operator_otel_collector" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.knative_eventing.app_name
    endpoint = "otel-collector"
  }

  application {
    name     = module.knative_operator.app_name
    endpoint = "otel-collector"
  }
}

resource "juju_integration" "knative_serving_knative_operator_otel_collector" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.knative_serving.app_name
    endpoint = "otel-collector"
  }

  application {
    name     = module.knative_operator.app_name
    endpoint = "otel-collector"
  }
}

resource "juju_integration" "knative_operator_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.knative_operator.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "knative_operator_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.knative_operator.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kserve_controller_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kserve_controller.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "kserve_controller_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kserve_controller.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kubeflow_dashboard_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "kubeflow_dashboard_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}


resource "juju_integration" "kubeflow_profiles_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_profiles.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "kubeflow_profiles_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_profiles.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "kubeflow_volumes_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_volumes.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "metacontroller_operator_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.metacontroller_operator.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "metacontroller_operator_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.metacontroller_operator.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "mlmd_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.mlmd.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "minio_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

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
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.minio.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "oidc_gatekeeper_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.oidc_gatekeeper.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "pvcviewer_operator_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.pvcviewer_operator.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "pvcviewer_operator_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.pvcviewer_operator.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "pvcviewer_operator_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.pvcviewer_operator.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "tensorboard_controller_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.tensorboard_controller.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}

resource "juju_integration" "tensorboard_controller_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.tensorboard_controller.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "tensorboards_web_app_grafana_agent_k8s_grafana_logging" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.tensorboards_web_app.app_name
    endpoint = "logging"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "logging-provider"
  }
}

resource "juju_integration" "training_operator_grafana_agent_k8s_grafana_dashboard" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.training_operator.app_name
    endpoint = "grafana-dashboard"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "grafana-dashboards-consumer"
  }
}

resource "juju_integration" "training_operator_grafana_agent_k8s_metrics_endpoint" {
  count = var.cos_configuration ? 1 : 0
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.training_operator.app_name
    endpoint = "metrics-endpoint"
  }

  application {
    name     = var.existing_grafana_agent_name == null ? juju_application.grafana_agent_k8s[count.index].name : var.existing_grafana_agent_name
    endpoint = "metrics-endpoint"
  }
}
