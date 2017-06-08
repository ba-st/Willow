initialization
initialize

	super initialize.
	columnRenderers := OrderedCollection new.
	tableCommand := CompositeComponentCommand empty.
	rowCommand := CompositeComponentCommand empty.
	headerProvider := [ :columns | TableHeaderWebView definedBy: columns ]