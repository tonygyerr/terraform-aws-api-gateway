#--------------------------------------------------------------
# general
#--------------------------------------------------------------

environment = {
    "environment" = "dev"
    "aws_region"  = "us-east-1"
}

tags = {
  Owner       = "cv-service"
  Environment = "dev"
  Name        = "cv-service-api-gw-iac"
  Region      = "us-east-1"
  CostCenter  = "cv-service"
}

#--------------------------------------------------------------
# api gateway
#--------------------------------------------------------------

http_method                   = "POST"
api_http_method               = "POST"
api_rest_api_id               = ""
aws_region                    = "us-east-1"
region                        = "us-east-1"
resource_id                   = ""
request_parameters            = ""
rest_api_id                   = "08mgxywnpl"
integration_request_template  = "#set($inputRoot = $input.path('$')){}"
request_model                 = "Empty"
integration_response_template = "#set($inputRoot = $input.path('$')){}"
response_model                = "Empty"
integration_error_template    = "#set ($errorMessageObj = $util.parseJson($input.path('$.errorMessage')) {\"message\" :\"$errorMessageObj.message\"}"
iam_role_arn                  = "arn:aws:iam::123456789012:role/lambda-basic-execution"
api_gateway_description       = "Computer Vision App API Gateway"
api_gateway_int_name          = "dev"
api_resource_path             = "test"
stack_name                    = "MobileApp"

#--------------------------------------------------------------
# cloudwatch
#--------------------------------------------------------------

cw_event_name                 = "cv-service-cloudwatch-error"

#--------------------------------------------------------------
# lambda
#--------------------------------------------------------------

lambda_name                   = "CvService"
layer_name                    = "lambda"
lambda_path                   = "dev"
function_name                 = "MobileAppFunction"
statement_id                  = "AllowAPIGatewayInvoke"
#filename                      = "src/cv_service.py"

#--------------------------------------------------------------
# kms
#--------------------------------------------------------------
kms_accounts                  = ["arn:aws:iam::123456789012:root"]
key_users                     = ["arn:aws:iam::123456789012:role/default", "arn:aws:iam::123456789012:role/app-sagemaker-role"]

#--------------------------------------------------------------
# s3
#--------------------------------------------------------------
s3_default_resources          = ["arn:aws:s3:::echo-workstream-dev-bucket", "arn:aws:s3:::echo-workstream-dev-bucket/*"]