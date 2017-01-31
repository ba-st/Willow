tests-processing
testApplyToOn
	| html |
	html := self apply: (SetComponentTabIndexCommand setting: 3) toComponentDefinedBy: [ :canvas | canvas select ].
	self assert: html equals: '<select tabindex="3"></select>'