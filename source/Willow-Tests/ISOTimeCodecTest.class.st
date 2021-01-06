"
A ISOTimeCodecTest is a test class for testing the behavior of ISOTimeCodec
"
Class {
	#name : #ISOTimeCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #tests }
ISOTimeCodecTest >> testCanCreate [

	self
		assert: ( ISOTimeCodec new canCreate: Time now );
		deny: ( ISOTimeCodec new canCreate: Date today );
		deny: ( ISOTimeCodec new canCreate: '11.03.55' )
]

{ #category : #tests }
ISOTimeCodecTest >> testCantDecodeTime [

	self
		should: [ ISOTimeCodec new decode: '25:03:55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:60:55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:03:60' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '1:03:55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:3:55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:03:5' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:3:5' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '1:03:5' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '1:3:55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '1:3:5' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11 03 55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11.03.55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11,03,55' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:03:55 AM' ] raise: InstanceCreationFailed;
		should: [ ISOTimeCodec new decode: '11:03:55 PM' ] raise: InstanceCreationFailed
]

{ #category : #tests }
ISOTimeCodecTest >> testDecode [

	self
		assert: ( ISOTimeCodec new decode: '11:03:55' )
		equals: ( Time hour: 11 minute: 03 second: 55 )
]

{ #category : #tests }
ISOTimeCodecTest >> testEncode [

	self
		assert: ( ISOTimeCodec new encode: ( Time hour: 11 minute: 03 second: 55 ) )
		equals: '11:03:55'
]
