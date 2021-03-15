"
I'm a WebInteractionCommand allowing to put the focus in a component
"
Class {
	#name : #ComponentFocusingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'componentProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ComponentFocusingCommand class >> findingComponentUsing: aComponentProvider [

	^ self new initializeFindingComponentUsing: aComponentProvider
]

{ #category : #'instance creation' }
ComponentFocusingCommand class >> for: anIdentifiedView [

	^ self findingComponentUsing: [ :aCanvas | aCanvas locate: anIdentifiedView ]
]

{ #category : #initialization }
ComponentFocusingCommand >> initializeFindingComponentUsing: aComponentProvider [

	componentProvider := aComponentProvider
]

{ #category : #accessing }
ComponentFocusingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | ( componentProvider value: aCanvas ) triggerFocus ]
		orderedAt: 20
]

{ #category : #accessing }
ComponentFocusingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ComponentFocusingCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
ComponentFocusingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
