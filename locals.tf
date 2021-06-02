locals {
  service_check_include_tags = coalesce(
    var.service_check_include_tags,
    ["service:${var.service}"]
  )

  service_check_exclude_tags = coalesce(
    var.service_check_exclude_tags,
    []
  )
}
