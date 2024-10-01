
module "admission_webhook" {
  source     = "git::https://github.com/canonical/admission-webhook-operator//terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "argo_controller" {
  source     = "git::https://github.com/canonical/argo-operators//charms/argo-controller/terraform?ref=track/3.4"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "dex_auth" {
  source     = "git::https://github.com/canonical/dex-auth-operator//terraform?ref=track/2.39"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  config = {
    "public-url" : var.public_url,
    "connectors" : var.dex_connectors
  }
}

module "envoy" {
  source     = "git::https://github.com/canonical/envoy-operator//terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "istio_ingressgateway" {
  source     = "git::https://github.com/canonical/istio-operators//charms/istio-gateway/terraform?ref=track/1.22"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  app_name   = "istio-ingressgateway"
  config = {
    kind = "ingress",
  }
}

module "istio_pilot" {
  source     = "git::https://github.com/canonical/istio-operators//charms/istio-pilot/terraform?ref=track/1.22"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  config = {
    default-gateway = "kubeflow-gateway",
    "tls-secret-id" : var.istio_tls_secret_id
  }
}

module "jupyter_controller" {
  source     = "git::https://github.com/canonical/notebook-operators//charms/jupyter-controller/terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "jupyter_ui" {
  source     = "git::https://github.com/canonical/notebook-operators//charms/jupyter-ui/terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  config     = var.jupyter_ui_config
}

module "katib_controller" {
  source     = "git::https://github.com/canonical/katib-operators//charms/katib-controller/terraform?ref=track/0.17"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "katib_db" {
  # TODO: Update kfp-db once https://github.com/canonical/terraform-modules/pull/20 is merged
  source              = "git::https://github.com/paulomach/terraform-modules//modules/k8s/mysql-ha-simple?ref=feature/simple-ha-module"
  juju_model_name     = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  mysql_app_name      = "katib-db"
  mysql_charm_channel = "8.0/stable"
  mysql_charm_units   = 1
  # Constrain is a required workaround due to https://github.com/juju/terraform-provider-juju/issues/344
  mysql_charm_constraints = "arch=amd64"
  # The following config is equivalent to "constraints: mem=2G"
  mysql_charm_config = {
    profile-limit-memory = "2048"
  }
  mysql_storage_size = var.katib_db_size
}

module "katib_db_manager" {
  source     = "git::https://github.com/canonical/katib-operators//charms/katib-db-manager/terraform?ref=track/0.17"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "katib_ui" {
  source     = "git::https://github.com/canonical/katib-operators//charms/katib-ui/terraform?ref=track/0.17"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_api" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-api/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_db" {
  # TODO: Update kfp-db once https://github.com/canonical/terraform-modules/pull/20 is merged
  source              = "git::https://github.com/paulomach/terraform-modules//modules/k8s/mysql-ha-simple?ref=feature/simple-ha-module"
  juju_model_name     = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  mysql_app_name      = "kfp-db"
  mysql_charm_channel = "8.0/stable"
  mysql_charm_units   = 1
  # Constrain is a required workaround due to https://github.com/juju/terraform-provider-juju/issues/344
  mysql_charm_constraints = "arch=amd64"
  # The following config is equivalent to "constraints: mem=2G"
  mysql_charm_config = {
    profile-limit-memory = "2048"
  }
  mysql_storage_size = var.kfp_db_size
}

module "kfp_metadata_writer" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-metadata-writer/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_persistence" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-persistence/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_profile_controller" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-profile-controller/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_schedwf" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-schedwf/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_ui" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-ui/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_viewer" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-viewer/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kfp_viz" {
  source     = "git::https://github.com/canonical/kfp-operators//charms/kfp-viz/terraform?ref=track/2.2"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "knative_eventing" {
  source     = "git::https://github.com/canonical/knative-operators//charms/knative-eventing/terraform?ref=track/1.12"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  config = {
    namespace = "knative-eventing"
  }
}

module "knative_operator" {
  source     = "git::https://github.com/canonical/knative-operators//charms/knative-operator/terraform?ref=track/1.12"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "knative_serving" {
  source     = "git::https://github.com/canonical/knative-operators//charms/knative-serving/terraform?ref=track/1.12"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  config = {
    http-proxy                = var.http_proxy,
    https-proxy               = var.https_proxy,
    "istio.gateway.namespace" = local.model_name,
    "istio.gateway.name"      = "kubeflow-gateway",
    namespace                 = "knative-serving",
    no-proxy                  = var.no_proxy,
  }
}

module "kserve_controller" {
  source     = "git::https://github.com/canonical/kserve-operators//charms/kserve-controller/terraform?ref=track/0.13"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  config = {
    deployment-mode = "serverless",
    http-proxy      = var.http_proxy,
    https-proxy     = var.https_proxy,
    no-proxy        = var.no_proxy,
  }
}

module "kubeflow_dashboard" {
  source     = "git::https://github.com/canonical/kubeflow-dashboard-operator//terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kubeflow_profiles" {
  source     = "git::https://github.com/canonical/kubeflow-profiles-operator//terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kubeflow_roles" {
  source     = "git::https://github.com/canonical/kubeflow-roles-operator//terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "kubeflow_volumes" {
  source     = "git::https://github.com/canonical/kubeflow-volumes-operator//terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "metacontroller_operator" {
  source     = "git::https://github.com/canonical/metacontroller-operator//terraform?ref=track/3.0"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "mlmd" {
  source     = "git::https://github.com/canonical/mlmd-operator//terraform?ref=track/ckf-1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  storage_directives = {
    mlmd-data = var.mlmd_size
  }
}

module "minio" {
  source     = "git::https://github.com/canonical/minio-operator//terraform?ref=track/ckf-1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
  storage_directives = {
    minio-data = var.minio_size
  }
}

module "oidc_gatekeeper" {
  source     = "git::https://github.com/canonical/oidc-gatekeeper-operator//terraform?ref=track/ckf-1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "pvcviewer_operator" {
  source     = "git::https://github.com/canonical/pvcviewer-operator//terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "tensorboard_controller" {
  source     = "git::https://github.com/canonical/kubeflow-tensorboards-operator//charms/tensorboard-controller/terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "tensorboards_web_app" {
  source     = "git::https://github.com/canonical/kubeflow-tensorboards-operator//charms/tensorboards-web-app/terraform?ref=track/1.9"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}

module "training_operator" {
  source     = "git::https://github.com/canonical/training-operator//terraform?ref=track/1.8"
  model_name = var.create_model ? juju_model.kubeflow[0].name : local.model_name
}
