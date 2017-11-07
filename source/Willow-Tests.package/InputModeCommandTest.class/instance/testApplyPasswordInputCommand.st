tests-processing
testApplyPasswordInputCommand

	| html |

	html := self apply: InputModeCommand asPassword toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="password"/>'