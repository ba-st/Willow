"
A command to set a component as required, using the HTML5 attribute.
"
Class {
	#name : #ComponentRequiredCommand,
	#superclass : #WebComponentCommand,
	#category : #'Willow-Core-Frontend'
}

{ #category : #processing }
ComponentRequiredCommand >> applyTo: aComponent on: aCanvas [

	aComponent required
]
