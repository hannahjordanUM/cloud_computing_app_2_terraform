module "lambda_function" {
  source = "./modules/lambda_function"
}

module "api_gateway" {
  source = "./modules/api_gateway"
  api_gateway_region = var.region
  api_gateway_account_id = var.account_id
  lambda_function_name = module.lambda_function.lambda_function_name
  lambda_function_arn = module.lambda_function.lambda_function_arn

  depends_on = [
    module.lambda_function
  ]
}


/*
resource "aws_dynamodb_table" "my_first_table" {
  name = "${var.table_name}"
  billing_mode = "${var.billing_mode}"
  hash_key = "employee-id"
  attribute {
    name = "employee-id"
    type = "S"
  }
  tags = {
    environment = "${var.environment}"
  }
}
*/