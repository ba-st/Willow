test
testIsA

	self
		assert: (self isA: TestCase);
		assert: (self isA: self class);
		assert: (self isAn: Object);
		deny: (self isA: Number);
		deny: (self isAn: Integer);
		deny: (self isA: Collection)