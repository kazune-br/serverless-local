def lambda_handler(event, context):
    print(event)
    return 'LocalStack TEST'

# import json
# import urllib.request
#
#
# def hello(event, context):
#     started_at = datetime.datetime.now()
#     with urllib.request.urlopen("https://example.com"):
#         ended_at = datetime.datetime.now()
#         elapsed = (ended_at - started_at).total_seconds()
#         return f'Time: {elapsed} seconds'
