Class {
	#name : #SetComponentTabIndexCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
SetComponentTabIndexCommandTest >> testApplyToOn [
	| html |
	html := self apply: (SetComponentTabIndexCommand setting: 3) toComponentDefinedBy: [ :canvas | canvas select ].
	self assert: html equals: '<select tabindex="3"></select>'
]
