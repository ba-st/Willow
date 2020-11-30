"
I'm an encoder/decoder of natural numbers
"
Class {
	#name : #NaturalNumberCodec,
	#superclass : #Codec,
	#category : #'Willow-Core-Frontend'
}

{ #category : #testing }
NaturalNumberCodec >> canCreate: anObject [

	^anObject isInteger and: [anObject positive]
]

{ #category : #converting }
NaturalNumberCodec >> decode: aString [

	| number |

	number := Integer
		readFrom: aString
		ifFail: [ InstanceCreationFailed signal: ( '<1s> is not a natural number' expandMacrosWith: aString ) ].
	AssertionChecker
		enforce: [ number positive ]
		because: [ '<1s> is not a natural number' expandMacrosWith: aString ]
		raising: InstanceCreationFailed.
	^ number
]

{ #category : #converting }
NaturalNumberCodec >> encode: aNaturalNumber [

	^aNaturalNumber greaseString
]
