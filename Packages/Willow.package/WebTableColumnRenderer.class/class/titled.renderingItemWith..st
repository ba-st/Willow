Instance Creation
titled: aName renderingItemWith: aRenderingCommand

	^self
		titled: aName
		applyingToEachCell: CompositeComponentCommand empty
		renderingWith: aRenderingCommand
		applyingToHeading: CompositeComponentCommand empty