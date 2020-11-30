Class {
	#name : #ComponentRequiredCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentRequiredCommandTest >> testApplyToOn [

	| html |

	html := self
		apply: ComponentRequiredCommand new
		toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input required type="text"/>'
]
