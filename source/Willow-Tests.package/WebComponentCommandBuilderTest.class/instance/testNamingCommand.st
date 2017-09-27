tests
testNamingCommand

	| html |

	html := self apply: (self commandBuilder setNameTo: 'name') toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a name="name"></a>'