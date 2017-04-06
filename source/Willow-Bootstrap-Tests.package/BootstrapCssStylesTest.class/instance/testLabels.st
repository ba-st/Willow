tests
testLabels

	self
		assert: BootstrapCssStyles badge equals: 'badge';
		assert: BootstrapCssStyles label equals: 'label';
		assert: BootstrapCssStyles labelDanger equals: 'label-danger';
		assert: BootstrapCssStyles labelDefault equals: 'label-default';
		assert: BootstrapCssStyles labelInfo equals: 'label-info';
		assert: BootstrapCssStyles labelPrimary equals: 'label-primary';
		assert: BootstrapCssStyles labelSuccess equals: 'label-success';
		assert: BootstrapCssStyles labelWarning equals: 'label-warning'