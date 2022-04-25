variable "region" {
  description = "aws region"
  type        = string
  default     = "us-west-2"
}

variable "table_name" {
  description = "Table name"
  type        = string
  default     = "my-first-test-table"
}

variable "billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "environment" {
  description = "Name of environment"
  default     = "test"
}

variable "account_id" {
  description = "aws access key"
  type        = string
  # default = "" # uncomment and fill this in with your account id from aws for quicker testing: otherwise just enter it upon apply
}