tests-number-container-API
testNumber

	| field html |

	field := NumberFieldWebView applying: [ :command |  ] transformingWith: IntegerCodec new.

	self assert: field number equals: 0.

	field changeNumberTo: 15.

	self assert: field number equals: 15.
	html := self render: field.

	self assert: html equals: '<input value="15" name="1" type="number"/>'