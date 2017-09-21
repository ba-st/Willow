tests
testAttributeCommands

	| html |

	html := self apply: (self commandBuilder attribute: 'rows' -> 5) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div rows="5"></div>'