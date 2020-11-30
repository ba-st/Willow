"
A RenderingCommandTest is a test class for testing the behavior of RenderingCommand
"
Class {
	#name : #RenderingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'identifiedView',
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
RenderingCommandTest >> setUp [

	super setUp.
	identifiedView := IdentifiedWebView forDivNamed: 'test' containing: [ :canvas | canvas span: 'Test' ].
	command := RenderingCommand for: identifiedView
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions size equals: 1.
	command clientIndependentActions do: [ :action | self assert: action value ]
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testEvaluatingAsConditionToRender [

	| html |

	command := RenderingCommand evaluating: [ false ] asConditionToRender: identifiedView.

	self assert: command clientIndependentActions size equals: 1.
	command clientIndependentActions do: [ :action | self deny: action value ].


	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			identifiedView identifyIn: canvas.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].

			canvas anchor script: (canvas jQuery this onClick: script) ].

	"The function must be empty because the condition is false"
	self assert: html equals: '<a id="id2"></a><script type="text/javascript">$("#id2").click(function(){});</script>'
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testModelLoadingActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			identifiedView identifyIn: canvas.
			command modelLoadingActions do: [ :action | action value: script value: canvas ].

			canvas anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals: '<a id="id2"></a><script type="text/javascript">$("#id2").click(function(){$("#test-id1").html("<span>Test</span>")});</script>'
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
RenderingCommandTest >> testRequiresSerialization [

	self assert: command requiresSerialization 
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
