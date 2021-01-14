Class {
	#name : #ComponentStyleClassChangingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentStyleClassChangingCommandTest >> setUp [

	super setUp.
	command := ComponentStyleClassChangingCommand
		applying: [ :component | 
			component
				removeClass: 'anExistingStyle';
				addClass: 'aNewStyle'
			]
		targeting: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ]
]

{ #category : #'tests-accessing' }
ComponentStyleClassChangingCommandTest >> testModelLoadingInstructions [

	self assert: command modelLoadingInstructions isEmpty
]

{ #category : #'tests-accessing' }
ComponentStyleClassChangingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ComponentStyleClassChangingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization  
]

{ #category : #'tests-accessing' }
ComponentStyleClassChangingCommandTest >> testServerIndependentInstructions [

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
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$(".aComponentByStyleName").removeClass("anExistingStyle").addClass("aNewStyle")});</script>'
]
