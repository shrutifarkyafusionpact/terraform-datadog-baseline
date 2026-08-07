locals {

  common_tags = [

    "service:${var.service}",

    "environment:${var.environment}",

    "team:${var.team}",

    "owner:${var.owner}",

    "managed-by:terraform"

  ]

}
