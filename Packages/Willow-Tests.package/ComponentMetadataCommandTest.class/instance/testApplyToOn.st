tests-processing
testApplyToOn

	| html |

	html := self apply: (ComponentMetadataCommand toDeclare: 'content' with: 15) toComponentDefinedBy: [ :canvas | canvas textInput ].
	self assert: html equals: '<input data-content="15" type="text"/>'