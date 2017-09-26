tests-rendering
testRenderSingleLineContentWithContents

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].
	textField changeContentsTo: 'S & P'.
	html := self render: textField.

	self assert: html equals: '<input value="S &amp; P" name="1" type="text"/>'