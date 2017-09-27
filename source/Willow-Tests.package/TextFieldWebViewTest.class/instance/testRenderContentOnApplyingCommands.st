tests-rendering
testRenderContentOnApplyingCommands

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field | (field setNameTo: 'Neo') + field bePasswordInput ].

	html := self render: textField.

	self assert: html equals: '<input value="" name="Neo" type="password"/>'