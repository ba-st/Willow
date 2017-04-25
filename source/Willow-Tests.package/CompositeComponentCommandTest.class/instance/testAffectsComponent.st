tests-testing
testAffectsComponent

	self
		deny: CompositeComponentCommand empty affectsComponent;
		deny: (CompositeComponentCommand empty + CompositeComponentCommand empty) affectsComponent;
		assert: ((ComponentAttributeCommand named: 'rows' with: 2) + (ComponentAttributeCommand named: 'columns' with: 3)) affectsComponent