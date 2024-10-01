
resource "juju_integration" "argo_controller_minio" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.argo_controller.app_name
    endpoint = "object-storage"
  }

  application {
    name     = module.minio.app_name
    endpoint = "object-storage"
  }
}

resource "juju_integration" "dex_auth_oidc_gatekeeper_dex_oidc_config" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.dex_auth.app_name
    endpoint = "dex-oidc-config"
  }

  application {
    name     = module.oidc_gatekeeper.app_name
    endpoint = "dex-oidc-config"
  }
}

resource "juju_integration" "dex_auth_oidc_gatekeeper_oidc_client" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.dex_auth.app_name
    endpoint = "oidc-client"
  }

  application {
    name     = module.oidc_gatekeeper.app_name
    endpoint = "oidc-client"
  }
}

resource "juju_integration" "istio_pilot_dex_auth_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.dex_auth.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_jupyter_uiingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.jupyter_ui.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_katib_uiingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.katib_ui.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_kfp_ui_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.kfp_ui.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_kubeflow_dashboard_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_kubeflow_volumes_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.kubeflow_volumes.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_oidc_gatekeeper_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.oidc_gatekeeper.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_envoy_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.envoy.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_tensorboards_web_app_ingress" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress"
  }

  application {
    name     = module.tensorboards_web_app.app_name
    endpoint = "ingress"
  }
}

resource "juju_integration" "istio_pilot_oidc_gatekeeper_ingress_auth" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "ingress-auth"
  }

  application {
    name     = module.oidc_gatekeeper.app_name
    endpoint = "ingress-auth"
  }
}

resource "juju_integration" "istio_pilot_istio_ingressgateway_istio_pilot" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "istio-pilot"
  }

  application {
    name     = module.istio_ingressgateway.app_name
    endpoint = "istio-pilot"
  }
}

resource "juju_integration" "istio_pilot_kserve_controller_gateway_info" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "gateway-info"
  }

  application {
    name     = module.kserve_controller.app_name
    endpoint = "ingress-gateway"
  }
}

resource "juju_integration" "istio_pilot_tensorboard_controller_gateway_info" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.istio_pilot.app_name
    endpoint = "gateway-info"
  }

  application {
    name     = module.tensorboard_controller.app_name
    endpoint = "gateway-info"
  }
}

resource "juju_integration" "katib_db_manager_katib_controller_k8s_service_info" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_db_manager.app_name
    endpoint = "k8s-service-info"
  }

  application {
    name     = module.katib_controller.app_name
    endpoint = "k8s-service-info"
  }
}

resource "juju_integration" "katib_db_manager_katib_db_relational_db" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.katib_db_manager.app_name
    endpoint = "relational-db"
  }

  application {
    name     = module.katib_db.application_name
    endpoint = "database"
  }
}

resource "juju_integration" "kfp_api_kfp_db_database" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "relational-db"
  }

  application {
    name     = module.kfp_db.application_name
    endpoint = "database"
  }
}

resource "juju_integration" "kfp_api_kfp_persistence_database" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "kfp-api"
  }

  application {
    name     = module.kfp_persistence.app_name
    endpoint = "kfp-api"
  }
}

resource "juju_integration" "kfp_api_kfp_ui_database" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "kfp-api"
  }

  application {
    name     = module.kfp_ui.app_name
    endpoint = "kfp-api"
  }
}

resource "juju_integration" "kfp_api_kfp_viz_database" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "kfp-viz"
  }

  application {
    name     = module.kfp_viz.app_name
    endpoint = "kfp-viz"
  }
}

resource "juju_integration" "kfp_api_minio_object_storage" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_api.app_name
    endpoint = "object-storage"
  }

  application {
    name     = module.minio.app_name
    endpoint = "object-storage"
  }
}

resource "juju_integration" "kfp_profile_controller_minio_object_storage" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_profile_controller.app_name
    endpoint = "object-storage"
  }

  application {
    name     = module.minio.app_name
    endpoint = "object-storage"
  }
}

resource "juju_integration" "kfp_ui_minio_object_storage" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kfp_ui.app_name
    endpoint = "object-storage"
  }

  application {
    name     = module.minio.app_name
    endpoint = "object-storage"
  }
}

resource "juju_integration" "kserve_controller_knative_serving_local_gateway" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kserve_controller.app_name
    endpoint = "local-gateway"
  }

  application {
    name     = module.knative_serving.app_name
    endpoint = "local-gateway"
  }
}

resource "juju_integration" "kubeflow_profiles_kubeflow_dashboard_kubeflow_profiles" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_profiles.app_name
    endpoint = "kubeflow-profiles"
  }

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "kubeflow-profiles"
  }
}

resource "juju_integration" "kubeflow_dashboard_jupyter_ui_links" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "links"
  }

  application {
    name     = module.jupyter_ui.app_name
    endpoint = "dashboard-links"
  }
}

resource "juju_integration" "kubeflow_dashboard_katib_ui_links" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "links"
  }

  application {
    name     = module.katib_ui.app_name
    endpoint = "dashboard-links"
  }
}

resource "juju_integration" "kubeflow_dashboard_kfp_ui_links" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "links"
  }

  application {
    name     = module.kfp_ui.app_name
    endpoint = "dashboard-links"
  }
}

resource "juju_integration" "kubeflow_dashboard_kubeflow_volumes_links" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "links"
  }

  application {
    name     = module.kubeflow_volumes.app_name
    endpoint = "dashboard-links"
  }
}

resource "juju_integration" "kubeflow_dashboard_tensorboards_web_app_links" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "links"
  }

  application {
    name     = module.tensorboards_web_app.app_name
    endpoint = "dashboard-links"
  }
}

resource "juju_integration" "kubeflow_dashboard_training_operator_links" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.kubeflow_dashboard.app_name
    endpoint = "links"
  }

  application {
    name     = module.training_operator.app_name
    endpoint = "dashboard-links"
  }
}

resource "juju_integration" "mlmd_envoy_grpc" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.mlmd.app_name
    endpoint = "grpc"
  }

  application {
    name     = module.envoy.app_name
    endpoint = "grpc"
  }
}

resource "juju_integration" "mlmd_kfp_metadata_writer_grpc" {
  model = var.create_model ? juju_model.kubeflow[0].name : local.model_name

  application {
    name     = module.mlmd.app_name
    endpoint = "grpc"
  }

  application {
    name     = module.kfp_metadata_writer.app_name
    endpoint = "grpc"
  }
}
