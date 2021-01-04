Class {
	#name : #EventInterpreterDispatcherBehavior,
	#superclass : #Object,
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #configuring }
EventInterpreterDispatcherBehavior >> change [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcherBehavior >> click [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcherBehavior >> eventNamed: anEventName [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcherBehavior >> keyUp [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcherBehavior >> mouseOver [

	^ self subclassResponsibility
]

{ #category : #configuring }
EventInterpreterDispatcherBehavior >> trigger [

	^ self subclassResponsibility
]
