# AWS EKS Golden Signals Datadog Monitors Terraform Module

A reusable Terraform module that provisions Datadog monitors for Amazon EKS clusters based on the four Golden Signals of monitoring: **Latency, Traffic, Errors, and Saturation**.

This module is part of the **terraform-datadog-baseline** project and provides production-ready monitoring for Kubernetes workloads running on Amazon EKS.

---

# Features

* Node CPU Utilization Monitor
* Node Memory Utilization Monitor
* Pod Restart Monitor
* Pod Pending Monitor
* Cluster Health Monitoring
* Configurable alert thresholds
* Notification target support
* Runbook URL support
* Standardized tagging
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

* An Amazon EKS cluster is running.
* The Datadog Agent is deployed to the cluster.
* Kubernetes metrics are visible in Datadog.
* AWS is integrated with Datadog.
* A Datadog API Key and Application Key are available.

Provider configuration:

```hcl
provider "datadog" {}
```

Export your credentials before running Terraform:

```bash
export DATADOG_API_KEY="<your-api-key>"
export DATADOG_APP_KEY="<your-application-key>"
```

---

# Usage

```hcl
module "tags" {
  source = "../../modules/tagging"

  service     = "payments"
  environment = "prod"
  team         = "platform"
  owner        = "devops"
}

module "eks_golden_signals" {
  source = "../../modules/eks-golden-signals"

  environment = "prod"
  service     = "payments"

  cluster_name = "production-eks"

  cpu_threshold          = 80
  memory_threshold       = 85
  pod_restart_threshold  = 5
  pending_pod_threshold  = 10

  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/eks"

  tags = module.tags.tags
}
```

---

# Inputs

| Name                  | Description                      | Type         | Default | Required |
| --------------------- | -------------------------------- | ------------ | ------- | -------- |
| environment           | Deployment environment           | string       | n/a     | Yes      |
| service               | Application or service name      | string       | n/a     | Yes      |
| cluster_name          | Amazon EKS cluster name          | string       | n/a     | Yes      |
| cpu_threshold         | CPU utilization threshold (%)    | number       | 80      | No       |
| memory_threshold      | Memory utilization threshold (%) | number       | 85      | No       |
| pod_restart_threshold | Pod restart threshold            | number       | 5       | No       |
| pending_pod_threshold | Pending pod threshold            | number       | 10      | No       |
| notification_target   | Slack, PagerDuty or email        | string       | ""      | No       |
| runbook_url           | Runbook URL                      | string       | ""      | No       |
| tags                  | Datadog monitor tags             | list(string) | []      | No       |
| evaluation_delay      | Delay monitor evaluation         | number       | 300     | No       |
| notify_no_data        | Notify when no data is received  | bool         | false   | No       |
| no_data_timeframe     | Minutes before reporting no data | number       | 20      | No       |
| renotify_interval     | Minutes before re-notification   | number       | 60      | No       |

---

# Outputs

| Name                   | Description            |
| ---------------------- | ---------------------- |
| cpu_monitor_id         | CPU monitor ID         |
| memory_monitor_id      | Memory monitor ID      |
| pod_restart_monitor_id | Pod restart monitor ID |
| pending_pod_monitor_id | Pending pod monitor ID |

---

# Monitors Created

This module provisions Datadog monitors for:

* High Node CPU Utilization
* High Node Memory Utilization
* Excessive Pod Restarts
* Pending Pods
* Kubernetes Cluster Health

These monitors provide a baseline observability setup for Amazon EKS clusters and can be customized using module variables.

---

# Tagging

This module is designed to work with the shared **tagging** module.

Example tags:

```text
service:payments
environment:prod
team:platform
owner:devops
```

Consistent tagging improves filtering, ownership, reporting, and monitor organization.

---

# Compatibility

| Platform   | Supported |
| ---------- | --------- |
| Terraform  | Yes       |
| OpenTofu   | Yes       |
| Amazon EKS | Yes       |
| Datadog    | Yes       |

---

# Versioning

This module follows Semantic Versioning.

Example releases:

* **v0.1.0** – Initial release
* **v0.2.0** – Additional monitors and configurable thresholds
* **v1.0.0** – Production-ready release

---

# Commercial Support

This module is maintained by Fusionpact Technologies Inc.

If your organization needs assistance implementing or standardizing observability for Amazon EKS environments, Fusionpact provides consulting, customization, and operational support for Datadog and cloud-native observability platforms.

---

# Contributing

Contributions are welcome.

Please review **CONTRIBUTING.md** before submitting a Pull Request.

---

# Security

Please report security vulnerabilities according to the process documented in **SECURITY.md**.

---

# License

Licensed under the Apache License, Version 2.0.
