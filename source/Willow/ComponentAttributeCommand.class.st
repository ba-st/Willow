"
Command to set an attribute for a component
"
Class {
	#name : #ComponentAttributeCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'name',
		'value'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'Instance Creation' }
ComponentAttributeCommand class >> named: aName with: aValue [

	^self new initializeNamed: aName with: aValue
]

{ #category : #processing }
ComponentAttributeCommand >> applyTo: aComponent on: aCanvas [

	aComponent attributeAt: name put: value
]

{ #category : #initialization }
ComponentAttributeCommand >> initializeNamed: aName with: aValue [

	name := aName.
	value := aValue
]
