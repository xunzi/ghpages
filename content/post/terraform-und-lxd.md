---
title: "Terraform und Lxd"
date: 2021-12-25
tags: ['terraform', 'lxd']
slug: terraform-und-lxd
---

[Terraform](https://www.terraform.io/) ist eine deklarative Beschreibungssprache für Cloud-Infrastrukturen.

Unterstützt werden viele Cloudprovider, unter anderem auch lxd.

<!--more-->

Ein kleines Beispiel für das Deployment von zwei lxd-Containern:

```terraform
terraform {

	required_providers {
        	lxd = {
                	source = "terraform-lxd/lxd"
			version = "1.6.0"
        	}
	}
}

provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true

 lxd_remote {
    name     = "rpi4-8gb"
    scheme   = "https"
    address  = "10.10.10.1"
    password = "sowasvongeheim"
    default  = true
    }
}

resource "lxd_cached_image" "focal" {
  source_remote = "ubuntu"
  source_image  = "ed6764dcaa08"
}

 resource "lxd_container" "pg" {
  name      = "pg0${count.index}"
  count     = 2
  image     = "${lxd_cached_image.focal.fingerprint}"
  profiles  = ["pgbase"]
  ephemeral = false

  config = {
    "boot.autostart" = true
  }

  limits = {
    cpu = 1
  }
}


output "ip_adresses" {
  value = {
	for container in lxd_container.pg:
	container.name => container.ipv4_address
	}
}

```
