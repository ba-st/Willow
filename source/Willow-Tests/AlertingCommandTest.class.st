"
An AlertingCommandTest is a test class for testing the behavior of AlertingCommand
"
Class {
	#name : #AlertingCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
AlertingCommandTest >> setUp [

	super setUp.
	command := AlertingCommand stating: 'Great!'
]

{ #category : #'tests-accessing' }
AlertingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
AlertingCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
AlertingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
AlertingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
AlertingCommandTest >> testServerIndependentActions [

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
		equals: '<div id="div-id1"></div><script type="text/javascript">$("#div-id1").click(function(){alert("Great!")});</script>'
]
