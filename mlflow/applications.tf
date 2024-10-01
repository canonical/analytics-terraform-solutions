module "minio" {
  app_name   = "mlflow-minio"
  source     = "git::https://github.com/canonical/minio-operator//terraform?ref=track/ckf-1.9"
  model_name = juju_model.kubeflow.name
  storage_directives = {
    minio-data = var.minio_size
  }
}

module "mlflow_server" {
  source     = "git::https://github.com/canonical/mlflow-operator//terraform?ref=track/2.15"
  model_name = juju_model.kubeflow.name
}

resource "juju_application" "mlflow_mysql" {
  charm {
    name    = "mysql-k8s"
    channel = "8.0/stable"
  }
  model       = juju_model.kubeflow.name
  name        = "mlflow-mysql"
  trust       = true
  units       = 1
  constraints = "arch=amd64"
  config = {
    profile-limit-memory = "2048"
  }
  storage_directives = {
    database = var.mlflow_mysql_size
  }
}
