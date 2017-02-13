tests-Asserting
testAssertIsValidIdentifier

	self shouldnt: [ HTMLAsserter new assertIsValidIdentifier: 'id-1_more.1.0' ] raise: AssertionFailed