from boto3 import Session
from pytest_terraform import terraform


@terraform("sqs", scope="session")
def test_sqs(sqs):
    assert sqs["aws_sqs_queue.test_queue.tags"] == {"Environment": "production"}
    assert sqs["aws_sqs_queue.test_queue.name"] == "test-queue"


@terraform("s3", scope="session")
def test_s3(s3):
    assert s3["aws_s3_bucket.test-bucket.name"] == "bucket-name"
