Class {
	#name : #ServerResponseCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #'test support' }
ServerResponseCommandTest >> bePost [

	"Nothing to do"
]

{ #category : #'test support' }
ServerResponseCommandTest >> callback: aBlock json: aString [

	^ aBlock value: aString
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testClientIndependentActions [

	| command blockWasExecuted |

	blockWasExecuted := false.
	command := ServerResponseCommand
		withBehaviorDeterminedBy: [ :response | blockWasExecuted := true ]
		conditionedBy: Optional unused
		requiring: Optional unused.
	command clientIndependentActions do: #value.
	self assert: blockWasExecuted
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter [

	| command |

	command := ServerResponseCommand
		withBehaviorDeterminedBy: [ :request | 'Test is <1s>' expandMacrosWith: request parameter ]
		conditionedBy: Optional unused
		requiring: ( Optional containing: 'complete' ).

	self
		should: [ command clientIndependentActions collect: #value ]
		raise: AssertionFailed
		withExceptionDo: [ :error | self assert: error messageText equals: 'Missing Server Side Parameter' ].

	command priorityActions do: [ :action | action value: self value: 'canvas' ].
	self
		assertCollection: ( command clientIndependentActions collect: #value )
		equals: #('Test is complete')
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testModelLoadingActions [

	| command html |

	command := ServerResponseCommand
		withBehaviorDeterminedBy: [ :request | request onRespond inform: request parameter ]
		conditionedBy: Optional unused
		requiring: ( Optional containing: 'test complete' ).
	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command priorityActions do: [ :action | action value: self value: 'canvas' ].
			command clientIndependentActions do: #value.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){alert("test complete")});</script>'
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testOnRespond [

	| command html |

	command := ServerResponseCommand
		withBehaviorDeterminedBy: [ :request | request onRespond inform: 'it has returned!' ]
		conditionedBy: Optional unused
		requiring: Optional unused.
		
	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command clientIndependentActions do: #value.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){alert("it has returned!")});</script>'
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testParameter [

	| parameterObtained command html |

	command := ServerResponseCommand
		withBehaviorDeterminedBy: [ :request | parameterObtained := request parameter ]
		conditionedBy: Optional unused
		requiring: ( Optional containing: 'test complete' ).

	html := self
		renderUsing: [ :canvas | 
			command priorityActions do: [ :action | action value: self value: 'canvas' ].
			command clientIndependentActions do: #value
			].

	self assert: parameterObtained equals: 'test complete'
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testPriorityActions [

	"Priority actions are only created when a client parameter is provided.
	See #testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter"

	self
		assert:
			( ServerResponseCommand
				withBehaviorDeterminedBy: [ :response | self fail ]
				conditionedBy: Optional unused
				requiring: Optional unused ) priorityActions isEmpty
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testPriorityActionsIncludeConditionalExecution [

	| command html |

	command := ServerResponseCommand
		withBehaviorDeterminedBy: [ :response :parameter | 'We got <1s>' expandMacrosWith: parameter ]
		conditionedBy: ( Optional containing: ( '<1s> > 0' expandMacrosWith: ( JSStream on: 'worldSize' ) asJavascript ) )
		requiring: ( Optional containing: ( JSStream on: 'worldSize' ) ).

	html := self
		renderUsing: [ :canvas | 
			| serverCall div |

			serverCall := canvas jQuery willow serverCall.
			command priorityActions do: [ :action | action value: serverCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: ( canvas jQuery this onClick: serverCall )
			].

	self
		assert: html
		equals:
			'<div id="div-id3"></div><script type="text/javascript">$("#div-id3").click(function(){if(worldSize > 0){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(worldSize))].join("&")})}});</script>'
]

{ #category : #'tests-testing' }
ServerResponseCommandTest >> testRequiresSerialization [

	self
		assert:
			( ServerResponseCommand
				withBehaviorDeterminedBy: [ self fail ]
				conditionedBy: Optional unused
				requiring: Optional unused ) requiresSerialization
]

{ #category : #'tests-accessing' }
ServerResponseCommandTest >> testServerIndependentActions [

	self
		assert:
			( ServerResponseCommand
				withBehaviorDeterminedBy: [ self fail ]
				conditionedBy: Optional unused
				requiring: Optional unused ) serverIndependentActions isEmpty
]