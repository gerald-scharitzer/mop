from testing import assert_equal

from mop import VERSION

def test_version():
	assert_equal(VERSION, "0.0-dev0")