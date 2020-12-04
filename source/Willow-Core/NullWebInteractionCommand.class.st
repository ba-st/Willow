"
I represent a null web interaction command, so no javascript is generated when applied.
"
Class {
	#name : #NullWebInteractionCommand,
	#superclass : #WebInteractionCommand,
	#classVars : [
		'OnlyInstance'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'class initialization' }
NullWebInteractionCommand class >> initialize [

	<ignoreForCoverage>
	OnlyInstance := super new
]

{ #category : #'instance creation' }
NullWebInteractionCommand class >> new [

	^ OnlyInstance
]

{ #category : #accessing }
NullWebInteractionCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
NullWebInteractionCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
NullWebInteractionCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
NullWebInteractionCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
