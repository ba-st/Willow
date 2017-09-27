initialization
initialize

	super initialize.
	columnRenderers := OrderedCollection new.
	tableCommand := [  ] asWebComponentCommand.
	rowCommand := [  ] asWebComponentCommand.
	headerProvider := [ :columns | TableHeaderWebView definedBy: columns ]