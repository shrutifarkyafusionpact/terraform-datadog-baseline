resource "datadog_monitor" "errors" {

  name = "${var.environment} Lambda Errors"

  type = "metric alert"

  query = "sum(last_5m):sum:aws.lambda.errors{functionname:${var.lambda_function_name}} > ${var.error_threshold}"

  message = local.common_message

  tags = var.tags

  evaluation_delay  = var.evaluation_delay
  notify_no_data    = var.notify_no_data
  no_data_timeframe = var.no_data_timeframe
  renotify_interval = var.renotify_interval
}

resource "datadog_monitor" "duration" {

  name = "${var.environment} Lambda High Duration"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.lambda.duration{functionname:${var.lambda_function_name}} > ${var.duration_threshold}"

  message = local.common_message

  tags = var.tags

  evaluation_delay   = var.evaluation_delay
  notify_no_data     = var.notify_no_data
  no_data_timeframe  = var.no_data_timeframe
  renotify_interval  = var.renotify_interval
}

resource "datadog_monitor" "throttles" {

  name = "${var.environment} Lambda Throttles"

  type = "metric alert"

  query = "sum(last_5m):sum:aws.lambda.throttles{functionname:${var.lambda_function_name}} > ${var.throttle_threshold}"

  message = local.common_message

  tags = var.tags

  evaluation_delay   = var.evaluation_delay
  notify_no_data     = var.notify_no_data
  no_data_timeframe  = var.no_data_timeframe
  renotify_interval  = var.renotify_interval
}
