#!/usr/bin/env bash
aws --endpoint-url=http://localhost:4574 \
      --region us-east-1 \
      --profile localstack \
      lambda update-function-code \
      --function-name f1 \
      --zip-file fileb://lambda.zip --publish