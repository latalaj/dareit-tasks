
resource "google_storage_default_object_access_control" "public_rule" {
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "bucket" {
  name = "dareit-task6-tf"
  project = "proven-cider-378518"
  storage_class = "standard"
  location = "us-central1"
}

resource "google_compute_instance" "vm-instance-tf" {
    name = "dareit-task6-vm-tf" 
    machine_type = "e2-medium"
    zone         = "us-central1-a"


tags = ["dareit"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        managed_by_terraform = "true"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_sql_database_instance" "dareit" {
  name             = "dareit"
  database_version = "POSTGRES_14"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = "false"
}

resource "google_sql_database" "database" {
  name     = "dareit"
  instance = google_sql_database_instance.dareit.name
}

resource "google_sql_user" "usertf" {
  name     = "dareit_user"
  instance = google_sql_database_instance.dareit.name
  password = "dareitpass"
}