## Module Api Gateway
```hcl
module "api_gw" {
  source                        = "git::sshh://git@github.com:tonygyerr/terraform-aws-api-gateway.git"
  rest_api_id                   = aws_api_gateway_rest_api.lambda.id
  resource_id                   = aws_api_gateway_resource.users.id
  http_method                   = var.http_method
  lambda_name                   = var.lambda_name
  account_id                    = data.aws_caller_identity.account_id
  region                        = var.aws_region
  integration_request_template  = var.integration_request_template
  request_model                 = var.request_model
  integration_response_template = var.integration_response_template
  response_model                = var.response_model
  integration_error_template    = var.integration_error_template
  authorization                 = var.authorization
  cw_event_name                 = var.cw_event_name
  tags                          = var.tags
}
```

## Prerequisites
- Docker (for using Docker Image of dependencies)
- Git
- Terraform
- AWS Key pair for Terraform provisioning.
- AWS S3 bucket for remote terraform state file (tfstate)
- AWS Dynamo Database for tfstate table state lock 

## How to run this Module using Terraform Commands
```bash
cd examples
terraform get
terraform init -backend-config ../backend-config/dev.tfvars
terraform plan -var-file="../env-config/dev.tfvars"
terraform apply -var-file="../env-config/dev.tfvars" -auto-approve
terraform destroy -var-file="../env-config/dev.tfvars"
```

## How to Run this Module using Makefile Process
```bash
make auth
make get
make init
make plan
make apply
```

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | n/a | `string` | `${key_users}` | no |
| api\_env | n/a | `map` | `{}` | no |
| api\_gateway\_description | n/a | `string` | `""` | no |
| api\_gateway\_int\_description | n/a | `string` | `""` | no |
| api\_gateway\_int\_name | n/a | `string` | `""` | no |
| api\_gateway\_name | n/a | `string` | `""` | no |
| api\_http\_method | n/a | `string` | `""` | no |
| api\_resource\_path | n/a | `string` | n/a | yes |
| api\_rest\_api\_id | n/a | `string` | `""` | no |
| app\_tags | optional lambda tags | `map(string)` | <pre>{<br>  "costcenter": "",<br>  "environment": "",<br>  "name": "",<br>  "owner": "",<br>  "project": ""<br>}</pre> | no |
| application\_name | Application name | `string` | `""` | no |
| aws\_region | Default AWS Region | `string` | `""` | no |
| cache\_cluster\_enabled | n/a | `bool` | `false` | no |
| cache\_cluster\_size | n/a | `number` | `0.5` | no |
| client\_name | Client name based on its site domain (e.g. example-com) | `string` | `"app"` | no |
| cw\_event\_name | n/a | `string` | `""` | no |
| description | Description of your Lambda Function | `string` | `""` | no |
| domain | The domain name (only 1 level, without subdomain) | `string` | `"example.com"` | no |
| environment | n/a | `string` | `""` | no |
| extra\_tags | A map of extra tags provided by the user | `map(string)` | `{}` | no |
| filename | path to the filename | `string` | `""` | no |
| function\_name | name of your lambda function name | `any` | n/a | yes |
| handler | n/a | `string` | `"lambda.handler"` | no |
| http\_method | n/a | `string` | `"GET"` | no |
| iam\_role\_arn | The Role | `string` | n/a | yes |
| lambda\_exec\_policy | n/a | `string` | `"{\n    \"Version\": \"2012-10-17\",\n    \"Statement\": [\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"logs:CreateLogGroup\",\n                \"logs:CreateLogStream\",\n                \"logs:PutLogEvents\"\n            ],\n            \"Resource\": [ \"arn:aws:logs:*:*:*\" ]\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Resource\": \"*\",\n            \"Action\": [\n                \"ec2:DescribeInstances\",\n                \"ec2:CreateNetworkInterface\",\n                \"ec2:AttachNetworkInterface\",\n                \"ec2:DescribeNetworkInterfaces\",\n                \"autoscaling:CompleteLifecycleAction\",\n                \"lambda:InvokeFunction\"\n            ]\n        },\n        {\n            \"Effect\": \"Allow\",\n            \"Action\": [\n                \"s3:PutObject\",\n                \"s3:GetObject\",\n                \"s3:PutObject\",\n                \"s3:DeleteObject\",\n                \"s3:ListBucket\"\n            ],\n            \"Resource\": [ \"arn:aws:s3:::*\" ]\n        }\n    ]\n}\n"` | no |
| lambda\_path | n/a | `string` | `""` | no |
| layer\_name | n/a | `string` | n/a | yes |
| memory\_size | n/a | `string` | `"256"` | no |
| module\_name | n/a | `string` | `""` | no |
| publish | n/a | `bool` | `false` | no |
| reserved\_concurrent\_executions | n/a | `string` | `"-1"` | no |
| runtime | n/a | `string` | `"python3.8"` | no |
| security\_group\_ids | n/a | `string` | `""` | no |
| stage | Stage name | `string` | `"v1"` | no |
| subdomain | Subdomain for the API | `string` | `"some"` | no |
| subnet\_ids | n/a | `string` | `""` | no |
| swagger\_template | n/a | `string` | `""` | no |
| tags | optional tags | `map(string)` | n/a | yes |
| timeout | n/a | `number` | `3` | no |
| use\_custom\_domain | n/a | `bool` | `false` | no |
| vpc\_config | Configuration options for VPC adn subnets | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| api\_id | n/a |
| lambda\_arn | n/a |
| lambda\_function\_name | n/a |
| lambda\_invoke\_arn | n/a |
| lambda\_source\_arn | n/a |