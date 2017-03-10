tests-rendering
testRenderContentOn

	| field html |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty.

	html := self render: field.

	self assert: html equals: '<input value="" name="1" type="text"/>'