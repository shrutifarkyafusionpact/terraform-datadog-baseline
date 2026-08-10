output "errors_monitor_id" {
  value = datadog_monitor.errors.id
}

output "duration_monitor_id" {
  value = datadog_monitor.duration.id
}

output "throttles_monitor_id" {
  value = datadog_monitor.throttles.id
}
