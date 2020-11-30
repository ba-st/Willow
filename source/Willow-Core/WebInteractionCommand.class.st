Class {
	#name : #WebInteractionCommand,
	#superclass : #Object,
	#pools : [
		'Willow'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #accessing }
WebInteractionCommand >> clientIndependentActions [

	self subclassResponsibility
]

{ #category : #accessing }
WebInteractionCommand >> modelLoadingActions [

	self subclassResponsibility
]

{ #category : #accessing }
WebInteractionCommand >> priorityActions [

	self subclassResponsibility
]

{ #category : #testing }
WebInteractionCommand >> requiresSerialization [

	self subclassResponsibility
]

{ #category : #accessing }
WebInteractionCommand >> serverIndependentActions [

	self subclassResponsibility
]
