tests-processing
testApplyToOn
	| html |
	html := self apply: (ComponentPlaceholderCommand suggestedBy: 'user') toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input placeholder="user" type="text"/>'