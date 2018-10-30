#!/usr/bin/env bash
aws --endpoint-url=http://localhost:4574 \
    --region us-east-1 \
    --profile localstack \
    lambda create-function --function-name=f1 \
    --runtime=python3.6 \
    --role=r1 \
    --handler=lambda.lambda_handler \
    --zip-file fileb://lambda.zip