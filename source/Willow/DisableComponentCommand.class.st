"
Command to disable a component
"
Class {
	#name : #DisableComponentCommand,
	#superclass : #WebComponentCommand,
	#category : 'Willow-Frontend'
}

{ #category : #processing }
DisableComponentCommand >> applyTo: aComponent on: aCanvas [

	aComponent disabled
]
