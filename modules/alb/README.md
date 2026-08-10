# AWS Application Load Balancer (ALB) Datadog Monitors Terraform Module

A reusable Terraform module that provisions Datadog monitors for AWS Application Load Balancers (ALB) using the Datadog Terraform Provider.

This module is part of the **terraform-datadog-baseline** project and provides opinionated, production-ready monitoring with configurable thresholds, standardized tagging, notification targets, and runbook integration.

---

## Features

* Target Response Time Monitor
* HTTP 5XX Error Monitor
* Unhealthy Host Monitor
* Configurable alert thresholds
* Standardized monitor tagging
* Notification target support
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
* Application Load Balancer metrics are available in Datadog.
* A Datadog API Key and Application Key are configured.
* The Datadog Terraform Provider is installed.

Provider example:

```hcl
provider "datadog" {}
```

Environment variables:

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

module "alb" {
  source = "../../modules/alb"

  environment        = "prod"
  service            = "orders"
  load_balancer_name = "orders-alb"

  latency_threshold         = 1
  http5xx_threshold         = 5
  unhealthy_host_threshold  = 1

  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/alb"

  tags = module.tags.tags
}
```

---

## Inputs

| Name                      | Description                              | Type         | Default | Required |
| ------------------------- | ---------------------------------------- | ------------ | ------- | -------- |
| environment               | Deployment environment                   | string       | n/a     | Yes      |
| service                   | Application or service name              | string       | n/a     | Yes      |
| load_balancer_name        | AWS Application Load Balancer name       | string       | n/a     | Yes      |
| latency_threshold         | Critical latency threshold (seconds)     | number       | 1       | No       |
| warning_latency_threshold | Warning latency threshold (seconds)      | number       | 0.8     | No       |
| http5xx_threshold         | Critical HTTP 5XX threshold              | number       | 5       | No       |
| warning_http5xx_threshold | Warning HTTP 5XX threshold               | number       | 2       | No       |
| unhealthy_host_threshold  | Critical unhealthy host count            | number       | 1       | No       |
| notification_target       | Slack, PagerDuty or Email                | string       | ""      | No       |
| runbook_url               | Runbook URL                              | string       | ""      | No       |
| tags                      | Additional Datadog monitor tags          | list(string) | []      | No       |
| evaluation_delay          | Delay monitor evaluation (seconds)       | number       | 300     | No       |
| notify_no_data            | Notify when no data is received          | bool         | false   | No       |
| no_data_timeframe         | Minutes before reporting no data         | number       | 20      | No       |
| renotify_interval         | Re-notification interval (minutes)       | number       | 60      | No       |
| priority                  | Datadog monitor priority                 | number       | 3       | No       |
| include_tags              | Include triggering tags in notifications | bool         | true    | No       |
| require_full_window       | Require a full evaluation window         | bool         | true    | No       |

---

## Outputs

| Name                       | Description                     |
| -------------------------- | ------------------------------- |
| latency_monitor_id         | Target response time monitor ID |
| http5xx_monitor_id         | HTTP 5XX monitor ID             |
| unhealthy_hosts_monitor_id | Unhealthy host monitor ID       |

---

## Monitors Created

The current version of the module creates the following Datadog monitors:

* Target Response Time
* HTTP 5XX Errors
* Unhealthy Target Hosts

Future releases will include:

* Target 4XX Error Rate
* Request Count Anomaly
* Active Connection Count
* Rejected Connection Count
* Target TLS Errors
* Target Connection Errors
* Target Response Time Percentiles

---

## Tagging

This module is designed to work with the shared **tagging** module.

Example tags:

```text
service:orders
environment:prod
team:platform
owner:devops
```

Consistent tagging improves filtering, ownership, reporting, and cost attribution across Datadog resources.

---

## Compatibility

| Platform  | Supported |
| --------- | --------- |
| Terraform | Yes       |
| OpenTofu  | Yes       |
| AWS ALB   | Yes       |
| Datadog   | Yes       |

---

## Versioning

This project follows Semantic Versioning.

Example releases:

* **v0.1.0** – Initial ALB monitoring module
* **v0.2.0** – Additional ALB monitors and configurable thresholds
* **v1.0.0** – Production-ready release

---

## Commercial Support

This module is maintained by **Fusionpact Technologies Inc.**

If you are deploying or standardizing observability across AWS environments and need implementation assistance, customization, or operational guidance, please contact the Fusionpact team using your organization's support channel.

---

## Contributing

Contributions are welcome.

Please review **CONTRIBUTING.md** before opening a Pull Request.

---

## Security

If you discover a security issue, please report it according to the process described in **SECURITY.md**.

---

## License

Licensed under the Apache License 2.0.
