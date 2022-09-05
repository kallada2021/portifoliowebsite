from boto3 import Session
from pytest_terraform import terraform

@terraform('aws_vpc',scope = 'session')
def test_vpc(aws_vpc):
    assert aws_vpc["module.networking.aws_vpc.main.tags"] == {
        "Name": "Portfolio VPC"
    }
