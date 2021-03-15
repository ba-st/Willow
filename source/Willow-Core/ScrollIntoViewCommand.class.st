"
I'm a WebInteractionCommand that scrolls the web page so that a specific component is visible.
"
Class {
	#name : #ScrollIntoViewCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'identifierProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ScrollIntoViewCommand class >> withComponentIdentifierProvidedBy: anIdentifierProvider [

	^self new
		initializeWithComponentIdentifierProvidedBy: anIdentifierProvider
]

{ #category : #'private - accessing' }
ScrollIntoViewCommand >> identifierToShow [

	^identifierProvider value
]

{ #category : #initialization }
ScrollIntoViewCommand >> initializeWithComponentIdentifierProvidedBy: anIdentifierProvider [

	identifierProvider := anIdentifierProvider
]

{ #category : #accessing }
ScrollIntoViewCommand >> modelLoadingInstructions [

	"We iterate the result before sending the scrolling message in case no match is found."

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | 
			( aCanvas jQuery id: self identifierToShow )
				each: ( ( aCanvas jQuery this get: 0 ) call: 'scrollIntoView' )
			]
		orderedAt: 20
]

{ #category : #accessing }
ScrollIntoViewCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ScrollIntoViewCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ScrollIntoViewCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
