variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "service" {
  description = "Application or service name"
  type        = string
}

variable "lambda_function_name" {
  description = "AWS Lambda function name"
  type        = string
}

variable "notification_target" {
  description = "Slack, PagerDuty or Email"
  type        = string
  default     = ""
}

variable "runbook_url" {
  description = "Runbook URL"
  type        = string
  default     = ""
}

#############################
# Thresholds
#############################

variable "error_threshold" {
  description = "Lambda error count threshold"
  type        = number
  default     = 5
}

variable "duration_threshold" {
  description = "Lambda duration threshold (milliseconds)"
  type        = number
  default     = 3000
}

variable "throttle_threshold" {
  description = "Lambda throttle threshold"
  type        = number
  default     = 1
}

#############################
# Monitor Settings
#############################

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
  description = "Minutes before re-notification"
  type        = number
  default     = 60
}

variable "tags" {
  description = "Datadog monitor tags"
  type        = list(string)
  default     = []
}
