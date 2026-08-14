# terraform-datadog-baseline

A collection of reusable Terraform modules for provisioning Datadog monitors for AWS workloads.

The project provides production-ready Terraform modules to monitor common AWS services using Datadog. It follows Infrastructure as Code (IaC) principles, allowing teams to create standardized monitors across multiple environments without manually configuring them in the Datadog UI.

---

## Features

- Reusable Terraform modules
- Infrastructure as Code (IaC)
- Datadog monitor automation
- Environment-specific configuration
- Consistent tagging
- Customizable alert thresholds
- GitHub Actions CI pipeline
- Example configurations for each module

---

## Project Structure

```
terraform-datadog-baseline/
│
├── modules/
│   ├── tagging/
│   ├── eks-golden-signals/
│   ├── slo-burn-rate/
│   ├── rds/
│   ├── alb/
│   ├── ecs-fargate/
│   ├── lambda/
│   └── ec2/
│
├── examples/
│   ├── eks/
│   ├── slo-burn-rate/
│   ├── rds/
│   ├── alb/
│   ├── ecs-fargate/
│   ├── lambda/
│
├── .github/
│   └── workflows/
│
├── providers.tf
├── versions.tf
├── variables.tf
├── outputs.tf
└── README.md
```

---

# Modules

## Tagging

Provides standardized tags for all Datadog monitors.

Example tags:

- Environment
- Service
- Team
- Owner
- Project

---

## EKS Golden Signals

Creates monitors for Kubernetes clusters.

Monitors include:

- Node CPU Utilization
- Node Memory Utilization
- Pod Restarts
- Pending Pods

---

## SLO Burn Rate

Creates Datadog SLO Alert monitors.

Supports:

- Fast Burn Rate
- Slow Burn Rate

---

## RDS

Creates monitors for Amazon RDS.

Monitors include:

- CPU Utilization
- Database Connections
- Free Storage
- Read Latency

---

## ALB

Creates monitors for Application Load Balancer.

Monitors include:

- HTTP 5XX Errors
- Target Response Time
- Healthy Host Count

---

## ECS Fargate

Creates monitors for ECS Fargate services.

Monitors include:

- CPU Utilization
- Memory Utilization
- Running Task Count

---

## Lambda

Creates monitors for AWS Lambda.

Monitors include:

- Errors
- Duration
- Throttles

---

# Prerequisites

- Terraform >= 1.5
- Datadog Account
- Datadog API Key
- Datadog Application Key
- AWS Integration enabled in Datadog

---

# Provider Configuration

```hcl
terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.91"
    }
  }
}

provider "datadog" {}
```

Export credentials before running Terraform:

```bash
export DD_API_KEY="<YOUR_API_KEY>"
export DD_APP_KEY="<YOUR_APPLICATION_KEY>"
export DD_HOST="https://api.us5.datadoghq.com"
```

Replace the API endpoint with your Datadog site if you are not using US5.

---

# Usage

Example:

```hcl
module "lambda" {

  source = "../../modules/lambda"

  environment = "prod"

  service = "payments"

  notification_target = "@slack-devops"

  runbook_url = "https://company/runbook"

  tags = module.tags.tags
}
```

---

# Deploy

Initialize Terraform

```bash
terraform init
```

Format

```bash
terraform fmt -recursive
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Deploy

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# GitHub Actions

The repository includes a GitHub Actions workflow that automatically performs:

- Terraform Format Check
- Terraform Validation

This helps maintain consistent code quality before changes are merged.

---

# Benefits

- Infrastructure as Code
- Reusable Terraform modules
- Standardized Datadog monitors
- Consistent tagging strategy
- Environment-specific deployments
- Reduced manual effort
- Easy maintenance
- Production-ready module structure

---

# Future Enhancements

- CloudWatch Dashboard modules
- API Gateway monitoring
- ElastiCache monitoring
- DynamoDB monitoring
- SQS monitoring
- SNS monitoring
- OpenTofu Registry support

---

# License

MIT License

---

# Author

Shruti Farkya

DevOps Engineer

Terraform • AWS • Datadog • Kubernetes
