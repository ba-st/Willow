tests-processing
testApplyToOn
	| html |
	html := self apply: ComponentRequiredCommand new toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input required="required" type="text"/>'