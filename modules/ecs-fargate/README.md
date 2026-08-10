# AWS ECS Fargate Datadog Monitors Terraform Module

A reusable Terraform module that provisions Datadog monitors for Amazon ECS services running on AWS Fargate.

This module is part of the **terraform-datadog-baseline** project and provides production-ready monitoring with configurable thresholds, standardized tagging, notification targets, and runbook integration.

---

# Features

* ECS CPU Utilization Monitor
* ECS Memory Utilization Monitor
* Running Task Count Monitor
* Configurable alert thresholds
* Standardized tagging
* Notification target support
* Runbook URL support
* Terraform and OpenTofu compatible

---

# Requirements

| Name             | Version              |
| ---------------- | -------------------- |
| Terraform        | >= 1.5               |
| OpenTofu         | >= 1.6 (Recommended) |
| Datadog Provider | ~> 3.40              |

---

# Prerequisites

Before using this module, ensure:

* AWS is integrated with Datadog.
* ECS Container Insights (or the required ECS metrics) are available in Datadog.
* A Datadog API Key and Application Key are configured.
* The Datadog Terraform Provider is installed.

Provider configuration:

```hcl
provider "datadog" {}
```

Set credentials using environment variables:

```bash
export DATADOG_API_KEY="<your-api-key>"
export DATADOG_APP_KEY="<your-application-key>"
```

---

# Usage

```hcl
module "tags" {
  source = "../../modules/tagging"

  service     = "orders"
  environment = "prod"
  team         = "platform"
  owner        = "devops"
}

module "ecs_fargate" {
  source = "../../modules/ecs-fargate"

  environment      = "prod"
  service          = "orders"

  cluster_name     = "orders-cluster"
  ecs_service_name = "orders-service"

  cpu_threshold            = 80
  memory_threshold         = 85
  running_task_threshold   = 1

  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/ecs"

  tags = module.tags.tags
}
```

---

# Inputs

| Name                   | Description                      | Type         | Default | Required |
| ---------------------- | -------------------------------- | ------------ | ------- | -------- |
| environment            | Deployment environment           | string       | n/a     | Yes      |
| service                | Application or service name      | string       | n/a     | Yes      |
| cluster_name           | ECS Cluster name                 | string       | n/a     | Yes      |
| ecs_service_name       | ECS Service name                 | string       | n/a     | Yes      |
| cpu_threshold          | CPU utilization threshold (%)    | number       | 80      | No       |
| memory_threshold       | Memory utilization threshold (%) | number       | 85      | No       |
| running_task_threshold | Minimum running task count       | number       | 1       | No       |
| notification_target    | Slack, PagerDuty or email        | string       | ""      | No       |
| runbook_url            | Runbook URL                      | string       | ""      | No       |
| tags                   | Datadog monitor tags             | list(string) | []      | No       |
| evaluation_delay       | Delay monitor evaluation         | number       | 300     | No       |
| notify_no_data         | Notify when no data is received  | bool         | false   | No       |
| no_data_timeframe      | Minutes before reporting no data | number       | 20      | No       |
| renotify_interval      | Re-notification interval         | number       | 60      | No       |

---

# Outputs

| Name                     | Description                   |
| ------------------------ | ----------------------------- |
| cpu_monitor_id           | ECS CPU monitor ID            |
| memory_monitor_id        | ECS memory monitor ID         |
| running_tasks_monitor_id | Running task count monitor ID |

---

# Monitors Created

The module creates the following Datadog monitors:

* ECS CPU Utilization
* ECS Memory Utilization
* Running Task Count

Future releases may include:

* Task Restart Count
* Task Failure Rate
* Service Deployment Failure Detection
* Container OOM Kill Detection
* Network Throughput
* Network Error Rate
* Pending Task Count
* ECS Service Availability

---

# Tagging

This module is designed to work with the shared **tagging** module.

Example tags:

```text
service:orders
environment:prod
team:platform
owner:devops
```

Consistent tagging improves monitor organization, ownership, filtering, reporting, and cost attribution.

---

# Compatibility

| Platform        | Supported |
| --------------- | --------- |
| Terraform       | Yes       |
| OpenTofu        | Yes       |
| AWS ECS Fargate | Yes       |
| Datadog         | Yes       |

---

# Versioning

This module follows Semantic Versioning.

Example releases:

* **v0.1.0** – Initial ECS Fargate monitoring module
* **v0.2.0** – Additional monitors and configurable thresholds
* **v1.0.0** – Production-ready release

---

# Commercial Support

This module is maintained by Fusionpact Technologies Inc.

If you are implementing or standardizing observability for ECS workloads across AWS environments and require implementation assistance, customization, or operational guidance, please contact the Fusionpact team through your organization's support channel.

---

# Contributing

Contributions are welcome.

Please review **CONTRIBUTING.md** before opening a Pull Request.

---

# Security

If you discover a security issue, please report it according to the process described in **SECURITY.md**.

---

# License

Licensed under the Apache License 2.0.
