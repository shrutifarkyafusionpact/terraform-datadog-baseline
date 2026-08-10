terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.91"
    }
  }
}

provider "datadog" {}
