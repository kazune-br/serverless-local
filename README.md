# serverless-local

## Setup if not installed
```
# Python
$ brew install pyenv
$ pyenv install 3.6.6
$ pyenv global 3.6.6
$ pip install --upgrade pip
$ pip install -r requirements.txt

# Node
$ brew install nodebrew
$ nodebrew ls-remote
$ nodebrew isntall stabe
$ nodebrew use {your_latest_node_version}
$ npm install -g serverless
```

## Before Run
```
# Set Up AWS  Credential
$ aws configure --profile localstack
AWS Access Key ID [None]: dummy
AWS Secret Access Key [None]: dummy
Default region name [None]: us-east-1
Default output format [None]: text

# Set Up Serverless
$ sls create --template aws-python3 --path my-serverless-local
$ cd my-serverless-local
$ npm install --save-dev serverless-localstack
```

## Run
```
# Start
$ TMPDIR=/private$TMPDIR docker-compose up -d
# Test
$ aws --endpoint-url=http://localhost:4572 s3api create-bucket --bucket test --profile localstack
$ aws --endpoint-url=http://localhost:4572 s3 cp ./requirements.txt s3://test --profile localstack

$ cd my-serverless-local
$ serverless deploy --stage local --aws-profile localstack

$ aws --endpoint-url=http://localhost:4574 --region us-east-1 --profile localstack lambda create-function --function-name=f1 --runtime=python3.6 --role=r1 --handler=handler.lambda_handler --zip-file fileb://my-serverless-local.zip


$ aws --endpoint-url=http://localhost:4572 s3 ls s3://my-serverless-local-local-ServerlessDeploymentBucket-330A-Z94394A-ZA-Z2 --profile localstack
$ aws --endpoint-url=http://localhost:4572 s3 ls s3://my-serverless-local-local-ServerlessDeploymentBucket-330A-Z94394A-ZA-Z2/serverless --profile localstack

$ aws lambda --endpoint-url=http://localhost:4574 invoke --function-name f1 --payload '{"key1":"value1"}' result.log

```