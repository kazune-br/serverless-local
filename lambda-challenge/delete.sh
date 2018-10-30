#!/usr/bin/env bash
aws --endpoint-url=http://localhost:4574 \
      --region us-east-1 \
      --profile localstack  \
      lambda delete-function --function-name f1