tests
testContainers

	self
		assert: BootstrapCssStyles container equals: 'container';
		assert: BootstrapCssStyles containerFluid equals: 'container-fluid';
		assert: BootstrapCssStyles jumbotron equals: 'jumbotron';
		assert: BootstrapCssStyles pageHeader equals: 'page-header';
		assert: BootstrapCssStyles thumbnail equals: 'thumbnail'