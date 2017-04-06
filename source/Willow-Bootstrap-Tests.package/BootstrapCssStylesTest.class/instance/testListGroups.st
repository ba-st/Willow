tests
testListGroups

	self
		assert: BootstrapCssStyles listGroup equals: 'list-group';
		assert: BootstrapCssStyles listGroupItem equals: 'list-group-item';
		assert: BootstrapCssStyles listGroupItemDanger equals: 'list-group-item-danger';
		assert: BootstrapCssStyles listGroupItemHeading equals: 'list-group-item-heading';
		assert: BootstrapCssStyles listGroupItemInfo equals: 'list-group-item-info';
		assert: BootstrapCssStyles listGroupItemSuccess equals: 'list-group-item-success';
		assert: BootstrapCssStyles listGroupItemWarning equals: 'list-group-item-warning'