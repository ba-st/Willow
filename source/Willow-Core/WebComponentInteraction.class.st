Class {
	#name : #WebComponentInteraction,
	#superclass : #Object,
	#instVars : [
		'commands',
		'serializationCommand',
		'triggerPolicy'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
WebComponentInteraction class >> neverTriggered [

	^self
		triggeredAccordingTo: NullTriggeringPolicy new
		serializingWith: NullWebInteractionCommand new
]

{ #category : #private }
WebComponentInteraction class >> triggeredAccordingTo: aTriggerPolicy serializingWith: aSerializationCommand [

	^ self new
		initializeTriggeredAccordingTo: aTriggerPolicy
		serializingWith: aSerializationCommand
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnChange [

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnChange
		serializingWith: SerializationCommand forCurrentObject
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnChangeSerializingHiddenInputs [

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnChange
		serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnClick [

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnClick
		serializingWith: NullWebInteractionCommand new
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnClickSerializingHiddenInputs [

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnClick
		serializingWith: SerializationCommand forCurrentObjectWithHiddenInputs
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnDocumentLoad [

	^self
		triggeredAccordingTo: DocumentLoadTrigger new
		serializingWith: NullWebInteractionCommand new
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnDoubleClick [

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnDoubleClick
		serializingWith: NullWebInteractionCommand new
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnEvaluationOf: aSelector withAll: aParameterArray [

	^ self
		triggeredAccordingTo: (FunctionEvaluationTrigger sending: aSelector parameterizedBy: aParameterArray)
		serializingWith: SerializationCommand forCurrentObject
]

{ #category : #'instance creation' }
WebComponentInteraction class >> triggeredOnKeyUp [

	^ self
		triggeredAccordingTo: InteractionScriptTrigger triggeringOnKeyUp
		serializingWith: SerializationCommand forCurrentObject
]

{ #category : #evaluating }
WebComponentInteraction >> applyTo: aComponent on: aCanvas [

	( WebInteractionWriter triggering: commands serializingWith: serializationCommand )
		applyTo: aComponent
		accordingTo: triggerPolicy
		on: aCanvas
]

{ #category : #initialization }
WebComponentInteraction >> initializeTriggeredAccordingTo: aTriggerPolicy serializingWith: aSerializationCommand [

	triggerPolicy := aTriggerPolicy.
	commands := OrderedCollection new.
	serializationCommand := aSerializationCommand
]

{ #category : #configuring }
WebComponentInteraction >> onTriggerExecute: aCommand [

	commands add: aCommand
]
