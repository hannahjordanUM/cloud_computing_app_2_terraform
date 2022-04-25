import logging
import json
#import jwt

logger = logging.getLogger()
logger.setLevel(logging.INFO)

MOVIES = ["Schindlers List", "Shawshank Redemption", "Batman The Dark Knight", "Spider-Man : No Way Home", "Avengers"]

def lambda_handler(event,context):
    #auth_token = str(event['headers']['Authorization'])
    #user_details = jwt.decode(auth_token, algorithms=["RS256"])
    response_message = json.dumps(MOVIES)
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
        },
        
        'body': json.dumps({
            'message': "movies: " + response_message,
            #'username': auth_token, #user_details["cognito:username"],
        }),
    }

    return response