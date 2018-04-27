"
I'm an encoder/decoder of Dates
"
Class {
	#name : #ISODateCodec,
	#superclass : #Codec,
	#category : #'Willow-Frontend'
}

{ #category : #testing }
ISODateCodec >> canCreate: anObject [

	^anObject isA: Date
]

{ #category : #converting }
ISODateCodec >> decode: aString [

	^ [ Date readFrom: aString pattern: 'yyyy-mm-dd' ]
		on: DateError
		do: [ :error | InstanceCreationFailed signal: error messageText ]
]

{ #category : #converting }
ISODateCodec >> encode: aDate [

	^ GRPrinter isoDate print: aDate
]
