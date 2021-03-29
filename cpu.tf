locals {
  cpu_filter = coalesce(
    var.cpu_filter_override,
    var.filter_str
  )
}

module "cpu" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.5"

  name  = "System - High CPU"
  query = "avg(${var.cpu_evaluation_period}):avg:system.cpu.user{${local.cpu_filter}} by {host} + avg:system.cpu.system{${local.cpu_filter}} by {host} > ${var.cpu_critical}"

  enabled          = var.cpu_enabled
  alerting_enabled = var.cpu_alerting_enabled

  alert_message    = "High CPU usage on ${var.service} Node {{host.name}} ({{value}} %)"
  recovery_message = "CPU usage on Vault ${var.service} {{host.name}} Recovered ({{value}} %)"

  service         = var.service
  env             = var.alert_env
  priority        = var.cpu_priority
  severity        = var.cpu_severity
  note            = var.cpu_note
  docs            = var.cpu_docs
  additional_tags = var.additional_tags

  notification_channel = var.notification_channel

  require_full_window = true
  locked              = var.locked

  critical_threshold = var.cpu_critical
  warning_threshold  = var.cpu_warning
}
