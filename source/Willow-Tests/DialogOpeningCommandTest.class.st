"
A DialogOpeningCommandTest is a test class for testing the behavior of DialogOpeningCommand
"
Class {
	#name : #DialogOpeningCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
DialogOpeningCommandTest >> setUp [

	super setUp.
	command := DialogOpeningCommand alwaysOpening: [ :canvas | canvas dialog attributeAt: 'open' put: true ]
]

{ #category : #'tests-accessing' }
DialogOpeningCommandTest >> testModelLoadingInstructions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			command modelLoadingInstructions appendTo: script on: canvas.
			anchor script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-dialog-section").append("<dialog open></dialog>")});</script>'
]

{ #category : #'tests-accessing' }
DialogOpeningCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
DialogOpeningCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization  
]

{ #category : #'tests-accessing' }
DialogOpeningCommandTest >> testServerIndependentInstructions [

	self assert: command serverIndependentInstructions isEmpty
]
