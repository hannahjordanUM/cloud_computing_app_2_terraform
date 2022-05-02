module "lambda_function" {
  source = "./modules/lambda_function"
  dynamo_db_arn = module.dynamo_db.dynamo_db_table_arn
}
/*
module "cognito" {
  source = "./modules/cognito"
}
*/
/*
module "api_gateway" {
  source                 = "./modules/api_gateway"
  api_gateway_region     = var.region
  api_gateway_account_id = var.account_id
  lambda_function_name   = module.lambda_function.lambda_function_name
  lambda_function_add_arn    = module.lambda_function.lambda_add_arn

  #cognito_user_pool_arn = module.cognito.cognito_user_pool_arn

  depends_on = [
    module.lambda_function
  ]
}
*/
module "dynamo_db" {
  source        = "./modules/dynamo_db"
  db_table_name = var.table_name
}
