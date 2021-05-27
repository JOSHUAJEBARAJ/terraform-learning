output "ip_address" {
    description = "output value of the Load BalancerIP "
    value = digitalocean_loadbalancer.public.ip
}