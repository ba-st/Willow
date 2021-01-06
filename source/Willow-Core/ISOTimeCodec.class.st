"
I'm an encoder/decoder of Times
"
Class {
	#name : #ISOTimeCodec,
	#superclass : #Codec,
	#category : #'Willow-Core-Frontend'
}

{ #category : #'private - preconditions' }
ISOTimeCodec >> assertIsValidHour: aPotentialHour [

	AssertionChecker
		enforce: [ aPotentialHour between: 0 and: 23 ]
		because: 'The hour must be an integer between 0 and 23'
		raising: InstanceCreationFailed
]

{ #category : #'private - preconditions' }
ISOTimeCodec >> assertIsValidMinute: aPotentialMinute [

	AssertionChecker
		enforce: [ aPotentialMinute between: 0 and: 59 ]
		because: 'The minute must be an integer between 0 and 59'
		raising: InstanceCreationFailed
]

{ #category : #'private - preconditions' }
ISOTimeCodec >> assertIsValidSecond: aPotentialSecond [

	AssertionChecker
		enforce: [ aPotentialSecond between: 0 and: 59 ]
		because: 'The second must be an integer between 0 and 59'
		raising: InstanceCreationFailed
]

{ #category : #'private - preconditions' }
ISOTimeCodec >> canCreate: anObject [

	^ anObject isA: Time
]

{ #category : #'private - preconditions' }
ISOTimeCodec >> decode: aString [

	| hour minute second |

	AssertionCheckerBuilder new
		raising: InstanceCreationFailed;
		checking: [ :asserter | 
			asserter
				enforce: [ aString size = 8 ]
				because: 'Invalid time format'
				onSuccess: [ :successAsserter | 
					successAsserter
						enforce: [ ( aString at: 3 ) = $: ] because: 'Invalid separator';
						enforce: [ ( aString at: 6 ) = $: ] because: 'Invalid separator'
					]
			];
		buildAndCheck.

	hour := self readIntegerFrom: ( aString copyFirst: 2 ).
	minute := self readIntegerFrom: ( aString copyFrom: 4 to: 5 ).
	second := self readIntegerFrom: ( aString copyFrom: 7 to: 8 ).

	self
		assertIsValidHour: hour;
		assertIsValidMinute: minute;
		assertIsValidSecond: second.

	^ Time hour: hour minute: minute second: second
]

{ #category : #'private - preconditions' }
ISOTimeCodec >> encode: aTime [

	^ GRPrinter isoTime print: aTime
]

{ #category : #'private - parsing' }
ISOTimeCodec >> readIntegerFrom: aString [

	^ Integer
		readFrom: aString
		ifFail: [ :errorDescription :position | InstanceCreationFailed signal: errorDescription ]
]
