resource "aws_cloudwatch_event_rule" "this" {
  name                = var.cw_event_name
  description         = "Trigger Lambda"
  schedule_expression = "cron(52 17 20 12 ? 2020)"
  is_enabled          = true
}