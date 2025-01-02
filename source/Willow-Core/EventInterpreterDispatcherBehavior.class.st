Class {
	#name : 'EventInterpreterDispatcherBehavior',
	#superclass : 'Object',
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'configuring' }
EventInterpreterDispatcherBehavior >> change [

	^ self eventNamed: #change
]

{ #category : 'configuring' }
EventInterpreterDispatcherBehavior >> click [

	^ self eventNamed: #click
]

{ #category : 'configuring' }
EventInterpreterDispatcherBehavior >> eventNamed: anEventName [

	^ self subclassResponsibility
]

{ #category : 'configuring' }
EventInterpreterDispatcherBehavior >> keyUp [

	^ self eventNamed: #keyup
]

{ #category : 'configuring' }
EventInterpreterDispatcherBehavior >> mouseOver [

	^ self eventNamed: #mouseover
]

{ #category : 'configuring' }
EventInterpreterDispatcherBehavior >> trigger [

	^ self subclassResponsibility
]
