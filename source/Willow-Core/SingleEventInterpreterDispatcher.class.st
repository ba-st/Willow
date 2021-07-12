Class {
	#name : #SingleEventInterpreterDispatcher,
	#superclass : #EventInterpreterDispatcher,
	#instVars : [
		'interpretersByEvent',
		'defaultInterpreter'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
SingleEventInterpreterDispatcher class >> defaultingToChange [

	^ self interpretingByDefault: #change configuring: ( self interpreterSending: #change )
]

{ #category : #'instance creation' }
SingleEventInterpreterDispatcher class >> defaultingToChangeHidden [

	^ self
		interpretingByDefault: #change
		configuring:
			( WebInteractionInterpreter
				calling: #change
				serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs )
]

{ #category : #'instance creation' }
SingleEventInterpreterDispatcher class >> defaultingToClick [

	^ self interpretingByDefault: #click configuring: ( self interpreterSending: #click )
]

{ #category : #'instance creation' }
SingleEventInterpreterDispatcher class >> defaultingToClickHidden [

	^ self
		interpretingByDefault: #click
		configuring:
			( WebInteractionInterpreter
				calling: #click
				serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs )
]

{ #category : #'private - accessing' }
SingleEventInterpreterDispatcher class >> interpreterSending: anEventName [

	| serializationCommand |

	"Users can always manually add a serialization command to the interaction collaboration if the situation requires it."
	serializationCommand := ( #(change keyup) includes: anEventName )
		then: [ SerializationCommand forCurrentObject ]
		otherwise: NullWebInteractionCommand new.

	^ WebInteractionInterpreter calling: anEventName serializingWith: serializationCommand
]

{ #category : #'private - instance creation' }
SingleEventInterpreterDispatcher class >> interpretingByDefault: anEventName configuring: aWebInteractionInterpreter [

	^ self new initializeInterpretingByDefault: anEventName configuring: aWebInteractionInterpreter
]

{ #category : #evaluating }
SingleEventInterpreterDispatcher >> applyTo: aComponent on: aCanvas [

	interpretersByEvent
		keysAndValuesDo: [ :event :interpreter | interpreter applyTo: aComponent on: aCanvas ]
]

{ #category : #configuring }
SingleEventInterpreterDispatcher >> change [

	^ self eventNamed: #change
]

{ #category : #configuring }
SingleEventInterpreterDispatcher >> click [

	^ self eventNamed: #click
]

{ #category : #configuring }
SingleEventInterpreterDispatcher >> eventNamed: anEventName [

	^ interpretersByEvent at: anEventName ifAbsentPut: [ self class interpreterSending: anEventName ]
]

{ #category : #initialization }
SingleEventInterpreterDispatcher >> initializeInterpretingByDefault: anEventName configuring: aWebInteractionInterpreter [

	defaultInterpreter := aWebInteractionInterpreter.
	interpretersByEvent := Dictionary new.
	interpretersByEvent at: anEventName put: aWebInteractionInterpreter
]

{ #category : #configuring }
SingleEventInterpreterDispatcher >> keyUp [

	^ self eventNamed: #keyup
]

{ #category : #configuring }
SingleEventInterpreterDispatcher >> mouseOver [

	^ self eventNamed: #mouseover
]

{ #category : #configuring }
SingleEventInterpreterDispatcher >> trigger [

	^ defaultInterpreter
]
