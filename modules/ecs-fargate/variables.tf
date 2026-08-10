variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "service" {
  description = "Application or service name"
  type        = string
}

variable "cluster_name" {
  description = "ECS Cluster name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS Service name"
  type        = string
}

variable "notification_target" {
  description = "Slack, PagerDuty or email"
  type        = string
  default     = ""
}

variable "runbook_url" {
  description = "Runbook URL"
  type        = string
  default     = ""
}

variable "cpu_threshold" {
  description = "CPU utilization threshold"
  type        = number
  default     = 80
}

variable "memory_threshold" {
  description = "Memory utilization threshold"
  type        = number
  default     = 85
}

variable "running_task_threshold" {
  description = "Minimum running task count"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Datadog monitor tags"
  type        = list(string)
  default     = []
}

variable "evaluation_delay" {
  description = "CloudWatch metric delay"
  type        = number
  default     = 300
}

variable "notify_no_data" {
  description = "Notify when no data is received"
  type        = bool
  default     = false
}

variable "no_data_timeframe" {
  description = "Minutes before reporting no data"
  type        = number
  default     = 20
}

variable "renotify_interval" {
  description = "Re-notification interval"
  type        = number
  default     = 60
}
