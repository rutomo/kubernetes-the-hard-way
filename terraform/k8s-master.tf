# Random string generator
resource "random_string" "random" {
  length = 5
  special = false
  upper = false
  lower = true
}

# Create a template for master nodes
resource "google_compute_instance_template" "k8s_master_template" {
  name        = "k8s-master-template-${random_string.random.result}"
  description = "This template is used to create k8s-master server instances."

  tags = ["k8s-master"]
  
  labels = {
    environment = "dev"
  }
  metadata_startup_script = "${google_storage_bucket.k8s_startup_script.url}/k8s_master.sh"
  instance_description = "description assigned to instances"
  machine_type         = "n1-standard-1"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image = "ubuntu-1804-lts"
    auto_delete  = true
    boot         = true
    disk_size_gb = 10
    disk_type    = "pd-ssd"
  }

  network_interface {
    network = "default"
  }
}

# Create a master group based on above template
resource "google_compute_instance_group_manager" "k8s_master_group" {
  name = "k8s-master-group"
  instance_template  = "${google_compute_instance_template.k8s_master_template.self_link}"
  base_instance_name = "k8s-master"
  zone               = "us-central1-a"
  depends_on = [google_compute_instance_template.k8s_master_template]
  target_size  = 1
}
