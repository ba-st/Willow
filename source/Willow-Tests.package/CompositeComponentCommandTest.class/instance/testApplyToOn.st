tests-processing
testApplyToOn

	| html |

	html := self
		apply:
			(CompositeComponentCommand
				applyingAll:
					(Array
						with: (ComponentAttributeCommand named: 'rows' with: 2)
						with: (ComponentAttributeCommand named: 'columns' with: 3)))
		toComponentDefinedBy: [ :canvas | canvas div ].
	self assert: html equals: '<div rows="2" columns="3"></div>'