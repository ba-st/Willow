tests
testAccessibilityEnrichmentCommands

	| html |

	html := self apply: (self commandBuilder setARIAAttribute: 'describedBy' to: 'helpBlock') toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input aria-describedBy="helpBlock" type="text"/>'