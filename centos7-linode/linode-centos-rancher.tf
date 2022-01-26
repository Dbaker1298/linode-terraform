terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.16.0"
    }
  }
}

provider "linode" {
  token = var.token
}

locals {
  timestamp = "${timestamp()}"
  timestamp_sanitized = "${replace("${local.timestamp}", "/[-| |T|Z|:]/", "")}"
}

resource "linode_instance" "rancher1" {
        image = "linode/centos7"
        label = "Terraform-Rancher1-${local.timestamp_sanitized}"
        group = "Terraform"
        region = var.region
        type = var.type
        authorized_keys = [var.authorized_keys]
        root_pass = var.root_pass
        stackscript_id = 963225
}

resource "linode_instance" "rancher2" {
        image = "linode/centos7"
        label = "Terraform-Rancher2-${local.timestamp_sanitized}"
        group = "Terraform"
        region = var.region
        type = var.type
        authorized_keys = [var.authorized_keys]
        root_pass = var.root_pass
        stackscript_id = 963225
}

output "instance_ip_addr" {
  value = linode_instance.rancher1.ip_address
}

output "instance2_ip_addr" {
  value = linode_instance.rancher2.ip_address
}
