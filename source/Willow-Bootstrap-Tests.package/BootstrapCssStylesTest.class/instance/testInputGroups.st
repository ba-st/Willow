tests
testInputGroups

	self
		assert: BootstrapCssStyles inputGroup equals: 'input-group';
		assert: BootstrapCssStyles inputGroupAddon equals: 'input-group-addon';
		assert: BootstrapCssStyles inputGroupButton equals: 'input-group-btn';
		assert: BootstrapCssStyles inputGroupLarge equals: 'input-group-lg';
		assert: BootstrapCssStyles inputGroupSmall equals: 'input-group-sm'