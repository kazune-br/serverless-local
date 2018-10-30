#!/usr/bin/env bash

bucket_name=${1:?}
file_path=${2:?}
aws --endpoint-url=http://localhost:4572 s3 cp ${file_path} s3://${bucket_name} --profile localstack