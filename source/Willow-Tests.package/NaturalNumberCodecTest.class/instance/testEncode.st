tests-converting
testEncode

	self
		assert: (NaturalNumberCodec new encode: 0) equals: '0';
		assert: (NaturalNumberCodec new encode: 99) equals: '99'