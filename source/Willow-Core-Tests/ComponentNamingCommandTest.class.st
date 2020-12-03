"
A ComponentNamingCommandTest is a test class for testing the behavior of ComponentNamingCommand
"
Class {
	#name : #ComponentNamingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentNamingCommandTest >> testApplyToOn [
	| html |
	html := self apply: (ComponentNamingCommand assigning: 'name') toComponentDefinedBy: [ :canvas | canvas anchor ].
	self assert: html equals: '<a name="name"></a>'
]
