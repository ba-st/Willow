Class {
	#name : #UserAgentCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
UserAgentCommandTest >> setUp [

	super setUp.
	command := UserAgentCommand executing: [ :canvas | JSStream this call: 'passTest' ]
]

{ #category : #'tests-accessing' }
UserAgentCommandTest >> testModelLoadingInstructions [

	self assert: command modelLoadingInstructions isEmpty
]

{ #category : #'tests-accessing' }
UserAgentCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
UserAgentCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
UserAgentCommandTest >> testServerIndependentInstructions [

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
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){this.passTest()});</script>'
]
