# Amazon RDS Datadog Monitors Terraform Module

A reusable Terraform module that creates Datadog monitors for Amazon RDS instances using the Datadog Terraform Provider.

This module is part of the **terraform-datadog-baseline** module family and provides opinionated, production-ready monitoring with configurable thresholds, notification targets, and standardized tagging.

---

## Features

* CPU Utilization Monitor
* Database Connections Monitor
* Replica Lag Monitor
* Free Storage Space Monitor
* Configurable alert thresholds
* Standardized tagging
* Custom notification targets
* Runbook URL support
* Compatible with Terraform and OpenTofu

---

## Requirements

| Name             | Version              |
| ---------------- | -------------------- |
| Terraform        | >= 1.5               |
| OpenTofu         | >= 1.6 (recommended) |
| Datadog Provider | ~> 3.40              |

---

## Prerequisites

Before using this module, ensure that:

* Your AWS account is integrated with Datadog.
* Amazon RDS metrics are visible in Datadog.
* You have a Datadog API Key and Application Key.
* The Datadog Terraform Provider is configured.

Example:

```hcl
provider "datadog" {}
```

The provider can also use the following environment variables:

```bash
export DATADOG_API_KEY="<your-api-key>"
export DATADOG_APP_KEY="<your-application-key>"
```

---

## Module Usage

```hcl
module "tags" {
  source = "../../modules/tagging"

  service     = "orders"
  environment = "prod"
  team         = "platform"
  owner        = "devops"
}

module "rds" {
  source = "../../modules/rds"

  environment   = "prod"
  service        = "orders"
  db_identifier  = "orders-db"

  cpu_threshold         = 80
  connections_threshold = 100
  replica_lag_threshold = 60
  storage_threshold     = 20

  notification_target = "@slack-devops"

  runbook_url = "https://wiki.company.com/runbooks/rds"

  tags = module.tags.tags
}
```

---

## Inputs

| Name                  | Description                     | Type         | Default | Required |
| --------------------- | ------------------------------- | ------------ | ------- | -------- |
| environment           | Deployment environment          | string       | n/a     | Yes      |
| service               | Application or service name     | string       | n/a     | Yes      |
| db_identifier         | Amazon RDS instance identifier  | string       | n/a     | Yes      |
| cpu_threshold         | CPU alert threshold             | number       | 80      | No       |
| connections_threshold | Maximum DB connections          | number       | 100     | No       |
| replica_lag_threshold | Replica lag threshold           | number       | 60      | No       |
| storage_threshold     | Free storage threshold          | number       | 20      | No       |
| notification_target   | Slack, PagerDuty or Email       | string       | ""      | No       |
| runbook_url           | Runbook URL                     | string       | ""      | No       |
| tags                  | Additional Datadog monitor tags | list(string) | []      | No       |

---

## Outputs

| Name                   | Description                    |
| ---------------------- | ------------------------------ |
| cpu_monitor_id         | CPU monitor ID                 |
| connection_monitor_id  | Database connection monitor ID |
| replica_lag_monitor_id | Replica lag monitor ID         |
| storage_monitor_id     | Free storage monitor ID        |

---

## Monitors Created

The module currently creates the following Datadog monitors:

* High CPU Utilization
* High Database Connections
* Replica Lag
* Low Free Storage Space

Future releases will include:

* Read Latency
* Write Latency
* Read IOPS
* Write IOPS
* Disk Queue Depth
* Freeable Memory
* Deadlocks
* Backup Storage Usage

---

## Tagging

This module is designed to work with the shared **tagging** module.

Example tags:

```
service:orders
environment:prod
team:platform
owner:devops
```

Consistent tagging improves monitor organization, ownership, filtering, and reporting.

---

## Versioning

This project follows Semantic Versioning.

Example releases:

* v0.1.0 – Initial release
* v0.2.0 – Additional RDS monitors
* v1.0.0 – Production-ready release

---

## Compatibility

| Platform  | Supported |
| --------- | --------- |
| Terraform | Yes       |
| OpenTofu  | Yes       |
| AWS RDS   | Yes       |
| Datadog   | Yes       |

---

## Commercial Support

This module is maintained by **Fusionpact Technologies Inc.**

If you are deploying or standardizing observability across multiple AWS environments and would like implementation assistance, customization, or operational guidance, please contact the Fusionpact team using the support information provided by your organization.

---

## Contributing

Contributions are welcome.

Please read the repository's **CONTRIBUTING.md** before opening a Pull Request.

---

## Security

If you discover a security issue, please follow the process described in **SECURITY.md** instead of creating a public issue.

---

## License

Licensed under the Apache License 2.0.
