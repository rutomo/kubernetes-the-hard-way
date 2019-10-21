# GCS for startup script
resource "google_storage_bucket" "k8s_startup_script" {
  name     = "${var.project_id}-k8s_startup_script"
  location = "US"
  force_destroy = true
}

# Copy script to GCS
resource "google_storage_bucket_object" "k8s_master" {
  name   = "k8s_master.sh"
  source = "k8s_master.sh"
  bucket = "${var.project_id}-k8s_startup_script"
  depends_on = [google_storage_bucket.k8s_startup_script]
}

resource "google_storage_bucket_object" "k8s_worker" {
  name   = "k8s_worker.sh"
  source = "k8s_worker.sh"
  bucket = "${var.project_id}-k8s_startup_script"
  depends_on = [google_storage_bucket.k8s_startup_script]
}