#!/usr/bin/env bash
aws --endpoint-url=http://localhost:4574 \
      lambda invoke --function-name f1 \
      --payload '{"key1":"value1"}' result.log

