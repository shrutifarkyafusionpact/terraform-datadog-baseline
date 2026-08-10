module "tags" {
  source = "../../modules/tagging"

  service     = "orders"
  environment = "prod"
  team         = "platform"
  owner        = "devops"
}

module "rds" {
  source = "../../modules/rds"

  environment         = "prod"
  service             = "orders"
  db_identifier       = "orders-db"

  cpu_threshold         = 80
  connections_threshold = 100
  replica_lag_threshold = 60

  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/rds"

  tags = module.tags.tags
}
