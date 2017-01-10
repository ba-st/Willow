tests-processing
testApplyToOn
	| html |
	html := self apply: PasswordInputModeCommand new toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input type="password"/>'