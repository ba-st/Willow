tests
testSetComponentStyleCommands

	| html |

	html := self
		apply: (self commandBuilder setStyleTo: [ :style | style background: CssSVGColors blue ])
		toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div style="background: blue;"></div>'