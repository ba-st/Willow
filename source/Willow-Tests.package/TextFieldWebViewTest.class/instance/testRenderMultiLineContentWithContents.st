tests-rendering
testRenderMultiLineContentWithContents

	| field html |

	field := TextFieldWebView multiLineTriggeringOnChangeApplying: [  ].
	field changeContentsTo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.' expandMacros.

	html := self render: field.

	self
		assert: html
		equals: '<textarea rows="auto" cols="auto" name="1">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</textarea>'