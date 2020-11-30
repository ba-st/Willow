"
I'm a WebInteractionCommand with a response that can be configured during the execution on the server.
"
Class {
	#name : #ServerResponseCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'interpreter',
		'serverSideParameterBinding',
		'commandToServer',
		'userAgentConditionOptional',
		'userAgentParameterOptional'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ServerResponseCommand class >> withBehaviorDeterminedBy: aBlock conditionedBy: aUserAgentConditionOptional requiring: aUserAgentParameterOptional [

	^ self new
		initializeWithBehaviorDeterminedBy: aBlock
		conditionedBy: aUserAgentConditionOptional
		requiring: aUserAgentParameterOptional
]

{ #category : #accessing }
ServerResponseCommand >> clientIndependentActions [

	^ Array
		with: [ self resetInterpreter.
			commandToServer cull: self
			]
]

{ #category : #private }
ServerResponseCommand >> considerAddingConditionTo: anAsynchronousCall [

	userAgentConditionOptional
		withContentDo: [ :clientCondition | anAsynchronousCall condition: ( JSStream on: clientCondition ) ]
]

{ #category : #initialization }
ServerResponseCommand >> initializeWithBehaviorDeterminedBy: aBlock
	conditionedBy: aUserAgentConditionOptional
	requiring: aUserAgentParameterOptional [


	commandToServer := aBlock.
	userAgentConditionOptional := aUserAgentConditionOptional.
	userAgentParameterOptional := aUserAgentParameterOptional.
	serverSideParameterBinding := Binding undefinedExplainedBy: 'Missing Server Side Parameter'.
	self resetInterpreter
]

{ #category : #accessing }
ServerResponseCommand >> modelLoadingActions [

	^ Array with: [ :aScript :aCanvas | interpreter applyTo: aScript on: aCanvas ]
]

{ #category : #private }
ServerResponseCommand >> obtain: clientSideParameter from: anAsynchronousCall [

	self considerAddingConditionTo: anAsynchronousCall.
	anAsynchronousCall
		bePost;
		callback: [ :serverSideParameter | serverSideParameterBinding := Binding to: serverSideParameter ]
			json: clientSideParameter
]

{ #category : #configuring }
ServerResponseCommand >> onReturn [

	^ interpreter
]

{ #category : #accessing }
ServerResponseCommand >> parameter [

	^ serverSideParameterBinding content
]

{ #category : #accessing }
ServerResponseCommand >> priorityActions [

	"If there's some parameter, we got it from the json and keep it to be used during callback execution"

	^ userAgentParameterOptional
		withContentDo: [ :clientSideParameter | 
			Array
				with: [ :anAsynchronousCall :aCanvas | self obtain: clientSideParameter from: anAsynchronousCall ]
			]
		ifUnused: [ #() ]
]

{ #category : #testing }
ServerResponseCommand >> requiresSerialization [

	^ true
]

{ #category : #initialization }
ServerResponseCommand >> resetInterpreter [

	interpreter := WebInteractionInterpreter forDelayedModelLoading
]

{ #category : #accessing }
ServerResponseCommand >> serverIndependentActions [

	^ #()
]
