tests
testRenderContentOn

	| field html |

	field := DateFieldWebView applying: CompositeComponentCommand empty.

	html := self render: field.

	self assert: html equals: '<input value="" name="1" type="date"/>'