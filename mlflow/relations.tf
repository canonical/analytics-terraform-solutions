resource "juju_integration" "mlflow_server_minio_object_storage" {
  model = juju_model.kubeflow.name

  application {
    name     = module.mlflow_server.app_name
    endpoint = "object-storage"
  }

  application {
    name     = module.minio.app_name
    endpoint = "object-storage"
  }
}

resource "juju_integration" "mlflow_server_mlflow_mysql_client" {
  model = juju_model.kubeflow.name

  application {
    name     = module.mlflow_server.app_name
    endpoint = "relational-db"
  }

  application {
    name     = juju_application.mlflow_mysql.name
    endpoint = "database"
  }
}