tests-rendering
testRenderSingleLineContentWithContents

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :command |  ].
	field changeContentsTo: 'S & P'.
	html := self render: field.

	self assert: html equals: '<input value="S &amp; P" name="1" type="text"/>'