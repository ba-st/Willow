configuring
respondUsing: aCallbackBlock
	self deprecated: 'Please use #determineBehaviorByEvaluating: instead' transformWith: '`@receiver respondUsing: `@callback' -> '@receiver determineBehaviorByEvaluating: `@callback'.
	self determineBehaviorByEvaluating: aCallbackBlock