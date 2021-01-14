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

{ #category : #'instance creation' }
RenderingCommand class >> for: anIdentifiedView [

	^ self forAll: ( Array with: anIdentifiedView )
]

{ #category : #'instance creation' }
RenderingCommand class >> forAll: anIdentifiedViewCollection [

	^ self new initializeRenderingAll: anIdentifiedViewCollection
]

{ #category : #initialization }
RenderingCommand >> initializeRenderingAll: anIdentifiedViewCollection [

	anIdentifiedViewCollection do: #beIdentifiable.
	identifiedViews  := anIdentifiedViewCollection
]

{ #category : #accessing }
RenderingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | 
			identifiedViews
				collect: [ :identifiedView | ( aCanvas locate: identifiedView ) html: identifiedView renderableContent ]
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
RenderingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
