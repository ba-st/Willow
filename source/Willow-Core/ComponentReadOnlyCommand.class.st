"
A command to mark a component as read-only.
"
Class {
	#name : #ComponentReadOnlyCommand,
	#superclass : #WebComponentCommand,
	#category : #'Willow-Core-Frontend'
}

{ #category : #processing }
ComponentReadOnlyCommand >> applyTo: aComponent on: aCanvas [

	aComponent readonly: true
]
