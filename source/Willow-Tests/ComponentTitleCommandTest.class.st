"
A ComponentTitleCommandTest is a test class for testing the behavior of ComponentTitleCommand
"
Class {
	#name : #ComponentTitleCommandTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentTitleCommandTest >> testApplyToOn [

	| html |

	html := self apply: (ComponentTitleCommand toSet: 'image') toComponentDefinedBy: [ :canvas | canvas image ].
	self assert: html equals: '<img alt="" title="image"/>'
]
