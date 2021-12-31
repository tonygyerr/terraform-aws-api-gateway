#--------------------------------------------------------------
# general
#--------------------------------------------------------------
vpc_name    = "service"
environment = "dev"
aws_region  = "us-east-1"
profile     = "default"

#--------------------------------------------------------------
# api gateway
#--------------------------------------------------------------
app_name                      = "my-app"
http_method                   = "ANY"
api_http_method               = "ANY"
api_rest_api_id               = ""
region                        = "us-east-1"
resource_id                   = ""
request_parameters            = ""
rest_api_id                   = ""
integration_request_template  = "#set($inputRoot = $input.path('$')){}"
request_model                 = "Empty"
integration_response_template = "#set($inputRoot = $input.path('$')){}"
response_model                = "Empty"
integration_error_template    = "#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {\"message\" :\"$errorMessageObj.message\"}"
iam_role_arn                  = "arn:aws:iam::1234567890123:role/lambda-basic-execution"
api_gateway_description       = "Service App API Gateway"
api_gateway_int_name          = "dev"
api_resource_path             = "test"

#--------------------------------------------------------------
# cloudwatch
#--------------------------------------------------------------
cw_event_name = "my-app-cloudwatch-error"

#--------------------------------------------------------------
# kms
#--------------------------------------------------------------
kms_accounts = ["arn:aws:iam::1234567890123:root"]
key_users    = ["arn:aws:iam::1234567890123:role/myrole", "arn:aws:iam::1234567890123:role/service-sagemaker-role", "arn:aws:iam::1234567890123:role/service-waf-reputation-list", "arn:aws:iam::1234567890123:role/service-waf-stream-role", "arn:aws:iam::1234567890123:role/lambda-basic-execution"]

#--------------------------------------------------------------
# lambda
#--------------------------------------------------------------
lambda_path   = "dev"
stack_name    = "MyApplication"
function_name = "my-application"
layer_name    = "lambda"
handler       = "my-application.lambda_handler"

#--------------------------------------------------------------
# wafv2
#--------------------------------------------------------------
ipset_v4 = "service-IPBadBotSetIPV4"
ipset_v6 = "service-IPBadBotSetIPV6"