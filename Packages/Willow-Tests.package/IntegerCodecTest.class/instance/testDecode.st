tests
testDecode

	self
		assert: (IntegerCodec new decode: '0') equals: 0;
		assert: (IntegerCodec new decode: '-1') equals: -1;
		assert: (IntegerCodec new decode: '99') equals: 99;
		assert: (IntegerCodec new decode: 'frula') equals: 0