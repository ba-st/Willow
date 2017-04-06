tests
testImages

	self
		assert: BootstrapCssStyles glyphicon equals: 'glyphicon';
		assert: BootstrapCssStyles imageCircle equals: 'img-circle';
		assert: BootstrapCssStyles imageResponsive equals: 'img-responsive';
		assert: BootstrapCssStyles imageRounded equals: 'img-rounded';
		assert: BootstrapCssStyles imageThumbnail equals: 'img-thumbnail'