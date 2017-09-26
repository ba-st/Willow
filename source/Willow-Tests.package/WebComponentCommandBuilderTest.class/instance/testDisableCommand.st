tests
testDisableCommand

	| html |

	html := self apply: self commandBuilder beDisabled toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div disabled="disabled"></div>'