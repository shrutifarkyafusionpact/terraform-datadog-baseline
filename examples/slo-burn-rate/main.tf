module "tags" {

  source = "../../modules/tagging"

  service     = "payments"

  environment = "prod"

  team = "platform"

  owner = "devops"

}

module "slo" {

  source = "../../modules/slo-burn-rate"

  service = "payments"

  environment = "prod"

  slo_id = "xxxxxxxxxxxxxxxx"

  notification_target = "@slack-devops"

  runbook_url = "https://wiki.company.com/runbooks/slo"

  tags = module.tags.tags

}
