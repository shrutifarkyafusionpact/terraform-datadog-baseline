resource "datadog_monitor" "fast_burn_rate" {

  name = "${var.environment} ${var.service} Fast Burn Rate"

  type = "slo alert"

  query = <<EOT
burn_rate("${var.slo_id}").over("7d").long_window("1h").short_window("5m") > 14.4
EOT

  message = local.common_message
  monitor_thresholds {
    critical = 14.4
  }

  tags = var.tags
}

resource "datadog_monitor" "slow_burn_rate" {

  name = "${var.environment} ${var.service} Slow Burn Rate"

  type = "slo alert"

  query = <<EOT
burn_rate("${var.slo_id}").over("7d").long_window("6h").short_window("30m") > 6
EOT

  message = local.common_message
  monitor_thresholds {
    critical = 6
  }
  tags = var.tags
}
