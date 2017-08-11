tests-processing
testApplyToOn

	| html |

	html := self
		apply: (ComponentCallbackSettingCommand setting: [ "Do something in real life." ])
		toComponentDefinedBy: [ :canvas | canvas anchor ].
	self assert: html equals: '<a href="/?1"></a>'