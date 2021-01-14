"
I'm a WebInteractionCommand allowing to remove a component
"
Class {
	#name : #ComponentRemovingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'identifiedView'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ComponentRemovingCommand class >> for: anIdentifiedView [

	^ self new initializeFor: anIdentifiedView
]

{ #category : #'initialize-release' }
ComponentRemovingCommand >> initializeFor: anIdentifiedView [

	identifiedView := anIdentifiedView
]

{ #category : #accessing }
ComponentRemovingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions directingTo: [ :aCanvas | ( aCanvas locate: identifiedView ) remove ]
]

{ #category : #accessing }
ComponentRemovingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ComponentRemovingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentRemovingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
