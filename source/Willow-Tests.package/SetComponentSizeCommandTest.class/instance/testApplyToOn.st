tests-processing
testApplyToOn
	| html |
	html := self apply: (SetComponentSizeCommand setting: 5) toComponentDefinedBy: [ :canvas | canvas select ].
	self assert: html equals: '<select size="5"></select>'