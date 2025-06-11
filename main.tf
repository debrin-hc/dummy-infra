terraform {
  cloud {
    hostname     = "app.staging.terraform.io"
    organization = "stacks-varset"

    workspaces {
      name = "dummy-infra"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
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

variable "ephemeral_var" {
  type      = string
  default   = "test"
  ephemeral = true
}

variable "normal_var" {
  type    = string
  default = "test"
}

variable "sensitive_var" {
  type      = string
  default   = "test"
  sensitive = true
}

# This output returns null.
output "ephemeralasnull_output" {
  value = ephemeralasnull(var.ephemeral_var)
}

output "ephemeral_output" {
  value = var.ephemeral_var
  ephemeral = true
}

output "normal_output" {
  value = var.normal_var
}

output "sensitive_output" {
  value     = var.sensitive_var
  sensitive = true
}
