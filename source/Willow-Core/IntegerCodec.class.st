"
I'm an encoder/decoder of integers
"
Class {
	#name : #IntegerCodec,
	#superclass : #Codec,
	#category : #'Willow-Core-Frontend'
}

{ #category : #testing }
IntegerCodec >> canCreate: anObject [

	^anObject isInteger
]

{ #category : #converting }
IntegerCodec >> decode: aString [

	^ aString greaseInteger ifNil: [ 0 ] ifNotNil: [ :integer | integer ]
]

{ #category : #converting }
IntegerCodec >> encode: anInteger [

	^ anInteger greaseString
]
