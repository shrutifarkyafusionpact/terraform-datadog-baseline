locals {
  common_message = <<EOT
Lambda monitor triggered.

Function: ${var.lambda_function_name}

Runbook:
${var.runbook_url}

${var.notification_target}
EOT
}
