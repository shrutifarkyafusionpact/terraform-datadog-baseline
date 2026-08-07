output "fast_burn_rate_monitor_id" {
  value = datadog_monitor.fast_burn_rate.id
}

output "slow_burn_rate_monitor_id" {
  value = datadog_monitor.slow_burn_rate.id
}
