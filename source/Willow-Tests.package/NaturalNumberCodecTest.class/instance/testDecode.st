tests-converting
testDecode

	self
		assert: (NaturalNumberCodec new decode: '0') equals: 0;
		assert: (NaturalNumberCodec new decode: '99') equals: 99.

	self
		should: [ NaturalNumberCodec new decode: '-1' ] raise: InstanceCreationFailed;
		should: [ NaturalNumberCodec new decode: 'frula' ] raise: InstanceCreationFailed