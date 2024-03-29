resource "aws_lambda_function" "this" {
  description                    = var.description
  filename                       = var.filename
  function_name                  = var.function_name
  handler                        = var.handler
  memory_size                    = var.memory_size
  publish                        = var.publish
  reserved_concurrent_executions = var.reserved_concurrent_executions
  role                           = var.iam_role_arn
  runtime                        = var.runtime
  source_code_hash               = filebase64sha256(var.filename)
  tags                           = var.app_tags
  timeout                        = var.timeout

  environment {
    variables = var.environment_variables
  }

  dynamic "vpc_config" {
    for_each = length(var.vpc_config) < 1 ? [] : [var.vpc_config]
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }
}

resource "aws_lambda_permission" "this" {
  # count         = var.environment == "dev" ? 1 : 0
  action = "lambda:InvokeFunction"
  # function_name = aws_lambda_function.this[count.index].function_name
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
  depends_on    = [aws_lambda_function.this]
}
