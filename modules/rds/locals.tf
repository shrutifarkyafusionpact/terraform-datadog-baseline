locals {
  common_message = <<EOT
RDS monitor triggered.

Database: ${var.db_identifier}

Runbook:
${var.runbook_url}

${var.notification_target}
EOT
}
