output "logging_sink_name" {
  description = "The name of the created logging sink"
  value       = google_logging_project_sink.quest_sink.name
}

output "logging_bucket_name" {
  description = "The name of the created logging bucket"
  value       = google_logging_project_bucket_config.quest_bucket.bucket_id
}