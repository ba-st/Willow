"
I'm a WebInteractionCommand with a response that can be configured during the execution on the server.
"
Class {
	#name : #DelayedCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'behaviorCallback',
		'interpreter',
		'optionalClientSideParameter',
		'serverSideParameterBinding',
		'optionalClientCondition'
	],
	#category : 'Willow-WebInteraction'
}

{ #category : #'instance creation' }
DelayedCommand class >> withBehaviorDeterminedBy: aBlock [

	^ self
		withBehaviorDeterminedBy: aBlock
		conditionedBy: Optional unused
		requiring: Optional unused
]

{ #category : #private }
DelayedCommand class >> withBehaviorDeterminedBy: aBlock conditionedBy: anOptionalClientCondition requiring: anOptionalParameter [

	^ self new
		initializeWithBehaviorDeterminedBy: aBlock
		conditionedBy: anOptionalClientCondition
		requiring: anOptionalParameter
]

{ #category : #'instance creation' }
DelayedCommand class >> withBehaviorDeterminedBy: aBlock executedOnlyWhen: aStringCondition with: aParameter [

	^ self
		withBehaviorDeterminedBy: aBlock
		conditionedBy: (Optional containing: (aStringCondition expandMacrosWith: aParameter asJavascript))
		requiring: (Optional containing: aParameter)
]

{ #category : #'instance creation' }
DelayedCommand class >> withBehaviorDeterminedBy: aBlock with: aParameter [

	^ self
		withBehaviorDeterminedBy: aBlock
		conditionedBy: Optional unused
		requiring: (Optional containing: aParameter)
]

{ #category : #accessing }
DelayedCommand >> clientIndependentActions [

	^ Array
		with: [ self resetInterpreter.
			optionalClientSideParameter
				withContentDo: [ behaviorCallback value: self value: serverSideParameterBinding content ]
				ifUnused: [ behaviorCallback value: self ] ]
]

{ #category : #private }
DelayedCommand >> considerAddingConditionTo: anAsynchronousCall [

	optionalClientCondition
		withContentDo: [ :clientCondition | anAsynchronousCall condition: (JSStream on: clientCondition) ]
]

{ #category : #initialization }
DelayedCommand >> initializeWithBehaviorDeterminedBy: aBlock conditionedBy: anOptionalClientCondition requiring: anOptionalParameter [

	behaviorCallback := aBlock.
	optionalClientCondition := anOptionalClientCondition.
	optionalClientSideParameter := anOptionalParameter.
	serverSideParameterBinding := Binding
		undefinedExplainedBy: 'Missing Server Side Parameter'.
	self resetInterpreter
]

{ #category : #accessing }
DelayedCommand >> modelLoadingActions [

	^ Array with: [ :aScript :aCanvas | interpreter applyTo: aScript on: aCanvas ]
]

{ #category : #private }
DelayedCommand >> obtain: clientSideParameter from: anAsynchronousCall [

	self considerAddingConditionTo: anAsynchronousCall.
	anAsynchronousCall
		bePost;
		callback: [ :serverSideParameter | serverSideParameterBinding := Binding to: serverSideParameter ]
			json: clientSideParameter
]

{ #category : #configuring }
DelayedCommand >> onReturn [

	"This message is not strictly needed. It is implemented merely to help with legibility of the code when being configured."

	^ interpreter
]

{ #category : #accessing }
DelayedCommand >> priorityActions [

	"If there's some parameter, we got it from the json and keep it to be used during callback execution"

	^ optionalClientSideParameter
		withContentDo: [ :clientSideParameter | 
			Array
				with:
					[ :anAsynchronousCall :aCanvas | self obtain: clientSideParameter from: anAsynchronousCall ] ]
		ifUnused: [ #() ]
]

{ #category : #testing }
DelayedCommand >> requiresSerialization [

	^ true
]

{ #category : #initialization }
DelayedCommand >> resetInterpreter [

	interpreter := WebInteractionInterpreter forDelayedModelLoading
]

{ #category : #accessing }
DelayedCommand >> serverIndependentActions [

	^ #()
]
