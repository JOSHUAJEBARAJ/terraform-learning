locals {
    name = "${var.name}"
    tag     = "${var.tag}"
 
    create_command = <<EOF
      docker build -t ${local.name}:${local.tag} .
    EOF
}

resource "null_resource" "docker_image" {
  provisioner "local-exec" {
    command = "${local.create_command}"
  }

triggers = {
    name = var.name 
    tag = var.tag 
  }
  provisioner "local-exec" {
      when = destroy
       command = "docker rmi  ${self.triggers.name}:${self.triggers.tag}"
  }
}

