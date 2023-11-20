terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.32"
    }
  }

  required_version = ">= 1.4.0"

}
