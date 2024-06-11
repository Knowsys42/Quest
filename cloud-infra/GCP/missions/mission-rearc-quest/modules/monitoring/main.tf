resource "google_monitoring_alert_policy" "quest_alert_policy" {
  display_name = "Quest Alert Policy"
  combiner     = "OR"

  conditions {
    display_name = "High CPU Usage"
    condition_threshold {
      filter     = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/cpu/usage_time\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = 0.8
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [
    google_monitoring_notification_channel.email.id,
  ]
}

resource "google_monitoring_notification_channel" "email" {
  display_name = "Email Notification Channel"
  type         = "email"
  labels = {
    email_address = var.notification_email
  }
}