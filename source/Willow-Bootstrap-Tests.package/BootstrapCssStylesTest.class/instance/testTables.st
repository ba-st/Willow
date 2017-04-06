tests
testTables

	self
		assert: BootstrapCssStyles table equals: 'table';
		assert: BootstrapCssStyles tableBordered equals: 'table-bordered';
		assert: BootstrapCssStyles tableCondensed equals: 'table-condensed';
		assert: BootstrapCssStyles tableHover equals: 'table-hover';
		assert: BootstrapCssStyles tableResponsive equals: 'table-responsive';
		assert: BootstrapCssStyles tableStriped equals: 'table-striped'.


	self
		assert: BootstrapCssStyles tableDanger equals: 'danger';
		assert: BootstrapCssStyles tableInfo equals: 'info';
		assert: BootstrapCssStyles tableSuccess equals: 'success';
		assert: BootstrapCssStyles tableWarning equals: 'warning'