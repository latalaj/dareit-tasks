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