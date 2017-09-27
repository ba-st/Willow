tests
testRequiredCommand

	| html |

	html := self apply: self commandBuilder beRequired toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input required="required" type="text"/>'