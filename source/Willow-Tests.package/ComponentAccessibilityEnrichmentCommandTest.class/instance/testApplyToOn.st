tests-processing
testApplyToOn

	| html |

	html := self apply: (ComponentAccessibilityEnrichmentCommand toDeclare: 'describedBy' with: 'helpBlock') toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input aria-describedBy="helpBlock" type="text"/>'