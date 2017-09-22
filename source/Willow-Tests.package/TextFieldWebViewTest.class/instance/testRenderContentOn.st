tests-rendering
testRenderContentOn

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :command |  ].

	html := self render: field.

	self assert: html equals: '<input value="" name="1" type="text"/>'