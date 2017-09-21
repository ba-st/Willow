tests
testDisableTabCycleCommand

	| html |

	html := self apply: self commandBuilder disableTabCycle toComponentDefinedBy: [ :canvas | canvas div ].

	self assert: html equals: '<div tabindex="-1"></div>'