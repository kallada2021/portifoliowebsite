from boto3 import Session
from pytest_terraform import terraform


@terraform("tests", scope="session")
def test_db(tests):
    assert tests["aws_db_instance.maindb.identifier"] == "main-db"


@terraform("tests", scope="session")
def test_secretmanager(tests):
    assert tests["aws_secretsmanager_secret.dbsecretmaster.name"] == "AppSecrets"
    assert tests["aws_secretsmanager_secret.dbsecretmaster.tags"] == {"Env": "Production"}


@terraform("tests", scope="session")
def test_vpc(tests):
    assert tests["aws_vpc.main.cidr_block"] == "10.0.0.0/16"
    assert tests["aws_internet_gateway.portfoliogw.tags"] == {"Name": "PortfolioGateway"}
