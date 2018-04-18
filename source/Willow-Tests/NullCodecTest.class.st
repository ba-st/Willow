"
An NullCodecTest is a test class for testing the behavior of NullCodec
"
Class {
	#name : #NullCodecTest,
	#superclass : #TestCase,
	#category : 'Willow-Tests-Frontend'
}

{ #category : #tests }
NullCodecTest >> testCanCreate [

	self
		assert: (NullCodec new canCreate: '0');
		assert: (NullCodec new canCreate: 'hello');
		deny: (NullCodec new canCreate: 0)
]

{ #category : #tests }
NullCodecTest >> testDecode [

	self
		assert: (NullCodec new decode: '0') equals: '0';
		assert: (NullCodec new decode: 'hello') equals: 'hello'
]

{ #category : #tests }
NullCodecTest >> testEncode [

	self
		assert: (NullCodec new encode: '0') equals: '0';
		assert: (NullCodec new encode: 'hello') equals: 'hello'
]
