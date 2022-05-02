variable "s3_bucket_name" {
    type = string
    description = "name of S3 bucket to store the lambda function code"
    default = "terraform-api-gateway-lambda-cc591-s22" # needs to be unique
}

variable "lambda_function_name" {
    type = string
    description = "name of lambda function"
    default = "MovieLambda"
}

variable "dynamo_db_arn" {
    type = string
    description = "dynamodb table arn"
} #from main.tf