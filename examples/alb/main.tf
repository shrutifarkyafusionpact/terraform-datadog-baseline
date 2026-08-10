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
