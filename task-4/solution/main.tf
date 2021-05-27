// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}



resource "google_compute_instance" "default" {
 name         = "vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = var.zone 

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }


 metadata_startup_script = "sudo apt update; sudo apt install -yq nginx"

 network_interface {
   network = "vpc-network"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }

 depends_on = [
    google_compute_network.vpc_network,
  ]
}


resource "google_compute_firewall" "default" {
 name    = "nginx-app-firewall"
 network = "vpc-network"

 allow {
   protocol = "tcp"
   ports    = ["80"]
 }

 depends_on = [
    google_compute_network.vpc_network,
  ]
}