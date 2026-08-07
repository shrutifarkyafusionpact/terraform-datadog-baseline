resource "datadog_monitor" "cpu_usage" {
  name = "${var.environment} EKS High CPU Usage"

  type = "metric alert"

  query = "avg(last_5m):avg:kubernetes.cpu.usage.total{env:${var.environment}} > ${var.cpu_threshold}"

  message = <<EOF
High CPU usage detected.

Runbook:
${var.runbook_url}

${var.notification_target}
EOF

  tags = var.tags
}

resource "datadog_monitor" "memory_usage" {
  name = "${var.environment} EKS High Memory"

  type = "metric alert"

  query = "avg(last_5m):avg:kubernetes.memory.usage{env:${var.environment}} > ${var.memory_threshold}"

  message = <<EOF
High Memory Usage

${var.notification_target}
EOF

  tags = var.tags
}

resource "datadog_monitor" "pod_restarts" {
  name = "${var.environment} Pod Restart"

  type = "metric alert"

  query = "sum(last_15m):sum:kubernetes.containers.restarts{env:${var.environment}} > ${var.pod_restart_threshold}"

  message = "Pods restarting ${var.notification_target}"

  tags = var.tags
}

resource "datadog_monitor" "node_not_ready" {
  name = "${var.environment} Node Not Ready"

  type = "metric alert"

  query = "avg(last_5m):avg:kubernetes_state.node.ready{status:false,env:${var.environment}} >= ${var.node_not_ready_threshold}"

  message = "Node Not Ready ${var.notification_target}"

  tags = var.tags
}

