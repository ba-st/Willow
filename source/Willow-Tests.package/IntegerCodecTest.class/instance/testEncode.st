tests
testEncode

	self
		assert: (IntegerCodec new encode: 0) equals: '0';
		assert: (IntegerCodec new encode: -1) equals: '-1';
		assert: (IntegerCodec new encode: 99) equals: '99'