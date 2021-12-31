data "aws_iam_policy_document" "resource-policy" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "execute-api:Invoke",
    ]
    resources = [
      "execute-api:/*",
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpc"
      values   = [data.aws_vpc.api.id]
    }
  }
}

resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.app_name}-apigw"
  description = var.api_gateway_description
  policy      = data.aws_iam_policy_document.resource-policy.json
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_deployment" "this" {
  depends_on = [
    aws_api_gateway_integration.lambda,
  ]

  description       = "Deployed at ${timestamp()}"
  stage_description = timestamp()
  rest_api_id       = aws_api_gateway_rest_api.this.id
  stage_name        = var.stage

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_resource" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "users"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id      = aws_api_gateway_rest_api.this.id
  resource_id      = aws_api_gateway_resource.proxy.id
  http_method      = var.http_method
  authorization    = "NONE"
  api_key_required = "true"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  resource_id = aws_api_gateway_method.proxy.resource_id
  http_method = aws_api_gateway_method.proxy.http_method

  integration_http_method = var.api_http_method
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.this.invoke_arn
}