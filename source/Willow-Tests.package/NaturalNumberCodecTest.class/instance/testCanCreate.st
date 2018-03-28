tests-converting
testCanCreate

	self
		assert: (NaturalNumberCodec new canCreate: 0);
		assert: (NaturalNumberCodec new canCreate: 99);
		deny: (NaturalNumberCodec new canCreate: -1);
		deny: (NaturalNumberCodec new canCreate: 1.0);
		deny: (NaturalNumberCodec new canCreate: 1 / 2)