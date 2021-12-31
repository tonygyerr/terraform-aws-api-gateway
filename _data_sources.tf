data "aws_elb_service_account" "main" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "main" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_iam_account_alias" "current" {}

data "null_data_source" "environment" {
  inputs = map(
    "SDLC",
    lower(
      element(
        split("-", data.aws_iam_account_alias.current.account_alias),
        length(split("-", data.aws_iam_account_alias.current.account_alias)) - 1
    ))
  )
}

data "aws_vpc" "api" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}