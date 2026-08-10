resource "datadog_monitor" "latency" {

  name = "${var.environment} ALB High Latency"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.applicationelb.target_response_time{loadbalancer:${var.load_balancer_name}} > ${var.latency_threshold}"

  message = local.common_message

  tags = var.tags
}

resource "datadog_monitor" "http5xx" {

  name = "${var.environment} ALB HTTP 5XX"

  type = "metric alert"

  query = "sum(last_5m):sum:aws.applicationelb.httpcode_elb_5xx{loadbalancer:${var.load_balancer_name}} > ${var.http5xx_threshold}"

  message = local.common_message

  tags = var.tags
}

resource "datadog_monitor" "unhealthy_hosts" {

  name = "${var.environment} ALB Unhealthy Hosts"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.applicationelb.un_healthy_host_count{loadbalancer:${var.load_balancer_name}} >= ${var.unhealthy_host_threshold}"

  message = local.common_message

  tags = var.tags
}
