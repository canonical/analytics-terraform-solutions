# Charmed MLFlow Terraform Solution

This is a Terraform module facilitating the deployment of Charmed MLFlow, using the [Terraform juju provider](https://github.com/juju/terraform-provider-juju/). For more information, refer to the provider [documentation](https://registry.terraform.io/providers/juju/juju/latest/docs).

## API

### Inputs
The solution module offers the following configurable inputs:

| Name                | Type   | Description                             | Required |
|---------------------|--------|-----------------------------------------|----------|
| `create_model`       | bool   | Allows skipping Juju model creation and re-using an existing model | False    |
| `minio_size`         | string | MinIO storage size allocation            | False    |
| `mlflow_mysql_size`  | string | MySQL storage size allocation for MLFlow | False    |
| `model`              | string | Name of the Juju model for deployment    | True     |

### Outputs
Upon applying, the solution module exports the following outputs:

| Name                | Description                                     |
|---------------------|-------------------------------------------------|
| `model`             | Model name that Charmed MLflow is deployed on |


## Usage

This solution module is intended to be used either on its own or as part of a higher-level module.

### Create Model
If a model is created outside of this solution module (e.g., in a higher-level module), deploy MLFlow with `create_model` set to `false`:

```bash
terraform apply -var create_model=false
```

By default, `create_model` is set to `true`, allowing MLFlow to be deployed independently. Ensure that the model name is passed correctly, as MLFlow is typically deployed within the same model as Kubeflow.

### MinIO and MySQL Configuration

#### Customize MinIO Storage
You can customize the MinIO storage size by providing the `minio_size` input:

```bash
terraform apply -var minio_size="20G"
```

#### Customize MySQL Storage for MLFlow
You can customize the MySQL storage size for MLFlow by providing the `mlflow_mysql_size` input:

```bash
terraform apply -var mlflow_mysql_size="5G"
```

### Using an Existing Model
In case you want to deploy MLFlow into an existing Juju model, instead of creating a new one, use the `model_name` input to specify the model:

```bash
terraform apply -var model="existing-kubeflow-model -var create_model=false"
```