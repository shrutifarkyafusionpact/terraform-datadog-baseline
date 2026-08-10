# Terraform Datadog Baseline – Tagging Module

A reusable Terraform module that generates a standardized set of Datadog tags for monitors created by the **terraform-datadog-baseline** module family.

Consistent tagging enables better filtering, ownership, reporting, monitor organization, and cost attribution across an observability estate.

This module is intended to be shared by all modules in the repository, including:

* EKS Golden Signals
* SLO Burn Rate
* RDS
* Application Load Balancer (ALB)
* ECS Fargate
* AWS Lambda

---

# Features

* Standardized Datadog tags
* Reusable across all Terraform modules
* Consistent naming convention
* Supports custom tags
* Terraform and OpenTofu compatible

---

# Requirements

| Name      | Version              |
| --------- | -------------------- |
| Terraform | >= 1.5               |
| OpenTofu  | >= 1.6 (Recommended) |

---

# Usage

```hcl
module "tags" {
  source = "../../modules/tagging"

  service     = "orders"
  environment = "prod"
  team         = "platform"
  owner        = "devops"

  additional_tags = [
    "application:payments",
    "managed-by:terraform"
  ]
}
```

---

# Example Output

```text
[
  "service:orders",
  "environment:prod",
  "team:platform",
  "owner:devops",
  "application:payments",
  "managed-by:terraform"
]
```

---

# Inputs

| Name            | Description                                       | Type         | Default | Required |
| --------------- | ------------------------------------------------- | ------------ | ------- | -------- |
| service         | Service or application name                       | string       | n/a     | Yes      |
| environment     | Deployment environment (dev, test, staging, prod) | string       | n/a     | Yes      |
| team            | Owning team                                       | string       | n/a     | Yes      |
| owner           | Resource owner                                    | string       | n/a     | Yes      |
| additional_tags | Additional Datadog tags                           | list(string) | []      | No       |

---

# Outputs

| Name | Description                   |
| ---- | ----------------------------- |
| tags | Complete list of Datadog tags |

---

# Generated Tags

The module generates a consistent set of tags such as:

```text
service:orders
environment:prod
team:platform
owner:devops
```

Additional tags supplied through `additional_tags` are appended to the generated list.

---

# Repository Integration

This module is consumed by every monitoring module in the project:

* `eks-golden-signals`
* `slo-burn-rate`
* `rds`
* `alb`
* `ecs-fargate`
* `lambda`

Using a shared tagging module ensures all Datadog monitors follow the same tagging convention.

---

# Compatibility

| Platform  | Supported |
| --------- | --------- |
| Terraform | Yes       |
| OpenTofu  | Yes       |
| Datadog   | Yes       |

---

# Versioning

This module follows Semantic Versioning.

Example releases:

* **v0.1.0** – Initial tagging module
* **v1.0.0** – Stable production release

---

# Commercial Support

This module is maintained by Fusionpact Technologies Inc.

If you are standardizing observability across AWS and Datadog environments, Fusionpact provides implementation, customization, and operational support for Terraform-based monitoring solutions.

---

# Contributing

Contributions are welcome.

Please review **CONTRIBUTING.md** before submitting a Pull Request.

---

# Security

Please report security vulnerabilities according to the process described in **SECURITY.md**.

---

# License

Licensed under the Apache License, Version 2.0.
