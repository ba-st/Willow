"
A command to set the name of a component.
"
Class {
	#name : #ComponentNamingCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'name'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'Instance Creation' }
ComponentNamingCommand class >> assigning: aName [

	^self new initializeAssigning: aName
]

{ #category : #processing }
ComponentNamingCommand >> applyTo: aComponent on: aCanvas [

	aComponent name: name
]

{ #category : #initialization }
ComponentNamingCommand >> initializeAssigning: aName [

	name := aName
]
