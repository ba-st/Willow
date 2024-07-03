"
Command to force autofocus on rendering of a component.
"
Class {
	#name : 'AutoFocusComponentCommand',
	#superclass : 'WebComponentCommand',
	#category : 'Willow-Core-Frontend',
	#package : 'Willow-Core',
	#tag : 'Frontend'
}

{ #category : 'processing' }
AutoFocusComponentCommand >> applyTo: aComponent on: aCanvas [

	aComponent autofocus
]
