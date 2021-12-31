data "aws_caller_identity" "current" {
}

data "aws_wafv2_ip_set" "bad_bot_v4" {
  name  = var.ipset_v4
  scope = "REGIONAL"
}

data "aws_wafv2_ip_set" "bad_bot_v6" {
  name  = var.ipset_v6
  scope = "REGIONAL"
}