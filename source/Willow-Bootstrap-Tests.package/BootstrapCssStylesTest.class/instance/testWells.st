tests
testWells

	self
		assert: BootstrapCssStyles well equals: 'well';
		assert: BootstrapCssStyles wellLarge equals: 'well-lg';
		assert: BootstrapCssStyles wellSmall equals: 'well-sm'