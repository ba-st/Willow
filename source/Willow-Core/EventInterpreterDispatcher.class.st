Class {
	#name : #EventInterpreterDispatcher,
	#superclass : #Object,
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #testing }
EventInterpreterDispatcher class >> isAbstract [

	^ self = EventInterpreterDispatcher
]

{ #category : #configuring }
EventInterpreterDispatcher >> change [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcher >> click [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcher >> eventNamed: anEventName [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcher >> keyUp [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcher >> mouseOver [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcher >> trigger [

	^ self subclassResponsibility
]
