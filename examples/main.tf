data "archive_file" "this" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/out/cv_pkg.zip"
}

module "api_gw" {
  source          = "git::ssh://git@github.com:tonygyerr/terraform-aws-api-gateway.git"
  api_resource_path = var.api_resource_path
  environment       = var.environment.environment
  cw_event_name     = var.cw_event_name
  filename          = data.archive_file.this.output_path
  function_name     = var.function_name
  http_method       = var.http_method
  iam_role_arn      = var.iam_role_arn
  layer_name        = var.layer_name
  statement_id      = var.statement_id
  tags              = var.tags
}