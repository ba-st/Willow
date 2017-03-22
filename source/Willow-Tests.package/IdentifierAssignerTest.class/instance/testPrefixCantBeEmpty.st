test
testPrefixCantBeEmpty

	self should: [ IdentifierAssigner prefixedBy: '' ] raise: InstanceCreationFailed withExceptionDo: [ :error | self assert: error messageText equals: 'The supplied prefix cannot be empty' ]