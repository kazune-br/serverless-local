#!/usr/bin/env bash

bucket_name=${1:?}
aws --endpoint-url=http://localhost:4572 mb s3://${bucket_name}/ --profile localstack