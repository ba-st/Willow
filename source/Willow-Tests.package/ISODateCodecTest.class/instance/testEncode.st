tests
testEncode

	self assert: (ISODateCodec new encode: (Date newDay: 11 month: 12 year: 2010)) equals: '2010-12-11'