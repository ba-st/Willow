"
A ComponentRemovingCommandTest is a test class for testing the behavior of ComponentRemovingCommand
"
Class {
	#name : #ComponentRemovingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentRemovingCommandTest >> setUp [

	super setUp.
	command := ComponentRemovingCommand for: (IdentifiedWebView forDivNamed: 'example' containing: [ :canvas |  ])
]

{ #category : #'tests-accessing' }
ComponentRemovingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
ComponentRemovingCommandTest >> testModelLoadingActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			div := canvas div.
			canvas ensureIdFor: div.
			(ComponentRemovingCommand for: div) modelLoadingActions do: [ :action | action value: script value: canvas ].
			div script: (canvas jQuery this onClick: script) ].

	self assert: html equals: '<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$("#div-id1").remove()});</script>'
]

{ #category : #'tests-accessing' }
ComponentRemovingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ComponentRemovingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization  
]

{ #category : #'tests-accessing' }
ComponentRemovingCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
