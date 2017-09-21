tests-rendering
testRenderContentOnApplyingCommands

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :command | (command name: 'Neo') + command passwordInputMode ].

	html := self render: field.

	self assert: html equals: '<input value="" name="Neo" type="password"/>'