tests
testTypography

	self
		assert: BootstrapCssStyles blockquoteReverse equals: 'blockquote-reverse';
		assert: BootstrapCssStyles definitionListHorizontal equals: 'dl-horizontal';
		assert: BootstrapCssStyles initialism equals: 'initialism';
		assert: BootstrapCssStyles lead equals: 'lead';
		assert: BootstrapCssStyles listInline equals: 'list-inline';
		assert: BootstrapCssStyles listUnstyled equals: 'list-unstyled';
		assert: BootstrapCssStyles small equals: 'small'.

	self
		assert: BootstrapCssStyles textCapitalize equals: 'text-capitalize';
		assert: BootstrapCssStyles textCenter equals: 'text-center';
		assert: BootstrapCssStyles textJustify equals: 'text-justify';
		assert: BootstrapCssStyles textLeft equals: 'text-left';
		assert: BootstrapCssStyles textLowercase equals: 'text-lowercase';
		assert: BootstrapCssStyles textNowrap equals: 'text-nowrap';
		assert: BootstrapCssStyles textRight equals: 'text-right';
		assert: BootstrapCssStyles textUppercase equals: 'text-uppercase'