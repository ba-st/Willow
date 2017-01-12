Asserting
assertIsValidIdentifier: candidate

	"http://stackoverflow.com/questions/70579/what-are-valid-values-for-the-id-attribute-in-html	
	ID and NAME tokens must begin with a letter [A-Za-z] and may be followed by any number of letters, digits [0-9], hyphens -, underscores _, colons :, and periods ."

	(candidate first isLetter and: [ candidate allSatisfy: [ :character | character isSafeForHTTP ] ])
		ifFalse: [ self error: ('Invalid identifier: <1s>' expandMacrosWith: candidate) ]