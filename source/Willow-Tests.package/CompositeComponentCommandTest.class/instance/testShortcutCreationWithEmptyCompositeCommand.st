tests-processing
testShortcutCreationWithEmptyCompositeCommand

	| command html |

	command := CompositeComponentCommand empty + (ComponentAttributeCommand named: 'columns' with: 3).
	html := self apply: command toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div columns="3"></div>'