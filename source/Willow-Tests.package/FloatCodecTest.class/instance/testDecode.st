tests
testDecode

	self
		assert: (FloatCodec new decode: '0.0') equals: 0.0;
		assert: (FloatCodec new decode: '-1.0') equals: -1.0;
		assert: (FloatCodec new decode: '99') equals: 99.0;
		assert: (FloatCodec new decode: '0.01') equals: 0.01;
		should: [FloatCodec new decode: 'xxx0.01'] raise: InstanceCreationFailed