module "tags" {
  source = "../../modules/tagging"

  service     = "orders"
  environment = "prod"
  team         = "platform"
  owner        = "devops"
}

module "ecs_fargate" {
  source = "../../modules/ecs-fargate"

  environment      = "prod"
  service          = "orders"
  cluster_name     = "orders-cluster"
  ecs_service_name = "orders-service"

  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/ecs"

  tags = module.tags.tags
}
