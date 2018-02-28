Instance creation
renderingWith: aRenderingBlock applyingToLabel: aLabelCommand applyingToInput: anInputCommand

	^super new
		initializeRenderingWith: aRenderingBlock
		applyingToLabel: aLabelCommand asWebComponentCommand
		applyingToInput: anInputCommand asWebComponentCommand