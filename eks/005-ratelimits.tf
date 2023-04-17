##IF you want to enable rate limiting for cockpit app please uncomment this file
#
#resource "aws_wafv2_web_acl" "cockpit" {
#  name        = "cockpit"
#  description = "cockpit rate based statement."
#  scope       = "REGIONAL"
#
#
#  default_action {
#    allow {}
#  }
#
#  rule {
#    name     = "rule-1"
#    priority = 1
#
#    action {
#      block {}
#    }
#
#    statement {
#      rate_based_statement {
#        limit              = 1000
#        aggregate_key_type = "IP"
#
#        scope_down_statement {
#          geo_match_statement {
#            country_codes = ["US", "IL"]
#          }
#        }
#      }
#    }
#
#    visibility_config {
#      cloudwatch_metrics_enabled = false
#      metric_name                = "cockpit-rule-metric"
#      sampled_requests_enabled   = false
#    }
#  }
#
#  tags = merge(
#  local.extra_tags
#  )
#
#  visibility_config {
#    cloudwatch_metrics_enabled = false
#    metric_name                = "cockpit-metric-name"
#    sampled_requests_enabled   = false
#  }
#}
#
#resource "aws_wafv2_web_acl_association" "cockpit_acl_association" {
#  resource_arn = data.aws_elb.cockpit.arn
#  web_acl_arn  = aws_wafv2_web_acl.cockpit.arn
#}
