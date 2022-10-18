terraform {
  required_version = ">= 1.3.0"

  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "~> 3.10"
    }
  }
}
