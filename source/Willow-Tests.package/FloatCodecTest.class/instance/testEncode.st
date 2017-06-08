tests
testEncode

	self
		assert: (FloatCodec new encode: 0) equals: '0.0';
		assert: (FloatCodec new encode: -1) equals: '-1.0';
		assert: (FloatCodec new encode: 99) equals: '99.0';
		assert: (FloatCodec new encode: 0.01) equals: '0.01';
		assert: (FloatCodec new encode: -1.365) equals: '-1.365'