"
A ConfirmationCommandTest is a test class for testing the behavior of ConfirmationCommand
"
Class {
	#name : #ConfirmationCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
ConfirmationCommandTest >> setUp [

	super setUp.
	command := ConfirmationCommand asking: 'Do you want to proceed?'
]

{ #category : #'tests-accessing' }
ConfirmationCommandTest >> testModelLoadingInstructions [

	self assert: command modelLoadingInstructions isEmpty
]

{ #category : #'tests-accessing' }
ConfirmationCommandTest >> testPriorityActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| asynchronousCall anchor |

			asynchronousCall := canvas jQuery ajax.
			command priorityActions do: [ :action | action value: asynchronousCall value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: asynchronousCall) ].

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){if(confirm("Do you want to proceed?")){$.ajax()}});</script>'
]

{ #category : #'tests-testing' }
ConfirmationCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization 
]

{ #category : #'tests-accessing' }
ConfirmationCommandTest >> testServerIndependentInstructions [

	self assert: command serverIndependentInstructions isEmpty
]
