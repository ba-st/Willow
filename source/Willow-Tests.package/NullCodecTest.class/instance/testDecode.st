tests
testDecode

	self
		assert: (NullCodec new decode: '0') equals: '0';
		assert: (NullCodec new decode: 'hello') equals: 'hello'