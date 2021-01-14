Class {
	#name : #AutoFocusComponentCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
AutoFocusComponentCommandTest >> testApplyToOn [

	| html |

	html := self apply: AutoFocusComponentCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div autofocus></div>'
]
