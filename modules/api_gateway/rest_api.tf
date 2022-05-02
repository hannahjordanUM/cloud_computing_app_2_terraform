resource "aws_api_gateway_rest_api" "rest_api" {
    name = var.rest_api_name
}

# api_gateway_resource defines the path for the api, ie 
# url/movies will perform the movies function

resource "aws_api_gateway_resource" "rest_api_resource" {
    rest_api_id = aws_api_gateway_rest_api.rest_api.id
    parent_id = aws_api_gateway_rest_api.rest_api.root_resource_id
    path_part = "add"
}

resource "aws_api_gateway_method" "rest_add_item" {
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  resource_id   = aws_api_gateway_resource.rest_api_resource.id
  http_method   = "PUT"
  authorization = "NONE" #"COGNITO_USER_POOLS"
}

# connect to lambda function
resource "aws_api_gateway_integration" "rest_add_item_integration" {
    rest_api_id = aws_api_gateway_rest_api.rest_api.id
    resource_id = aws_api_gateway_resource.rest_api_resource.id
    http_method = aws_api_gateway_method.rest_add_item.http_method
    integration_http_method = "PUT"
    type = "AWS_PROXY"
    uri = var.lambda_function_add_arn
}

resource "aws_api_gateway_method_response" "rest_add_item_response"{
    rest_api_id = aws_api_gateway_rest_api.rest_api.id
    resource_id = aws_api_gateway_resource.rest_api_resource.id
    http_method = aws_api_gateway_method.rest_add_item.http_method
    status_code = "200"
}



# creating a lambda resource based policy to allow API gateway to invoke the lambda function
resource "aws_lambda_permission" "api_gateway_lambda" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = var.lambda_function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_api_gateway_rest_api.rest_api.execution_arn}/*/*/*"
}

resource "aws_api_gateway_deployment" "rest_api_deployment" {
    rest_api_id = aws_api_gateway_rest_api.rest_api.id

    triggers = {
        redeployment = sha1(jsonencode([
            aws_api_gateway_resource.rest_api_resource.id,
            aws_api_gateway_method.rest_add_item.id,
            aws_api_gateway_integration.rest_add_item_integration.id
        ]))
    }
}

resource "aws_api_gateway_stage" "rest_api_stage" {
    deployment_id = aws_api_gateway_deployment.rest_api_deployment.id
    rest_api_id = aws_api_gateway_rest_api.rest_api.id
    stage_name = var.rest_api_stage_name
}

/*
resource "aws_api_gateway_authorizer" "api_authorizer" {
  name          = "CognitoUserPoolAuthorizer"
  type          = "COGNITO_USER_POOLS"
  rest_api_id   = aws_api_gateway_rest_api.rest_api.id
  provider_arns = [var.cognito_user_pool_arn]
}
*/ 