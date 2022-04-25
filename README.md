Based on this tutorial: 
https://hands-on.cloud/managing-amazon-api-gateway-using-terraform/#h-creating-resources-using-terraform

-still need to add cognito to it

--> I think this will be a good way of setting up our backend rather than going through all the steps in this tutorial: https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/

--> in order for authorization to work correctly: install jwt-decode: npm install jwt-decode, locate package and move to modules/lambda_function/function_code/


Currently:
- initializes API Gateway,  Lambda and DynamoDB
- cognito can be initialized as well, but I need to look to see how we can combine with Charle's work
- upon terraform apply, it will ask you for your account id
- once apply is complete, an api url will pop up. Upon following the link, it should display a json formatted list of movies
