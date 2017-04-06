tests
testProgressBars

	self
		assert: BootstrapCssStyles progress equals: 'progress';
		assert: BootstrapCssStyles progressBar equals: 'progress-bar';
		assert: BootstrapCssStyles progressBarDanger equals: 'progress-bar-danger';
		assert: BootstrapCssStyles progressBarInfo equals: 'progress-bar-info';
		assert: BootstrapCssStyles progressBarStriped equals: 'progress-bar-striped';
		assert: BootstrapCssStyles progressBarSuccess equals: 'progress-bar-success';
		assert: BootstrapCssStyles progressBarWarning equals: 'progress-bar-warning'