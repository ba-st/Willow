tests
testMaxLengthCommand

	| html |

	html := self apply: (self commandBuilder maxLength: 25) toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input maxlength="25" type="text"/>'