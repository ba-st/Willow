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

{ #category : #private }
ServerResponseCommand >> conditionApplying: clientSideParameter to: clientCondition [

	"We need to obtain the parameter and build a new object around it to prevent Seaside from manipulating the original object"

	^ clientCondition cull: ( JSStream on: clientSideParameter asJavascript )
]

{ #category : #private }
ServerResponseCommand >> considerAddingConditionTo: anAsynchronousCall [

	userAgentConditionOptional
		withContentDo: [ :clientCondition | 
			anAsynchronousCall
				condition:
					( userAgentParameterOptional
						withContentDo: [ :clientSideParameter | self conditionApplying: clientSideParameter to: clientCondition ]
						ifUnused: clientCondition )
			]
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
ServerResponseCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | 
			| actions |

			actions := OrderedCollection new.
			self resetInterpreter.
			commandToServer cull: self.
			interpreter applyTo: actions on: aCanvas.
			actions
			]
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
ServerResponseCommand >> onRespond [

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

	interpreter := WebInteractionInterpreter workingWith: DelayedModelLoader new
]

{ #category : #accessing }
ServerResponseCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
