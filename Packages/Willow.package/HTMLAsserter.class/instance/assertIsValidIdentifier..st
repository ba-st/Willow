Asserting
assertIsValidIdentifier: candidate

	"http://stackoverflow.com/questions/70579/what-are-valid-values-for-the-id-attribute-in-html	
	ID and NAME tokens must begin with a letter [A-Za-z] and may be followed by any number of letters, digits [0-9], hyphens -, underscores _, colons :, and periods ."

	AssertionCheckerBuilder new
		checking: [ :asserter | 
			asserter
				enforce: [ candidate notEmpty ]
					because: 'An id attribute can''t be empty'
					onSuccess: [ :successAsserter | successAsserter enforce: [ candidate first isLetter ] because: 'An id attribute must begin with a letter' ];
				enforce: [ candidate allSatisfy: [ :character | character isSafeForHTTP ] ] because: 'The id contains an unsafe character' ];
		buildAndCheck