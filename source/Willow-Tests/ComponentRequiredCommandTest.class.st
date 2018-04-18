Class {
	#name : #ComponentRequiredCommandTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentRequiredCommandTest >> testApplyToOn [
	| html |
	html := self apply: ComponentRequiredCommand new toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input required="required" type="text"/>'
]
