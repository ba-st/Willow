tests
testCanCreate

	self
		assert: (IntegerCodec new canCreate: 0);
		assert: (IntegerCodec new canCreate: SmallInteger maxVal + 1);
		deny: (IntegerCodec new canCreate: '9');
		deny: (IntegerCodec new canCreate: 1.0);
		deny: (IntegerCodec new canCreate: 1 / 2)