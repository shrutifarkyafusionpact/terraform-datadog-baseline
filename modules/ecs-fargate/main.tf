resource "datadog_monitor" "cpu" {
  name = "${var.environment} ECS High CPU"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.ecs.cpuutilization{clustername:${var.cluster_name},servicename:${var.ecs_service_name}} > ${var.cpu_threshold}"

  message = local.common_message

  tags = var.tags

  evaluation_delay = var.evaluation_delay
  notify_no_data   = var.notify_no_data
  no_data_timeframe = var.no_data_timeframe
  renotify_interval = var.renotify_interval
}

resource "datadog_monitor" "memory" {

  name = "${var.environment} ECS High Memory"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.ecs.memoryutilization{clustername:${var.cluster_name},servicename:${var.ecs_service_name}} > ${var.memory_threshold}"

  message = local.common_message

  tags = var.tags

  evaluation_delay   = var.evaluation_delay
  notify_no_data     = var.notify_no_data
  no_data_timeframe  = var.no_data_timeframe
  renotify_interval  = var.renotify_interval
}

resource "datadog_monitor" "running_tasks" {

  name = "${var.environment} ECS Running Tasks"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.ecs.runningtaskcount{clustername:${var.cluster_name},servicename:${var.ecs_service_name}} < ${var.running_task_threshold}"

  message = local.common_message

  tags = var.tags

  evaluation_delay   = var.evaluation_delay
  notify_no_data     = var.notify_no_data
  no_data_timeframe  = var.no_data_timeframe
  renotify_interval  = var.renotify_interval
}
