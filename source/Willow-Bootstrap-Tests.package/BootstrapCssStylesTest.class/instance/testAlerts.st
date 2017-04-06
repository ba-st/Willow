tests
testAlerts

	self
		assert: BootstrapCssStyles alert equals: 'alert';
		assert: BootstrapCssStyles alertDanger equals: 'alert-danger';
		assert: BootstrapCssStyles alertDismissible equals: 'alert-dismissible';
		assert: BootstrapCssStyles alertInfo equals: 'alert-info';
		assert: BootstrapCssStyles alertLink equals: 'alert-link';
		assert: BootstrapCssStyles alertSuccess equals: 'alert-success';
		assert: BootstrapCssStyles alertWarning equals: 'alert-warning'