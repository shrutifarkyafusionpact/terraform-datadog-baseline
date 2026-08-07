# Tagging Module

Creates standardized Datadog monitor tags.

## Example

```hcl
module "tags" {

  source = "../../modules/tagging"

  service = "payments"

  environment = "prod"

  team = "platform"

  owner = "devops"

}
```
