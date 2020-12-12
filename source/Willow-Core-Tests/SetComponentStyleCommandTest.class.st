"
A SetComponentStyleCommandTest is a test class for testing the behavior of SetComponentStyleCommand
"
Class {
	#name : #SetComponentStyleCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-initialization' }
SetComponentStyleCommandTest >> testApplyToOn [
	| html |
	html := self
		apply:
			(SetComponentStyleCommand
				setting:
					(CssDeclarationBlock new
						background: 'blue';
						yourself))
		toComponentDefinedBy: [ :canvas | canvas div ].
	self
		assert: html
		equals: '<div style="background: blue;"></div>'
]
