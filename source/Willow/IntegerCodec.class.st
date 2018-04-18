"
I'm an encoder/decoder of integers
"
Class {
	#name : #IntegerCodec,
	#superclass : #Codec,
	#category : 'Willow-Frontend'
}

{ #category : #testing }
IntegerCodec >> canCreate: anObject [

	^anObject isInteger
]

{ #category : #converting }
IntegerCodec >> decode: aString [

	^ aString greaseInteger ifNil: [ 0 ]
]

{ #category : #converting }
IntegerCodec >> encode: anInteger [

	^ anInteger greaseString
]
