initialization
setUp

	super setUp.
	identifiedView := IdentifiedWebView forDivNamed: 'test' containing: [ :canvas | canvas span: 'Test' ].
	command := RenderingCommand for: identifiedView