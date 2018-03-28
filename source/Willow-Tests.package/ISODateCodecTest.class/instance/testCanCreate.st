tests
testCanCreate

	self
		assert: (ISODateCodec new canCreate: Date today);
		deny: (ISODateCodec new canCreate: Time now);
		deny: (ISODateCodec new canCreate: '01/01/2001')