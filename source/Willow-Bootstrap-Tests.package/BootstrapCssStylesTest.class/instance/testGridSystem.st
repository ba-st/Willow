tests
testGridSystem

	self
		assert: BootstrapCssStyles row equals: 'row';
		assert: (BootstrapCssStyles columnExtraSmall: 6) equals: 'col-xs-6';
		assert: (BootstrapCssStyles columnSmall: 6) equals: 'col-sm-6';
		assert: (BootstrapCssStyles columnMedium: 6) equals: 'col-md-6';
		assert: (BootstrapCssStyles columnLarge: 6) equals: 'col-lg-6'.

	self
		assert: (BootstrapCssStyles columnExtraSmallOffset: 6) equals: 'col-xs-offset-6';
		assert: (BootstrapCssStyles columnSmallOffset: 6) equals: 'col-sm-offset-6';
		assert: (BootstrapCssStyles columnMediumOffset: 6) equals: 'col-md-offset-6';
		assert: (BootstrapCssStyles columnLargeOffset: 6) equals: 'col-lg-offset-6'.

	self
		assert: (BootstrapCssStyles columnExtraSmallPull: 2) equals: 'col-xs-pull-2';
		assert: (BootstrapCssStyles columnSmallPull: 2) equals: 'col-sm-pull-2';
		assert: (BootstrapCssStyles columnMediumPull: 2) equals: 'col-md-pull-2';
		assert: (BootstrapCssStyles columnLargePull: 2) equals: 'col-lg-pull-2'.

	self
		assert: (BootstrapCssStyles columnExtraSmallPush: 2) equals: 'col-xs-push-2';
		assert: (BootstrapCssStyles columnSmallPush: 2) equals: 'col-sm-push-2';
		assert: (BootstrapCssStyles columnMediumPush: 2) equals: 'col-md-push-2';
		assert: (BootstrapCssStyles columnLargePush: 2) equals: 'col-lg-push-2'