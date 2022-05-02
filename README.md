Based on this tutorial: 
https://hands-on.cloud/managing-amazon-api-gateway-using-terraform/#h-creating-resources-using-terraform

-still need to add cognito to it

--> I think this will be a good way of setting up our backend rather than going through all the steps in this tutorial: https://aws.amazon.com/getting-started/hands-on/build-serverless-web-app-lambda-apigateway-s3-dynamodb-cognito/

--> in order for authorization to work correctly: install jwt-decode: npm install jwt-decode, locate package and move to modules/lambda_function/function_code/


Currently:
- initializes Lambda and DynamoDB
- cognito can be initialized as well, but I need to look to see how we can combine with Charle's work
- upon terraform apply, it will ask you for your account id
- once apply is complete, an api url will pop up. Upon following the link, it 

To initialize API Gateway:
- go to aws API Gateway
- select Build orange button on REST API service
- make sure REST is the protocol selected, select New API, name API (I've been using cloud-api), click create

ADD:
- under Actions, click Create Resource: name = add, check Enable API Gateway CORS, create
- with add selected, click create method under actions, with /add selected, select PUT and the checkmark
- make sure lambda function is selected, lambda proxy integration is not checked, and start typing addItem for Lambda Function, click save and ok
- test that it is working by selecting the lightning bolt test: enter 
{
    "id": "1234",
    "name": "test",
    "amount": 5
}
for request body. The response should have a status code of 200 and body = Success. To check that this worked with the database, go to DynamoDB in the console and look for the table named cloud-class-inventory-app-table. There should be an item with the above specifications.

DELETE:
- with the very top / selected (don't want to have add selected), under Actions, click Create Resource: name = delete, check Enable API Gateway CORS, create
- with add selected, click create method under actions with /delete selected, select DELETE and the checkmark
- make sure lambda function is selected, lambda proxy integration is not checked, and start typing deleteItem for Lambda Function, click save and ok
- test that it is working by selecting the lightning bolt test: enter 
{
    "id": "1234"
}
for request body. The response should have a status code of 200 and body = Success. Go to table, the item you added before should be deleted.


- Deploy API: under actions select Deploy API: select new stage as deployment, name it dev and press deploy
- copy the invoke URL

Input the invoke URL into your Javascript fetch() calls, for the example on HannahsBranch, index.html is calling the /add resource, so just paste your api url and add the /add to the end. https://..../dev/add --> just added /add. It should work on both amplify and on your local machine.