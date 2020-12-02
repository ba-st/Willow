"
I'm a Web Interaction Command used to render again the contents of an IdentifedWebView .
"
Class {
	#name : #RenderingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'renderingCondition',
		'identifiedViews'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'private - preconditions' }
RenderingCommand class >> assertInitializationOfAll: anIdentifiedViewCollection [

	anIdentifiedViewCollection
		do:
			[ :anIdentifiedView | anIdentifiedView ifNil: [ self error: 'View initialization order is incorrect, please review' ] ]
]

{ #category : #'instance creation' }
RenderingCommand class >> for: anIdentifiedView [

	^ self forAll: ( Array with: anIdentifiedView )
]

{ #category : #'instance creation' }
RenderingCommand class >> forAll: anIdentifiedViewCollection [

	self assertInitializationOfAll: anIdentifiedViewCollection.

	^ self new initializeRenderingAll: anIdentifiedViewCollection
]

{ #category : #initialization }
RenderingCommand >> initializeRenderingAll: anIdentifiedViewCollection [

	identifiedViews  := anIdentifiedViewCollection
]

{ #category : #accessing }
RenderingCommand >> modelLoadingActions [

	^ identifiedViews
		collect: [ :identifiedView | 
			[ :aCanvas | 
			identifiedView identifyIn: aCanvas.
			( aCanvas jQuery id: identifiedView identifier ) html: identifiedView view
			]
			]
]

{ #category : #accessing }
RenderingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
RenderingCommand >> requiresSerialization [

	^ true
]

{ #category : #accessing }
RenderingCommand >> serverIndependentActions [

	^ #()
]
