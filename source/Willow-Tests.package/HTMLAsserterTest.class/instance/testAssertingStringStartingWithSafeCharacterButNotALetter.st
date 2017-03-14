tests
testAssertingStringStartingWithSafeCharacterButNotALetter

	self
		should: [ HTMLAsserter new assertIsValidIdentifier: '1id' ]
		raise: AssertionFailed
		withExceptionDo:
			[ :exception | self assert: exception messageText equals: 'An id attribute must begin with a letter' ]