tests-processing
testApplyToOn

	| html |

	html := self apply: AutoFocusComponentCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div autofocus="autofocus"></div>'