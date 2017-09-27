tests
testAutofocusCommand

	| html |

	html := self apply: self commandBuilder beAutofocused toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div autofocus="autofocus"></div>'