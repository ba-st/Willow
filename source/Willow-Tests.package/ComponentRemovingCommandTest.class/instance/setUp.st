initialization
setUp

	super setUp.
	command := ComponentRemovingCommand for: (IdentifiedWebView forDivNamed: 'example' containing: [ :canvas |  ])