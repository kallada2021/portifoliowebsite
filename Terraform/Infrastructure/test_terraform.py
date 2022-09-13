from boto3 import Session
from pytest_terraform import terraform


@terraform("rds", scope="session")
def test_db(rds):
    assert rds["aws_db_instance.main-db.identifier"] == "main-db"
