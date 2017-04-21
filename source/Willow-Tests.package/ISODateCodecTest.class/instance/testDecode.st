tests
testDecode

	self assert: (ISODateCodec new decode: '2010-12-11') equals: (Date newDay: 11 month: 12 year: 2010)