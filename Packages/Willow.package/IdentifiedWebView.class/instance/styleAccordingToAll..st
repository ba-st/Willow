configuring
styleAccordingToAll: aCssStyleNameCollection

	self deprecated: 'Use HTMLAsserter instead' transformWith: '(IdentifiedWebView forDivNamed: `@aName containing: `@aContent) styleAccordingToAll: `@aStyleCollection' -> '(IdentifiedWebView forDivNamed: `@aName containing: `@aContent applying: (ComponentClassificationCommand toStyleWithAll: `@aStyleCollection)) yourself'.	
			
		commandToComponent := CompositeComponentCommand
		applyingAll:
			{commandToComponent.
			(ComponentClassificationCommand toStyleWithAll: aCssStyleNameCollection )}