variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "service" {
  description = "Application or service name"
  type        = string
}

variable "load_balancer_name" {
  description = "AWS ALB name"
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

variable "latency_threshold" {
  type    = number
  default = 1
}

variable "http5xx_threshold" {
  type    = number
  default = 5
}

variable "unhealthy_host_threshold" {
  type    = number
  default = 1
}

variable "tags" {
  type    = list(string)
  default = []
}
