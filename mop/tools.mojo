from testing import assert_equal

fn health() raises -> None:
    # TODO check character encoding
    var chars = List(
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
        "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    )
    assert_equal(len(chars), 26) # 26 lowercase characters
    var code_expected = 97
    for char in chars:
        var code = ord(char[])
        assert_equal(code, code_expected, "character maps to wrong number")
        code_expected += 1
    
    # TODO tuples cannot be subscripted or iterated over
    var character_expected = "a"
    var number_expected = 97
    var number_output = ord(character_expected)
    assert_equal(number_output, number_expected, "character maps to wrong number")
    var character_output = chr(number_output)
    assert_equal(character_output, character_expected, "number maps to wrong character")
