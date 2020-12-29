Class {
	#name : #EventInterpreterDispatcher,
	#superclass : #EventInterpreterDispatcherBehavior,
	#instVars : [
		'interactionsByEvent',
		'interpretersByEvent',
		'defaultInterpreter'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToChange [

	^ self interpretingByDefault: #change configuring: ( self interpreterSending: #change )
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToChangeHidden [

	^ self
		interpretingByDefault: #change
		configuring:
			( WebInteractionInterpreter
				calling: #change
				serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs )
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToClick [

	^ self interpretingByDefault: #click configuring: ( self interpreterSending: #click )
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToClickHidden [

	^ self
		interpretingByDefault: #click
		configuring:
			( WebInteractionInterpreter
				calling: #click
				serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs )
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToKeyUp [

	^ self interpretingByDefault: #keyup configuring: ( self interpreterSending: #keyup )
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> interpreterSending: anEventName [

	| serializationCommand |

	"Users can always manually add a serialization command to the interaction collaboration if the situation requires it."
	serializationCommand := ( #(change keyup) includes: anEventName )
		then: [ SerializationCommand forCurrentObject ]
		otherwise: NullWebInteractionCommand new.

	^ WebInteractionInterpreter calling: anEventName serializingWith: serializationCommand
]

{ #category : #'private - instance creation' }
EventInterpreterDispatcher class >> interpretingByDefault: anEventName configuring: aWebInteractionInterpreter [

	^ self new initializeInterpretingByDefault: anEventName configuring: aWebInteractionInterpreter
]

{ #category : #evaluating }
EventInterpreterDispatcher >> applyTo: aComponent on: aCanvas [

	interpretersByEvent
		keysAndValuesDo: [ :event :interpreter | interpreter applyTo: aComponent on: aCanvas ]
]

{ #category : #configuring }
EventInterpreterDispatcher >> change [

	^ self eventNamed: #change
]

{ #category : #configuring }
EventInterpreterDispatcher >> click [

	^ self eventNamed: #click
]

{ #category : #configuring }
EventInterpreterDispatcher >> eventNamed: anEventName [

	^ interpretersByEvent at: anEventName ifAbsentPut: [ self class interpreterSending: anEventName ]
]

{ #category : #initialization }
EventInterpreterDispatcher >> initializeInterpretingByDefault: anEventName configuring: aWebInteractionInterpreter [

	defaultInterpreter := aWebInteractionInterpreter.
	interpretersByEvent := Dictionary new.
	interpretersByEvent at: anEventName put: aWebInteractionInterpreter
]

{ #category : #configuring }
EventInterpreterDispatcher >> keyUp [

	^ self eventNamed: #keyup
]

{ #category : #configuring }
EventInterpreterDispatcher >> mouseOver [

	^ self eventNamed: #mouseover
]

{ #category : #configuring }
EventInterpreterDispatcher >> trigger [

	^ defaultInterpreter
]
