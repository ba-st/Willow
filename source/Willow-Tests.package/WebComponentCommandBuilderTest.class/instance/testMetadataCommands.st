tests
testMetadataCommands

	| html |

	html := self apply: (self commandBuilder setData: 'content' to: 15) toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div data-content="15"></div>'