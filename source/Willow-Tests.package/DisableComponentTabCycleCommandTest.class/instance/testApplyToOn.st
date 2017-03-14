tests-processing
testApplyToOn
	| html |
	html := self apply: DisableComponentTabCycleCommand new toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div tabindex="-1"></div>'