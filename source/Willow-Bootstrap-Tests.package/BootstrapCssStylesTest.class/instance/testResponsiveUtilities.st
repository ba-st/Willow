tests
testResponsiveUtilities

	self
		assert: BootstrapCssStyles hiddenExtraSmall equals: 'hidden-xs';
		assert: BootstrapCssStyles hiddenSmall equals: 'hidden-sm';
		assert: BootstrapCssStyles hiddenMedium equals: 'hidden-md';
		assert: BootstrapCssStyles hiddenLarge equals: 'hidden-lg';
		assert: BootstrapCssStyles hiddenPrint equals: 'hidden-print'.

	self
		assert: BootstrapCssStyles visibleExtraSmallBlock equals: 'visible-xs-block';
		assert: BootstrapCssStyles visibleSmallBlock equals: 'visible-sm-block';
		assert: BootstrapCssStyles visibleMediumBlock equals: 'visible-md-block';
		assert: BootstrapCssStyles visibleLargeBlock equals: 'visible-lg-block';
		assert: BootstrapCssStyles visiblePrintBlock equals: 'visible-print-block'.

	self
		assert: BootstrapCssStyles visibleExtraSmallInline equals: 'visible-xs-inline';
		assert: BootstrapCssStyles visibleSmallInline equals: 'visible-sm-inline';
		assert: BootstrapCssStyles visibleMediumInline equals: 'visible-md-inline';
		assert: BootstrapCssStyles visibleLargeInline equals: 'visible-lg-inline';
		assert: BootstrapCssStyles visiblePrintInline equals: 'visible-print-inline'.

	self
		assert: BootstrapCssStyles visibleExtraSmallInlineBlock equals: 'visible-xs-inline-block';
		assert: BootstrapCssStyles visibleSmallInlineBlock equals: 'visible-sm-inline-block';
		assert: BootstrapCssStyles visibleMediumInlineBlock equals: 'visible-md-inline-block';
		assert: BootstrapCssStyles visibleLargeInlineBlock equals: 'visible-lg-inline-block';
		assert: BootstrapCssStyles visiblePrintInlineBlock equals: 'visible-print-inline-block'