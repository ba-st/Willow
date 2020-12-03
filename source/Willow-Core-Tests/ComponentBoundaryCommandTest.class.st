"
A ComponentBoundaryCommandTest is a test class for testing the behavior of ComponentBoundaryCommand
"
Class {
	#name : #ComponentBoundaryCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentBoundaryCommandTest >> testApplyToOn [

	| html |

	html := self apply: (ComponentBoundaryCommand between: 15 and: 20) toComponentDefinedBy: [ :canvas | canvas numberInput ].
	self assert: html equals: '<input min="15" max="20" type="number"/>'
]

{ #category : #'tests-processing' }
ComponentBoundaryCommandTest >> testNonNegative [

	| html |

	html := self apply: ComponentBoundaryCommand nonNegative toComponentDefinedBy: [ :canvas | canvas numberInput ].
	self assert: html equals: '<input min="0" type="number"/>'
]
