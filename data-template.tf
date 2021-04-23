data "template_file" "this" {
  template = "${file("${path.module}/policy/s3-policy/s3_bucket_policy.tmpl")}"

  vars = {
    api_gateway_name          = jsonencode(var.api_gateway_name),
    api_gateway_policy        = "${file("${path.module}/policy/s3-policy/lambda_bucket_policy.json")}"
    bucket_resources          = jsonencode(var.s3_default_resources),
    iam_role_arn              = jsonencode(var.iam_role_arn),
    key_users                 = jsonencode(var.key_users),
    lambda_handler_invoke_arn = jsonencode(aws_lambda_function.this.invoke_arn)
  }
}