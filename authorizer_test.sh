#!/bin/bash

set -eux

#assign credentials to variables
CLIENT_ID=4tg4f4uc30rsd2dt3dht3q5ef0
USER_POOL_ID=us-west-2_omASq4AvN
USERNAME=hannah3ban3@gmail.com
PASSWORD=testPassword1!
URL=https://tdqaltqqa7.execute-api.us-west-2.amazonaws.com/prod/movies
#sign-up user:
aws cognito-idp sign-up \
 --client-id ${CLIENT_ID} \
 --username ${USERNAME} \
 --password ${PASSWORD} 
 
#confirm user:
aws cognito-idp admin-confirm-sign-up  \
  --user-pool-id ${USER_POOL_ID} \
  --username ${USERNAME} 
  
#authenticate and get token
TOKEN=$(
    aws cognito-idp initiate-auth \
 --client-id ${CLIENT_ID} \
 --auth-flow USER_PASSWORD_AUTH \
 --auth-parameters USERNAME=${USERNAME},PASSWORD=${PASSWORD} \
 --query 'AuthenticationResult.IdToken' \
 --output text 
    )
#make API call:
curl -H "Authorization: ${TOKEN}" ${URL} | jq