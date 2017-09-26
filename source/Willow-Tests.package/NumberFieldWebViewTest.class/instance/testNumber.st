tests-number-container-API
testNumber

	| numberField html |

	numberField := NumberFieldWebView applying: [ :field |  ] transformingWith: IntegerCodec new.

	self assert: numberField number equals: 0.

	numberField changeNumberTo: 15.

	self assert: numberField number equals: 15.
	html := self render: numberField.

	self assert: html equals: '<input value="15" name="1" type="number"/>'