# AWS Lambda Datadog Monitors Terraform Module

A reusable Terraform module that provisions Datadog monitors for AWS Lambda functions.

This module is part of the **terraform-datadog-baseline** project and provides a standardized observability baseline for serverless workloads by creating Datadog monitors for Lambda errors, execution duration, and throttling events.

---

# Features

* Lambda Error Monitor
* Lambda Duration Monitor
* Lambda Throttle Monitor
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

* AWS Lambda is integrated with Datadog.
* AWS CloudWatch metrics are being collected by Datadog.
* A Datadog API Key and Application Key are available.
* The Datadog Terraform Provider is configured.

Provider configuration:

```hcl
provider "datadog" {}
```

Export your Datadog credentials:

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

module "lambda" {
  source = "../../modules/lambda"

  environment          = "prod"
  service              = "orders"

  lambda_function_name = "orders-api"

  error_threshold      = 5
  duration_threshold   = 3000
  throttle_threshold   = 1

  notification_target  = "@slack-devops"
  runbook_url          = "https://wiki.company.com/runbooks/lambda"

  tags = module.tags.tags
}
```

---

# Inputs

| Name                 | Description                                        | Type         | Default | Required |
| -------------------- | -------------------------------------------------- | ------------ | ------- | -------- |
| environment          | Deployment environment                             | string       | n/a     | Yes      |
| service              | Application or service name                        | string       | n/a     | Yes      |
| lambda_function_name | Lambda function name                               | string       | n/a     | Yes      |
| error_threshold      | Lambda error threshold                             | number       | 5       | No       |
| duration_threshold   | Lambda execution duration threshold (milliseconds) | number       | 3000    | No       |
| throttle_threshold   | Lambda throttle threshold                          | number       | 1       | No       |
| notification_target  | Slack, PagerDuty or email notification target      | string       | ""      | No       |
| runbook_url          | Runbook documentation URL                          | string       | ""      | No       |
| tags                 | Datadog monitor tags                               | list(string) | []      | No       |
| evaluation_delay     | Delay monitor evaluation                           | number       | 300     | No       |
| notify_no_data       | Notify when no data is received                    | bool         | false   | No       |
| no_data_timeframe    | Minutes before reporting no data                   | number       | 20      | No       |
| renotify_interval    | Minutes before re-notification                     | number       | 60      | No       |

---

# Outputs

| Name                 | Description                 |
| -------------------- | --------------------------- |
| errors_monitor_id    | Lambda Errors monitor ID    |
| duration_monitor_id  | Lambda Duration monitor ID  |
| throttles_monitor_id | Lambda Throttles monitor ID |

---

# Monitors Created

This module provisions the following Datadog monitors:

* Lambda Errors
* Lambda Duration
* Lambda Throttles

These monitors provide a baseline monitoring solution for AWS Lambda workloads and can be customized through module variables.

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

Consistent tagging improves monitor organization, ownership, reporting, filtering, and operational visibility.

---

# Example

A complete working example is available in:

```text
examples/lambda/
```

Run the example:

```bash
cd examples/lambda

terraform init
terraform plan
```

---

# Compatibility

| Platform   | Supported |
| ---------- | --------- |
| Terraform  | Yes       |
| OpenTofu   | Yes       |
| AWS Lambda | Yes       |
| Datadog    | Yes       |

---

# Versioning

This module follows Semantic Versioning.

Example releases:

* **v0.1.0** – Initial Lambda monitoring module
* **v0.2.0** – Additional monitor configuration
* **v1.0.0** – Production-ready release

---

# Commercial Support

This module is maintained by **Fusionpact Technologies Inc.**

If your organization is deploying serverless applications on AWS and requires assistance implementing Datadog observability, Terraform modules, or operational best practices, Fusionpact provides implementation, customization, and support services.

---

# Contributing

Contributions are welcome.

Please review **CONTRIBUTING.md** before submitting a Pull Request.

---

# Security

If you discover a security vulnerability, please report it according to the process documented in **SECURITY.md**.

---

# License

Licensed under the Apache License, Version 2.0.
