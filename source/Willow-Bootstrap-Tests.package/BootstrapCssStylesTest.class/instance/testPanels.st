tests
testPanels

	self
		assert: BootstrapCssStyles panel equals: 'panel';
		assert: BootstrapCssStyles panelBody equals: 'panel-body';
		assert: BootstrapCssStyles panelDanger equals: 'panel-danger';
		assert: BootstrapCssStyles panelDefault equals: 'panel-default';
		assert: BootstrapCssStyles panelFooter equals: 'panel-footer';
		assert: BootstrapCssStyles panelHeading equals: 'panel-heading';
		assert: BootstrapCssStyles panelInfo equals: 'panel-info';
		assert: BootstrapCssStyles panelPrimary equals: 'panel-primary';
		assert: BootstrapCssStyles panelSuccess equals: 'panel-success';
		assert: BootstrapCssStyles panelTitle equals: 'panel-title';
		assert: BootstrapCssStyles panelWarning equals: 'panel-warning'