from pathlib import Path

import pytest
import tftest


@pytest.fixture
def plan():
    file_path = Path(__file__).resolve()
    print(file_path)
    base_dir = file_path.parent.absolute()

    print(base_dir)
    tf = tftest.TerraformTest(tfdir="./", basedir=base_dir)
    # tf = tftest.TerraformTest("plan",fixtures_dir)
    # tf.setup()

    # print(tf)
    return tf.plan(output=True)


def test_modules(plan):
    mod = plan.modules["module.networking"]
    res = mod.resources["aws_vpc.main"]
    print(res)
