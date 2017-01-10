tests-processing
testEmpty
	| html |
	html := self apply: CompositeComponentCommand empty toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div></div>'