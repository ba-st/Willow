"
A ComponentMetadataCommandTest is a test class for testing the behavior of ComponentMetadataCommand
"
Class {
	#name : #ComponentMetadataCommandTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentMetadataCommandTest >> testApplyToOn [

	| html |

	html := self apply: (ComponentMetadataCommand toDeclare: 'content' with: 15) toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input data-content="15" type="text"/>'
]
