tests-rendering
testRenderContentOn

	| field html |

	field := NumberFieldWebView applying: [  ] transformingWith: IntegerCodec new.

	html := self render: field.

	self assert: html equals: '<input value="" name="1" type="number"/>'