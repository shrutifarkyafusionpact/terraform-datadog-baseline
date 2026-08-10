resource "datadog_monitor" "cpu" {

  name = "${var.environment} RDS High CPU"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.rds.cpuutilization{dbinstanceidentifier:${var.db_identifier}} > ${var.cpu_threshold}"

  message = local.common_message

  tags = var.tags
}

resource "datadog_monitor" "connections" {

  name = "${var.environment} RDS Connections"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.rds.database_connections{dbinstanceidentifier:${var.db_identifier}} > ${var.connections_threshold}"

  message = local.common_message

  tags = var.tags
}

resource "datadog_monitor" "replica_lag" {

  name = "${var.environment} Replica Lag"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.rds.replica_lag{dbinstanceidentifier:${var.db_identifier}} > ${var.replica_lag_threshold}"

  message = local.common_message

  tags = var.tags
}

resource "datadog_monitor" "storage" {

  name = "${var.environment} Low Free Storage"

  type = "metric alert"

  query = "avg(last_5m):avg:aws.rds.free_storage_space{dbinstanceidentifier:${var.db_identifier}} < ${var.storage_threshold}"

  message = local.common_message

  tags = var.tags
}
