
# Terraform Application for MLFlow Bundle

This Terraform application facilitates the deployment of the MLFlow bundle, which includes MLFlow Server, MinIO, and MySQL components, using the [Terraform juju provider](https://github.com/juju/terraform-provider-juju/). For more information, refer to the provider [documentation](https://registry.terraform.io/providers/juju/juju/latest/docs).

## Requirements
This module requires a `juju` model to be available. Refer to the [Usage section](#usage) below for more details.

## API

### Inputs
The application offers the following configurable inputs:

| Name                | Type   | Description                        | Required |
|---------------------|--------|------------------------------------|----------|
| `minio_size`        | string | Size allocated for MinIO data      | False    |
| `mlflow_mysql_size` | string | Size allocated for MySQL data      | False    |
| `model_name`        | string | Name of the model to deploy the app| True     |

### Outputs
This application currently does not export any outputs.

## Usage

This Terraform application is designed to deploy MLFlow along with its dependencies (MinIO and MySQL) and set up the necessary relations between them.

### Define a `juju_model` Resource
You must define a `juju_model` resource in your Terraform configuration, which specifies the Juju model where the applications will be deployed. Ensure that the `model_name` variable points to the correct model name:

```hcl
resource "juju_model" "kubeflow" {
  name = var.model_name
}
```
