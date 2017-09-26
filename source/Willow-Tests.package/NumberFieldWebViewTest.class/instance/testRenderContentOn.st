tests-rendering
testRenderContentOn

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	html := self render: numberField.

	self assert: html equals: '<input value="" name="1" type="number"/>'