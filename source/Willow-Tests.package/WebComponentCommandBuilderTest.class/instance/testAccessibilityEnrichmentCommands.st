tests
testAccessibilityEnrichmentCommands

	| html |

	html := self
		apply: (self commandBuilder aria: 'describedBy' -> 'helpBlock')
		toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input aria-describedBy="helpBlock" type="text"/>'