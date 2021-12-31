variable "app_name" {
  type        = string
  description = "Application"
  default     = ""
}

variable "environment" {
  default = {}
}

variable "rest_api_id" {
  default = ""
}

variable "resource_id" {
}

variable "lambda_name" {
  default = ""
}

variable "account_id" {
  default = ""
}

variable "aws_region" {
  default = "us-east-1"
}

variable "integration_request_template" {
  default = "{}"
}

variable "integration_response_template" {
  default = "#set($inputRoot = $input.path('$')){}"
}

variable "request_parameters" {
  default = {}
}

variable "request_model" {
  default = "Empty"
}

variable "filename" {
  default = ""
}

variable "cw_event_name" {
  default = ""
}

variable "response_model" {
  default = "Empty"
}

variable "integration_error_template" {
  default = <<EOF
#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {
  "message" : "$errorMessageObj.message"
}
EOF

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

variable "region" {
  description = "ec2 region for the vpc"
  type        = string
}

variable "reserved_concurrent_executions" {
  default = "-1"
}

variable "tags" {
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

variable "iam_role_arn" {
  description = "The IAM Role"
  type        = string
  default     = ""
}

variable "function_name" {
  type    = string
  default = ""
}

variable "api_rest_api_id" {
  type    = string
  default = ""
}

variable "api_http_method" {
  type = string
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
        }
    ]
}
EOF
}

variable "http_method" {
  default = "GET"
}

variable "lambda_path" {
  type = string
}

variable "stack_name" {
  type = string
}

variable "layer_name" {
  type = string
}

# variable "s3_object_version" {
#   type = string
#   default = ""
# }

variable "s3_default_resources" {
  type        = list(string)
  default     = []
}

variable "kms_accounts" {
  type        = list(string)
  default     = []
}

variable "key_users" {
  type        = list(string)
  default     = []
}

variable "deploy_env_map" {
  type = map
  default = {
    dev = "develop"
    test = "test"
    prod = "prod"
  }
}

variable "statement_id" {
  type    = string
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