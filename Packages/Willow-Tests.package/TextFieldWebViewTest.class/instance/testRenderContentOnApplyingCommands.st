tests-rendering
testRenderContentOnApplyingCommands

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: (ComponentNamingCommand assigning: 'Neo') + PasswordInputModeCommand new.

	html := self render: field.

	self assert: html equals: '<input value="" name="Neo" type="password"/>'