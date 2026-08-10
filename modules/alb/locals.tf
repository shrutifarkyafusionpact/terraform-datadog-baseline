locals {
  common_message = <<EOT
ALB monitor triggered.

Load Balancer: ${var.load_balancer_name}

Runbook:
${var.runbook_url}

${var.notification_target}
EOT
}
