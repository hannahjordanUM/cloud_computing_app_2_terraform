variable "rest_api_name" {
    description = "Name of the API Gateway created"
    type = string
    default = "terraform-api-gateway-example"
}

variable "api_gateway_region" {
    description = "region in which to create/manage resources"
    type = string
} # value comes from main.tf

variable "api_gateway_account_id" {
    description = "account ID in which to create/manage resource"
    type = string
} # value comes from main.tf

variable "lambda_function_name" {
    description = "name of the Lambda function"
    type        = string
} # value comes from main.tf

variable "lambda_function_add_arn" {
    description = "The ARN of the Lambda function"
    type        = string
} # value comes from main.tf


variable "rest_api_stage_name" {
    description = "The name of the API Gateway stage"
    type        = string
    default     = "prod" # add a stage name as per your requirement
}

/*
variable "cognito_user_pool_arn" {
    description = "arn of user pool"
    type = string
} # from main.tf
*/