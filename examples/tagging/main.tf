module "tags" {

  source = "../../modules/tagging"

  service = "payments"

  environment = "prod"

  team = "platform"

  owner = "devops"

}

output "tags" {

  value = module.tags.tags

}
