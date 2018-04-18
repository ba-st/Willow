"
Command to configure maximum length of an input field
"
Class {
	#name : #InputFieldMaxLengthCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'maxLength'
	],
	#category : 'Willow-Frontend'
}

{ #category : #'Instance Creation' }
InputFieldMaxLengthCommand class >> allowingUpTo: anAmount [

	^self new initializeAllowingUpTo: anAmount
]

{ #category : #processing }
InputFieldMaxLengthCommand >> applyTo: aComponent on: aCanvas [

	aComponent maxLength: maxLength
]

{ #category : #initialization }
InputFieldMaxLengthCommand >> initializeAllowingUpTo: anAmount [

	maxLength := anAmount
]
