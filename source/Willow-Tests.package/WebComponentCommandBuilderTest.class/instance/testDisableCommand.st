tests
testDisableCommand

	| html |

	html := self apply: self commandBuilder disable toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div disabled="disabled"></div>'