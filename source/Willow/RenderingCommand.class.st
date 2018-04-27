"
I'm a Web Interaction Command used to render again the contents of an IdentifedWebView .
"
Class {
	#name : #RenderingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'shouldRender',
		'renderingCondition',
		'identifiedViews'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #Preconditions }
RenderingCommand class >> assertInitializationOfAll: anIdentifiedViewCollection [
	anIdentifiedViewCollection do: [ :anIdentifiedView | anIdentifiedView ifNil: [ self error: 'View initialization order is incorrect, please review' ] ]
]

{ #category : #'instance creation' }
RenderingCommand class >> evaluating: aCallback asConditionToRender: anIdentifiedView [

	^self evaluating: aCallback asConditionToRenderAll: (Array with: anIdentifiedView)
]

{ #category : #'instance creation' }
RenderingCommand class >> evaluating: aCallback asConditionToRenderAll: anIdentifiedViewCollection [

	self assertInitializationOfAll: anIdentifiedViewCollection.

	^self new initializeEvaluating: aCallback asConditionToRenderAll: anIdentifiedViewCollection
]

{ #category : #'instance creation' }
RenderingCommand class >> for: anIdentifiedView [

	^self forAll: (Array with: anIdentifiedView)
]

{ #category : #'instance creation' }
RenderingCommand class >> forAll: anIdentifiedViewCollection [

	^self evaluating: [true] asConditionToRenderAll: anIdentifiedViewCollection
]

{ #category : #accessing }
RenderingCommand >> clientIndependentActions [

	^Array with: [shouldRender := renderingCondition value]
]

{ #category : #'initialize-release' }
RenderingCommand >> initializeEvaluating: aCallback asConditionToRenderAll: anIdentifiedViewCollection [

	shouldRender := true.
	renderingCondition := aCallback.
	identifiedViews  := anIdentifiedViewCollection
]

{ #category : #accessing }
RenderingCommand >> modelLoadingActions [

	^ Array
		with: [ :aScript :aCanvas | 
			shouldRender
				ifTrue: [ identifiedViews
						do: [ :identifiedView | 
							identifiedView identifyIn: aCanvas.
							aScript << (aCanvas jQuery id: identifiedView identifier) html: identifiedView view ] ] ]
]

{ #category : #accessing }
RenderingCommand >> priorityActions [

	^#()
]

{ #category : #testing }
RenderingCommand >> requiresSerialization [

	^true
]

{ #category : #accessing }
RenderingCommand >> serverIndependentActions [

	^#()
]
