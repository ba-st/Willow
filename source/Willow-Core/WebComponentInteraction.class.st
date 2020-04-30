Class {
	#name : #WebComponentInteraction,
	#superclass : #Object,
	#instVars : [
		'triggerPolicy',
		'commands',
		'modelLoadingActions',
		'clientIndependentActions',
		'priorityActions',
		'serverIndependentActions',
		'serializationCommand'
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

	self prepareActions.
	self shouldApplyActions
		then: [ triggerPolicy apply: ( self commandToExecuteOn: aCanvas ) to: aComponent on: aCanvas ]
]

{ #category : #'private - accessing' }
WebComponentInteraction >> asynchronousCallToAffect: aCanvas [

	| serverCall |

	serverCall := aCanvas jQuery willow serverCall.
	priorityActions do: [ :action | action value: serverCall value: aCanvas ].
	self complete: serverCall withResponseOn: aCanvas.
	^ serverCall
]

{ #category : #'private - accessing' }
WebComponentInteraction >> commandToExecuteOn: aCanvas [

	^ [ | script |

	script := aCanvas javascript.
	serverIndependentActions do: [ :action | action value: script value: aCanvas ].
	self shouldApplyAsynchronousCall then: [ script << ( self asynchronousCallToAffect: aCanvas ) ].
	script
	] unless: serverIndependentActions isEmpty inWhichCase: [ self asynchronousCallToAffect: aCanvas ]
]

{ #category : #'private - accessing' }
WebComponentInteraction >> complete: anAsynchronousCall withResponseOn: aCanvas [

	anAsynchronousCall
		script: [ :subScript | 
			clientIndependentActions do: [ :action | action value ].
			modelLoadingActions do: [ :action | action value: subScript value: aCanvas ] ]
]

{ #category : #initialization }
WebComponentInteraction >> initializeActions [

	priorityActions := OrderedCollection new.
	clientIndependentActions := OrderedCollection new.
	serverIndependentActions := OrderedCollection new.
	modelLoadingActions := OrderedCollection new
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

{ #category : #initialization }
WebComponentInteraction >> prepareActions [

	| serializationRequired |

	serializationRequired := false.
	self initializeActions.
	commands
		do: [ :aCommand | 
			self registerActionsOf: aCommand.
			serializationRequired := serializationRequired or: [ aCommand requiresSerialization ]
			].
	serializationRequired then: [ self registerActionsOf: serializationCommand ]
]

{ #category : #'private - processing' }
WebComponentInteraction >> registerActionsOf: aCommand [

	modelLoadingActions addAll: aCommand modelLoadingActions.
	clientIndependentActions addAll: aCommand clientIndependentActions.
	priorityActions addAll: aCommand priorityActions.
	serverIndependentActions addAll: aCommand serverIndependentActions.
]

{ #category : #'private - testing' }
WebComponentInteraction >> shouldApplyActions [

	^serverIndependentActions notEmpty or: [self shouldApplyAsynchronousCall]
]

{ #category : #'private - testing' }
WebComponentInteraction >> shouldApplyAsynchronousCall [

	^clientIndependentActions notEmpty
		or: [priorityActions notEmpty or: [modelLoadingActions notEmpty]]
]
