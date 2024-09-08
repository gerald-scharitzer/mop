from testing import assert_equal

from mop import VERSION

fn test_version() raises -> None:
	assert_equal(VERSION, "0.2.0-dev0")
