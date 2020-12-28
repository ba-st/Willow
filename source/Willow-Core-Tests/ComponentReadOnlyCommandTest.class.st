"
A ComponentReadOnlyCommandTest is a test class for testing the behavior of ComponentReadOnlyCommand
"
Class {
	#name : #ComponentReadOnlyCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentReadOnlyCommandTest >> testApplyToOn [

	| html |

	html := self
		apply: ComponentReadOnlyCommand new
		toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input readonly type="text"/>'
]
