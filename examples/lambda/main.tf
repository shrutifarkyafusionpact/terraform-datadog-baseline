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

  error_threshold    = 5
  duration_threshold = 3000
  throttle_threshold = 1

  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/lambda"

  tags = module.tags.tags
}
