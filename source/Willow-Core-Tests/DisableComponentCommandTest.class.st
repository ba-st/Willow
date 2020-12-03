"
A DisableComponentCommandTest is a test class for testing the behavior of DisableComponentCommand
"
Class {
	#name : #DisableComponentCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
DisableComponentCommandTest >> testApplyToOn [

	| html |

	html := self apply: DisableComponentCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div disabled></div>'
]
