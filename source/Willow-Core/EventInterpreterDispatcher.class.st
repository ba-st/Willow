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

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> changeHiddenInterpreter [

	^ WebInteractionInterpreter
		workingWith:
			( WebComponentInteraction
				triggeredAccordingTo: ( InteractionScriptTrigger interactSending: #onChange: )
				serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs )
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> changeInterpreter [

	^ self interpreterSending: #onChange: requiringSerialization: true
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> clickHiddenInterpreter [

	^ WebInteractionInterpreter
		workingWith:
			( WebComponentInteraction
				triggeredAccordingTo: ( InteractionScriptTrigger interactSending: #onClick: )
				serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs )
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> clickInterpreter [

	^ self interpreterSending: #onClick: requiringSerialization: false
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToChange [

	^ self interpretingByDefault: 'change' configuring: self changeInterpreter
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToChangeHidden [

	^ self interpretingByDefault: 'change' configuring: self changeHiddenInterpreter
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToClick [

	^ self interpretingByDefault: 'click' configuring: self clickInterpreter
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToClickHidden [

	^ self interpretingByDefault: 'click' configuring: self clickHiddenInterpreter
]

{ #category : #'instance creation' }
EventInterpreterDispatcher class >> defaultingToKeyUp [

	^ self interpretingByDefault: 'keyUp' configuring: self keyUpInterpreter
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> interpreterSending: aMessage requiringSerialization: shouldSerialize [

	| serializationCommand |

	serializationCommand := shouldSerialize
		then: [ SerializationCommand forCurrentObject ]
		otherwise: NullWebInteractionCommand new.
		
	^ WebInteractionInterpreter
		workingWith:
			( WebComponentInteraction
				triggeredAccordingTo: ( InteractionScriptTrigger interactSending: aMessage )
				serializingWith: serializationCommand )
]

{ #category : #'private - instance creation' }
EventInterpreterDispatcher class >> interpretingByDefault: anEventName configuring: aWebInteractionInterpreter [

	^ self new initializeInterpretingByDefault: anEventName configuring: aWebInteractionInterpreter
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> keyUpInterpreter [

	^ self interpreterSending: #onKeyUp: requiringSerialization: true
]

{ #category : #'private - accessing' }
EventInterpreterDispatcher class >> mouseOverInterpreter [

	^ self interpreterSending: #onMouseOver: requiringSerialization: false
]

{ #category : #evaluating }
EventInterpreterDispatcher >> applyTo: aComponent on: aCanvas [

	interpretersByEvent
		keysAndValuesDo: [ :event :interpreter | interpreter applyTo: aComponent on: aCanvas ]
]

{ #category : #configuring }
EventInterpreterDispatcher >> change [

	^ interpretersByEvent at: 'change' ifAbsentPut: [ self class changeInterpreter ]
]

{ #category : #configuring }
EventInterpreterDispatcher >> click [

	^ interpretersByEvent at: 'click' ifAbsentPut: [ self class clickInterpreter ]
]

{ #category : #initialization }
EventInterpreterDispatcher >> initializeInterpretingByDefault: anEventName configuring: aWebInteractionInterpreter [

	defaultInterpreter := aWebInteractionInterpreter.
	interpretersByEvent := Dictionary new.
	interpretersByEvent at: anEventName put: aWebInteractionInterpreter
]

{ #category : #configuring }
EventInterpreterDispatcher >> keyUp [

	^ interpretersByEvent at: 'keyUp' ifAbsentPut: [ self class keyUpInterpreter ]
]

{ #category : #configuring }
EventInterpreterDispatcher >> mouseOver [

	^ interpretersByEvent at: 'mouseOver' ifAbsentPut: [ self class mouseOverInterpreter ]
]

{ #category : #configuring }
EventInterpreterDispatcher >> trigger [

	^ defaultInterpreter
]
