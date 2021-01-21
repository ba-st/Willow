"
An ISOTimeCodecTest is a test class for testing the behavior of ISOTimeCodec
"
Class {
	#name : #ISOTimeCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'private - asserting' }
ISOTimeCodecTest >> should: aBlock failBecause: anExplanation [

	self should: aBlock raise: InstanceCreationFailed withMessageText: anExplanation
]

{ #category : #tests }
ISOTimeCodecTest >> testCanCreate [

	self
		deny: ( ISOTimeCodec new canCreate: Date today );
		deny: ( ISOTimeCodec new canCreate: '11.03.55' )
]

{ #category : #tests }
ISOTimeCodecTest >> testCantDecodeTime [

	self
		should: [ ISOTimeCodec new decode: '25:03:55' ]
			failBecause: 'The hour must be an integer between 0 and 23';
		should: [ ISOTimeCodec new decode: '11:60:55' ]
			failBecause: 'The minute must be an integer between 0 and 59';
		should: [ ISOTimeCodec new decode: '11:03:60' ]
			failBecause: 'The second must be an integer between 0 and 59';
		should: [ ISOTimeCodec new decode: '1:03:55' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '11:3:55' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '11:03:5' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '11:3:5' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '1:03:5' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '1:3:55' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '1:3:5' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '11 03 55' ] failBecause: 'Invalid separator. Invalid separator';
		should: [ ISOTimeCodec new decode: '11.03.55' ] failBecause: 'Invalid separator. Invalid separator';
		should: [ ISOTimeCodec new decode: '11,03,55' ] failBecause: 'Invalid separator. Invalid separator';
		should: [ ISOTimeCodec new decode: '11:03:55 AM' ] failBecause: 'Invalid time format';
		should: [ ISOTimeCodec new decode: '11:03:55 PM' ] failBecause: 'Invalid time format'
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
