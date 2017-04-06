tests
testMediaObjects

	self
		assert: BootstrapCssStyles media equals: 'media';
		assert: BootstrapCssStyles mediaBody equals: 'media-body';
		assert: BootstrapCssStyles mediaHeading equals: 'media-heading';
		assert: BootstrapCssStyles mediaLeft equals: 'media-left';
		assert: BootstrapCssStyles mediaRight equals: 'media-right';
		assert: BootstrapCssStyles mediaMiddle equals: 'media-middle';
		assert: BootstrapCssStyles mediaList equals: 'media-list';
		assert: BootstrapCssStyles mediaObject equals: 'media-object'