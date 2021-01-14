Class {
	#name : #CombinedEventInterpreterDispatcher,
	#superclass : #EventInterpreterDispatcherBehavior,
	#instVars : [
		'eventInterpreterDispatchers'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
CombinedEventInterpreterDispatcher class >> combiningAll: anEventInterpreterDispatcherCollection [

	^ self new initializeCombiningAll: anEventInterpreterDispatcherCollection
]

{ #category : #'instance creation' }
CombinedEventInterpreterDispatcher class >> combiningInterpretersOfAll: aWebViewCollection [

	^ self combiningAll: ( aWebViewCollection collect: #on )
]

{ #category : #configuring }
CombinedEventInterpreterDispatcher >> change [

	^ CombinedWebInteractionInterpreter combining: ( eventInterpreterDispatchers collect: #change )
]

{ #category : #configuring }
CombinedEventInterpreterDispatcher >> click [

	^ CombinedWebInteractionInterpreter combining: ( eventInterpreterDispatchers collect: #click )
]

{ #category : #configuring }
CombinedEventInterpreterDispatcher >> eventNamed: anEventName [

	^ CombinedWebInteractionInterpreter
		combining: ( eventInterpreterDispatchers collect: [ :dispatcher | dispatcher eventNamed: anEventName ] )
]

{ #category : #initialization }
CombinedEventInterpreterDispatcher >> initializeCombiningAll: anEventInterpreterDispatcherCollection [

	eventInterpreterDispatchers := anEventInterpreterDispatcherCollection
]

{ #category : #configuring }
CombinedEventInterpreterDispatcher >> keyUp [

	^ CombinedWebInteractionInterpreter combining: ( eventInterpreterDispatchers collect: #keyUp )
]

{ #category : #configuring }
CombinedEventInterpreterDispatcher >> mouseOver [

	^ CombinedWebInteractionInterpreter combining: ( eventInterpreterDispatchers collect: #mouseOver )
]

{ #category : #configuring }
CombinedEventInterpreterDispatcher >> trigger [

	^ CombinedWebInteractionInterpreter combining: ( eventInterpreterDispatchers collect: #trigger )
]
