tests
testAutofocusCommand

	| html |

	html := self apply: self commandBuilder autofocus toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div autofocus="autofocus"></div>'