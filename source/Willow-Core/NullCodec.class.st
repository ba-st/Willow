"
I'm a null encoder/decoder
"
Class {
	#name : #NullCodec,
	#superclass : #Codec,
	#category : #'Willow-Core-Frontend'
}

{ #category : #testing }
NullCodec >> canCreate: anObject [

	^anObject isString
]

{ #category : #converting }
NullCodec >> decode: aString [

	^ aString
]

{ #category : #converting }
NullCodec >> encode: aString [

	^aString
]
