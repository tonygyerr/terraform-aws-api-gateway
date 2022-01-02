variable "app_name" {
  type        = string
  description = "Application"
  default     = ""
}

variable "application_name" {
  description = "Application name"
  default     = ""
}

variable "client_name" {
  description = "Client name based on its site domain (e.g. example-com)"
  default     = "app"
}

variable "subdomain" {
  description = "Subdomain for the API"
  default     = "some"
}

variable "domain" {
  description = "The domain name (only 1 level, without subdomain)"
  default     = "example.com"
}
variable "swagger_template" {
  default = ""
}

variable "stage" {
  description = "Stage name"
  default     = ""
}
variable "use_custom_domain" {
  default = false
}
variable "cache_cluster_enabled" {
  default = false
}
variable "cache_cluster_size" {
  default = 0.5
}
variable "api_env" {
  type    = map(any)
  default = {}
}

variable "api_gateway_name" {
  type    = string
  default = ""
}

variable "api_gateway_description" {
  type    = string
  default = ""
}

variable "api_gateway_int_name" {
  type    = string
  default = ""
}

variable "api_gateway_int_description" {
  type    = string
  default = ""
}


# -----------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# -----------------------------------------------------------------------------------------------------

variable "filename" {
  description = "path to the filename"
  default     = ""
}

variable "function_name" {
  description = "name of your lambda function name"
}

variable "handler" {
  default = "lambda.handler"
}

variable "runtime" {
  default = "python3.8"
}

variable "iam_role_arn" {
  description = "The IAM Role"
  type        = string
  default     = ""
}

variable "app_tags" {
  type        = map(string)
  description = "optional lambda tags"

  default = {
    name        = ""
    owner       = ""
    costcenter  = ""
    environment = ""
    project     = ""
  }
}

# -----------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# -----------------------------------------------------------------------------------------------------

variable "description" {
  description = "Description of your Lambda Function"
  default     = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "module_name" {
  type    = string
  default = ""
}

variable "memory_size" {
  default = "256"
}

variable "publish" {
  default = false
}

variable "cw_event_name" {
  default = ""
}

variable "aws_region" {
  description = "Default AWS Region"
  type        = string
  default     = ""
}

variable "profile" {
  description = "The name of the aws profile"
  type        = string
  default     = ""
}

variable "reserved_concurrent_executions" {
  default = "-1"
}

variable "extra_tags" {
  description = "A map of extra tags provided by the user"
  type        = map(string)
  default     = {}
}

variable "timeout" {
  default = 3
}

variable "vpc_config" {
  description = "Configuration options for VPC adn subnets"
  type        = map(list(string))
  default     = {}
}

variable "api_rest_api_id" {
  type    = string
  default = ""
}

variable "api_http_method" {
  type    = string
  default = ""
}

variable "api_resource_path" {
  type = string
}

variable "subnet_ids" {
  default = ""
}

variable "security_group_ids" {
  default = ""
}

variable "ipset_v4" {
  type    = string
  default = ""
}

variable "ipset_v6" {
  type    = string
  default = ""
}

variable "lambda_exec_policy" {
  default = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [ "arn:aws:logs:*:*:*" ]
        },
        {
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:CreateNetworkInterface",
                "ec2:AttachNetworkInterface",
                "ec2:DescribeNetworkInterfaces",
                "autoscaling:CompleteLifecycleAction",
                "lambda:InvokeFunction"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:ListBucket"
            ],
            "Resource": [ "arn:aws:s3:::*" ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "sns:Publish",
                "sqs:SendMessage"
            ],
            "Resource": [ "arn:aws:sqs:::*" ]
        },
    ]
}
EOF
}

variable "http_method" {
  default = "GET"
}

variable "lambda_path" {
  type    = string
  default = ""
}

variable "statement_id" {
  type    = string
  default = ""
}

variable "layer_name" {
  type = string
}

# variable "s3_object_version" {
#   type = string
# }

variable "tags" {
  type        = map(string)
  description = "optional tags"

  # default = {
  #   name        = ""
  #   owner       = ""
  #   costcenter  = ""
  #   environment = ""
  #   project     = ""
  # }
}

variable "s3_default_resources" {
  type    = list(string)
  default = []
}

variable "kms_accounts" {
  type    = list(string)
  default = []
}

variable "key_users" {
  type    = list(string)
  default = []
}

variable "deploy_env_map" {
  type = map(any)
  default = {
    dev  = "develop"
    test = "test"
    prod = "prod"
  }
}

variable "vpc_name" {
  type    = string
  default = ""
}

variable "logging_bucket" {
  description = ""
  default     = ""
}