variable "environment" {
  type        = string
  description = "Environment name"
}

variable "service" {
  type        = string
  description = "Service name"
}

variable "notification_target" {
  type        = string
  default     = ""
  description = "Slack, email or PagerDuty target"
}

variable "runbook_url" {
  type        = string
  default     = ""
}

variable "cpu_threshold" {
  type    = number
  default = 80
}

variable "memory_threshold" {
  type    = number
  default = 85
}

variable "pod_restart_threshold" {
  type    = number
  default = 5
}

variable "node_not_ready_threshold" {
  type    = number
  default = 1
}

variable "tags" {
  type    = list(string)
  default = []
}
