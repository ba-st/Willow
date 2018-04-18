"
A ComponentFocusingCommandTest is a test class for testing the behavior of ComponentFocusingCommand
"
Class {
	#name : #ComponentFocusingCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentFocusingCommandTest >> setUp [

	super setUp.
	command := ComponentFocusingCommand findingComponentUsing: [ :canvas | canvas jQuery this ]
]

{ #category : #'tests-accessing' }
ComponentFocusingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
ComponentFocusingCommandTest >> testModelLoadingActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			div := canvas div.
			canvas ensureIdFor: div.
			(ComponentFocusingCommand for: div) modelLoadingActions do: [ :action | action value: script value: canvas ].
			div script: (canvas jQuery this onClick: script) ].

	self assert: html equals: '<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$("#div-id1").focus()});</script>'
]

{ #category : #'tests-accessing' }
ComponentFocusingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ComponentFocusingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
ComponentFocusingCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
