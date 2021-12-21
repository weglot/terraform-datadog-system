
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit)

# Terraform module for Datadog System

Monitors:
* [Terraform module for Datadog System](#terraform-module-for-datadog-system)
  * [Datadog Agent](#datadog-agent)
  * [Required Services](#required-services)
  * [Bytes Sent](#bytes-sent)
  * [Disk Free Percent](#disk-free-percent)
  * [Packets Out Errors](#packets-out-errors)
  * [Memory Free Percent](#memory-free-percent)
  * [Datadog Agent Data](#datadog-agent-data)
  * [Disk Free Bytes](#disk-free-bytes)
  * [Packets In Errors](#packets-in-errors)
  * [Swap](#swap)
  * [Memory Free Bytes](#memory-free-bytes)
  * [Bytes Received](#bytes-received)
  * [Disk Iowait](#disk-iowait)
  * [Reboot](#reboot)
  * [CPU](#cpu)
  * [Module Variables](#module-variables)

# Getting started
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Datadog Agent

| variable                   | default                                  | required | description                      |
|----------------------------|------------------------------------------|----------|----------------------------------|
| dd_agent_enabled           | True                                     | No       |                                  |
| dd_agent_evaluation_period | last_15m                                 | No       |                                  |
| dd_agent_note              | ""                                       | No       |                                  |
| dd_agent_docs              | Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event | No       |                                  |
| dd_agent_filter_override   | ""                                       | No       |                                  |
| dd_agent_alerting_enabled  | True                                     | No       |                                  |
| dd_agent_data_priority     | 2                                        | No       | Number from 1 (high) to 5 (low). |


## Required Services

| variable                                     | default  | required | description                      |
|----------------------------------------------|----------|----------|----------------------------------|
| required_services_enabled                    | True     | No       |                                  |
| required_services_config                     | {}       | No       |                                  |
| required_services_default_freshness_duration | 5m       | No       |                                  |
| required_services_default_note               | ""       | No       |                                  |
| required_services_default_docs               | ""       | No       |                                  |
| required_services_filter_override            | ""       | No       |                                  |
| required_services_alerting_enabled           | True     | No       |                                  |
| required_services_default_priority           | 2        | No       | Number from 1 (high) to 5 (low). |


## Bytes Sent

| variable                     | default  | required | description                      |
|------------------------------|----------|----------|----------------------------------|
| bytes_sent_enabled           | True     | No       |                                  |
| bytes_sent_warning           | 4000000  | No       |                                  |
| bytes_sent_critical          | 5000000  | No       |                                  |
| bytes_sent_evaluation_period | last_30m | No       |                                  |
| bytes_sent_note              | ""       | No       |                                  |
| bytes_sent_docs              | ""       | No       |                                  |
| bytes_sent_filter_override   | ""       | No       |                                  |
| bytes_sent_alerting_enabled  | True     | No       |                                  |
| bytes_sent_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Free Percent

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| disk_free_percent_enabled           | True     | No       |                                  |
| disk_free_percent_warning           | 20       | No       |                                  |
| disk_free_percent_critical          | 10       | No       |                                  |
| disk_free_percent_evaluation_period | last_5m  | No       |                                  |
| disk_free_percent_note              | ""       | No       |                                  |
| disk_free_percent_docs              | ""       | No       |                                  |
| disk_free_percent_filter_override   | ""       | No       |                                  |
| disk_free_percent_alerting_enabled  | True     | No       |                                  |
| disk_free_percent_priority          | 1        | No       | Number from 1 (high) to 5 (low). |


## Packets Out Errors

| variable                             | default                                  | required | description                      |
|--------------------------------------|------------------------------------------|----------|----------------------------------|
| packets_out_errors_enabled           | True                                     | No       |                                  |
| packets_out_errors_warning           | 0.5                                      | No       |                                  |
| packets_out_errors_critical          | 1                                        | No       |                                  |
| packets_out_errors_evaluation_period | last_15m                                 | No       |                                  |
| packets_out_errors_note              | ""                                       | No       |                                  |
| packets_out_errors_docs              | Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/ | No       |                                  |
| packets_out_errors_filter_override   | ""                                       | No       |                                  |
| packets_out_errors_alerting_enabled  | True                                     | No       |                                  |
| packets_out_errors_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Memory Free Percent

| variable                              | default  | required | description                      |
|---------------------------------------|----------|----------|----------------------------------|
| memory_free_percent_enabled           | True     | No       |                                  |
| memory_free_percent_warning           | 20       | No       |                                  |
| memory_free_percent_critical          | 10       | No       |                                  |
| memory_free_percent_evaluation_period | last_5m  | No       |                                  |
| memory_free_percent_note              | ""       | No       |                                  |
| memory_free_percent_docs              | ""       | No       |                                  |
| memory_free_percent_filter_override   | ""       | No       |                                  |
| memory_free_percent_alerting_enabled  | True     | No       |                                  |
| memory_free_percent_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Datadog Agent Data

| variable                            | default                                  | required | description                      |
|-------------------------------------|------------------------------------------|----------|----------------------------------|
| dd_agent_data_enabled               | True                                     | No       |                                  |
| dd_agent_data_severity              | major                                    | No       |                                  |
| dd_agent_data_note                  | ""                                       | No       |                                  |
| dd_agent_data_docs                  | Not getting monitoring data could mean anything, best is to assume the host is down and consider this a major event | No       |                                  |
| dd_agent_data_filter_override       | ""                                       | No       |                                  |
| dd_agent_data_include_tags_override | null                                     | No       |                                  |
| dd_agent_data_exclude_tags_override | null                                     | No       |                                  |
| dd_agent_data_alerting_enabled      | True                                     | No       |                                  |
| dd_agent_priority                   | null                                     | No       | Number from 1 (high) to 5 (low). |


## Disk Free Bytes

| variable                          | default     | required | description                      |
|-----------------------------------|-------------|----------|----------------------------------|
| disk_free_bytes_enabled           | False       | No       |                                  |
| disk_free_bytes_warning           | 20000000000 | No       |                                  |
| disk_free_bytes_critical          | 10000000000 | No       |                                  |
| disk_free_bytes_evaluation_period | last_5m     | No       |                                  |
| disk_free_bytes_note              | ""          | No       |                                  |
| disk_free_bytes_docs              | ""          | No       |                                  |
| disk_free_bytes_filter_override   | ""          | No       |                                  |
| disk_free_bytes_alerting_enabled  | True        | No       |                                  |
| disk_free_bytes_priority          | 1           | No       | Number from 1 (high) to 5 (low). |


## Packets In Errors

| variable                            | default                                  | required | description                      |
|-------------------------------------|------------------------------------------|----------|----------------------------------|
| packets_in_errors_enabled           | True                                     | No       |                                  |
| packets_in_errors_warning           | 0.5                                      | No       |                                  |
| packets_in_errors_critical          | 1                                        | No       |                                  |
| packets_in_errors_evaluation_period | last_15m                                 | No       |                                  |
| packets_in_errors_note              | ""                                       | No       |                                  |
| packets_in_errors_docs              | Packet errors can severely degrade network performance. A good article about it is found here: https://netcraftsmen.com/understanding-interface-errors-and-tcp-performance/ | No       |                                  |
| packets_in_errors_filter_override   | ""                                       | No       |                                  |
| packets_in_errors_alerting_enabled  | True                                     | No       |                                  |
| packets_in_errors_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Swap

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| swap_percent_free_enabled           | True     | No       |                                  |
| swap_percent_free_warning           | 15       | No       |                                  |
| swap_percent_free_critical          | 10       | No       |                                  |
| swap_percent_free_evaluation_period | last_5m  | No       |                                  |
| swap_percent_free_note              | ""       | No       |                                  |
| swap_percent_free_docs              | ""       | No       |                                  |
| swap_percent_free_filter_override   | ""       | No       |                                  |
| swap_percent_free_alerting_enabled  | True     | No       |                                  |
| swap_percent_free_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Memory Free Bytes

| variable                            | default    | required | description                                                                          |
|-------------------------------------|------------|----------|--------------------------------------------------------------------------------------|
| memory_free_bytes_enabled           | False      | No       | Memory free based on absolute values. Disabled by default to use memory_free_percent |
| memory_free_bytes_warning           | 2000000000 | No       |                                                                                      |
| memory_free_bytes_critical          | 1000000000 | No       |                                                                                      |
| memory_free_bytes_evaluation_period | last_5m    | No       |                                                                                      |
| memory_free_bytes_note              | ""         | No       |                                                                                      |
| memory_free_bytes_docs              | ""         | No       |                                                                                      |
| memory_free_bytes_filter_override   | ""         | No       |                                                                                      |
| memory_free_bytes_alerting_enabled  | True       | No       |                                                                                      |
| memory_free_bytes_priority          | 2          | No       | Number from 1 (high) to 5 (low).                                                     |


## Bytes Received

| variable                         | default  | required | description                      |
|----------------------------------|----------|----------|----------------------------------|
| bytes_received_enabled           | True     | No       |                                  |
| bytes_received_warning           | 4000000  | No       |                                  |
| bytes_received_critical          | 5000000  | No       |                                  |
| bytes_received_evaluation_period | last_30m | No       |                                  |
| bytes_received_note              | ""       | No       |                                  |
| bytes_received_docs              | ""       | No       |                                  |
| bytes_received_filter_override   | ""       | No       |                                  |
| bytes_received_alerting_enabled  | True     | No       |                                  |
| bytes_received_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Iowait

| variable                       | default                                  | required | description                      |
|--------------------------------|------------------------------------------|----------|----------------------------------|
| disk_io_wait_enabled           | True                                     | No       |                                  |
| disk_io_wait_warning           | 80                                       | No       |                                  |
| disk_io_wait_critical          | 95                                       | No       |                                  |
| disk_io_wait_evaluation_period | last_30m                                 | No       |                                  |
| disk_io_wait_note              | ""                                       | No       |                                  |
| disk_io_wait_docs              | The CPU is mainly waiting for data to be written on disk. This means in general that application running on this machine is stalled | No       |                                  |
| disk_io_wait_filter_override   | ""                                       | No       |                                  |
| disk_io_wait_alerting_enabled  | True                                     | No       |                                  |
| disk_io_wait_priority          | 2                                        | No       | Number from 1 (high) to 5 (low). |


## Reboot

| variable                | default  | required | description                      |
|-------------------------|----------|----------|----------------------------------|
| reboot_enabled          | True     | No       |                                  |
| reboot_note             | ""       | No       |                                  |
| reboot_docs             | ""       | No       |                                  |
| reboot_filter_override  | ""       | No       |                                  |
| reboot_alerting_enabled | True     | No       |                                  |
| reboot_priority         | 3        | No       | Number from 1 (high) to 5 (low). |


## CPU

| variable              | default  | required | description                      |
|-----------------------|----------|----------|----------------------------------|
| cpu_enabled           | True     | No       |                                  |
| cpu_warning           | 80       | No       |                                  |
| cpu_critical          | 95       | No       |                                  |
| cpu_evaluation_period | last_30m | No       |                                  |
| cpu_note              | ""       | No       |                                  |
| cpu_docs              | ""       | No       |                                  |
| cpu_filter_override   | ""       | No       |                                  |
| cpu_alerting_enabled  | True     | No       |                                  |
| cpu_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable                   | default  | required | description                                                                                          |
|----------------------------|----------|----------|------------------------------------------------------------------------------------------------------|
| env                        |          | Yes      |                                                                                                      |
| filter_str                 |          | Yes      |                                                                                                      |
| service                    |          | Yes      | Service name of what you're monitoring. This also sets the service:<service> tag on the monitor      |
| service_display_name       | null     | No       |                                                                                                      |
| notification_channel       |          | Yes      | Channel to which datadog sends alerts, will be overridden by alerting_enabled if that's set to false |
| additional_tags            | []       | No       | Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags |
| name_prefix                | ""       | No       | Can be used to prefix to the Monitor name                                                            |
| name_suffix                | ""       | No       | Can be used to suffix to the Monitor name                                                            |
| locked                     | True     | No       |                                                                                                      |
| service_check_include_tags | null     | No       | List of tags for the "over" part of the query. Can be either key:value tags or boolean tags.         |
| service_check_exclude_tags | null     | No       | List of tags for the "exclude" part of the query. Can be either key:value tags or boolean tags.      |


