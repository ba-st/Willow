tests
testEncode

	self
		assert: (NullCodec new encode: '0') equals: '0';
		assert: (NullCodec new encode: 'hello') equals: 'hello'