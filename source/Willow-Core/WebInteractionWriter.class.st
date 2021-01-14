Class {
	#name : #WebInteractionWriter,
	#superclass : #Object,
	#instVars : [
		'serializationCommand',
		'priorityActions',
		'serverIndependentInstructions',
		'modelLoadingInstructions',
		'serializationCoverage'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
WebInteractionWriter class >> triggering: aCommandCollection serializingWith: aSerializationCommand [

	^ self new initializeFor: aCommandCollection serializingWith: aSerializationCommand
]

{ #category : #processing }
WebInteractionWriter >> applyTo: aComponent accordingTo: aTriggerPolicy on: aCanvas [

	self shouldApplyActions
		then: [ aTriggerPolicy apply: ( self commandToExecuteOn: aCanvas ) to: aComponent on: aCanvas ]
]

{ #category : #'private - accessing' }
WebInteractionWriter >> asynchronousCallToAffect: aCanvas [

	| serverCall |

	serverCall := aCanvas jQuery willow serverCall.
	priorityActions do: [ :action | action value: serverCall value: aCanvas ].
	self complete: serverCall withResponseOn: aCanvas.
	^ serverCall
]

{ #category : #'private - accessing' }
WebInteractionWriter >> commandToExecuteOn: aCanvas [

	^ [ | script |

	script := aCanvas javascript.
	serverIndependentInstructions appendTo: script on: aCanvas.
	self shouldApplyAsynchronousCall then: [ script << ( self asynchronousCallToAffect: aCanvas ) ].
	script
	]
		unless: serverIndependentInstructions isEmpty
		inWhichCase: [ self asynchronousCallToAffect: aCanvas ]
]

{ #category : #'private - processing' }
WebInteractionWriter >> complete: anAsynchronousCall withResponseOn: aCanvas [

	anAsynchronousCall
		script: [ :subScript | modelLoadingInstructions appendTo: subScript on: aCanvas ]
]

{ #category : #initialization }
WebInteractionWriter >> initializeFor: aCommandCollection serializingWith: aSerializationCommand [

	serializationCommand := aSerializationCommand.

	priorityActions := OrderedCollection new.
	serverIndependentInstructions := WebInteractionInstructions empty.
	modelLoadingInstructions := WebInteractionInstructions empty.
	serializationCoverage := Bag new.

	self registerActionsOfAll: aCommandCollection.
	self preventSerializationCoverageConflict
]

{ #category : #'private - preconditions' }
WebInteractionWriter >> preventSerializationCoverageConflict [

	serializationCoverage
		doWithOccurrences: [ :selector :count | 
			count = 1
				ifFalse: [ ConflictingObjectFound
						signal: ( 'Found <1p> commands specifying serialization using <2s>' expandMacrosWith: count with: selector )
					]
			]
]

{ #category : #'private - processing' }
WebInteractionWriter >> registerActionsOf: aCommand [

	priorityActions addAll: aCommand priorityActions.

	modelLoadingInstructions := modelLoadingInstructions
		combinedWith: aCommand modelLoadingInstructions.
	serverIndependentInstructions := serverIndependentInstructions
		combinedWith: aCommand serverIndependentInstructions.

	serializationCoverage addAll: aCommand serializationCoverage
]

{ #category : #'private - processing' }
WebInteractionWriter >> registerActionsOfAll: aCommandCollection [

	| serializationRequired |

	serializationRequired := false.
	aCommandCollection
		do: [ :aCommand | 
			self registerActionsOf: aCommand.
			serializationRequired := serializationRequired or: [ aCommand requiresSerialization ]
			].
	serializationRequired then: [ self registerActionsOf: serializationCommand ]
]

{ #category : #'private - testing' }
WebInteractionWriter >> shouldApplyActions [

	^ serverIndependentInstructions notEmpty or: [ self shouldApplyAsynchronousCall ]
]

{ #category : #'private - testing' }
WebInteractionWriter >> shouldApplyAsynchronousCall [

	^ priorityActions notEmpty or: [ modelLoadingInstructions notEmpty ]
]
