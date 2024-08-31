from testing import assert_equal

fn health() raises -> None:
    # TODO check character encoding
    var character_expected = "a"
    var number_expected = 97
    var number_output = ord(character_expected)
    assert_equal(number_output, number_expected, "character maps to wrong number")
    var character_output = chr(number_output)
    assert_equal(character_output, character_expected, "number maps to wrong character")
