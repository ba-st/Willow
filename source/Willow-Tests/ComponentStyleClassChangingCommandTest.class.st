Class {
	#name : #ComponentStyleClassChangingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentStyleClassChangingCommandTest >> setUp [

	super setUp.
	command := ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery class: 'aComponentByStyleName' ]
				altering: 'anExistingStyle'
				sending: #removeClass:
				using: [ :component | component addClass: 'aNewStyle' ]
]

{ #category : #'tests-accessing' }
ComponentStyleClassChangingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
ComponentStyleClassChangingCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
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
ComponentStyleClassChangingCommandTest >> testServerIndependentActions [

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
		equals:
			'<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){$(".aComponentByStyleName").removeClass("anExistingStyle").addClass("aNewStyle")});</script>'
]
