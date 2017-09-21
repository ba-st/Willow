tests
testNamingCommand

	| html |

	html := self apply: (self commandBuilder name: 'name') toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a name="name"></a>'