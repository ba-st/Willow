tests-rendering
testRenderContentOn

	| textField html |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].

	html := self render: textField.

	self assert: html equals: '<input value="" name="1" type="text"/>'