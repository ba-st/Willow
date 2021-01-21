"
A ISODateCodecTest is a test class for testing the behavior of ISODateCodec
"
Class {
	#name : #ISODateCodecTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'private - asserting' }
ISODateCodecTest >> should: aBlock failBecause: anExplanation [

	self should: aBlock raise: InstanceCreationFailed withMessageText: anExplanation
]

{ #category : #tests }
ISODateCodecTest >> testCanCreate [

	self
		assert: ( ISODateCodec new canCreate: Date today );
		deny: ( ISODateCodec new canCreate: Time now );
		deny: ( ISODateCodec new canCreate: '01/01/2001' )
]

{ #category : #tests }
ISODateCodecTest >> testCantDecodeDate [

	self
		should: [ ISODateCodec new decode: '2010-13-11' ] failBecause: 'There is no 13th month';
		should: [ ISODateCodec new decode: '2010-11-32' ] failBecause: 'day is after month ends';
		should: [ ISODateCodec new decode: '2017-02-29' ] failBecause: 'day is after month ends';
		should: [ ISODateCodec new decode: '1-10-11' ] failBecause: '';
		should: [ ISODateCodec new decode: '10-12-11' ] failBecause: '';
		should: [ ISODateCodec new decode: '010-12-11' ] failBecause: '';
		should: [ ISODateCodec new decode: '2010-13-11' ] failBecause: 'There is no 13th month';
		should: [ ISODateCodec new decode: '2010-1-11' ] failBecause: '';
		should: [ ISODateCodec new decode: '2010-11-1' ] failBecause: ' Expect a two digit day, got 1';
		should: [ ISODateCodec new decode: '2020/12/11' ] failBecause: ''
]

{ #category : #tests }
ISODateCodecTest >> testDecode [

	self
		assert: ( ISODateCodec new decode: '2010-12-11' )
		equals: ( Date newDay: 11 month: 12 year: 2010 )
]

{ #category : #tests }
ISODateCodecTest >> testEncode [

	self
		assert: ( ISODateCodec new encode: ( Date newDay: 11 month: 12 year: 2010 ) )
		equals: '2010-12-11'
]
