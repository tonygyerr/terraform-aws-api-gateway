output "api_id" {
  value = aws_api_gateway_rest_api.this.id
}

output "lambda_function_name" {
  value = aws_lambda_function.this.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.this.invoke_arn
}

output "lambda_source_arn" {
  value = aws_lambda_permission.this.source_arn
}

# output "lambda_swagger_full_arn" {
#   value = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${aws_lambda_function.swagger.arn}/invocations"
# }