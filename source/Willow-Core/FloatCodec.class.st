"
I'm an encoder/decoder of floats
"
Class {
	#name : #FloatCodec,
	#superclass : #Codec,
	#category : #'Willow-Core-Frontend'
}

{ #category : #testing }
FloatCodec >> canCreate: anObject [

	^anObject isNumber
]

{ #category : #converting }
FloatCodec >> decode: aString [

	| number |

	number := Float
		readFrom: aString
		ifFail: [ InstanceCreationFailed signal: ( '<1s> is not a decimal number' expandMacrosWith: aString ) ].
	^ number
]

{ #category : #converting }
FloatCodec >> encode: aNumber [

	^ aNumber asFloat greaseString
]
