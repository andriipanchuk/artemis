## Terraform module helm-deploy

This terraform module will help you deploy the helm charts on local.

- [Requirements](#Requirements)

- [Before you begin](#before-you-begin)

- [Usage](#usage)

- [Variables](#variables)

- [Custom Values](#custom-variable-deployment)

  

## Requirements

Terraform >= 0.11.7

Kubernetes  >=  v1.14.8

Tiller >= v2.11.0

## Before you begin

1. Make sure that you have `kubectl` installed and you have configured your `~/.kube/config` 
2. Make sure you have tiller installed on your  kubernetes cluster
3. Make sure that terraform also installed and follows [Requirements](#Requirements)

## Usage

First you will need to create your own helm chart [link](https://docs.bitnami.com/kubernetes/how-to/create-your-first-helm-chart/). If you would like to quickly create helm chart then run

```
╭─ fsadykov ~
╰─() mkdir -p deployments/terraform/charts && cd deployments/terraform
╭─ fsadykov ~
╰─() helm create charts/example
Creating example
╭─ fsadykov ~
╰─() ls charts/example
Chart.yaml  charts      templates   values.yaml
```

After you created your helm chart you can go ahead and do modification inside `values.yaml`

when modification is done for `values.yaml` you will need to create `module.tf` to call the module 

```hcl
cat <<EOF >module.tf
module "helm_deploy" {
  source                 = "git::https://github.com/fuchicorp/helm-deploy.git"
  deployment_name        = "example-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "example.fuchicorp.com"
  deployment_path        = "example"
}
EOF
```

follow the file path 

```yaml
./module.tf
./charts/
    /example ## Your chart location 
      /Chart.yaml
      /charts
      /templates
      /values.yaml
```



## Variables

For more info, please see the [variables file](variables.tf).

| Variable               | Description                         | Default                                               | Type |
| :--------------------- | :---------------------------------- | :---------------------------------------------------: | :--------------------: |
| `deployment_name` | The name of the deployement for helm release | `(Required)` | `string` |
| `deployment_environment` | Name of the namespace | `(Required)` | `string` |
| `deployment_endpoint` | Ingress endpoint `example.fuchicorp.com` | `(Required)` | `domain/string` |
| `deployment_path` | path for helm chart on local | `(Required)` | `string` |
| `template_custom_vars` | Template custom veriables you can modify variables by parsting the `template_custom_vars` | (Optional) | `map` |
| `env_vars` | Environment veriable for the containers takes map | `(Optional)` | `map` |
| `timeout` | If you would like to increase the timeout | `(Optional)` | `number` |
| `recreate_pods` | On update performs pods restart for the resource if applicable. | `(Optional)` | `bool` |



## Custom variable deployment 

```
module "helm_deploy" {
  # source = "git::https://github.com/fuchicorp/helm-deploy.git"

  source  = "../../helm-deploy"
  timeout = "500"

  deployment_name        = "artemis-deployment"
  deployment_environment = "dev"
  deployment_endpoint    = "artemis.fuchicorp.com"
  deployment_path        = "artemis"

  template_custom_vars = {
    deployment_image = "nginx"
  }
}
```

Every key and value you define inside `template_custom_vars` will used for your `values-template.yaml` in this case 

`deployment_image` value will replace inside file to `nginx` 

```
╭─ fsadykov ~/Projects/fuchicorp-projects/terraform-modules/deploy-testing
╰─(‹master*› ) cat charts/artemis/values.yaml| grep repository
  repository: ${deployment_image}
```

Output file will be: 

```
╭─ fsadykov ~/Projects/fuchicorp-projects/helm-deploy
╰─(‹master*› ) cat .cache/values.yaml | grep reposit
  repository: nginx
```

You can see the `repository` replaced to right value



Created for FuchiCorp developed by FuchiCorp DevOps team enjoy using it


