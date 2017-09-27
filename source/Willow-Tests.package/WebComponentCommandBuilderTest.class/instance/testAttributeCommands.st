tests
testAttributeCommands

	| html |

	html := self apply: (self commandBuilder setAttribute: 'rows' to: 5) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div rows="5"></div>'