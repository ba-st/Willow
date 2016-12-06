test
testForcedAsNumber

	self
		assert: 3 forcedAsNumber equals: 3;
		assert: (1 / 3) forcedAsNumber equals: 1 / 3;
		assert: '21' forcedAsNumber equals: 21;
		assert: '33.5' forcedAsNumber equals: 33.5;
		assert: '-45' forcedAsNumber equals: -45;
		assert: '-45-6' forcedAsNumber equals: -45;
		assert: '33ed' forcedAsNumber isZero;
		assert: '4 6' forcedAsNumber isZero;
		assert: 'abc1' forcedAsNumber isZero;
		assert: '' forcedAsNumber isZero