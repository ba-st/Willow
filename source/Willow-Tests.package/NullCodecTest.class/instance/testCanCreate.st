tests
testCanCreate

	self
		assert: (NullCodec new canCreate: '0');
		assert: (NullCodec new canCreate: 'hello');
		deny: (NullCodec new canCreate: 0)