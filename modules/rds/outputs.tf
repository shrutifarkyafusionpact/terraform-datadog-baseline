output "cpu_monitor_id" {
  value = datadog_monitor.cpu.id
}

output "connection_monitor_id" {
  value = datadog_monitor.connections.id
}

output "replica_lag_monitor_id" {
  value = datadog_monitor.replica_lag.id
}

output "storage_monitor_id" {
  value = datadog_monitor.storage.id
}
