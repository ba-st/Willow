"
I'm a WebInteractionCommand allowing to change the css class of a component, which can be done using a specific transformation.
"
Class {
	#name : #ComponentStyleClassChangingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'updatesProvider',
		'elementsProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ComponentStyleClassChangingCommand class >> applying: aCssClassConfigurationBlock targeting: anElementMatchingBlock [

	^ self new
		initializeApplying: aCssClassConfigurationBlock
		targeting: anElementMatchingBlock
]

{ #category : #private }
ComponentStyleClassChangingCommand >> applyStyleChangeTo: component [

	^ updatesProvider applyTo: component
]

{ #category : #private }
ComponentStyleClassChangingCommand >> componentOn: aCanvas [

	^ elementsProvider value: aCanvas
]

{ #category : #initialization }
ComponentStyleClassChangingCommand >> initializeApplying: aCssClassConfigurationBlock
	targeting: anElementMatchingBlock [

	updatesProvider := aCssClassConfigurationBlock cull: ComponentStyleClassUpdateBuilder new.
	elementsProvider := anElementMatchingBlock
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ComponentStyleClassChangingCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | self applyStyleChangeTo: ( self componentOn: aCanvas ) ]
]
