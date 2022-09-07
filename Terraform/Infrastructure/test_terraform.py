from boto3 import Session
from pytest_terraform import terraform


@terraform("rds", scope="session")
def test_vpc(rds):
    assert rds["rds.main.tags"] == {"Name": "RDS"}
