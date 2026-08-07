resource "datadog_monitor" "fast_burn_rate" {

  name = "${var.environment} ${var.service} Fast Burn Rate"

  type = "slo alert"

  query = "burn_rate(\"${var.slo_id}\").over(\"1h\") > 14"

  message = local.common_message

  tags = var.tags
}

resource "datadog_monitor" "slow_burn_rate" {

  name = "${var.environment} ${var.service} Slow Burn Rate"

  type = "slo alert"

  query = "burn_rate(\"${var.slo_id}\").over(\"6h\") > 2"

  message = local.common_message

  tags = var.tags
}
