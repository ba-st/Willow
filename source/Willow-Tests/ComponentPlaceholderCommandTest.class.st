"
A ComponentPlaceholderCommandTest is a test class for testing the behavior of ComponentPlaceholderCommand
"
Class {
	#name : #ComponentPlaceholderCommandTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentPlaceholderCommandTest >> testApplyToOn [
	| html |
	html := self apply: (ComponentPlaceholderCommand suggestedBy: 'user') toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input placeholder="user" type="text"/>'
]
