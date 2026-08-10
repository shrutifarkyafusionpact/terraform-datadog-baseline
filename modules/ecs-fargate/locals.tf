locals {
  common_message = <<EOT
ECS Fargate monitor triggered.

Cluster: ${var.cluster_name}
Service: ${var.ecs_service_name}

Runbook:
${var.runbook_url}

${var.notification_target}
EOT
}
