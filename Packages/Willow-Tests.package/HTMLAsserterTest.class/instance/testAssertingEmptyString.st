tests
testAssertingEmptyString

	self
		should: [ HTMLAsserter new assertIsValidIdentifier: '' ]
		raise: AssertionFailed
		withExceptionDo: [ :exception | self assert: exception messageText equals: 'An id attribute can''t be empty' ]