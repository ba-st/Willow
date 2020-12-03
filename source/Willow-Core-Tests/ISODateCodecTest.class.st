"
A ISODateCodecTest is a test class for testing the behavior of ISODateCodec
"
Class {
	#name : #ISODateCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #tests }
ISODateCodecTest >> testCanCreate [

	self
		assert: (ISODateCodec new canCreate: Date today);
		deny: (ISODateCodec new canCreate: Time now);
		deny: (ISODateCodec new canCreate: '01/01/2001')
]

{ #category : #tests }
ISODateCodecTest >> testCantDecodeDate [

	self
		should: [ ISODateCodec new decode: '2010-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-13-32' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2017-02-29' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '1-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '10-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '010-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-13-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-1-11' ] raise: InstanceCreationFailed;
		should: [ ISODateCodec new decode: '2010-13-1' ] raise: InstanceCreationFailed
]

{ #category : #tests }
ISODateCodecTest >> testDecode [

	self assert: (ISODateCodec new decode: '2010-12-11') equals: (Date newDay: 11 month: 12 year: 2010)
]

{ #category : #tests }
ISODateCodecTest >> testEncode [

	self assert: (ISODateCodec new encode: (Date newDay: 11 month: 12 year: 2010)) equals: '2010-12-11'
]
