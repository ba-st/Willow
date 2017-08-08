initialization
initializeShowing: aThrobber whileEvaluating: aBlock thenRendering: aView

	self setCurrentViewTo: aThrobber.
	identifiedDelayedView := IdentifiedWebView forDivNamed: 'Delayed' containing: [ :canvas | canvas render: currentView ].
	self initializeInteractionToEvaluate: aBlock thenRender: aView