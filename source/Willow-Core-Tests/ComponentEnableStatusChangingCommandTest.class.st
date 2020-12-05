"
A ComponentEnableStatusChangingCommandTest is a test class for testing the behavior of ComponentEnableStatusChangingCommand
"
Class {
	#name : #ComponentEnableStatusChangingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentEnableStatusChangingCommandTest >> setUp [

	super setUp .
	command := ComponentEnableStatusChangingCommand disablingCurrentComponent.
]

{ #category : #'tests-accessing' }
ComponentEnableStatusChangingCommandTest >> testModelLoadingInstructions [

	self assert: command modelLoadingInstructions isEmpty
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
ComponentEnableStatusChangingCommandTest >> testServerIndependentInstructions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script div |

			script := canvas javascript.
			command serverIndependentInstructions appendTo: script on: canvas.
			div := canvas div.
			canvas ensureIdFor: div.
			div script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$(this).prop("disabled",true)});</script>'
]
