# WEBACLの設定
resource "aws_wafv2_web_acl" "wafv2_web_acl" {
  name        = "${var.project}-${var.env}-webacl"
  description = "AWS WAF managed rule of WebACL"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  # AWS Managed Rule - CommonRuleSet
  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 0

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "CommonRuleSetMetric"
      sampled_requests_enabled   = true
    }
  }

  # AWS Managed Rule - KnownBadInputsRuleSet
  rule {
    name     = "AWSManagedRulesKnownBadInputsRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesKnownBadInputsRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # AWS Managed Rule - AnonymousIpList
  rule {
    name     = "AWSManagedRulesAnonymousIpList"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesAnonymousIpList"
      sampled_requests_enabled   = true
    }
  }

  # AWS Managed Rule - LinuxRuleSet
  rule {
    name     = "AWSManagedRulesLinuxRuleSet"
    priority = 3

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesLinuxRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesLinuxRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # AWS Managed Rule - SQLiRuleSet
  rule {
    name     = "AWSManagedRulesSQLiRuleSet"
    priority = 4

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesSQLiRuleSet"
      sampled_requests_enabled   = true
    }
  }

  # AdminProtection
# rule {
#   name     = "AWSManagedRulesAdminProtectionRuleSet"
#   priority = 2

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesAdminProtectionRuleSet"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "AdminProtectionMetric"
#     sampled_requests_enabled   = true
#   }
# }

# UnixRuleSet
# rule {
#   name     = "AWSManagedRulesUnixRuleSet"
#   priority = 6

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesUnixRuleSet"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "UnixRuleSetMetric"
#     sampled_requests_enabled   = true
#   }
# }

# WindowsRuleSet
# rule {
#   name     = "AWSManagedRulesWindowsRuleSet"
#   priority = 7

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesWindowsRuleSet"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "WindowsRuleSetMetric"
#     sampled_requests_enabled   = true
#   }
# }

# PHPRuleSet
# rule {
#   name     = "AWSManagedRulesPHPRuleSet"
#   priority = 8

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesPHPRuleSet"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "PHPRuleSetMetric"
#     sampled_requests_enabled   = true
#   }
# }

# WordPressRuleSet
# rule {
#   name     = "AWSManagedRulesWordPressRuleSet"
#   priority = 9

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesWordPressRuleSet"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "WordPressRuleSetMetric"
#     sampled_requests_enabled   = true
#   }
# }

# AmazonIpReputationList
# rule {
#   name     = "AWSManagedRulesAmazonIpReputationList"
#   priority = 10

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesAmazonIpReputationList"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "AmazonIpReputationMetric"
#     sampled_requests_enabled   = true
#   }
# }

# BotControlRuleSet
# rule {
#   name     = "AWSManagedRulesBotControlRuleSet"
#   priority = 11

#   override_action {
#     none {}
#   }

#   statement {
#     managed_rule_group_statement {
#       name        = "AWSManagedRulesBotControlRuleSet"
#       vendor_name = "AWS"
#     }
#   }

#   visibility_config {
#     cloudwatch_metrics_enabled = true
#     metric_name                = "BotControlMetric"
#     sampled_requests_enabled   = true
#   }
# }

  # IPSets allowリストのルール
  rule {
    name     = "${var.project}-${var.env}-ipsets-white-list"
    priority = 5

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.IPset.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "accessWhiteListMetric"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.env}_web_acl"
    sampled_requests_enabled   = true
  }
}

# IPセットの設定
resource "aws_wafv2_ip_set" "IPset" {
  name               = "${var.project}-${var.env}-ipsets"
  description        = "AWS WAF IP sets"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = ["198.51.100.0/32"]

  tags = {
    Name = "${var.project}-${var.env}-ipsets"
  }
}

# WEBACLとALBの関連付けの設定
resource "aws_wafv2_web_acl_association" "web_acl_association" {
  resource_arn = var.load_balancer_arn
  web_acl_arn  = aws_wafv2_web_acl.wafv2_web_acl.arn
}

# resource "aws_cloudwatch_log_resource_policy" "waf_logs_policy" {
#   policy_name = "AWS-WAF-Logging"
#   policy_document = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           Service = "waf.amazonaws.com"
#         },
#         Action = "logs:PutLogEvents",
#         Resource = "arn:aws:logs:*:*:log-group:/aws-waf-logs-*:*"
#       }
#     ]
#   })
# }

# WAFログを出力設定
resource "aws_cloudwatch_log_group" "waflogs" {
  name              = "aws-waf-logs-${var.project}"
  retention_in_days = 30  
}

# WAFログの設定
resource "aws_wafv2_web_acl_logging_configuration" "waflogs" {
# log_destination_configs = [var.cloudwatch_log_group_waflogs_arn]
log_destination_configs = [format("%s:*", aws_cloudwatch_log_group.waflogs.arn)]
 resource_arn            = aws_wafv2_web_acl.wafv2_web_acl.arn
}

