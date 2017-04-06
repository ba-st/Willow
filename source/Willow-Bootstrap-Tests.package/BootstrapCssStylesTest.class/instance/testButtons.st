tests
testButtons

	self
		assert: BootstrapCssStyles active equals: 'active';
		assert: BootstrapCssStyles button equals: 'btn';
		"Styles"
		assert: BootstrapCssStyles buttonDanger equals: 'btn-danger';
		assert: BootstrapCssStyles buttonDefault equals: 'btn-default';
		assert: BootstrapCssStyles buttonInfo equals: 'btn-info';
		assert: BootstrapCssStyles buttonLink equals: 'btn-link';
		assert: BootstrapCssStyles buttonPrimary equals: 'btn-primary';
		assert: BootstrapCssStyles buttonSuccess equals: 'btn-success';
		assert: BootstrapCssStyles buttonWarning equals: 'btn-warning';
		"Sizes"
		assert: BootstrapCssStyles buttonExtraSmall equals: 'btn-xs';
		assert: BootstrapCssStyles buttonSmall equals: 'btn-sm';
		assert: BootstrapCssStyles buttonLarge equals: 'btn-lg';
		"Groups"
		assert: BootstrapCssStyles buttonGroup equals: 'btn-group';
		assert: BootstrapCssStyles buttonGroupExtraSmall equals: 'btn-group-xs';
		assert: BootstrapCssStyles buttonGroupJustified equals: 'btn-group-justified';
		assert: BootstrapCssStyles buttonGroupLarge equals: 'btn-group-lg';
		assert: BootstrapCssStyles buttonGroupSmall equals: 'btn-group-sm';
		assert: BootstrapCssStyles buttonGroupVertical equals: 'btn-group-vertical';
		assert: BootstrapCssStyles buttonBlock equals: 'btn-block';
		assert: BootstrapCssStyles buttonToolbar equals: 'btn-toolbar'