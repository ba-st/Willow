"
I'm an abstract class representing a text coder/encoder.
"
Class {
	#name : #Codec,
	#superclass : #Object,
	#category : #'Willow-Frontend'
}

{ #category : #testing }
Codec >> canCreate: anObject [

	^self subclassResponsibility
]

{ #category : #converting }
Codec >> decode: aString [

	^ self subclassResponsibility
]

{ #category : #converting }
Codec >> encode: anObject [

	^ self subclassResponsibility
]
