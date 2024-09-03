from testing import assert_equal

fn health() raises -> None:
    # TODO check character encoding
    var code_expected: Int

    var digits = List( # TODO alias crashes
        "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
    )
    assert_equal(len(digits), 10) # 10 digits
    code_expected = 48
    for char in digits:
        var code = ord(char[])
        assert_equal(code, code_expected, "character maps to wrong number")
        code_expected += 1

    var capital_letters = List( # TODO alias crashes
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
        "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
    )
    assert_equal(len(capital_letters), 26) # 26 capital letters
    code_expected = 65
    for char in capital_letters:
        var code = ord(char[])
        assert_equal(code, code_expected, "character maps to wrong number")
        code_expected += 1

    var small_letters = List( # TODO alias crashes
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
        "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    )
    assert_equal(len(small_letters), 26) # 26 small letters
    code_expected = 97
    for char in small_letters:
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
