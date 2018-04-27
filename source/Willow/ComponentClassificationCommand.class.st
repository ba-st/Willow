"
Command to add css styles to a component (using class:/classes:).
"
Class {
	#name : #ComponentClassificationCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'cssStyles'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'instance creation' }
ComponentClassificationCommand class >> toStyleWith: aCssStyle [

	^ self toStyleWithAll: (Array with: aCssStyle)
]

{ #category : #'instance creation' }
ComponentClassificationCommand class >> toStyleWithAll: aCssStyleCollection [

	^ self new initializeToStyleWithAll: aCssStyleCollection
]

{ #category : #processing }
ComponentClassificationCommand >> applyTo: aComponent on: aCanvas [

	^ aComponent classes: cssStyles
]

{ #category : #'initialize-release' }
ComponentClassificationCommand >> initializeToStyleWithAll: aCssStyleCollection [

	cssStyles := aCssStyleCollection
]
