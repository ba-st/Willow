tests
testPlaceholderCommands

	| html |

	html := self apply: (self commandBuilder setPlaceholderTo: 'user') toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input placeholder="user" type="text"/>'