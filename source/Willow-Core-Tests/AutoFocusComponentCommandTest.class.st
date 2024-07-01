Class {
	#name : 'AutoFocusComponentCommandTest',
	#superclass : 'BWRenderingTest',
	#category : 'Willow-Core-Tests-Frontend',
	#package : 'Willow-Core-Tests',
	#tag : 'Frontend'
}

{ #category : 'tests-processing' }
AutoFocusComponentCommandTest >> testApplyToOn [

	| html |

	html := self apply: AutoFocusComponentCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div autofocus></div>'
]
