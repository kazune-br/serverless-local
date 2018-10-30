#!/usr/bin/env bash

bucket_name=${1:?}
aws --endpoint-url=http://localhost:4572 s3 ls s3://${bucket_name} --profile localstack