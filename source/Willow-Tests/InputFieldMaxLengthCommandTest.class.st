"
An InputFieldMaxLengthCommandTest is a test class for testing the behavior of InputFieldMaxLengthCommand
"
Class {
	#name : #InputFieldMaxLengthCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
InputFieldMaxLengthCommandTest >> testApplyToOn [

	| html |

	html := self apply: (InputFieldMaxLengthCommand allowingUpTo: 25) toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input maxlength="25" type="text"/>'
]
