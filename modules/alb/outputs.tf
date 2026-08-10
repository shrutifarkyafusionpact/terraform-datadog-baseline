output "latency_monitor_id" {
  value = datadog_monitor.latency.id
}

output "http5xx_monitor_id" {
  value = datadog_monitor.http5xx.id
}

output "unhealthy_hosts_monitor_id" {
  value = datadog_monitor.unhealthy_hosts.id
}
