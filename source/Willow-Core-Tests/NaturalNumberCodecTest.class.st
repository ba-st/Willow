"
A NaturalNumberCodecTest is a test class for testing the behavior of NaturalNumberCodec
"
Class {
	#name : #NaturalNumberCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-converting' }
NaturalNumberCodecTest >> testCanCreate [

	self
		assert: (NaturalNumberCodec new canCreate: 0);
		assert: (NaturalNumberCodec new canCreate: 99);
		deny: (NaturalNumberCodec new canCreate: -1);
		deny: (NaturalNumberCodec new canCreate: 1.0);
		deny: (NaturalNumberCodec new canCreate: 1 / 2)
]

{ #category : #'tests-converting' }
NaturalNumberCodecTest >> testDecode [

	self
		assert: (NaturalNumberCodec new decode: '0') equals: 0;
		assert: (NaturalNumberCodec new decode: '99') equals: 99.

	self
		should: [ NaturalNumberCodec new decode: '-1' ] raise: InstanceCreationFailed;
		should: [ NaturalNumberCodec new decode: 'frula' ] raise: InstanceCreationFailed
]

{ #category : #'tests-converting' }
NaturalNumberCodecTest >> testEncode [

	self
		assert: (NaturalNumberCodec new encode: 0) equals: '0';
		assert: (NaturalNumberCodec new encode: 99) equals: '99'
]
