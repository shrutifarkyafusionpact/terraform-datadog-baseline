module "tags" {
  source = "../../modules/tagging"

  service     = "payments"
  environment = "prod"
  team        = "platform"
  owner       = "devops"
}

module "eks_monitors" {
  source = "../../modules/eks-golden-signals"

  environment         = "prod"
  service             = "payments"
  notification_target = "@slack-devops"
  runbook_url         = "https://wiki.company.com/runbooks/eks"

  tags = module.tags.tags
}
