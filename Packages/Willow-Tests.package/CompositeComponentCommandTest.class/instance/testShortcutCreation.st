tests-processing
testShortcutCreation

	| html |

	html := self
		apply: (ComponentAttributeCommand named: 'rows' with: 2) + (ComponentAttributeCommand named: 'columns' with: 3)
		toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2" columns="3"></div>'