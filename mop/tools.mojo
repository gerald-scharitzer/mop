from testing import assert_equal

fn health() raises -> None:
	# TODO check character encoding plus - and _
	var digits = List( # TODO alias crashes
		"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
	)
	assert_equal(len(digits), 10) # 10 digits
	check_encoding(digits, 48)

	var capital_letters = List( # TODO alias crashes
		"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
		"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
	)
	assert_equal(len(capital_letters), 26) # 26 capital letters
	check_encoding(capital_letters, 65)

	var small_letters = List( # TODO alias crashes
		"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
		"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
	)
	assert_equal(len(small_letters), 26) # 26 small letters
	check_encoding(small_letters, 97)
	# TODO tuples cannot be subscripted or iterated over

fn check_encoding(chars: List[StringLiteral], index: Int) raises -> None:
	var code_expected = index
	for char in chars:
		var char_expected = char[]
		var code = ord(char_expected)
		assert_equal(code, code_expected, "character maps to wrong number")
		var char_out = chr(code)
		assert_equal(char_out, char_expected, "number maps to wrong character")
		code_expected += 1
