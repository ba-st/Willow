"
I'm a WebInteractionCommand that scrolls the web page so that a specific component is visible.
"
Class {
	#name : #ScrollIntoViewCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'identifierProvider'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #'instance creation' }
ScrollIntoViewCommand class >> withComponentIdentifierProvidedBy: anIdentifierProvider [

	^self new
		initializeWithComponentIdentifierProvidedBy: anIdentifierProvider
]

{ #category : #accessing }
ScrollIntoViewCommand >> clientIndependentActions [

	^#()
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
ScrollIntoViewCommand >> modelLoadingActions [

	^ Array
		with: [ :aScript :aCanvas | 
			aScript << (aCanvas jQuery id: self identifierToShow)
				each: ((aCanvas jQuery this property: 0) call: 'scrollIntoView') ]
]

{ #category : #accessing }
ScrollIntoViewCommand >> priorityActions [

	^#()
]

{ #category : #testing }
ScrollIntoViewCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ScrollIntoViewCommand >> serverIndependentActions [

	^#()
]
