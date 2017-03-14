Instance Creation
titled: aName renderingItemWithAll: aRenderingCommandCollection

	^ self
		titled: aName
		applyingToEachCell: CompositeComponentCommand empty
		renderingWithAll: aRenderingCommandCollection
		applyingToHeading: CompositeComponentCommand empty