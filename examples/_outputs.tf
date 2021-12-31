output "api_id" {
  value = module.api_gw.api_id
}

output "execution_arn" {
  value = module.api_gw.execution_arn
}

output "lambda_function_name" {
  value = module.api_gw.lambda_function_name
}

output "lambda_arn" {
  value = module.api_gw.lambda_arn
}

output "lambda_invoke_arn" {
  value = module.api_gw.lambda_invoke_arn
}

output "lambda_source_arn" {
  value = module.api_gw.lambda_source_arn
}
