"
A ComponentClassificationCommandTest is a test class for testing the behavior of ComponentClassificationCommand
"
Class {
	#name : #ComponentClassificationCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentClassificationCommandTest >> testApplyToOn [

	| html |

	html := self apply: (ComponentClassificationCommand toStyleWith: 'ui') toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div class="ui"></div>'
]
