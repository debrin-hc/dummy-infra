terraform {
  cloud { 
    hostname = "app.staging.terraform.io" 
    organization = "stacks-varset" 

    workspaces { 
      name = "dummy-infra" 
    } 
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

variable "example" {
  type      = string
  default   = "test"
  ephemeral = true
}

# This output returns null.
output "example_output" {
  value       = ephemeralasnull(var.example)
}
