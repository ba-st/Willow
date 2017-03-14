tests-processing
testApplyToOn
	| html |
	html := self apply: (ComponentNamingCommand assigning: 'name') toComponentDefinedBy: [ :canvas | canvas anchor ].
	self assert: html equals: '<a name="name"></a>'