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
$ nodebrew setup
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
# Dockerの起動
$ TMPDIR=/private$TMPDIR docker-compose up -d

# S3へ接続
$ aws --endpoint-url=http://localhost:4572 s3api create-bucket --bucket test --profile localstack
$ aws --endpoint-url=http://localhost:4572 s3 cp ./requirements.txt s3://test --profile localstack

# Lambdaの作成(何回も書くのめんどくさいのでlambda.shの中に格納)
$ aws --endpoint-url=http://localhost:4574 \ 
      --region us-east-1 \
      --profile localstack \
      lambda create-function --function-name=f1 \
      --runtime=python3.6 \
      --role=r1 \
      --handler=lambda.lambda_handler \
      --zip-file fileb://lambda.zip

# 作成した関数のテスト
$ aws --endpoint-url=http://localhost:4574 \
      lambda invoke --function-name f1 \
      --payload '{"key1":"value1"}' result.log
      
# 作成した関数のアップデート
$ aws --endpoint-url=http://localhost:4574 \
      --region us-east-1 \
      --profile localstack \
      lambda update-function-code \ 
      --function-name f1 \ 
      --zip-file fileb://lambda.zip --publish
      
# 作成した関数一覧
$ aws --endpoint-url=http://localhost:4574 \
      --region us-east-1 \
      --profile localstack \
      lambda list-functions

# 作成した関数の削除
$ aws --endpoint-url=http://localhost:4574 \
      --region us-east-1 \
      --profile localstack  \
      lambda delete-function --function-name f1
```


## WIP
```
# Deploy時にエラーが起こる
$ cd my-serverless-local
$ serverless deploy --stage local --aws-profile localstack

# Deploy後にCloudFormationのスタックがS3バケットに作成されていることは確認
$ aws --endpoint-url=http://localhost:4572 s3 ls s3://my-serverless-local-local-ServerlessDeploymentBucket-330A-Z94394A-ZA-Z2 --profile localstack
$ aws --endpoint-url=http://localhost:4572 s3 ls s3://my-serverless-local-local-ServerlessDeploymentBucket-330A-Z94394A-ZA-Z2/serverless --profile localstack
```






