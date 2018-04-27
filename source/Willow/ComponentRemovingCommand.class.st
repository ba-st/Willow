"
I'm a WebInteractionCommand allowing to remove a component
"
Class {
	#name : #ComponentRemovingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'identifiedView'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #'instance creation' }
ComponentRemovingCommand class >> for: anIdentifiedView [

	^ self new initializeFor: anIdentifiedView
]

{ #category : #accessing }
ComponentRemovingCommand >> clientIndependentActions [

	^#()
]

{ #category : #'initialize-release' }
ComponentRemovingCommand >> initializeFor: anIdentifiedView [

	identifiedView := anIdentifiedView
]

{ #category : #accessing }
ComponentRemovingCommand >> modelLoadingActions [

	^ Array
		with: [ :aScript :aCanvas | 
			identifiedView identifyIn: aCanvas.
			aScript << (aCanvas jQuery id: identifiedView identifier) remove ]
]

{ #category : #accessing }
ComponentRemovingCommand >> priorityActions [

	^#()
]

{ #category : #testing }
ComponentRemovingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentRemovingCommand >> serverIndependentActions [

	^#()
]
