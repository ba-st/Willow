"
Command to remove a component for the tab cycle
"
Class {
	#name : #DisableComponentTabCycleCommand,
	#superclass : #WebComponentCommand,
	#category : 'Willow-Frontend'
}

{ #category : #processing }
DisableComponentTabCycleCommand >> applyTo: aComponent on: aCanvas [

	aComponent tabIndex: -1
]
