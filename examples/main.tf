data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/out/cv_pkg.zip"
}

module "api_gw" {
  source            = "git::https://github.com/tonygyerr/terraform-aws-api-gateway.git"
  api_resource_path = var.api_resource_path
  environment       = var.environment
  cw_event_name     = var.cw_event_name
  environment_variables = merge(local.lambda_arguments, var.arguments)
  filename          = data.archive_file.this.output_path
  function_name     = var.function_name 
  http_method       = var.http_method
  iam_role_arn      = var.iam_role_arn
  ipset_v4          = var.ipset_v4
  ipset_v6          = var.ipset_v6
  layer_name        = var.layer_name
  vpc_name          = var.vpc_name
  tags              = var.tags