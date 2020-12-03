"
An IntegerCodecTest is a test class for testing the behavior of IntegerCodec
"
Class {
	#name : #IntegerCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #tests }
IntegerCodecTest >> testCanCreate [

	self
		assert: (IntegerCodec new canCreate: 0);
		assert: (IntegerCodec new canCreate: SmallInteger maxVal + 1);
		deny: (IntegerCodec new canCreate: '9');
		deny: (IntegerCodec new canCreate: 1.0);
		deny: (IntegerCodec new canCreate: 1 / 2)
]

{ #category : #tests }
IntegerCodecTest >> testDecode [

	self
		assert: (IntegerCodec new decode: '0') equals: 0;
		assert: (IntegerCodec new decode: '-1') equals: -1;
		assert: (IntegerCodec new decode: '99') equals: 99;
		assert: (IntegerCodec new decode: 'frula') equals: 0
]

{ #category : #tests }
IntegerCodecTest >> testEncode [

	self
		assert: (IntegerCodec new encode: 0) equals: '0';
		assert: (IntegerCodec new encode: -1) equals: '-1';
		assert: (IntegerCodec new encode: 99) equals: '99'
]
