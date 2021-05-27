variable "do_token" {
    description = "Digital Ocean Token"
    type = string
}
variable "pvt_key" {
    description = "Private key"
    type = string
    default = "do_key"
}
variable "public_key" {
    description = "Public key"
    type = string
    default = "do_key.pub"
}


variable "os" {
    description = "Base OS"
    type = string
    default = "ubuntu-18-04-x64"
}
variable "region" {
    description = "Region of Deployment"
    type = string
    default = "nyc1"
}
variable "size" {
    description = "Droplet Size"
    type = string
    default = "s-1vcpu-1gb"
}