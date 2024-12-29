Class {
	#name : 'CombinedEventInterpreterDispatcher',
	#superclass : 'EventInterpreterDispatcherBehavior',
	#instVars : [
		'eventInterpreterDispatchers'
	],
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'instance creation' }
CombinedEventInterpreterDispatcher class >> combiningAll: anEventInterpreterDispatcherCollection [

	^ self new initializeCombiningAll: anEventInterpreterDispatcherCollection
]

{ #category : 'instance creation' }
CombinedEventInterpreterDispatcher class >> combiningInterpretersOfAll: aWebViewCollection [

	^ self combiningAll: ( aWebViewCollection collect: #on )
]

{ #category : 'configuring' }
CombinedEventInterpreterDispatcher >> eventNamed: anEventName [

	^ CombinedWebInteractionInterpreter
		combining: ( eventInterpreterDispatchers collect: [ :dispatcher | dispatcher eventNamed: anEventName ] )
]

{ #category : 'initialization' }
CombinedEventInterpreterDispatcher >> initializeCombiningAll: anEventInterpreterDispatcherCollection [

	eventInterpreterDispatchers := anEventInterpreterDispatcherCollection
]

{ #category : 'configuring' }
CombinedEventInterpreterDispatcher >> trigger [

	^ CombinedWebInteractionInterpreter combining: ( eventInterpreterDispatchers collect: #trigger )
]
