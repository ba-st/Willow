tests-processing
testApplyToOn
	| html |
	html := self apply: ComponentReadOnlyCommand new toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input readonly="readonly" type="text"/>'