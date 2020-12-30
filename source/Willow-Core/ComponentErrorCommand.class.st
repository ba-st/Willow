"
Command to determine behavior when a component signals an error (using onError:).
"
Class {
	#name : #ComponentErrorCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'actionProvider'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
ComponentErrorCommand class >> toActUsing: anActionProvider [

	^ self new initializeToActUsing: anActionProvider
]

{ #category : #processing }
ComponentErrorCommand >> applyTo: aComponent on: aCanvas [

	^ aComponent onError: (actionProvider value: aCanvas)
]

{ #category : #'initialize-release' }
ComponentErrorCommand >> initializeToActUsing: anActionProvider [

	actionProvider := anActionProvider
]
