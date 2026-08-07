output "monitor_ids" {
  value = {
    cpu     = datadog_monitor.cpu_usage.id
    memory  = datadog_monitor.memory_usage.id
    restart = datadog_monitor.pod_restarts.id
    node    = datadog_monitor.node_not_ready.id
  }
}
