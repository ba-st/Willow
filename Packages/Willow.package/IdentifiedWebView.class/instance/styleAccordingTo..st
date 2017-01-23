configuring
styleAccordingTo: aCssStyleName

	self
		deprecated: 'Use HTMLAsserter instead'
		transformWith:
			'(IdentifiedWebView forDivNamed: `@aName containing: `@aContent) styleAccordingTo: `@aStyle'
				-> '(IdentifiedWebView forDivNamed: `@aName containing: `@aContent applying: (ComponentClassificationCommand toStyleWith: `@aStyle)) yourself'.

	commandToComponent := CompositeComponentCommand
		applyingAll:
			{commandToComponent.
			(ComponentClassificationCommand toStyleWith: aCssStyleName)}