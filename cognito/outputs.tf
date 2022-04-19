output "cognito_user_pool_id" {
    value = aws_cognito_user_pool.user_pool.id
}

output "cognito_user_pool_arn" {
    value = aws_cognito_user_pool.user_pool.arn
}

output "user_pool_client_id" {
    value = aws_cognito_user_pool_client.user_pool_client.id
}

