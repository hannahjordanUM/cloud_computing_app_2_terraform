output "lambda_add_arn" {
    value = aws_lambda_function.lambda_function_add.invoke_arn
}

output "lambda_delete_arn" {
    value = aws_lambda_function.lambda_function_delete.invoke_arn
}

output "lambda_function_name" {
    value = aws_lambda_function.lambda_function_add.function_name
}