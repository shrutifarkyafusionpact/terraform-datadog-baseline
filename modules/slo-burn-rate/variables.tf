variable "service" {
  description = "Service name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "slo_id" {
  description = "Datadog SLO ID"
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

variable "tags" {
  description = "Datadog monitor tags"
  type        = list(string)
  default     = []
}
