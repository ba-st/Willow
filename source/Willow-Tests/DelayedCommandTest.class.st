Class {
	#name : #DelayedCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #'test support' }
DelayedCommandTest >> bePost [

	"Nothing to do"
]

{ #category : #'test support' }
DelayedCommandTest >> callback: aBlock json: aString [

	^ aBlock value: aString
]

{ #category : #'tests-accessing' }
DelayedCommandTest >> testClientIndependentActions [

	| command blockWasExecuted |

	blockWasExecuted := false.
	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response | blockWasExecuted := true ].
	command clientIndependentActions do: #value.
	self assert: blockWasExecuted
]

{ #category : #'tests-accessing' }
DelayedCommandTest >> testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter [

	| command |

	command := DelayedCommand withBehaviorDeterminedBy: [ :response :parameter | 'Test is <1s>' expandMacrosWith: parameter ] with: 'complete'.

	self
		should: [ command clientIndependentActions collect: #value ]
		raise: AssertionFailed
		withExceptionDo: [ :error | self assert: error messageText equals: 'Missing Server Side Parameter' ].

	command priorityActions do: [ :action | action value: self value: 'canvas' ].
	self assertCollection: (command clientIndependentActions collect: #value) equals: #('Test is complete')
]

{ #category : #'tests-accessing' }
DelayedCommandTest >> testModelLoadingActions [

	| command html |

	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response :parameter | response onReturn inform: parameter ]
		with: 'test complete'.
	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command priorityActions do: [ :action | action value: self value: 'canvas' ].
			command clientIndependentActions do: #value.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){alert("test complete")});</script>'
]

{ #category : #'tests-accessing' }
DelayedCommandTest >> testPriorityActions [

	"Priority actions are only created when a client parameter is provided.
	See #testClientIndependentActionsDependOnPriorityActionsWhenUsingClientParameter"

	self
		assert:
			(DelayedCommand withBehaviorDeterminedBy: [ :response | self fail ]) priorityActions
				isEmpty
]

{ #category : #'tests-accessing' }
DelayedCommandTest >> testPriorityActionsIncludeConditionalExecution [

	| command html |

	command := DelayedCommand
		withBehaviorDeterminedBy: [ :response :parameter | 'We got <1s>' expandMacrosWith: parameter ]
		executedOnlyWhen: '<1s> > 0'
		with: (JSStream on: 'worldSize').

	html := self
		renderUsing: [ :canvas | 
			| serverCall div |

			serverCall := canvas jQuery willow serverCall.
			command priorityActions do: [ :action | action value: serverCall value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: serverCall) ].

	self
		assert: html
		equals:
			'<div id="div-id3"></div><script type="text/javascript">$("#div-id3").click(function(){if(worldSize > 0){Willow.callServer({"type":"POST","url":"/","data":["1","2="+encodeURIComponent(JSON.stringify(worldSize))].join("&")})}});</script>'
]

{ #category : #'tests-testing' }
DelayedCommandTest >> testRequiresSerialization [

	self
		assert: (DelayedCommand withBehaviorDeterminedBy: [ self fail ]) requiresSerialization
]

{ #category : #'tests-accessing' }
DelayedCommandTest >> testServerIndependentActions [

	self
		assert: (DelayedCommand withBehaviorDeterminedBy: [ self fail ]) serverIndependentActions isEmpty
]
