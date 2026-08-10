variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "service" {
  description = "Application or service name"
  type        = string
}

variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "notification_target" {
  description = "Slack, PagerDuty, or email"
  type        = string
  default     = ""
}

variable "runbook_url" {
  description = "Runbook URL"
  type        = string
  default     = ""
}

variable "cpu_threshold" {
  type    = number
  default = 80
}

variable "storage_threshold" {
  type    = number
  default = 20
}

variable "connections_threshold" {
  type    = number
  default = 100
}

variable "replica_lag_threshold" {
  type    = number
  default = 60
}

variable "tags" {
  type    = list(string)
  default = []
}
