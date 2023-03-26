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