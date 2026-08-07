locals {
  common_message = <<EOF
SLO burn rate alert.

Runbook:
${var.runbook_url}

${var.notification_target}
EOF
}
