"
A FormSubmitCommandTest is a test class for testing the behavior of FormSubmitCommand
"
Class {
	#name : #FormSubmitCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #'tests-accessing' }
FormSubmitCommandTest >> setUp [

	super setUp.
	command := FormSubmitCommand findingComponentUsing: [ :canvas | canvas jQuery this ]
]

{ #category : #'tests-accessing' }
FormSubmitCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
FormSubmitCommandTest >> testModelLoadingActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.

			(FormSubmitCommand forFormStyledAs: Willow classes >> #willow) modelLoadingActions do: [ :action | action value: script value: canvas ].
			anchor script: (canvas jQuery this onClick: script) ].

	self assert: html equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("form.willow").submit()});</script>'
]

{ #category : #'tests-accessing' }
FormSubmitCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
FormSubmitCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization 
]

{ #category : #'tests-accessing' }
FormSubmitCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
