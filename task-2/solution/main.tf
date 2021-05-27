resource "digitalocean_ssh_key" "do_key" {
  name       = "Digital  Key"
  public_key = file(var.public_key)
}


resource "digitalocean_droplet" "web" {
  count = 2
  name   = "web-${count.index}"
  image = var.os
  region = var.region
  size = var.size
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.do_key.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
    provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.public_key}' nginx.yaml"
  }

}
   
resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = var.region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id
  depends_on = [
    digitalocean_droplet.web,
  ]
}


  

