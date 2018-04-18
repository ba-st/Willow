Class {
	#name : #AutoFocusComponentCommandTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
AutoFocusComponentCommandTest >> testApplyToOn [

	| html |

	html := self apply: AutoFocusComponentCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div autofocus="autofocus"></div>'
]
