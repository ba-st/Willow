Supplying
radioRenderingWith: aRenderingBlock applying: aCommandToComponent

	self
		deprecated: 'Please use #radioRenderingWith:applyingToLabel:applyingToInput:  instead'
		transformWith: '`@receiver radioRenderingWith: `@aRenderingBlock applying: `@aCommandToComponent' 
		    -> '`@receiver radioRenderingWith: `@aRenderingBlock applyingToLabel: `@aCommandToComponent applyingToInput: `@aCommandToComponent'.

	self subclassResponsibility