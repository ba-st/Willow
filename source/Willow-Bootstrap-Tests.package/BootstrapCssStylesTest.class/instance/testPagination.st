tests
testPagination

	self
		assert: BootstrapCssStyles next equals: 'next';
		assert: BootstrapCssStyles previous equals: 'previous';
		assert: BootstrapCssStyles pager equals: 'pager';
		assert: BootstrapCssStyles pagination equals: 'pagination';
		assert: BootstrapCssStyles paginationLarge equals: 'pagination-lg';
		assert: BootstrapCssStyles paginationSmall equals: 'pagination-sm'