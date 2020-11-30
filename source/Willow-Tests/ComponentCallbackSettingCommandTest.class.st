"
A ComponentCallbackSettingCommandTest is a test class for testing the behavior of ComponentCallbackSettingCommand
"
Class {
	#name : #ComponentCallbackSettingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ComponentCallbackSettingCommandTest >> testApplyToOn [

	| html |

	html := self
		apply: (ComponentCallbackSettingCommand setting: [ "Do something in real life." ])
		toComponentDefinedBy: [ :canvas | canvas anchor ].
	self assert: html equals: '<a href="/?1"></a>'
]
