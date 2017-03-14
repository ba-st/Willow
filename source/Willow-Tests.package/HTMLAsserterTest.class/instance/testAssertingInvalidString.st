tests
testAssertingInvalidString

	self
		should: [ HTMLAsserter new assertIsValidIdentifier: '1/aaa' ]
		raise: AssertionFailed
		withExceptionDo:
			[ :exception | self assert: exception messageText equals: 'An id attribute must begin with a letter. The id contains an unsafe character' ]