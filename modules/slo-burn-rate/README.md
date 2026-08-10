# SLO Burn Rate Datadog Monitor Terraform Module

A reusable Terraform module that creates **Datadog SLO Burn Rate monitors** using industry-recommended multi-window burn-rate alerting.

This module is part of the **terraform-datadog-baseline** project and helps organizations monitor Service Level Objectives (SLOs) consistently across environments.

---

## Features

* Creates Datadog SLO Burn Rate monitors
* Configurable burn-rate thresholds
* Configurable evaluation windows
* Standardized tagging
* Notification target support
* Runbook URL support
* Terraform and OpenTofu compatible

---

## Requirements

| Name             | Version |
| ---------------- | ------- |
| Terraform        | >= 1.5  |
| OpenTofu         | >= 1.6  |
| Datadog Provider | ~> 3.40 |

---

## Prerequisites

Before using this module, ensure:

* A Datadog account is available.
* The Datadog Terraform Provider is configured.
* A Datadog API Key and Application Key are available.
* The target Service Level Objective (SLO) already exists in Datadog.

Configure the provider:

```hcl
provider "datadog" {}
```

Export credentials:

```bash
export DATADOG_API_KEY="<your-api-key>"
export DATADOG_APP_KEY="<your-app-key>"
```

---

## Usage

```hcl
module "tags" {
  source = "../../modules/tagging"

  service     = "orders"
  environment = "prod"
  team         = "platform"
  owner        = "devops"
}

module "slo_burn_rate" {
  source = "../../modules/slo-burn-rate"

  environment = "prod"
  service     = "orders"

  slo_id = "xxxxxxxxxxxxxxxx"

  burn_rate_threshold = 2

  evaluation_window = "5m"

  notification_target = "@slack-devops"

  runbook_url = "https://company.com/runbooks/orders"

  tags = module.tags.tags
}
```

---

## Inputs

| Name                | Description                 | Type         | Default | Required |
| ------------------- | --------------------------- | ------------ | ------- | -------- |
| environment         | Deployment environment      | string       | n/a     | Yes      |
| service             | Service name                | string       | n/a     | Yes      |
| slo_id              | Datadog SLO ID              | string       | n/a     | Yes      |
| burn_rate_threshold | Burn-rate threshold         | number       | 2       | No       |
| evaluation_window   | Alert evaluation window     | string       | "5m"    | No       |
| notification_target | Slack, PagerDuty or email   | string       | ""      | No       |
| runbook_url         | Runbook URL                 | string       | ""      | No       |
| notify_no_data      | Notify when data is missing | bool         | false   | No       |
| no_data_timeframe   | No-data timeframe           | number       | 20      | No       |
| renotify_interval   | Re-notification interval    | number       | 60      | No       |
| tags                | Datadog monitor tags        | list(string) | []      | No       |

---

## Outputs

| Name                     | Description        |
| ------------------------ | ------------------ |
| slo_burn_rate_monitor_id | Datadog monitor ID |

---

## Monitor Created

This module creates a Datadog **Metric Alert** that monitors SLO burn rate.

The monitor alerts when the configured burn rate exceeds the specified threshold, helping teams detect rapid error-budget consumption before the SLO is exhausted.

---

## Tagging

This module is designed to work with the shared **tagging** module.

Example generated tags:

```text
service:orders
environment:prod
team:platform
owner:devops
```

---

## Example Directory

A working example is available in:

```text
examples/slo-burn-rate/
```

Run the example:

```bash
cd examples/slo-burn-rate

terraform init
terraform plan
```

---

## Compatibility

| Platform  | Supported |
| --------- | --------- |
| Terraform | ✅         |
| OpenTofu  | ✅         |
| Datadog   | ✅         |

---

## Versioning

This module follows Semantic Versioning.

* v0.1.0 – Initial release
* v0.2.0 – Improved configuration options
* v1.0.0 – Stable production release

---

## Commercial Support

This module is maintained by **Fusionpact Technologies Inc.**

If your organization is implementing Datadog, Site Reliability Engineering (SRE) practices, or standardized observability across AWS and Kubernetes environments, Fusionpact provides implementation, customization, and operational support.

---

## Contributing

Contributions are welcome.

Please read **CONTRIBUTING.md** before submitting a Pull Request.

---

## Security

To report a security issue, please follow the process described in **SECURITY.md**.

---

## License

Licensed under the Apache License 2.0.
