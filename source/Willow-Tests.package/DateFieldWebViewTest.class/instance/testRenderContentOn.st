tests
testRenderContentOn

	| dateField html |

	dateField := DateFieldWebView applying: [ :field |  ].

	html := self render: dateField.

	self assert: html equals: '<input value="" name="1" type="date"/>'