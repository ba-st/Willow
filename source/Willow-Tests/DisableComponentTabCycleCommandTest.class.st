"
A DisableComponentTabCycleCommandTest is a test class for testing the behavior of DisableComponentTabCycleCommand
"
Class {
	#name : #DisableComponentTabCycleCommandTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
DisableComponentTabCycleCommandTest >> testApplyToOn [
	| html |
	html := self apply: DisableComponentTabCycleCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div tabindex="-1"></div>'
]
