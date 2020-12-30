"
A ScrollIntoViewCommandTest is a test class for testing the behavior of ScrollIntoViewCommand
"
Class {
	#name : #ScrollIntoViewCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
ScrollIntoViewCommandTest >> setUp [

	super setUp.
	command := ScrollIntoViewCommand withComponentIdentifierProvidedBy: [ 'id8' ]
]

{ #category : #'tests-accessing' }
ScrollIntoViewCommandTest >> testModelLoadingInstructions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			command modelLoadingInstructions appendTo: script on: canvas.
			canvas anchor script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<a id="id1"></a><script type="text/javascript">$("#id1").click(function(){$("#id8").each(function(){$(this).get(0).scrollIntoView()})});</script>'
]

{ #category : #'tests-accessing' }
ScrollIntoViewCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ScrollIntoViewCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
ScrollIntoViewCommandTest >> testServerIndependentInstructions [

	self assert: command serverIndependentInstructions isEmpty
]
