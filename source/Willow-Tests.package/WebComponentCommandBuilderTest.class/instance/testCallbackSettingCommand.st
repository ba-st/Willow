tests
testCallbackSettingCommand

	| html |

	html := self
		apply: (self commandBuilder setCallbackTo: [ "Do something in real life." ])
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a href="/?1"></a>'