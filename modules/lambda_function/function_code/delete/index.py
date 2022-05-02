# import the JSON utility package since we will be working with a JSON object
import json
import boto3


# define the handler function that the Lambda service will use an entry point
def lambda_handler(event, context):

    db = boto3.resource('dynamodb')
    table = db.Table('cloud-class-inventory-app-table')

    item_id = event['id']
    
    table.delete_item(Key={'id': item_id })

# return a properly formatted JSON object
    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }
