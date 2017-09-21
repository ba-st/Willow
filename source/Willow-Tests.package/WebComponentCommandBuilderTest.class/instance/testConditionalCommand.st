tests
testConditionalCommand

	| html |

	html := self
		apply: (self commandBuilder when: [ true ] apply: self commandBuilder beReadOnly)
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input readonly="readonly" type="text"/>'