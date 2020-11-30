"
A ComponentAccessibilityEnrichmentCommandTest is a test class for testing the behavior of ComponentAccessibilityEnrichmentCommand
"
Class {
	#name : #ComponentAccessibilityEnrichmentCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentAccessibilityEnrichmentCommandTest >> testApplyToOn [

	| html |

	html := self apply: (ComponentAccessibilityEnrichmentCommand toDeclare: 'describedBy' with: 'helpBlock') toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input aria-describedBy="helpBlock" type="text"/>'
]
