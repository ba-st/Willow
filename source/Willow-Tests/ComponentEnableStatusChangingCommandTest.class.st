"
A ComponentEnableStatusChangingCommandTest is a test class for testing the behavior of ComponentEnableStatusChangingCommand
"
Class {
	#name : #ComponentEnableStatusChangingCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentEnableStatusChangingCommandTest >> setUp [

	super setUp .
	command := ComponentEnableStatusChangingCommand disablingCurrentComponent.
]

{ #category : #'tests-accessing' }
ComponentEnableStatusChangingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
ComponentEnableStatusChangingCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
ComponentEnableStatusChangingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ComponentEnableStatusChangingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
ComponentEnableStatusChangingCommandTest >> testServerIndependentActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command serverIndependentActions do: [ :action | action value: script value: canvas ].
			div := canvas div.
			canvas ensureIdFor: div.
			div script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals: '<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$(this).prop("disabled",true)});</script>'
]
