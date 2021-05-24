output "ip_address" {
    description = "output value of the IP Address"
    value = digitalocean_droplet.web.ipv4_address
}