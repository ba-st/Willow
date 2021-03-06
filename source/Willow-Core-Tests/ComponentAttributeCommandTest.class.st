Class {
	#name : #ComponentAttributeCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentAttributeCommandTest >> testApplyToOn [

	| html |

	html := self apply: (ComponentAttributeCommand named: 'rows' with: 5) toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="5"></div>'
]
